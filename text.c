#define _POSIX_C_SOURCE 200809L
#include "text.h"
#include "elf.h"
#include "lex.h"
#include "log.h"
#include "state.h"

bool add_new_inst(text_state_t *state, uint8_t *machine_code,
                  size_t machine_code_len, inst_status_t status,
                  rela_info_t *rela, void *extra) {
  // Increase size if needed
  if (state->nof_instructions + 1 > state->inst_capacity) {
    state->instructions =
        (inst_t *)realloc(state->instructions, state->inst_capacity * 2);
  }
  inst_t new_inst;
  new_inst.machine_code = machine_code;
  new_inst.machine_code_len = machine_code_len;
  new_inst.status = status;
  new_inst.rela = rela;
  new_inst.extra = extra;
  state->instructions[state->nof_instructions++] = new_inst;
  state->current_text_offset += machine_code_len;
  return true;
}

uint8_t get_mod_bits(operand_info_t *res) {
  int largest_disp = res->rm_disp != 0 ? res->rm_disp : res->reg_disp;

  if (largest_disp == 0) {
    return 0b11;
  }
  if (largest_disp <= 127 && largest_disp >= -128) {
    return 0b01;
  }

  return 0b10;
}

bool apply_text_shift(text_state_t *state, size_t instruction_start,
                      size_t shift_by) {
  jmp_extra_t *extra = state->instructions[instruction_start].extra;
  if (extra == NULL) {
    ASM_ERROR("text shift failed: no extra info for instruction %zu",
              instruction_start);
    return false;
  }
  for (size_t i = 0; i < state->nof_text_labels; i++) {
    if (state->text_labels[i].text_offset >= extra->jmp_location)
      state->text_labels[i].text_offset += shift_by;
  }
  for (size_t i = instruction_start + 1; i < state->nof_instructions; i++) {
    if (state->instructions[i].extra != NULL) {
      jmp_extra_t *e = state->instructions[i].extra;
      e->jmp_location += shift_by;
    }
  }
  state->current_text_offset += shift_by;
  return true;
}

char *parse_cstring_escapes(const char *input) {
  size_t len = strlen(input);
  char *output = malloc(len + 1);
  if (!output) {
    perror("malloc failed");
    exit(1);
  }

  size_t i = 0;
  size_t j = 0;

  while (i < len) {
    if (input[i] == '\\') {
      i++;
      if (i >= len)
        break;
      switch (input[i]) {
      case 'n':
        output[j++] = '\n';
        break;
      case 't':
        output[j++] = '\t';
        break;
      case 'r':
        output[j++] = '\r';
        break;
      case '\\':
        output[j++] = '\\';
        break;
      case '\'':
        output[j++] = '\'';
        break;
      case '\"':
        output[j++] = '\"';
        break;
      case '0':
        output[j++] = '\0';
        break;
      default:
        // Unknown escape, copy as-is
        output[j++] = input[i];
        break;
      }
    } else {
      output[j++] = input[i];
    }
    i++;
  }
  output[j] = '\0'; // null terminate

  return output;
}

