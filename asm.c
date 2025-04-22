#define _POSIX_C_SOURCE 200809L
#include "asm.h"
#include "elf.h"
#include "lex.h"
#include "text.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void assembler_init(asm_state_t *state) {
  memset(state, 0, sizeof(asm_state_t));
  state->output_file = "a.out";
  state->current_file = 0;
  line_num = 0;
  state->parse_mode = TEXT;

  state->text_idx = -1;
  state->note_idx = -1;
  state->symtab_idx = -1;
  state->strtab_idx = -1;
  state->shstrtab_idx = -1;
  state->rodata_idx = -1;

  // Add mandatory NULL section
  add_section(state, "", SHT_NULL, 0, 0, 0); // Section 0 is always NULL

  add_section(state, ".text", SHT_PROGBITS, SHF_ALLOC | SHF_EXECINSTR, 4, 0);
  add_section(state, ".rodata", SHT_PROGBITS, SHF_ALLOC, 4, 0);
  add_section(state, ".note.GNU-stack", SHT_PROGBITS, 0, 1, 0);
  add_section(state, ".symtab", SHT_SYMTAB, 0, 8, sizeof(Elf64_Sym));
  add_section(state, ".strtab", SHT_STRTAB, 0, 1, 0);
  add_section(state, ".shstrtab", SHT_STRTAB, 0, 1, 0);

  // Symbol 0: NULL symbol
  add_symbol(state, "", SHN_UNDEF, 0, STT_NOTYPE, STB_LOCAL);

  // Initialize string tables with the required initial NULL byte
  buffer_append(&state->sections[state->strtab_idx].content, "\0", 1);
  buffer_append(&state->sections[state->shstrtab_idx].content, "\0", 1);

  state->nof_rodata_entries = 0;
}

void assembler_add_input_file(asm_state_t *state, const char *filename) {
  if (state->nof_input_files >= MAX_FILES) {
    fprintf(stderr, "Too many input files. Ignoring %s\n", filename);
    return;
  }
  state->input_files[state->nof_input_files++] = filename;
}
void assembler_set_output_file(asm_state_t *state, const char *filename) {
  state->output_file = filename;
}

char *get_asm_state_info(const asm_state_t *state) {
  size_t bufsize = 8192;
  char *buffer = malloc(bufsize);
  if (!buffer)
    return NULL;

  size_t offset = 0;
  offset += snprintf(buffer + offset, bufsize - offset,
                     "ASM State:\n"
                     "  Output file: %s\n"
                     "  Number of input files: %zu\n",
                     state->output_file ? state->output_file : "(null)",
                     state->nof_input_files);

  for (size_t i = 0; i < state->nof_input_files && i < MAX_FILES; ++i) {
    offset +=
        snprintf(buffer + offset, bufsize - offset, "    Input file[%zu]: %s\n",
                 i, state->input_files[i] ? state->input_files[i] : "(null)");
  }

  offset +=
      snprintf(buffer + offset, bufsize - offset,
               "  Current text offset: %lu\n"
               "  Current file index: %zu\n"
               "  Current line: %d\n"
               "  Indexes:\n"
               "    text_idx: %zu\n"
               "    note_idx: %zu\n"
               "    symtab_idx: %zu\n"
               "    strtab_idx: %zu\n"
               "    shstrtab_idx: %zu\n"
               "  Symbols (%zu total):\n",
               state->current_text_offset, state->current_file, line_num,
               state->text_idx, state->note_idx, state->symtab_idx,
               state->strtab_idx, state->shstrtab_idx, state->nof_symbols);

  for (size_t i = 0; i < state->nof_symbols && i < MAX_SYMBOLS; ++i) {
    char symbol_buf[128];
    snprintf(symbol_buf, sizeof(symbol_buf), "  Symbol[%ld]: name=%s\n", i,
             state->symbols[i].name);
    ;
    offset += snprintf(buffer + offset, bufsize - offset, "%s", symbol_buf);
  }

  offset += snprintf(buffer + offset, bufsize - offset,
                     "  Sections (%zu total):\n", state->nof_sections);

  for (size_t i = 0; i < state->nof_sections && i < MAX_SECTIONS; ++i) {
    char section_buf[128];

    snprintf(section_buf, sizeof(section_buf),
             "  Section[%ld]: name=%s, content=%s\n", i,
             state->sections[i].name, (char *)state->sections[i].content.data);
    offset += snprintf(buffer + offset, bufsize - offset, "%s", section_buf);
  }

  return buffer;
}

bool assembler_run(asm_state_t *state) {
  if (state->nof_input_files == 0) {
    fprintf(stderr, "Error: No input files specified.\n");
    return false;
  }

  for (size_t i = 0; i < state->nof_input_files; i++) {
    if (!assemble_file(state, i)) {
      fprintf(stderr, "Translation failed in file %s line %d.\n",
              state->input_files[state->current_file], line_num);
      return false;
    }
  }
  printf("Writing ELF file...\n");
  // add_symbol(&state, ".file", SHN_ABS, 0, STT_FILE, STB_LOCAL);
  if (!write_elf_object_file(state)) {
    fprintf(stderr, "Failed to write to ELF file %s\n", state->output_file);
    return false;
  }

  printf("Assembly successful.\n");
  return true;
}

bool assemble_file(asm_state_t *state, size_t file_idx) {
  printf("Assembling file: %s\n", state->input_files[file_idx]);
  yyin = fopen(state->input_files[file_idx], "r");
  if (!yyin) {
    perror("fopen failed");
    fprintf(stderr, "Error opening input file: %s\n",
            state->input_files[file_idx]);
    return false;
  }

  line_num = 0;
  bool ret = true;

  int current_token;
  int tokens[MAX_LINE_SIZE];
  char *opt_str = NULL;
  size_t nof_tokens = 0;

  while ((current_token = yylex())) {
    switch (current_token) {
    case TOK_NEWLINE: {
      if (!handle_line(state, tokens, nof_tokens, opt_str)) {
        fprintf(stderr, "%s line %d: parsing failed\n",
                state->input_files[file_idx], line_num);
        return false;
      }
      nof_tokens = 0;
      opt_str = NULL;
      continue;
    }
    case TOK_COMMA:
      continue; // ignore commas
    case TOK_STRLIT:
    case TOK_RODATA_LABEL:
    case TOK_IDENT:
    case TOK_IDENT_TAG:
      opt_str = strdup(yytext);
      break;
    case TOK_UNKNOWN:
      fprintf(stderr, "%s line %d: Encountered unknown token %s\n",
              state->input_files[file_idx], line_num, yytext);
      return false;
    }
    tokens[nof_tokens++] = current_token;
  }

  return ret;
}
