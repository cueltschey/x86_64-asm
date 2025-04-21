#include "lex.h"
#include "state.h"
#include <elf.h>
#include <stdio.h>
#define _POSIX_C_SOURCE 200809L
#include "text.h"

int opcode_push(asm_state_t *state);

bool tok_is_label(int tok) { return tok == 0; }
bool tok_is_directive(int tok) { return tok == 1; }

bool handle_line(asm_state_t *state, int tokens[MAX_LINE_SIZE],
                 size_t nof_tokens, char *opt_str) {

  if (tok_is_label(tokens[0])) {
    if (opt_str == NULL) {
      fprintf(stderr, "Label parsed without any string\n");
      return false;
    }
    return handle_label(state, tokens[0], opt_str);
  }

  if (tok_is_directive(tokens[0]))
    return handle_directive(state, tokens, nof_tokens, opt_str);

  if (!handle_machine_code(state, tokens, nof_tokens)) {
    fprintf(stderr, ".text code parsing failed\n");
    return false;
  };

  return true;
}

bool handle_label(asm_state_t *state, int label_tok, char *label_name) {
  switch (state->parse_mode) {
  case TEXT: {
    // Ignore function labels
    if (label_tok == TOK_FUNC_START || label_tok == TOK_FUNC_END)
      return true;
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
    if ((sym = find_symbol(state, directive_str)) == NULL)
      add_symbol(state, directive_str, state->text_idx, 0, STT_SECTION,
                 STB_LOCAL);
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
    if ((sym = find_symbol(state, directive_str)) == NULL)
      add_symbol(state, directive_str, state->rodata_idx, 0, STT_SECTION,
                 STB_LOCAL);
    return true;
  }
  case TOK_SECTION_GNUSTACK:
    state->parse_mode = GNU_STACK;
    return true;
  case TOK_SECTION_TEXT: {
    state->parse_mode = TEXT;
    elf_symbol_t *sym = NULL;
    if ((sym = find_symbol(state, directive_str)) == NULL)
      add_symbol(state, directive_str, state->text_idx, 0, STT_SECTION,
                 STB_LOCAL);
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
    printf("Parsing mov... on line %ld\n", state->current_line);
    return true;
  case OPCODE_PUSH:
    opcode_push(state);
    return true;
  default:
    break;
  }

  return true;
}

int opcode_push(asm_state_t *state) {
  int reg_code = 0;

  uint8_t rex = REX_PREFIX_BASE;
  rex |= REX_PREFIX_B;

  uint8_t machine_code = 0x50 + reg_code;
  buffer_append(&state->sections[state->text_idx].content, &machine_code, 1);

  return 0;
}
