#define _POSIX_C_SOURCE 200809L
#include "text.h"
#include "elf.h"
#include "lex.h"
#include "state.h"
#include <elf.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

bool tok_is_label(int tok) {
  return tok == TOK_RODATA_LABEL || tok == TOK_FUNC_END ||
         tok == TOK_FUNC_START || tok == TOK_IDENT_TAG;
}
bool tok_is_directive(int tok) {
  return tok >= TOK_FILEHEADER && tok <= TOK_SECTION_GNUSTACK;
}

bool tok_is_machine_code(int tok) {
  return tok >= OPCODE_ADDQ && tok <= OPCODE_MULQ;
}

bool handle_line(text_state_t *state, line_info_t *info) { // reset text offset
  // Skip blank lines
  if (info->nof_tokens < 1)
    return true;

  if (tok_is_label(info->tokens[0]))
    return handle_label(state, info);
  else if (tok_is_directive(info->tokens[0]))
    return handle_directive(state, info);
  else if (tok_is_machine_code(info->tokens[0]))
    return handle_machine_code(state, info);
  else
    fprintf(stderr, "handle line: unexpected first token: %d\n",
            info->tokens[0]);
  return false;
}

bool handle_label(text_state_t *state, line_info_t *info) {
  int label_tok = info->tokens[0];
  char *label_name = NULL;
  if (info->nof_input_strings > 0) {
    label_name = info->input_strings[0];
  }
  switch (state->parse_mode) {
  case TEXT: {
    if (label_name == NULL) {
      fprintf(stderr, "Expected label name in .text\n");
      return false;
    }
    // Function definition
    if (label_tok == TOK_IDENT_TAG) {
      label_name[strlen(label_name) - 1] = '\0'; // remove :
      func_t new_func = {};
      new_func.is_global = false;
      new_func.name = strdup(label_name);
      state->functions[state->nof_functions++] = new_func;
      return true;
    }
    // define text label
    if (label_tok == TOK_TEXT_LABEL) {
    }
    // .LFB[0-9]
    if (label_tok == TOK_FUNC_START) {
      label_name[strlen(label_name) - 1] = '\0'; // remove :
      label_name += 4;                           // skip .LFB
      size_t func_idx = atoi(label_name);
      if (func_idx >= state->nof_functions) {
        fprintf(stderr, "Function index out of bounds %ld\n", func_idx);
        return false;
      }
      state->functions[func_idx].location = state->current_text_offset;
      return true;
    }
    // .LFE[0-9]
    if (label_tok == TOK_FUNC_END) {
      label_name[strlen(label_name) - 1] = '\0'; // remove :
      label_name += 4;                           // skip .LFB
      size_t func_idx = atoi(label_name);
      if (func_idx >= state->nof_functions) {
        fprintf(stderr, "Function index out of bounds %ld\n", func_idx);
        return false;
      }
      state->functions[func_idx].size =
          state->current_text_offset - state->functions[func_idx].location;
      return true;
    }

    fprintf(stderr, "Got unexpected label in .text: %d", label_tok);
    return false;
  }
  case RODATA: {
    if (label_tok != TOK_RODATA_LABEL) {
      fprintf(stderr, "Expected rodata constant label but got: %s\n",
              label_name);
      return false;
    }
    // .LC[0-9]
    state->nof_rodata_entries++;
    break;
  }
  default:
    break;
  }
  return true;
}