bool tok_is_label(int tok) {
  return tok == TOK_RODATA_LABEL || tok == TOK_FUNC_END ||
         tok == TOK_FUNC_START || tok == TOK_IDENT_TAG || tok == TOK_TEXT_LABEL;
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
    ASM_ERROR("handle line: unexpected first token: %d", info->tokens[0]);
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
      ASM_ERROR("Expected label name in .text");
      return false;
    }
    // Function definition
    if (label_tok == TOK_IDENT_TAG) {
      label_name[strlen(label_name) - 1] = '\0'; // remove :
      func_t new_func = {};
      new_func.sec_idx = state->text_sec_idx;
      new_func.is_global = true;
      new_func.name = strdup(label_name);
      new_func.type = STT_FUNC;
      new_func.defined_in_file = true;
      state->functions[state->nof_functions++] = new_func;
      return true;
    }
    // define text label
    if (label_tok == TOK_TEXT_LABEL) {
    }
    // .LFB[0-9]
    if (label_tok == TOK_FUNC_START) {
      size_t file_defined_idx = 0;
      for (size_t i = 0; i < state->nof_functions; i++) {
        if (state->functions[i].defined_in_file) {
          if (file_defined_idx == state->local_function_idx) {
            state->functions[i].location = state->current_text_offset;
            break;
          }
          file_defined_idx++;
        }
      }
      return true;
    }
    // .LFE[0-9]
    if (label_tok == TOK_FUNC_END) {
      size_t file_defined_idx = 0;
      for (size_t i = 0; i < state->nof_functions; i++) {
        if (state->functions[i].defined_in_file) {
          if (file_defined_idx == state->local_function_idx) {
            state->functions[i].size =
                state->current_text_offset - state->functions[i].location;
            ASM_DEBUG("Found function %zu", state->local_function_idx);
            break;
          }
          file_defined_idx++;
        }
      }
      state->local_function_idx++;
      return true;
    }

    // .L[0-9]
    if (label_tok == TOK_TEXT_LABEL) {
      // remove :
      label_name[strlen(label_name) - 1] = '\0';
      text_label_t new_label;
      new_label.label = strdup(label_name);
      new_label.text_offset = state->current_text_offset;
      state->text_labels[state->nof_text_labels++] = new_label;
      return true;
    }

    ASM_ERROR("Got unexpected label in .text: %d", label_tok);
    return false;
  }
  case RODATA: {
    if (label_tok != TOK_RODATA_LABEL) {
      ASM_ERROR("Expected rodata constant label but got: %s", label_name);
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
      ASM_ERROR(".file directive requires string");
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
      ASM_ERROR("Encountered .string outside of rodata");
      return false;
    }

    // Remove quotes
    directive_str++;
    directive_str[strlen(directive_str) - 1] = '\0';

    const char *parsed_string = parse_cstring_escapes(directive_str);
    state->rodata_entries[state->nof_rodata_entries - 1] =
        strlen(parsed_string) + 1;
    buffer_append(state->rodata_buffer, parsed_string, strlen(parsed_string));
    uint8_t null_byte = '\0';
    buffer_append(state->rodata_buffer, &null_byte, 1);
    return true;
  }
  case TOK_GLOBLDEF: {
    if (state->parse_mode != TEXT) {
      ASM_ERROR("Encountered .globl outside of .text");
      return false;
    }
    if (directive_str == NULL) {
      ASM_ERROR(".globl requires string");
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
  case TOK_ALIGN: {
    if (state->parse_mode != RODATA) {
      ASM_ERROR("Got .align outside of .rodata");
      return false;
    }
    if (info->nof_input_strings < 1) {
      ASM_ERROR(".align requires value");
      return false;
    }
    state->rodata_align = atoi(info->input_strings[0]);

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
    ASM_ERROR("Unexpected directive");
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
    ASM_ERROR("unknown .section directive: %s", directive_str);
    return false;
  }
}

bool handle_machine_code(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens < 1)
    return false;

  switch (info->tokens[0]) {
  case OPCODE_MOV:
  case OPCODE_MOVB:
  case OPCODE_MOVZ:
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
  case OPCODE_JMP:
  case OPCODE_JE:
  case OPCODE_JNE:
  case OPCODE_JG:
  case OPCODE_JGE:
  case OPCODE_JL:
  case OPCODE_JLE:
  case OPCODE_JNS:
  case OPCODE_JS:
    return opcode_jmp(state, info);
  case OPCODE_CMPQ:
  case OPCODE_CMPL:
  case OPCODE_CMPB:
    return opcode_cmp(state, info);
  case OPCODE_NOP:
    return opcode_nop(state);
  case OPCODE_POP:
    return opcode_pop(state, info);
  case OPCODE_CQD:
    return opcode_cqd(state);
  case OPCODE_CQO:
    return opcode_cqo(state);
  case OPCODE_DIVB:
  case OPCODE_IDIVQ:
    return opcode_mul(state, info);
  case OPCODE_ADDB:
  case OPCODE_ADDL:
  case OPCODE_ADDQ:
    return opcode_add(state, info);
  default:
    ASM_WARN("Encountered unknown instruction on line %d: 0x%02x", line_num,
             info->tokens[0]);
    break;
  }
  return true;
}

bool opcode_leave(text_state_t *state) {
  uint8_t *machine_code = malloc(1);
  machine_code[0] = 0xc9;
  add_new_inst(state, machine_code, 1, COMPLETE, NULL, NULL);
  return true;
}

bool opcode_cqd(text_state_t *state) {
  uint8_t *machine_code = malloc(1);
  machine_code[0] = 0x99;
  add_new_inst(state, machine_code, 1, COMPLETE, NULL, NULL);
  return true;
}

bool opcode_cqo(text_state_t *state) {
  uint8_t *machine_code = malloc(2);
  machine_code[0] = 0x48;
  machine_code[1] = 0x99;
  add_new_inst(state, machine_code, 1, COMPLETE, NULL, NULL);
  return true;
}

bool opcode_nop(text_state_t *state) {
  uint8_t *machine_code = malloc(1);
  machine_code[0] = 0x90;
  add_new_inst(state, machine_code, 1, COMPLETE, NULL, NULL);
  return true;
}

bool opcode_ret(text_state_t *state) {
  uint8_t *machine_code = malloc(1);
  machine_code[0] = 0xc3;
  add_new_inst(state, machine_code, 1, COMPLETE, NULL, NULL);
  return true;
}

