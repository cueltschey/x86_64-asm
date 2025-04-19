#define _POSIX_C_SOURCE 200809L
#include "text.h"

bool define_label(asm_state_t *state, const char *label) {
  switch (state->parse_mode) {
  case TEXT: {
    // Ignore local labels
    if (label[0] == '.' && label[1] == 'L')
      return true;
    elf_symbol_t *sym = find_symbol(state, label);
    if (sym == NULL) {
      fprintf(stderr, ".text: No such symbol %s\n", label);
      return false;
    }
    sym->value = state->current_text_offset;
    break;
  }
  case RODATA: {
    rodata_label_t new_entry;
    new_entry.name = label;
    state->rodata_entries[state->nof_rodata_entries++] = new_entry;
    break;
  }
  default:
    break;
  }
  return true;
}

bool handle_directive(asm_state_t *state, char *tokens[10], size_t nof_tokens) {
  if (strcmp(tokens[0], ".file") == 0) {
    add_symbol(state, strdup(tokens[1]), SHN_ABS, 0, STT_FILE, STB_LOCAL);
    return true;
  }

  if (strcmp(tokens[0], ".text") == 0) {
    state->parse_mode = TEXT;
    elf_symbol_t *sym = NULL;
    if ((sym = find_symbol(state, tokens[0])) == NULL)
      add_symbol(state, strdup(tokens[0]), state->text_idx, 0, STT_SECTION,
                 STB_LOCAL);
    return true;
  }

  if (tokens[0][1] == 'i' && tokens[0][2] == 'd') {
    // NOTE: ignore ident for now
    return true;
  }

  if (strcmp(tokens[0], ".section") == 0) {
    if (strcmp(tokens[1], ".rodata") == 0) {
      state->parse_mode = RODATA;
      elf_symbol_t *sym = NULL;
      if ((sym = find_symbol(state, tokens[1])) == NULL)
        add_symbol(state, strdup(tokens[1]), state->rodata_idx, 0, STT_SECTION,
                   STB_LOCAL);
    } else if (strcmp(tokens[1], ".note.GNU-stack") == 0)
      state->parse_mode = GNU_STACK;
    else if (strcmp(tokens[1], ".text") == 0) {
      state->parse_mode = TEXT;
      elf_symbol_t *sym = NULL;
      if ((sym = find_symbol(state, tokens[1])) == NULL)
        add_symbol(state, strdup(tokens[1]), state->text_idx, 0, STT_SECTION,
                   STB_LOCAL);

    } else {
      fprintf(stderr, "unknown .section directive: %s", tokens[1]);
      return false;
    }
    return true;
  }

  if (strcmp(tokens[0], ".string") == 0) {
    if (state->parse_mode != RODATA) {
      fprintf(stderr, "Encountered .string outside of rodata\n");
      return false;
    }
    char *string = strdup(tokens[1] + 1);
    // Combine all tokens
    for (size_t i = 2; i < nof_tokens; i++) {
      strcat(string, " ");
      strcat(string, tokens[i]);
    }

    size_t tok_len = strlen(string);
    string[tok_len - 1] = '\0';

    state->rodata_entries[state->nof_rodata_entries - 1].offset =
        state->sections[state->rodata_idx].size;
    buffer_append(&state->sections[state->rodata_idx].content, string, tok_len);

    return true;
  }

  if (strcmp(tokens[0], ".globl") == 0) {
    if (state->parse_mode != TEXT) {
      fprintf(stderr, "Encountered .globl outside of .text\n");
      return false;
    }
    // Define the symbol as global
    add_symbol(state, strdup(tokens[1]), state->text_idx, 0, STT_NOTYPE,
               STB_GLOBAL);
    return true;
  }

  if (strcmp(tokens[0], ".size") == 0) {
    if (state->parse_mode != TEXT) {
      fprintf(stderr, "Encountered .size outside of .text\n");
      return false;
    }

    elf_symbol_t *sym = find_symbol(state, tokens[1]);
    if (sym == NULL) {
      fprintf(stderr, ".size: No such symbol %s\n", tokens[1]);
      return false;
    }

    sym->size = state->current_text_offset - sym->value;
    return true;
  }

  if (strcmp(tokens[0], ".type") == 0) {
    if (state->parse_mode != TEXT) {
      fprintf(stderr, "Encountered .type outside of .text\n");
      return false;
    }

    elf_symbol_t *sym = find_symbol(state, tokens[1]);
    if (sym == NULL) {
      fprintf(stderr, ".type: No such symbol %s\n", tokens[1]);
      return false;
    }

    uint8_t sym_type = STT_NOTYPE;
    if (strcmp(tokens[2], "@function") == 0) {
      sym_type = STT_FUNC;
    } else {
      fprintf(stderr, ".type: Unknown type %s\n", tokens[2]);
      return false;
    }

    sym->info = ELF64_ST_INFO(sym->global ? STB_GLOBAL : STB_LOCAL, sym_type);
    return true;
  }
  // NOTE: ignore all .cfi instructions
  if (tokens[0][1] == 'c' && tokens[0][2] == 'f' && tokens[0][3] == 'i')
    return true;

  fprintf(stderr, "Encountered unknown directive: %s\n", tokens[0]);
  return false;
}