bool handle_directive(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens < 1)
    return false;

  char *directive_str = NULL;
  if (info->nof_input_strings > 0) {
    directive_str = info->input_strings[0];
  }

  switch (info->tokens[0]) {
  case TOK_FILEHEADER: {
    if (directive_str == NULL) {
      fprintf(stderr, ".file directive requires string\n");
      return false;
    }
    // Remove quotes
    directive_str++;
    directive_str[strlen(directive_str) - 1] = '\0';
    state->file_name = strdup(directive_str);
    return true;
  }
  case TOK_SECTION_TEXT: {
    state->parse_mode = TEXT;
    return true;
  }
  case TOK_STRINGDEF: {
    if (state->parse_mode != RODATA) {
      fprintf(stderr, "Encountered .string outside of rodata\n");
      return false;
    }

    // Remove quotes
    directive_str++;
    directive_str[strlen(directive_str) - 1] = '\0';

    state->rodata_entries[state->nof_rodata_entries - 1] =
        strlen(directive_str);
    buffer_append(state->rodata_buffer, directive_str, strlen(directive_str));
    return true;
  }
  case TOK_GLOBLDEF: {
    if (state->parse_mode != TEXT) {
      fprintf(stderr, "Encountered .globl outside of .text\n");
      return false;
    }
    if (directive_str == NULL) {
      fprintf(stderr, ".globl requires string\n");
      return false;
    }
    // Locate function and set to global
    for (size_t i = 0; i < state->nof_functions; i++) {
      if (strcmp(state->functions[i].name, directive_str) == 0) {
        state->functions[i].is_global = true;
      }
    }
    return true;
  }
  case TOK_SIZEDEF: {
    // Ignore, since we handle size elsewhere
    return true;
  }

  case TOK_TYPEDEF: {
    // TODO: handle types
    return true;
  }

  case TOK_SECTION:
    // handle section below
    break;
  default:
    fprintf(stderr, "Unexpected directive\n");
    return false;
  }

  switch (info->tokens[1]) {
  case TOK_SECTION_RODATA: {
    state->parse_mode = RODATA;
    return true;
  }
  case TOK_SECTION_GNUSTACK:
    state->parse_mode = GNU_STACK;
    return true;
  case TOK_SECTION_TEXT: {
    state->parse_mode = TEXT;
    return true;
  }
  default:
    fprintf(stderr, "unknown .section directive: %s", directive_str);
    return false;
  }
}

bool handle_machine_code(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens < 1)
    return false;

  switch (info->tokens[0]) {
  case OPCODE_MOV:
    return opcode_mov(state, info);
  case OPCODE_SUBB:
  case OPCODE_SUBL:
  case OPCODE_SUBW:
  case OPCODE_SUBQ:
    return opcode_sub(state, info);
  case OPCODE_LEAL:
    return opcode_lea(state, info);
  case OPCODE_CALL:
    return opcode_call(state, info);
  case OPCODE_PUSH:
    return opcode_push(state, info);
  case OPCODE_LEAVE:
    return opcode_leave(state);
  case OPCODE_RET:
    return opcode_ret(state);
  default:
    break;
  }
  return true;
}

bool opcode_leave(text_state_t *state) {
  uint8_t *machine_code = malloc(1);
  machine_code[0] = 0xc9;
  add_new_inst(state, machine_code, 1, COMPLETE, NULL);
  return true;
}

int opcode_ret(text_state_t *state) {
  uint8_t *machine_code = malloc(1);
  machine_code[0] = 0xc3;
  add_new_inst(state, machine_code, 1, COMPLETE, NULL);
  return true;
}

int opcode_push(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens != 2) {
    fprintf(stderr, "push encoding failed: expected 2 operands but got %ld\n",
            info->nof_tokens);
    return false;
  }
  size_t machine_code_len = 0;
  uint8_t *machine_code = malloc(2);

  switch (info->tokens[1]) {
  // Legacy 64-bit registers: opcode = 0x50 + reg
  case TOK_REG_RAX:
    machine_code[0] = 0x50;
    machine_code_len = 1;
    break;
  case TOK_REG_RCX:
    machine_code[0] = 0x51;
    machine_code_len = 1;
    break;
  case TOK_REG_RDX:
    machine_code[0] = 0x52;
    machine_code_len = 1;
    break;
  case TOK_REG_RBX:
    machine_code[0] = 0x53;
    machine_code_len = 1;
    break;
  case TOK_REG_RSP:
    machine_code[0] = 0x54;
    machine_code_len = 1;
    break;
  case TOK_REG_RBP:
    machine_code[0] = 0x55;
    machine_code_len = 1;
    break;
  case TOK_REG_RSI:
    machine_code[0] = 0x56;
    machine_code_len = 1;
    break;
  case TOK_REG_RDI:
    machine_code[0] = 0x57;
    machine_code_len = 1;
    break;

  // Extended registers (r8–r15): need REX prefix + opcode
  case TOK_REG_R8:
    machine_code[0] = 0x41;
    machine_code[1] = 0x50;
    machine_code_len = 2;
    break;
  case TOK_REG_R9:
    machine_code[0] = 0x41;
    machine_code[1] = 0x51;
    machine_code_len = 2;
    break;
  case TOK_REG_R10:
    machine_code[0] = 0x41;
    machine_code[1] = 0x52;
    machine_code_len = 2;
    break;
  case TOK_REG_R11:
    machine_code[0] = 0x41;
    machine_code[1] = 0x53;
    machine_code_len = 2;
    break;
  case TOK_REG_R12:
    machine_code[0] = 0x41;
    machine_code[1] = 0x54;
    machine_code_len = 2;
    break;
  case TOK_REG_R13:
    machine_code[0] = 0x41;
    machine_code[1] = 0x55;
    machine_code_len = 2;
    break;
  case TOK_REG_R14:
    machine_code[0] = 0x41;
    machine_code[1] = 0x56;
    machine_code_len = 2;
    break;
  case TOK_REG_R15:
    machine_code[0] = 0x41;
    machine_code[1] = 0x57;
    machine_code_len = 2;
    break;

  default:
    fprintf(stderr, "push encoding failed: unsupported operand token: %d\n",
            info->tokens[1]);
    free(machine_code);
    return false;
  }

  add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL);
  return true;
}
bool is_extended_reg(int reg_token) {
  return (reg_token >= TOK_REG_R8 && reg_token <= TOK_REG_R15) ||
         (reg_token >= TOK_REG_R8D && reg_token <= TOK_REG_R15D) ||
         (reg_token >= TOK_REG_R8W && reg_token <= TOK_REG_R15W) ||
         (reg_token >= TOK_REG_R8B && reg_token <= TOK_REG_R15B);
}

