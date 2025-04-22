#include "text.h"
#include "elf.h"
#include "lex.h"
#include "state.h"
#include <stdint.h>
#include <stdio.h>

// Opcode handlers
int opcode_push(asm_state_t *state, int tokens[MAX_LINE_SIZE],
                size_t nof_tokens);

int opcode_mov(asm_state_t *state, int tokens[MAX_LINE_SIZE],
               size_t nof_tokens);

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
                 size_t nof_tokens, char *opt_str) {
  printf("Processing line %d: ", line_num);
  for (size_t i = 0; i < nof_tokens; i++) {
    printf("%d ", tokens[i]);
  }
  printf("\n");

  // ignore blank lines
  if (nof_tokens < 1)
    return true;

  if (tok_is_label(tokens[0]))
    return handle_label(state, tokens[0], opt_str);

  if (tok_is_directive(tokens[0]))
    return handle_directive(state, tokens, nof_tokens, opt_str);

  if (tok_is_machine_code(tokens[0]))
    return handle_machine_code(state, tokens, nof_tokens);

  fprintf(stderr, "Encountered bad token: %d\n", tokens[0]);
  return false;
}

bool handle_label(asm_state_t *state, int label_tok, char *label_name) {
  switch (state->parse_mode) {
  case TEXT: {
    // Ignore function labels
    if (label_tok == TOK_FUNC_START || label_tok == TOK_FUNC_END)
      return true;
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
    rodata_label_t new_entry;
    new_entry.name = label_name;
    state->rodata_entries[state->nof_rodata_entries++] = new_entry;
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

    state->rodata_entries[state->nof_rodata_entries - 1].offset =
        state->sections[state->rodata_idx].size;
    buffer_append(&state->sections[state->rodata_idx].content, directive_str,
                  strlen(directive_str));

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
                         size_t nof_tokens) {
  if (nof_tokens < 1)
    return false;

  switch (tokens[0]) {
  case OPCODE_MOV:
    return opcode_mov(state, tokens, nof_tokens);
  case OPCODE_PUSH:
    return opcode_push(state, tokens, nof_tokens);
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
  state->current_text_offset += machine_code_len;

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
                       int *displacement, bool *minus) {
  if (tokens[(*tok_idx)] == TOK_MINUS) {
    (*tok_idx)++;
    *minus = true;
  }
  if (tokens[(*tok_idx)] == TOK_NUM) {
    // TODO: get offset
    *displacement = 8;
    (*tok_idx)++;
    if (tokens[(*tok_idx)++] == TOK_OPENPAREN) {
      *reg = tokens[(*tok_idx)++];
      if (tokens[(*tok_idx)++] != TOK_CLOSEPAREN) {
        fprintf(stderr, "expected )\n");
        return false;
      }
      return true;
    }
  }
  *reg = tokens[(*tok_idx)++];
  return true;
}

int opcode_mov(asm_state_t *state, int tokens[MAX_LINE_SIZE],
               size_t nof_tokens) {
  if (nof_tokens < 3) {
    fprintf(stderr, "mov failed: not enough operands\n");
    return false;
  }

  size_t machine_code_len = 0;
  uint8_t *machine_code = malloc(3);
  int reg_token = -1, rm_token = -1;
  bool reg_minus = false, rm_minus = false;
  int reg_disp = 0, rm_disp = 0;

  size_t tok_idx = 1;
  parse_mov_operand(tokens, &tok_idx, &reg_token, &reg_disp, &reg_minus);
  printf("DEBUG: %ld\n", tok_idx);
  parse_mov_operand(tokens, &tok_idx, &rm_token, &rm_disp, &rm_minus);

  reg_disp = reg_minus ? -reg_disp : reg_disp;
  rm_disp = rm_minus ? -rm_disp : rm_disp;

  if (reg_disp > 0 && rm_disp > 0) {
    fprintf(stderr, "mov failed: both operands have a displacement\n");
    return false;
  }

  printf("DEBUG: reg: %d, rm: %d, reg_disp: %d, rm_disp: %d\n", reg_token,
         rm_token, reg_disp, rm_disp);

  int mod_bits;
  int displacement = rm_disp > 0 ? rm_disp : reg_disp;
  if (displacement == 0)
    mod_bits = 0b00;
  if (displacement >= -128 && displacement <= 127)
    mod_bits = 0b01;
  else
    mod_bits = 0b11;
  int reg_bits = get_rm_reg_bits_from_reg(reg_token);
  int rm_bits = get_rm_reg_bits_from_reg(rm_token);
  if (reg_bits < 0 || rm_bits < 0) {
    fprintf(stderr, "mov failed: could not get reg or rm bits from register\n");
    return false;
  }
  uint8_t modrm_byte = ((mod_bits & 0b00000011) << 6) |
                       ((reg_bits & 0b00000011) << 3) | (rm_bits & 0b00000011);

  // Add REX if required
  if (is_token_64bit(reg_token) || is_token_64bit(rm_token)) {
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
    machine_code[machine_code_len++] = rex;
  }
  // Add opcode
  machine_code[machine_code_len++] = 0x89;

  // Add Mod R/M byte
  machine_code[machine_code_len++] = modrm_byte;

  buffer_append(&state->sections[state->text_idx].content, machine_code,
                machine_code_len);
  state->current_text_offset += machine_code_len;

  free(machine_code);
  return true;
}
