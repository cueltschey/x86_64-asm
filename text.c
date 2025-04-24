#include "text.h"
#include "elf.h"
#include "lex.h"
#include "state.h"
#include <elf.h>
#include <stdlib.h>

// Opcode handlers
int opcode_push(asm_state_t *state, int tokens[MAX_LINE_SIZE],
                size_t nof_tokens);
int opcode_mov(asm_state_t *state, int tokens[MAX_LINE_SIZE], size_t nof_tokens,
               char *input_strings[10], size_t nof_input_strings);

int opcode_sub(asm_state_t *state, int tokens[MAX_LINE_SIZE], size_t nof_tokens,
               char *input_strings[10], size_t nof_input_strings);

int opcode_call(asm_state_t *state, int tokens[MAX_LINE_SIZE],
                size_t nof_tokens, char *input_strings[10],
                size_t nof_input_strings);

int opcode_lea(asm_state_t *state, int tokens[MAX_LINE_SIZE], size_t nof_tokens,
               char *input_strings[10], size_t nof_input_strings);

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

bool handle_line(asm_state_t *state, int tokens[MAX_LINE_SIZE],
                 size_t nof_tokens, char *input_strings[10],
                 size_t nof_input_strings) { // reset text offset
  state->current_text_offset = state->sections[state->text_idx].content.size;
  printf("Processing line %d: ", line_num);
  for (size_t i = 0; i < nof_tokens; i++) {
    printf("%d ", tokens[i]);
  }
  printf("\n");

  // ignore blank lines
  if (nof_tokens < 1)
    return true;

  if (tok_is_label(tokens[0])) {
    if (nof_input_strings < 1) {
      return handle_label(state, tokens[0], NULL);
    }
    return handle_label(state, tokens[0], input_strings[0]);
  }

  if (tok_is_directive(tokens[0])) {
    if (nof_input_strings < 1) {
      return handle_directive(state, tokens, nof_tokens, NULL);
    }
    return handle_directive(state, tokens, nof_tokens, input_strings[0]);
  }

  if (tok_is_machine_code(tokens[0]))
    return handle_machine_code(state, tokens, nof_tokens, input_strings,
                               nof_input_strings);

  fprintf(stderr, "Encountered bad token: %d\n", tokens[0]);
  return false;
}

bool handle_label(asm_state_t *state, int label_tok, char *label_name) {
  switch (state->parse_mode) {
  case TEXT: {
    // Ignore function labels
    if (label_tok == TOK_FUNC_START)
      return true;
    if (label_tok == TOK_FUNC_END) {
      elf_symbol_t *function_sym = NULL;
      for (size_t i = 0; i < state->nof_symbols; i++) {
        printf("DEBUG: %ld %s\n", i, state->symbols[i].name);
        if ((state->symbols[i].info & 0xf) == STT_FUNC) {
          function_sym = &state->symbols[i];
        }
      }
      if (function_sym == NULL)
        return true;
      function_sym->size =
          state->sections[state->text_idx].content.size - function_sym->value;
      return true;
    }
    // remove colon
    if (label_tok == TOK_IDENT_TAG)
      label_name[strlen(label_name) - 1] = '\0';
    elf_symbol_t *sym = find_symbol(state, label_name);
    if (sym == NULL) {
      fprintf(stderr, ".text: No such symbol %s\n", label_name);
      return false;
    }
    sym->value = state->current_text_offset;
    break;
  }
  case RODATA: {
    if (label_tok != TOK_RODATA_LABEL) {
      fprintf(stderr, "Expected rodata constant label but got: %s\n",
              label_name);
      return false;
    }
    state->nof_rodata_entries++;
    break;
  }
  default:
    break;
  }
  return true;
}