bool opcode_push(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens != 2) {
    ASM_ERROR("push encoding failed: expected 2 operands but got %ld",
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
    ASM_ERROR("push encoding failed: unsupported operand token: %d",
              info->tokens[1]);
    free(machine_code);
    return false;
  }

  add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);
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

bool unpack_operands(line_info_t *info, operand_info_t *res) {
  res->reg_disp = -1;
  res->rm_token = -1;
  res->rm_disp = 0;
  res->reg_disp = 0;
  res->reg_is_mem = false;
  res->rm_is_mem = false;
  res->reg_is_imm = false;
  size_t tok_idx = 1;
  size_t string_idx = 0;
  bool reg_disp_minus = false, rm_disp_minus = false;
  if (info->nof_tokens < 3) {
    ASM_ERROR("unpack operands failed: not enough tokens");
    return false;
  }

  if (info->tokens[tok_idx] == TOK_MINUS) {
    tok_idx++;
    reg_disp_minus = true;
    if (info->tokens[tok_idx] != TOK_NUM) {
      ASM_ERROR("unpack operands failed: encountered - without number");
      return false;
    }
  }
  if (info->tokens[tok_idx] == TOK_NUM) {
    if (string_idx + 1 > info->nof_input_strings) {
      ASM_ERROR("unpack_operands failed: not enough displacement values");
      return false;
    }
    char *disp_val = info->input_strings[string_idx++];
    if (disp_val[0] == '$')
      disp_val++;
    res->reg_disp = atoi(disp_val);
    tok_idx++;

    if (info->tokens[tok_idx] == TOK_OPENPAREN) {
      tok_idx++;
      res->reg_token = info->tokens[tok_idx++];
      if (info->tokens[tok_idx++] != TOK_CLOSEPAREN) {
        ASM_ERROR("unpack_operands failed: expected ) after register");
        return false;
      }
      res->reg_is_mem = true;
    } else {
      res->reg_is_imm = true;
    }
  } else {
    res->reg_token = info->tokens[tok_idx++];
  }

  if (info->tokens[tok_idx] == TOK_MINUS) {
    tok_idx++;
    rm_disp_minus = true;
    if (info->tokens[tok_idx] != TOK_NUM) {
      ASM_ERROR("unpack operands failed: encountered - without number");
      return false;
    }
  }
  if (info->tokens[tok_idx] == TOK_NUM) {
    if (string_idx + 1 > info->nof_input_strings) {
      ASM_ERROR("unpack_operands failed: not enough displacement values");
      return false;
    }
    char *disp_val = info->input_strings[string_idx++];
    if (disp_val[0] == '$')
      disp_val++;
    res->rm_disp = atoi(disp_val);
    tok_idx++;

    if (info->tokens[tok_idx] == TOK_OPENPAREN) {
      tok_idx++;
      res->rm_token = info->tokens[tok_idx++];
      if (info->tokens[tok_idx++] != TOK_CLOSEPAREN) {
        ASM_ERROR("unpack_operands failed: expected ) after register");
        return false;
      }
      res->rm_is_mem = true;
    } else {
      ASM_ERROR("Imm in second operand is not allowed");
      return false;
    }
  } else {
    res->rm_token = info->tokens[tok_idx++];
  }
  if (reg_disp_minus)
    res->reg_disp = res->reg_disp * -1;

  if (rm_disp_minus)
    res->rm_disp = res->rm_disp * -1;

  ASM_DEBUG("Finished parsing operands on line %d:", line_num);
  ASM_DEBUG("reg: %d(%d) | rm: %d(%d)", res->reg_disp, res->reg_token,
            res->rm_disp, res->rm_token);

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

bool opcode_mov(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens < 3) {
    ASM_ERROR("mov failed: not enough operands");
    return false;
  }

  size_t machine_code_len = 0;
  uint8_t *machine_code = malloc(10);

  operand_info_t *res = NULL;
  res = malloc(sizeof(operand_info_t));
  memset(res, 0, sizeof(operand_info_t));
  if (!unpack_operands(info, res)) {
    return false;
  }

  add_rex_if_required(res->reg_token, res->rm_token, machine_code,
                      &machine_code_len);

  if (res->reg_is_imm) {
    if (res->rm_is_mem) {
      machine_code[machine_code_len++] = 0xc7;
      uint8_t mod_bits = get_mod_bits(res);
      machine_code[machine_code_len++] =
          (mod_bits << 6) | (0b000 << 3) |
          get_rm_reg_bits_from_reg(res->rm_token);
      switch (mod_bits) {
      case 0b01:
        machine_code[machine_code_len++] = res->rm_disp & 0xff;
        break;
      case 0b10: {
        uint32_t value = res->rm_disp;
        memcpy(machine_code + machine_code_len, &value, sizeof(uint32_t));
        machine_code_len += sizeof(uint32_t);
        break;
      }
      default:
        ASM_ERROR("Got unexpected mod bits in mov r/m64 imm");
        return false;
      }
      uint32_t imm_value = res->reg_disp;
      memcpy(machine_code + machine_code_len, &imm_value, sizeof(uint32_t));
      machine_code_len += sizeof(uint32_t);

      add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);
      return true;
    }
    // Handle immediate move
    uint8_t register_byte = 0xb8 + get_rm_reg_bits_from_reg(res->rm_token);
    machine_code[machine_code_len++] = register_byte;
    if (is_token_64bit(res->rm_token)) {
      uint64_t value = res->reg_disp;
      if (machine_code_len + sizeof(uint64_t) > 10) {
        ASM_ERROR("mov failed: not enough bytes!");
        return false;
      }
      memcpy(machine_code + machine_code_len, &value, sizeof(uint64_t));
      machine_code_len += sizeof(uint64_t);
      add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);
      return true;
    }
    if (machine_code_len + sizeof(uint32_t) > 10) {
      ASM_ERROR("mov failed: not enough bytes!");
      return false;
    }
    uint32_t value = res->reg_disp;
    memcpy(machine_code + machine_code_len, &value, sizeof(uint32_t));
    machine_code_len += sizeof(uint32_t);
    add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);
    return true;
  }

  int mod_bits = get_mod_bits(res);

  int reg_bits = get_rm_reg_bits_from_reg(res->reg_token);
  int rm_bits = get_rm_reg_bits_from_reg(res->rm_token);
  if (reg_bits < 0 || rm_bits < 0) {
    ASM_ERROR("mov failed: could not get reg or rm bits from register");
    return false;
  }

  // Add opcode
  if (info->tokens[0] == OPCODE_MOVZ) {
    machine_code[machine_code_len++] = 0x0f;
    machine_code[machine_code_len++] = 0xb6;
  } else {
    if (res->reg_disp != 0)
      machine_code[machine_code_len++] = 0x8b;
    else
      machine_code[machine_code_len++] = info->tokens[0];
  }

  // Add Mod R/M byte
  uint8_t modrm_byte = 0;
  if (res->reg_disp != 0)
    modrm_byte = ((mod_bits & 0b11) << 6) | ((rm_bits & 0b111) << 3) |
                 (reg_bits & 0b111);
  else
    modrm_byte = ((mod_bits & 0b11) << 6) | ((reg_bits & 0b111) << 3) |
                 (rm_bits & 0b111);
  machine_code[machine_code_len++] = modrm_byte;

  // Add displacement if any
  if (res->reg_disp != 0 || info->tokens[0] == OPCODE_MOVZ) {
    machine_code[machine_code_len++] = res->reg_disp;
  }

  if (res->rm_disp != 0) {
    machine_code[machine_code_len++] = res->rm_disp;
  }

  add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);
  return true;
}