bool is_rex_required_special(int reg_token) {
  return reg_token == TOK_REG_SIL || reg_token == TOK_REG_DIL ||
         reg_token == TOK_REG_BPL || reg_token == TOK_REG_SPL;
}

bool is_token_64bit(int token) {
  switch (token) {
  case TOK_REG_RAX:
  case TOK_REG_RBX:
  case TOK_REG_RCX:
  case TOK_REG_RDX:
  case TOK_REG_RSI:
  case TOK_REG_RDI:
  case TOK_REG_RBP:
  case TOK_REG_RSP:
  case TOK_REG_R8:
  case TOK_REG_R9:
  case TOK_REG_R10:
  case TOK_REG_R11:
  case TOK_REG_R12:
  case TOK_REG_R13:
  case TOK_REG_R14:
  case TOK_REG_R15:
    return true;
  default:
    return false;
  }
}

bool is_token_32bit(int token) {
  switch (token) {
  case TOK_REG_EAX:
  case TOK_REG_EBX:
  case TOK_REG_ECX:
  case TOK_REG_EDX:
  case TOK_REG_ESI:
  case TOK_REG_EDI:
  case TOK_REG_EBP:
  case TOK_REG_ESP:
  case TOK_REG_R8D:
  case TOK_REG_R9D:
  case TOK_REG_R10D:
  case TOK_REG_R11D:
  case TOK_REG_R12D:
  case TOK_REG_R13D:
  case TOK_REG_R14D:
  case TOK_REG_R15D:
    return true;
  default:
    return false;
  }
}

bool is_token_16bit(int token) {
  switch (token) {
  case TOK_REG_AX:
  case TOK_REG_BX:
  case TOK_REG_CX:
  case TOK_REG_DX:
  case TOK_REG_SI:
  case TOK_REG_DI:
  case TOK_REG_BP:
  case TOK_REG_SP:
  case TOK_REG_R8W:
  case TOK_REG_R9W:
  case TOK_REG_R10W:
  case TOK_REG_R11W:
  case TOK_REG_R12W:
  case TOK_REG_R13W:
  case TOK_REG_R14W:
  case TOK_REG_R15W:
    return true;
  default:
    return false;
  }
}

bool is_token_8bit(int token) {
  switch (token) {
  case TOK_REG_AL:
  case TOK_REG_BL:
  case TOK_REG_CL:
  case TOK_REG_DL:
  case TOK_REG_SIL:
  case TOK_REG_DIL:
  case TOK_REG_BPL:
  case TOK_REG_SPL:
  case TOK_REG_R8B:
  case TOK_REG_R9B:
  case TOK_REG_R10B:
  case TOK_REG_R11B:
  case TOK_REG_R12B:
  case TOK_REG_R13B:
  case TOK_REG_R14B:
  case TOK_REG_R15B:
    return true;
  default:
    return false;
  }
}