bool handle_directive(asm_state_t *state, int tokens[MAX_LINE_SIZE],
                      size_t nof_tokens, char *directive_str) {
  if (nof_tokens < 1)
    return false;

  switch (tokens[0]) {
  case TOK_FILEHEADER: {
    if (directive_str[0] == '"')
      directive_str++;
    if (directive_str[strlen(directive_str) - 1] == '"')
      directive_str[strlen(directive_str) - 1] = '\0';
    add_symbol(state, directive_str, SHN_ABS, 0, STT_FILE, STB_LOCAL);
    return true;
  }
  case TOK_SECTION_TEXT: {
    state->parse_mode = TEXT;
    elf_symbol_t *sym = NULL;
    if ((sym = find_symbol(state, ".text")) == NULL)
      add_symbol(state, ".text", state->text_idx, 0, STT_SECTION, STB_LOCAL);
    return true;
  }
  case TOK_STRINGDEF: {
    if (state->parse_mode != RODATA) {
      fprintf(stderr, "Encountered .string outside of rodata\n");
      return false;
    }

    if (directive_str[0] == '"')
      directive_str++;
    if (directive_str[strlen(directive_str) - 1] == '"')
      directive_str[strlen(directive_str) - 1] = '\0';

    state->rodata_entries[state->nof_rodata_entries - 1] =
        state->sections[state->rodata_idx].size;
    buffer_append(&state->sections[state->rodata_idx].content, directive_str,
                  strlen(directive_str));
    // update rela entry with offset
    for (size_t i = 0; i < state->nof_relocations; i++) {
      if (strcmp(state->relocations[i].symbol, ".rodata") == 0) {
        state->relocations[i].offset += strlen(directive_str) + 1;
      }
    }

    return true;
  }
  case TOK_GLOBLDEF: {
    if (state->parse_mode != TEXT) {
      fprintf(stderr, "Encountered .globl outside of .text\n");
      return false;
    }
    // Define the symbol as global
    add_symbol(state, directive_str, state->text_idx, 0, STT_NOTYPE,
               STB_GLOBAL);
    return true;
  }
  case TOK_SIZEDEF: {
    if (state->parse_mode != TEXT) {
      fprintf(stderr, "Encountered .size outside of .text\n");
      return false;
    }

    elf_symbol_t *sym = find_symbol(state, directive_str);
    if (sym == NULL) {
      fprintf(stderr, ".size: No such symbol %s\n", directive_str);
      return false;
    }

    sym->size = state->current_text_offset - sym->value;
    return true;
  }

  case TOK_TYPEDEF: {
    if (state->parse_mode != TEXT) {
      fprintf(stderr, "Encountered .type outside of .text\n");
      return false;
    }

    elf_symbol_t *sym = find_symbol(state, directive_str);
    if (sym == NULL) {
      fprintf(stderr, ".type: No such symbol %s\n", directive_str);
      return false;
    }

    uint8_t sym_type = STT_FUNC;
    // TODO: other types

    sym->info = ELF64_ST_INFO(sym->global ? STB_GLOBAL : STB_LOCAL, sym_type);
    return true;
  }

  case TOK_SECTION:
    // handle section below
    break;
  default:
    fprintf(stderr, "Unexpected directive\n");
    return false;
  }

  switch (tokens[1]) {
  case TOK_SECTION_RODATA: {
    state->parse_mode = RODATA;
    elf_symbol_t *sym = NULL;
    if ((sym = find_symbol(state, ".rodata")) == NULL)
      add_symbol(state, ".rodata", state->rodata_idx, 0, STT_SECTION,
                 STB_LOCAL);
    return true;
  }
  case TOK_SECTION_GNUSTACK:
    state->parse_mode = GNU_STACK;
    return true;
  case TOK_SECTION_TEXT: {
    state->parse_mode = TEXT;
    elf_symbol_t *sym = NULL;
    if ((sym = find_symbol(state, ".text")) == NULL)
      add_symbol(state, ".text", state->text_idx, 0, STT_SECTION, STB_LOCAL);
    return true;
  }
  default:
    fprintf(stderr, "unknown .section directive: %s", directive_str);
    return false;
  }
}