bool opcode_sub(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens < 3) {
    ASM_ERROR("mov failed: not enough operands");
    return false;
  }

  operand_info_t *res = NULL;
  res = malloc(sizeof(operand_info_t));
  memset(res, 0, sizeof(operand_info_t));
  if (!unpack_operands(info, res)) {
    return false;
  }

  uint8_t *machine_code = malloc(12);
  size_t machine_code_len = 0;

  if (res->reg_is_imm) {
    uint8_t opcode_byte = 0x81;
    uint8_t modrm_byte =
        (0b11 << 6) | (0b101 << 3) | get_rm_reg_bits_from_reg(res->rm_token);
    if (is_token_64bit(res->rm_token)) {
      uint8_t rex_prefix = REX_PREFIX_BASE | REX_PREFIX_W;
      machine_code[machine_code_len++] = rex_prefix;
      uint64_t value_byte = res->reg_disp;
      if (res->reg_disp <= 128 && res->reg_disp >= 0) {
        uint8_t value_byte = res->reg_disp;
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
    } else if (is_token_32bit(res->rm_token)) {
      uint32_t value_byte = res->reg_disp;
      machine_code[machine_code_len++] = opcode_byte;
      machine_code[machine_code_len++] = modrm_byte;
      memcpy(machine_code + machine_code_len, &value_byte, sizeof(uint32_t));
      machine_code_len += sizeof(uint32_t);
    } else if (is_token_16bit(res->reg_disp)) {
      uint16_t value_byte = res->reg_disp;
      machine_code[machine_code_len++] = opcode_byte;
      machine_code[machine_code_len++] = modrm_byte;
      memcpy(machine_code + machine_code_len, &value_byte, sizeof(uint16_t));
      machine_code_len += sizeof(uint16_t);
    } else {
      uint8_t value_byte = res->reg_disp;
      machine_code[machine_code_len++] = opcode_byte;
      machine_code[machine_code_len++] = modrm_byte;
      machine_code[machine_code_len++] = value_byte;
    }
    add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);
  }
  // TODO: handle register to register subtractions
  return true;
}