int get_rm_reg_bits_from_reg(int tok) {
  switch (tok) {
  // 64-bit registers
  case TOK_REG_RAX:
    return 0;
  case TOK_REG_RCX:
    return 1;
  case TOK_REG_RDX:
    return 2;
  case TOK_REG_RBX:
    return 3;
  case TOK_REG_RSP:
    return 4;
  case TOK_REG_RBP:
    return 5;
  case TOK_REG_RSI:
    return 6;
  case TOK_REG_RDI:
    return 7;
  case TOK_REG_R8:
    return 0;
  case TOK_REG_R9:
    return 1;
  case TOK_REG_R10:
    return 2;
  case TOK_REG_R11:
    return 3;
  case TOK_REG_R12:
    return 4;
  case TOK_REG_R13:
    return 5;
  case TOK_REG_R14:
    return 6;
  case TOK_REG_R15:
    return 7;

  // 32-bit registers
  case TOK_REG_EAX:
    return 0;
  case TOK_REG_ECX:
    return 1;
  case TOK_REG_EDX:
    return 2;
  case TOK_REG_EBX:
    return 3;
  case TOK_REG_ESP:
    return 4;
  case TOK_REG_EBP:
    return 5;
  case TOK_REG_ESI:
    return 6;
  case TOK_REG_EDI:
    return 7;
  case TOK_REG_R8D:
    return 0;
  case TOK_REG_R9D:
    return 1;
  case TOK_REG_R10D:
    return 2;
  case TOK_REG_R11D:
    return 3;
  case TOK_REG_R12D:
    return 4;
  case TOK_REG_R13D:
    return 5;
  case TOK_REG_R14D:
    return 6;
  case TOK_REG_R15D:
    return 7;

  // 16-bit registers
  case TOK_REG_AX:
    return 0;
  case TOK_REG_CX:
    return 1;
  case TOK_REG_DX:
    return 2;
  case TOK_REG_BX:
    return 3;
  case TOK_REG_SP:
    return 4;
  case TOK_REG_BP:
    return 5;
  case TOK_REG_SI:
    return 6;
  case TOK_REG_DI:
    return 7;
  case TOK_REG_R8W:
    return 0;
  case TOK_REG_R9W:
    return 1;
  case TOK_REG_R10W:
    return 2;
  case TOK_REG_R11W:
    return 3;
  case TOK_REG_R12W:
    return 4;
  case TOK_REG_R13W:
    return 5;
  case TOK_REG_R14W:
    return 6;
  case TOK_REG_R15W:
    return 7;

  // 8-bit registers
  case TOK_REG_AL:
    return 0;
  case TOK_REG_CL:
    return 1;
  case TOK_REG_DL:
    return 2;
  case TOK_REG_BL:
    return 3;
  case TOK_REG_SPL:
    return 4;
  case TOK_REG_BPL:
    return 5;
  case TOK_REG_SIL:
    return 6;
  case TOK_REG_DIL:
    return 7;
  case TOK_REG_R8B:
    return 0;
  case TOK_REG_R9B:
    return 1;
  case TOK_REG_R10B:
    return 2;
  case TOK_REG_R11B:
    return 3;
  case TOK_REG_R12B:
    return 4;
  case TOK_REG_R13B:
    return 5;
  case TOK_REG_R14B:
    return 6;
  case TOK_REG_R15B:
    return 7;

  default:
    return -1; // Invalid or unsupported register
  }
}

bool parse_mov_operand(int tokens[MAX_LINE_SIZE], size_t *tok_idx, int *reg,
                       int *displacement, bool *minus, bool *reg_is_mem) {
  *reg_is_mem = false;
  if (tokens[(*tok_idx)] == TOK_MINUS) {
    (*tok_idx)++;
    *minus = true;
  }
  if (tokens[(*tok_idx)] == TOK_NUM) {
    // TODO: get offset
    *displacement = 8;
    (*tok_idx)++;
    if (tokens[(*tok_idx)] == TOK_OPENPAREN) {
      (*tok_idx)++;
      *reg = tokens[(*tok_idx)++];
      if (tokens[(*tok_idx)++] != TOK_CLOSEPAREN) {
        fprintf(stderr, "expected )\n");
        return false;
      }
      return true;
    }
    *reg_is_mem = true;
    return true;
  }
  *reg = tokens[(*tok_idx)++];
  return true;
}