bool handle_machine_code(asm_state_t *state, int tokens[MAX_LINE_SIZE],
                         size_t nof_tokens, char *input_strings[10],
                         size_t nof_input_strings) {
  if (nof_tokens < 1)
    return false;

  switch (tokens[0]) {
  case OPCODE_MOV:
    return opcode_mov(state, tokens, nof_tokens, input_strings,
                      nof_input_strings);
  case OPCODE_SUBB:
  case OPCODE_SUBL:
  case OPCODE_SUBW:
  case OPCODE_SUBQ:
    return opcode_sub(state, tokens, nof_tokens, input_strings,
                      nof_input_strings);
  case OPCODE_LEAL:
    return opcode_lea(state, tokens, nof_tokens, input_strings,
                      nof_input_strings);
  case OPCODE_CALL:
    return opcode_call(state, tokens, nof_tokens, input_strings,
                       nof_input_strings);
  case OPCODE_PUSH:
    return opcode_push(state, tokens, nof_tokens);
  case OPCODE_LEAVE: {
    uint8_t leave_byte = 0xc9;
    buffer_append(&state->sections[state->text_idx].content, &leave_byte, 1);
    return true;
  }
  case OPCODE_RET: {
    uint8_t ret_byte = 0xc3;
    buffer_append(&state->sections[state->text_idx].content, &ret_byte, 1);
    return true;
  }
  default:
    break;
  }

  return true;
}

int opcode_push(asm_state_t *state, int tokens[MAX_LINE_SIZE],
                size_t nof_tokens) {
  if (nof_tokens != 2) {
    fprintf(stderr, "push encoding failed: expected 2 operands but got %ld\n",
            nof_tokens);
    return false;
  }
  size_t machine_code_len = 0;
  uint8_t *machine_code = malloc(2);

  switch (tokens[1]) {
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
            tokens[1]);
    free(machine_code);
    return false;
  }

  buffer_append(&state->sections[state->text_idx].content, machine_code,
                machine_code_len);

  free(machine_code);

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
  int read_pos = 0, write_pos = 0;

  while (str[read_pos] != '\0') {
    if (str[read_pos] != '$') {
      str[write_pos++] = str[read_pos];
    }
    read_pos++;
  }

  str[write_pos] = '\0';
}