bool opcode_cmp(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens < 3) {
    ASM_ERROR("mov failed: not enough operands");
    return false;
  }

  operand_info_t *res = NULL;
  res = malloc(sizeof(operand_info_t));
  memset(res, 0, sizeof(operand_info_t));
  if (!unpack_operands(info, res)) {
    return false;
  }

  uint8_t *machine_code = malloc(12);
  size_t machine_code_len = 0;

  if (res->reg_is_imm) {
    if (res->rm_token == TOK_REG_AL) {
      machine_code[machine_code_len++] = 0x3c;
      machine_code[machine_code_len++] = res->reg_disp & 0xff;
      add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);
      return true;
    }
    uint8_t opcode_byte = 0x81;
    uint8_t modrm_byte =
        (0b01 << 6) | (0b111 << 3) | get_rm_reg_bits_from_reg(res->rm_token);
    if (is_token_64bit(res->rm_token)) {
      uint64_t value_byte = res->reg_disp;
      if (res->rm_disp >= -127 && res->rm_disp <= 128) {
        uint8_t single_byte_disp = res->rm_disp & 0xff;
        opcode_byte = 0x83;
        machine_code[machine_code_len++] = opcode_byte;
        machine_code[machine_code_len++] = modrm_byte;
        machine_code[machine_code_len++] = single_byte_disp;
      } else {
        machine_code[machine_code_len++] = opcode_byte;
        machine_code[machine_code_len++] = modrm_byte;
        memcpy(machine_code + machine_code_len, &value_byte, sizeof(uint64_t));
        machine_code_len += sizeof(uint64_t);
      }
    } else if (is_token_32bit(res->rm_token)) {
      uint32_t value_byte = res->reg_disp;
      machine_code[machine_code_len++] = opcode_byte;
      machine_code[machine_code_len++] = modrm_byte;
      memcpy(machine_code + machine_code_len, &value_byte, sizeof(uint32_t));
      machine_code_len += sizeof(uint32_t);
    } else if (is_token_16bit(res->rm_token)) {
      uint16_t value_byte = res->reg_disp;
      machine_code[machine_code_len++] = opcode_byte;
      machine_code[machine_code_len++] = modrm_byte;
      memcpy(machine_code + machine_code_len, &value_byte, sizeof(uint16_t));
      machine_code_len += sizeof(uint16_t);
    } else {
      uint8_t value_byte = res->reg_disp;
      machine_code[machine_code_len++] = opcode_byte;
      machine_code[machine_code_len++] = modrm_byte;
      machine_code[machine_code_len++] = value_byte;
    }

    // add the mem val
    machine_code[machine_code_len++] = res->reg_disp & 0xff;
    add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);
    return true;
  }
  add_rex_if_required(res->reg_token, res->rm_token, machine_code,
                      &machine_code_len);
  uint8_t opcode_byte = 0x3b;
  uint8_t modrm_byte =
      (0b11 << 6) | ((get_rm_reg_bits_from_reg(res->reg_token) & 0xff) << 3) |
      (get_rm_reg_bits_from_reg(res->rm_token) & 0xff);
  machine_code[machine_code_len++] = opcode_byte;
  machine_code[machine_code_len++] = modrm_byte;

  add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);

  return true;
}

bool handle_plt_call(text_state_t *state, char *called_function,
                     uint8_t *machine_code, size_t machine_code_len) {

  func_t new_func = {};
  new_func.is_global = true;
  new_func.location = 0;
  new_func.sec_idx = SHN_UNDEF;
  new_func.name = strdup(called_function);
  new_func.type = STT_NOTYPE;
  new_func.defined_in_file = false;
  state->functions[state->nof_functions++] = new_func;

  rela_info_t *rela = (rela_info_t *)malloc(sizeof(rela_info_t));
  memset(rela, 0, sizeof(rela_info_t));
  rela->offset = state->current_text_offset + machine_code_len - 4;
  rela->name = strdup(called_function);
  rela->addend = -4;
  rela->type = RELOC_PLT;

  add_new_inst(state, machine_code, machine_code_len, COMPLETE, rela, NULL);

  return true;
}