void add_rex_if_required(int reg_token, int rm_token, uint8_t *machine_code,
                         size_t *machine_code_len) {
  if ((is_token_64bit(reg_token) && is_token_64bit(rm_token)) ||
      (is_extended_reg(reg_token) || is_extended_reg(rm_token)) ||
      (is_rex_required_special(reg_token) ||
       is_rex_required_special(rm_token))) {
    uint8_t rex = REX_PREFIX_BASE;

    bool is_64bit_op = true;

    if (is_64bit_op)
      rex |= REX_PREFIX_W;

    if (is_extended_reg(reg_token))
      rex |= REX_PREFIX_R;

    if (is_extended_reg(rm_token))
      rex |= REX_PREFIX_B;
    if (is_rex_required_special(reg_token) || is_rex_required_special(rm_token))
      rex |= 0;
    machine_code[(*machine_code_len)++] = rex;
  }
}
void remove_dollar_sign(char *str) {
  if (str[0] == '$')
    str++;
}

int opcode_mov(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens < 3) {
    fprintf(stderr, "mov failed: not enough operands\n");
    return false;
  }

  size_t str_idx = 0;
  size_t machine_code_len = 0;
  uint8_t *machine_code = malloc(10);
  int reg_token = -1, rm_token = -1;
  bool reg_minus = false, rm_minus = false;
  int reg_disp = 0, rm_disp = 0;
  bool reg_is_mem = false, rm_is_mem = false;

  size_t tok_idx = 1;
  parse_mov_operand(info->tokens, &tok_idx, &reg_token, &reg_disp, &reg_minus,
                    &reg_is_mem);
  if (reg_disp == 8) {
    if (str_idx >= info->nof_input_strings) {
      fprintf(stderr,
              "mov failed: not enough input strings, needed %ld got %ld\n",
              str_idx, info->nof_input_strings);
      return false;
    }
    char *disp_str = info->input_strings[str_idx++];
    remove_dollar_sign(disp_str);
    int actual_displacement = atoi(disp_str);
    reg_disp = actual_displacement;
  }
  parse_mov_operand(info->tokens, &tok_idx, &rm_token, &rm_disp, &rm_minus,
                    &rm_is_mem);
  if (rm_disp == 8) {
    if (str_idx >= info->nof_input_strings) {
      fprintf(stderr,
              "mov failed: not enough input strings, needed %ld got %ld\n",
              str_idx, info->nof_input_strings);
      return false;
    }
    char *disp_str = info->input_strings[str_idx++];
    remove_dollar_sign(disp_str);
    int actual_displacement = atoi(disp_str);
    rm_disp = actual_displacement;
  }

  reg_disp = reg_minus ? -reg_disp : reg_disp;
  rm_disp = rm_minus ? -rm_disp : rm_disp;

  if (reg_disp > 0 && rm_disp > 0) {
    fprintf(stderr, "mov failed: both operands have a displacement\n");
    return false;
  }

  int mod_bits;
  int displacement = rm_disp != 0 ? rm_disp : reg_disp;

  if (reg_is_mem) {
    // Handle immediate move
    uint8_t register_byte = 0xb8 + get_rm_reg_bits_from_reg(rm_token);
    machine_code[machine_code_len++] = register_byte;
    if (is_token_64bit(rm_token)) {
      // TODO: add REX
      uint64_t value = displacement;
      if (machine_code_len + sizeof(uint64_t) > 10) {
        fprintf(stderr, "mov failed: not enough bytes!\n");
        return false;
      }
      memcpy(machine_code + machine_code_len, &value, sizeof(uint64_t));
      machine_code += sizeof(uint64_t);
      add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL);
      return true;
    }
    if (machine_code_len + sizeof(uint32_t) > 10) {
      fprintf(stderr, "mov failed: not enough bytes!\n");
      return false;
    }
    uint32_t value = displacement;
    memcpy(machine_code + machine_code_len, &value, sizeof(uint32_t));
    machine_code += sizeof(uint32_t);
    add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL);
    return true;
  }

  if (displacement == 0)
    mod_bits = 0b11;
  else if (displacement >= -128 && displacement <= 127)
    mod_bits = 0b01;
  else
    mod_bits = 0b10;

  int reg_bits = get_rm_reg_bits_from_reg(reg_token);
  int rm_bits = get_rm_reg_bits_from_reg(rm_token);
  if (reg_bits < 0 || rm_bits < 0) {
    fprintf(stderr, "mov failed: could not get reg or rm bits from register\n");
    return false;
  }

  add_rex_if_required(reg_token, rm_token, machine_code, &machine_code_len);

  // Add opcode
  machine_code[machine_code_len++] = 0x89;

  // Add Mod R/M byte
  uint8_t modrm_byte =
      ((mod_bits & 0b11) << 6) | ((reg_bits & 0b111) << 3) | (rm_bits & 0b111);
  machine_code[machine_code_len++] = modrm_byte;

  // Add displacement if any
  if (displacement != 0) {
    machine_code[machine_code_len++] = displacement;
  }
  printf("\n");

  add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL);
  return true;
}