int opcode_mov(asm_state_t *state, int tokens[MAX_LINE_SIZE], size_t nof_tokens,
               char *input_strings[10], size_t nof_input_strings) {
  if (nof_tokens < 3) {
    fprintf(stderr, "mov failed: not enough operands\n");
    return false;
  }

  size_t str_idx = 0;
  size_t machine_code_len = 0;
  uint8_t *machine_code = malloc(3);
  int reg_token = -1, rm_token = -1;
  bool reg_minus = false, rm_minus = false;
  int reg_disp = 0, rm_disp = 0;
  bool reg_is_mem = false, rm_is_mem = false;

  size_t tok_idx = 1;
  parse_mov_operand(tokens, &tok_idx, &reg_token, &reg_disp, &reg_minus,
                    &reg_is_mem);
  if (reg_disp == 8) {
    if (str_idx >= nof_input_strings) {
      fprintf(stderr,
              "mov failed: not enough input strings, needed %ld got %ld\n",
              str_idx, nof_input_strings);
      return false;
    }
    char *disp_str = input_strings[str_idx++];
    remove_dollar_sign(disp_str);
    int actual_displacement = atoi(disp_str);
    reg_disp = actual_displacement;
  }
  parse_mov_operand(tokens, &tok_idx, &rm_token, &rm_disp, &rm_minus,
                    &rm_is_mem);
  if (rm_disp == 8) {
    if (str_idx >= nof_input_strings) {
      fprintf(stderr,
              "mov failed: not enough input strings, needed %ld got %ld\n",
              str_idx, nof_input_strings);
      return false;
    }
    char *disp_str = input_strings[str_idx++];
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
    printf("IMMEDIATE MOVE REG: %d\n", rm_token);
    uint8_t register_byte = 0xb8 + get_rm_reg_bits_from_reg(rm_token);
    buffer_append(&state->sections[state->text_idx].content, &register_byte, 1);
    if (is_token_64bit(rm_token)) {
      // TODO: add REX
      uint64_t value = displacement;
      buffer_append(&state->sections[state->text_idx].content, &value, 8);
      return true;
    }
    uint32_t value = displacement;
    buffer_append(&state->sections[state->text_idx].content, &value, 4);
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

  buffer_append(&state->sections[state->text_idx].content, machine_code,
                machine_code_len);
  state->current_text_offset += machine_code_len;

  free(machine_code);
  return true;
}

int opcode_sub(asm_state_t *state, int tokens[MAX_LINE_SIZE], size_t nof_tokens,
               char *input_strings[10], size_t nof_input_strings) {
  if (nof_tokens < 3) {
    fprintf(stderr, "mov failed: not enough operands\n");
    return false;
  }

  size_t str_idx = 0;
  int reg_token = -1, rm_token = -1;
  bool reg_minus = false, rm_minus = false;
  int reg_disp = 0, rm_disp = 0;
  bool reg_is_mem = false, rm_is_mem = false;

  size_t tok_idx = 1;
  parse_mov_operand(tokens, &tok_idx, &reg_token, &reg_disp, &reg_minus,
                    &reg_is_mem);
  if (reg_disp == 8) {
    if (str_idx >= nof_input_strings) {
      fprintf(stderr,
              "mov failed: not enough input strings, needed %ld got %ld\n",
              str_idx, nof_input_strings);
      return false;
    }
    char *disp_str = input_strings[str_idx++];
    remove_dollar_sign(disp_str);
    int actual_displacement = atoi(disp_str);
    reg_disp = actual_displacement;
  }
  parse_mov_operand(tokens, &tok_idx, &rm_token, &rm_disp, &rm_minus,
                    &rm_is_mem);
  if (rm_disp == 8) {
    if (str_idx >= nof_input_strings) {
      fprintf(stderr,
              "mov failed: not enough input strings, needed %ld got %ld\n",
              str_idx, nof_input_strings);
      return false;
    }
    char *disp_str = input_strings[str_idx++];
    remove_dollar_sign(disp_str);
    int actual_displacement = atoi(disp_str);
    rm_disp = actual_displacement;
  }

  reg_disp = reg_minus ? -reg_disp : reg_disp;
  rm_disp = rm_minus ? -rm_disp : rm_disp;
  int displacement = rm_disp != 0 ? rm_disp : reg_disp;

  if (reg_is_mem) {
    uint8_t opcode_byte = 0x81;
    uint8_t modrm_byte =
        (0b11 << 6) | (0b101 << 3) | get_rm_reg_bits_from_reg(rm_token);
    if (is_token_64bit(rm_token)) {
      uint8_t rex_prefix = REX_PREFIX_BASE | REX_PREFIX_W;
      buffer_append(&state->sections[state->text_idx].content, &rex_prefix, 1);
      uint64_t value_byte = displacement;
      if (displacement <= 128 && displacement >= 0) {
        uint8_t value_byte = displacement;
        opcode_byte = 0x83;
        buffer_append(&state->sections[state->text_idx].content, &opcode_byte,
                      1);
        buffer_append(&state->sections[state->text_idx].content, &modrm_byte,
                      1);
        buffer_append(&state->sections[state->text_idx].content, &value_byte,
                      1);
        return true;
      }
      buffer_append(&state->sections[state->text_idx].content, &opcode_byte, 1);
      buffer_append(&state->sections[state->text_idx].content, &modrm_byte, 1);
      buffer_append(&state->sections[state->text_idx].content, &value_byte, 8);
    } else if (is_token_32bit(rm_token)) {
      uint32_t value_byte = displacement;
      buffer_append(&state->sections[state->text_idx].content, &opcode_byte, 1);
      buffer_append(&state->sections[state->text_idx].content, &modrm_byte, 1);
      buffer_append(&state->sections[state->text_idx].content, &value_byte, 4);
    } else if (is_token_16bit(rm_token)) {
      uint16_t value_byte = displacement;
      buffer_append(&state->sections[state->text_idx].content, &opcode_byte, 1);
      buffer_append(&state->sections[state->text_idx].content, &modrm_byte, 1);
      buffer_append(&state->sections[state->text_idx].content, &value_byte, 2);
    } else {
      uint8_t value_byte = displacement;
      buffer_append(&state->sections[state->text_idx].content, &opcode_byte, 1);
      buffer_append(&state->sections[state->text_idx].content, &modrm_byte, 1);
      buffer_append(&state->sections[state->text_idx].content, &value_byte, 1);
    }
  }
  // TODO: handle register to register subtractions
  return true;
}

int opcode_call(asm_state_t *state, int tokens[MAX_LINE_SIZE],
                size_t nof_tokens, char *input_strings[10],
                size_t nof_input_strings) {
  if (nof_tokens < 3) {
    fprintf(stderr, "call failed: 2 operands required\n");
    return false;
  }
  if (tokens[0] != OPCODE_CALL || tokens[1] != TOK_IDENT ||
      tokens[2] != TOK_PLT_FLAG) {
    fprintf(stderr, "call failed: got unexpected operand tokens\n");
    return false;
  }
  uint8_t machine_code[5] = {0xe8, 0x00, 0x00, 0x00, 0x00};

  if (nof_input_strings < 1) {
    fprintf(stderr, "call failed: function name required\n");
    return false;
  }
  char *called_function = input_strings[0];

  elf_symbol_t *sym = NULL;
  if ((sym = find_symbol(state, called_function)) == NULL)
    add_symbol(state, called_function, SHN_UNDEF, 0, STT_NOTYPE, STB_GLOBAL);

  buffer_append(&state->sections[state->text_idx].content, &machine_code, 5);

  add_rela(state, called_function,
           state->sections[state->text_idx].content.size - 4, RELOC_PLT, -4);

  return true;
}

int opcode_lea(asm_state_t *state, int tokens[MAX_LINE_SIZE], size_t nof_tokens,
               char *input_strings[10], size_t nof_input_strings) {

  if (nof_tokens < 3) {
    fprintf(stderr, "lea failed: not enough operands\n");
    return false;
  }
  if (nof_input_strings < 1) {
    fprintf(stderr, "lea failed: rodata label required\n");
    return false;
  }

  int reg_token = -1, rm_token = -1;
  char *rodata_label = input_strings[0];

  size_t tok_idx = 1;

  if (tokens[tok_idx++] != TOK_RODATA_LABEL_REF) {
    fprintf(stderr, "lea failed: expected rodata reference in operand 1\n");
    return false;
  }
  if (tokens[tok_idx++] != TOK_OPENPAREN) {
    fprintf(stderr, "expected (\n");
    return false;
  }
  reg_token = tokens[tok_idx++];
  if (tokens[tok_idx++] != TOK_CLOSEPAREN) {
    fprintf(stderr, "expected )\n");
    return false;
  }
  rm_token = tokens[tok_idx++];

  uint8_t *machine_code = malloc(3);
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
  add_rela(state, ".rodata", offset, RELOC_PC_RELATIVE, addend);

  buffer_append(&state->sections[state->text_idx].content, machine_code,
                machine_code_len);

  uint32_t value = 0; // use 0 as placeholder for linker
  buffer_append(&state->sections[state->text_idx].content, &value, 4);
  return true;
}