bool opcode_call(text_state_t *state, line_info_t *info) {
  uint8_t *machine_code = malloc(5);
  size_t machine_code_len = 0;
  machine_code[machine_code_len++] = 0xe8;
  // blank address for linker
  for (size_t i = 0; i < 4; i++)
    machine_code[machine_code_len++] = 0x00;

  if (info->nof_input_strings < 1) {
    ASM_ERROR("call failed: function name required");
    return false;
  }

  char *called_function = info->input_strings[0];
  if (info->nof_tokens == 3) {
    if (info->tokens[0] != OPCODE_CALL || info->tokens[1] != TOK_IDENT ||
        info->tokens[2] != TOK_PLT_FLAG) {
      ASM_ERROR("call failed: got unexpected operand tokens");
      return false;
    }
    return handle_plt_call(state, called_function, machine_code,
                           machine_code_len);
  }
  if (info->nof_tokens < 2) {
    ASM_ERROR("At least 2 operands required for call");
    return false;
  }

  rela_info_t *rela = (rela_info_t *)malloc(sizeof(rela_info_t));
  memset(rela, 0, sizeof(rela_info_t));
  rela->offset = state->current_text_offset + machine_code_len - 4;
  rela->name = strdup(called_function);
  rela->addend = -4;
  rela->type = RELOC_PLT;

  add_new_inst(state, machine_code, machine_code_len, COMPLETE, rela, NULL);
  return true;
}

bool opcode_pop(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens < 2) {
    ASM_ERROR("pop requires two operands");
    return false;
  }
  uint8_t opcode_byte =
      0x58 + (get_rm_reg_bits_from_reg(info->tokens[1]) & 0xff);
  uint8_t *machine_code = malloc(1);
  size_t machine_code_len = 0;
  machine_code[machine_code_len++] = opcode_byte;
  add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);
  return true;
}

bool lea_mem_expr(text_state_t *state, line_info_t *info) {
  int displacement = 0, base_reg = -1, index_reg = -1, scale = 1;
  size_t tok_idx = 1;
  size_t str_idx = 0;
  if (info->tokens[tok_idx] == TOK_NUM) {
    if (info->nof_input_strings < str_idx + 1) {
      ASM_ERROR("lea displacement value expected");
      return false;
    }
    displacement = atoi(info->input_strings[str_idx++]);
    tok_idx++;
  }
  if (info->tokens[tok_idx++] != TOK_OPENPAREN) {
    ASM_ERROR("lea parsing ( expected");
    return false;
  }
  index_reg = info->tokens[tok_idx++];
  if (info->tokens[tok_idx] >= TOK_REG_RAX &&
      info->tokens[tok_idx] <= TOK_REG_SS) {
    base_reg = index_reg;
    index_reg = info->tokens[tok_idx++];
  }
  if (info->tokens[tok_idx] == TOK_NUM) {
    if (info->nof_input_strings < str_idx + 1) {
      ASM_ERROR("lea failed: not enough input strings");
      return false;
    }
    scale = atoi(info->input_strings[str_idx++]);
    tok_idx++;
  }
  if (info->tokens[tok_idx++] != TOK_CLOSEPAREN) {
    ASM_ERROR("lea failed: expected )");
    return false;
  }

  int dest_reg = info->tokens[tok_idx];

  uint8_t *machine_code = malloc(7);
  size_t machine_code_len = 0;

  machine_code[machine_code_len++] = 0x8d;
  uint8_t modrm_byte =
      (0b00 << 6) | (0b101 << 3) | get_rm_reg_bits_from_reg(dest_reg);
  machine_code[machine_code_len++] = modrm_byte;

  uint8_t scale_bits = 0b00;
  switch (scale) {
  case 1:
    scale_bits = 0b00;
    break;
  case 2:
    scale_bits = 0b01;
    break;
  case 4:
    scale_bits = 0b10;
    break;
  case 8:
    scale_bits = 0b11;
    break;
  default:
    ASM_ERROR("Unexpected scaling %d", scale);
    return false;
  }
  uint8_t base_bits = 0b000;
  if (base_reg == -1) {
    base_bits = 0b100;
  } else {
    base_bits = get_rm_reg_bits_from_reg(base_reg);
  }
  uint8_t sib_byte = (scale_bits << 6) |
                     (get_rm_reg_bits_from_reg(index_reg) << 3) | base_bits;
  machine_code[machine_code_len++] = sib_byte;

  if (displacement > 0) {
    uint32_t disp_val = displacement;
    memcpy(machine_code + machine_code_len, &disp_val, 4);
    machine_code_len += 4;
  }

  add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);
  return true;
}