int opcode_sub(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens < 3) {
    fprintf(stderr, "mov failed: not enough operands\n");
    return false;
  }

  size_t str_idx = 0;
  int reg_token = -1, rm_token = -1;
  bool reg_minus = false, rm_minus = false;
  int reg_disp = 0, rm_disp = 0;
  bool reg_is_mem = false, rm_is_mem = false;

  size_t tok_idx = 1;
  parse_mov_operand(info->tokens, &tok_idx, &reg_token, &reg_disp, &reg_minus,
                    &reg_is_mem);
  if (reg_disp == 8) {
    if (str_idx >= info->nof_input_strings) {
      fprintf(stderr,
              "mov failed: not enough input strings, needed %ld got %ld\n",
              str_idx, info->nof_input_strings);
      return false;
    }
    char *disp_str = info->input_strings[str_idx++];
    remove_dollar_sign(disp_str);
    int actual_displacement = atoi(disp_str);
    reg_disp = actual_displacement;
  }
  parse_mov_operand(info->tokens, &tok_idx, &rm_token, &rm_disp, &rm_minus,
                    &rm_is_mem);
  if (rm_disp == 8) {
    if (str_idx >= info->nof_input_strings) {
      fprintf(stderr,
              "mov failed: not enough input strings, needed %ld got %ld\n",
              str_idx, info->nof_input_strings);
      return false;
    }
    char *disp_str = info->input_strings[str_idx++];
    remove_dollar_sign(disp_str);
    int actual_displacement = atoi(disp_str);
    rm_disp = actual_displacement;
  }

  reg_disp = reg_minus ? -reg_disp : reg_disp;
  rm_disp = rm_minus ? -rm_disp : rm_disp;
  int displacement = rm_disp != 0 ? rm_disp : reg_disp;

  uint8_t *machine_code = malloc(12);
  size_t machine_code_len = 0;

  if (reg_is_mem) {
    uint8_t opcode_byte = 0x81;
    uint8_t modrm_byte =
        (0b11 << 6) | (0b101 << 3) | get_rm_reg_bits_from_reg(rm_token);
    if (is_token_64bit(rm_token)) {
      uint8_t rex_prefix = REX_PREFIX_BASE | REX_PREFIX_W;
      machine_code[machine_code_len++] = rex_prefix;
      uint64_t value_byte = displacement;
      if (displacement <= 128 && displacement >= 0) {
        uint8_t value_byte = displacement;
        opcode_byte = 0x83;
        machine_code[machine_code_len++] = opcode_byte;
        machine_code[machine_code_len++] = modrm_byte;
        machine_code[machine_code_len++] = value_byte;
      } else {
        machine_code[machine_code_len++] = opcode_byte;
        machine_code[machine_code_len++] = modrm_byte;
        memcpy(machine_code + machine_code_len, &value_byte, sizeof(uint64_t));
        machine_code_len += sizeof(uint64_t);
      }
    } else if (is_token_32bit(rm_token)) {
      uint32_t value_byte = displacement;
      machine_code[machine_code_len++] = opcode_byte;
      machine_code[machine_code_len++] = modrm_byte;
      memcpy(machine_code + machine_code_len, &value_byte, sizeof(uint32_t));
      machine_code_len += sizeof(uint32_t);
    } else if (is_token_16bit(rm_token)) {
      uint16_t value_byte = displacement;
      machine_code[machine_code_len++] = opcode_byte;
      machine_code[machine_code_len++] = modrm_byte;
      memcpy(machine_code + machine_code_len, &value_byte, sizeof(uint16_t));
      machine_code_len += sizeof(uint16_t);
    } else {
      uint8_t value_byte = displacement;
      machine_code[machine_code_len++] = opcode_byte;
      machine_code[machine_code_len++] = modrm_byte;
      machine_code[machine_code_len++] = value_byte;
    }
    add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL);
  }
  // TODO: handle register to register subtractions
  return true;
}