bool opcode_lea(text_state_t *state, line_info_t *info) {

  if (info->nof_tokens < 3) {
    ASM_ERROR("lea failed: not enough operands");
    return false;
  }
  if (info->nof_input_strings < 1) {
    ASM_ERROR("lea failed: rodata label required");
    return false;
  }

  int reg_token = -1, rm_token = -1;
  char *rodata_label = info->input_strings[0];

  size_t tok_idx = 1;

  if (info->tokens[tok_idx] != TOK_RODATA_LABEL_REF) {
    if (info->tokens[tok_idx] != TOK_NUM &&
        info->tokens[tok_idx] != TOK_OPENPAREN) {
      ASM_ERROR("memory expression lea got unexpected arguments");
      return false;
    }
    return lea_mem_expr(state, info);
  }
  tok_idx++;
  if (info->tokens[tok_idx++] != TOK_OPENPAREN) {
    ASM_ERROR("expected (");
    return false;
  }
  reg_token = info->tokens[tok_idx++];
  if (info->tokens[tok_idx++] != TOK_CLOSEPAREN) {
    ASM_ERROR("expected )");
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
    ASM_ERROR("lea failed: cannot get index of constant %s", rodata_label);
    return false;
  }
  if (label_index >= state->nof_rodata_entries) {
    ASM_ERROR("lea failed: constant index %ld does not existn", label_index);
    return false;
  }

  // Get the beginning of the str

  uint64_t addend = 0;
  if (label_index >= 1)
    addend = state->rodata_entries[label_index - 1];
  else
    addend = 0;
  addend -= 4;

  size_t offset = state->current_text_offset + 3; // 3 bytes for the instruction
  rela_info_t *rela = (rela_info_t *)malloc(sizeof(rela_info_t));
  memset(rela, 0, sizeof(rela_info_t));
  rela->offset = offset;
  rela->addend = addend;
  rela->name = strdup(".rodata");
  rela->type = RELOC_PC_RELATIVE;

  // O placeholder for linker
  for (size_t i = 0; i < 4; i++)
    machine_code[machine_code_len++] = 0x00;

  add_new_inst(state, machine_code, machine_code_len, LEA_REQUIRES_OFFSET, rela,
               NULL);

  return true;
}

bool opcode_jmp(text_state_t *state, line_info_t *info) {
  if (info->tokens[1] != TOK_TEXT_LABEL_REF) {
    ASM_ERROR("jmp expected text label reference");
    return false;
  }
  if (info->nof_input_strings < 1) {
    ASM_ERROR("jmp requires label str");
    return false;
  }
  uint8_t *machine_code = malloc(6); // maximum near jump length
  size_t machine_code_len = 0;
  if (info->tokens[0] == OPCODE_JMP)
    machine_code[machine_code_len++] = 0xeb; // short jump code
  else
    machine_code[machine_code_len++] = info->tokens[0];
  machine_code[machine_code_len++] = 0x00; // short jump placeholder

  jmp_extra_t *extra = malloc(sizeof(jmp_extra_t));
  memset(extra, 0, sizeof(jmp_extra_t));
  extra->jmp_location = state->current_text_offset;
  extra->label = strdup(info->input_strings[0]);
  add_new_inst(state, machine_code, machine_code_len, JMP_REQUIRES_OFFSET, NULL,
               extra);
  return true;
}