int opcode_call(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens < 3) {
    fprintf(stderr, "call failed: 2 operands required\n");
    return false;
  }
  if (info->tokens[0] != OPCODE_CALL || info->tokens[1] != TOK_IDENT ||
      info->tokens[2] != TOK_PLT_FLAG) {
    fprintf(stderr, "call failed: got unexpected operand tokens\n");
    return false;
  }
  uint8_t machine_code[5] = {0xe8, 0x00, 0x00, 0x00, 0x00};

  if (info->nof_input_strings < 1) {
    fprintf(stderr, "call failed: function name required\n");
    return false;
  }
  char *called_function = info->input_strings[0];

  func_t new_func = {};
  new_func.is_global = true;
  new_func.location = 0;
  new_func.name = strdup(called_function);
  state->functions[state->nof_functions++] = new_func;

  rela_info_t rela;
  rela.offset = state->current_text_offset - 4;
  rela.addend = -4;
  rela.type = RELOC_PLT;

  add_new_inst(state, machine_code, 5, COMPLETE, &rela);

  return true;
}

int opcode_lea(text_state_t *state, line_info_t *info) {

  if (info->nof_tokens < 3) {
    fprintf(stderr, "lea failed: not enough operands\n");
    return false;
  }
  if (info->nof_input_strings < 1) {
    fprintf(stderr, "lea failed: rodata label required\n");
    return false;
  }

  int reg_token = -1, rm_token = -1;
  char *rodata_label = info->input_strings[0];

  size_t tok_idx = 1;

  if (info->tokens[tok_idx++] != TOK_RODATA_LABEL_REF) {
    fprintf(stderr, "lea failed: expected rodata reference in operand 1\n");
    return false;
  }
  if (info->tokens[tok_idx++] != TOK_OPENPAREN) {
    fprintf(stderr, "expected (\n");
    return false;
  }
  reg_token = info->tokens[tok_idx++];
  if (info->tokens[tok_idx++] != TOK_CLOSEPAREN) {
    fprintf(stderr, "expected )\n");
    return false;
  }
  rm_token = info->tokens[tok_idx++];

  uint8_t *machine_code = malloc(7);
  size_t machine_code_len = 0;

  if (is_token_64bit(rm_token) || is_token_64bit(reg_token)) {
    uint8_t rex_byte = REX_PREFIX_BASE | REX_PREFIX_W;
    machine_code[machine_code_len++] = rex_byte;
  }

  uint8_t opcode_byte = 0x8d;
  machine_code[machine_code_len++] = opcode_byte;

  uint8_t modrm_byte =
      (0b00 << 6) | (get_rm_reg_bits_from_reg(rm_token) << 3) | 0b101;

  machine_code[machine_code_len++] = modrm_byte;

  rodata_label += 3; // Skip .LC
  size_t label_index = atoi(rodata_label);
  if (label_index > 1024) {
    fprintf(stderr, "lea failed: cannot get index of constant %s\n",
            rodata_label);
    return false;
  }
  if (label_index >= state->nof_rodata_entries) {
    fprintf(stderr, "lea failed: constant index %ld does not exist\n",
            label_index);
    return false;
  }

  uint64_t addend = state->rodata_entries[label_index] - 4; // subtract addend 4

  size_t offset = state->current_text_offset + 3; // 3 bytes for the instruction
  rela_info_t rela;
  rela.offset = offset;
  rela.addend = addend;
  rela.name = ".rodata";
  rela.type = RELOC_PC_RELATIVE;

  // O placeholder for linker
  for (size_t i = 0; i < 4; i++)
    machine_code[machine_code_len++] = 0x00;

  add_new_inst(state, machine_code, machine_code_len, LEA_REQUIRES_OFFSET,
               &rela);

  return true;
}