bool opcode_mul(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens < 2) {
    ASM_ERROR("mul requires 2 operands");
    return false;
  }
  if (info->nof_input_strings < 1) {
    ASM_ERROR("mul requires label str");
    return false;
  }
  uint8_t *machine_code = malloc(10);
  size_t machine_code_len = 0;
  // get opcode
  machine_code[machine_code_len++] = info->tokens[0] & 0xff;
  operand_info_t *res = NULL;
  res = malloc(sizeof(operand_info_t));
  memset(res, 0, sizeof(operand_info_t));

  size_t tok_idx = 1;
  bool rm_disp_minus = false;
  if (info->tokens[tok_idx] == TOK_MINUS) {
    tok_idx++;
    rm_disp_minus = true;
    if (info->tokens[tok_idx] != TOK_NUM) {
      ASM_ERROR("opcode_mul failed: encountered - without number");
      return false;
    }
  }
  if (info->tokens[tok_idx] == TOK_NUM) {
    if (info->nof_input_strings < 2) {
      ASM_ERROR("opcode_mul failed: not enough displacement values");
      return false;
    }
    char *disp_val = info->input_strings[1];
    if (disp_val[0] == '$')
      disp_val++;
    res->rm_disp = atoi(disp_val);
    tok_idx++;

    if (info->tokens[tok_idx] == TOK_OPENPAREN) {
      tok_idx++;
      res->rm_token = info->tokens[tok_idx++];
      if (info->tokens[tok_idx++] != TOK_CLOSEPAREN) {
        ASM_ERROR("unpack_operands failed: expected ) after register");
        return false;
      }
    } else {
      res->reg_is_imm = true;
    }
  } else {
    res->rm_token = info->tokens[tok_idx++];
  }
  if (rm_disp_minus)
    res->rm_disp = res->rm_disp * -1;

  uint8_t modrm_byte = 0;
  uint8_t mod_bits = get_mod_bits(res);
  uint8_t reg_bits = 0, rm_bits = get_rm_reg_bits_from_reg(res->rm_token);
  // TODO: handle imulw and the like
  //

  if (memcmp(info->input_strings[0], "test", 4) == 0) {
    reg_bits = 0b000;
  } else if (memcmp(info->input_strings[0], "not", 3) == 0) {
    reg_bits = 0b010;
  } else if (memcmp(info->input_strings[0], "neg", 3) == 0) {
    reg_bits = 0b011;
  } else if (memcmp(info->input_strings[0], "mul", 3) == 0) {
    reg_bits = 0b100;
  } else if (memcmp(info->input_strings[0], "imul", 4) == 0) {
    reg_bits = 0b101;
  } else if (memcmp(info->input_strings[0], "div", 3) == 0) {
    reg_bits = 0b110;
  } else if (memcmp(info->input_strings[0], "idiv", 4) == 0) {
    reg_bits = 0b111;
  }

  modrm_byte = (mod_bits << 6) | (reg_bits << 3) | rm_bits;
  machine_code[machine_code_len++] = modrm_byte;

  if (res->rm_disp != 0) {
    ASM_DEBUG("RM DISP: %d", res->rm_disp);
    if (mod_bits == 0b01) {
      machine_code[machine_code_len++] = res->rm_disp & 0xff;
    } else {
      int32_t disp_val = res->rm_disp;
      memcpy(machine_code + machine_code_len, &disp_val, sizeof(int32_t));
      machine_code_len += sizeof(int32_t);
    }
  }

  add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);

  return true;
}

bool opcode_add(text_state_t *state, line_info_t *info) {
  if (info->nof_tokens < 3) {
    ASM_ERROR("add requires 2 operands");
    return false;
  }
  uint8_t *machine_code = malloc(10);
  size_t machine_code_len = 0;

  // get opcode
  operand_info_t *res = NULL;
  res = malloc(sizeof(operand_info_t));
  memset(res, 0, sizeof(operand_info_t));
  if (!unpack_operands(info, res)) {
    return false;
  }

  add_rex_if_required(res->reg_token, res->rm_token, machine_code,
                      &machine_code_len);

  if (res->reg_is_imm) {
    if (res->rm_is_mem) {
      uint8_t opcode_byte;
      if (res->reg_disp >= -128 && res->reg_disp <= 127) {
        opcode_byte = 0x83;
      } else {
        opcode_byte = 0x81;
      }
      machine_code[machine_code_len++] = opcode_byte;
      uint8_t mod_bits = get_mod_bits(res);
      uint8_t modrm_byte = (mod_bits << 6) | (0b000 << 3) |
                           get_rm_reg_bits_from_reg(res->rm_token);
      machine_code[machine_code_len++] = modrm_byte;

      switch (mod_bits) {
      case 0b01:
        machine_code[machine_code_len++] = res->rm_disp & 0xff;
        break;

      case 0b10: {
        uint32_t disp_val = res->rm_disp;
        memcpy(machine_code + machine_code_len, &disp_val, sizeof(uint32_t));
        machine_code_len += sizeof(uint32_t);
        break;
      }
      default:
        ASM_ERROR("encountered unexpected mod bits in mov r/m64 imm");
        return false;
      }
      switch (opcode_byte) {
      case 0x83:
        machine_code[machine_code_len++] = res->reg_disp & 0xff;
        break;

      case 0x81: {
        uint32_t imm_val = res->reg_disp;
        memcpy(machine_code + machine_code_len, &imm_val, sizeof(uint32_t));
        machine_code_len += sizeof(uint32_t);
        break;
      }
      default:
        ASM_ERROR("encountered unexpected opcode in mov r/m64 imm");
        return false;
      }
      add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);
      return true;
    }
    // TODO: implement
    ASM_ERROR("add from imm to reg is not implemented");
    return false;
  }

  machine_code[machine_code_len++] = info->tokens[0] & 0xff;

  uint8_t mod_bits = get_mod_bits(res);
  uint8_t modrm_byte = (mod_bits << 6) |
                       (get_rm_reg_bits_from_reg(res->rm_token) << 3) |
                       get_rm_reg_bits_from_reg(res->reg_token);
  machine_code[machine_code_len++] = modrm_byte;

  add_new_inst(state, machine_code, machine_code_len, COMPLETE, NULL, NULL);

  return true;
}
