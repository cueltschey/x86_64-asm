#ifndef ASM_H
#define ASM_H

#include "elf.h"
#include <fcntl.h>
#include <stddef.h>
#include <stdint.h>
#include <sys/stat.h>

#define MAX_FILES 16

#define MAX_SYMBOLS 256
#define MAX_SECTIONS 10

typedef struct asm_state_s {
  // File paths
  const char *input_files[MAX_FILES];
  const char *output_file;

  // File position data
  uint64_t current_text_offset;
  size_t current_file;
  size_t current_line;

  // Indexes to string tables
  size_t text_idx;
  size_t note_idx;
  size_t symtab_idx;
  size_t strtab_idx;
  size_t shstrtab_idx;

  // ELF data
  elf_symbol_t symbols[MAX_SYMBOLS];
  elf_section_t sections[MAX_SECTIONS];
} asm_state_t;

void assembler_init(asm_state_t *state);
void assembler_add_input_file(asm_state_t *state, const char *filename);
void assembler_set_output_file(asm_state_t *state, const char *filename);
void assembler_free(asm_state_t *state);

bool assembler_write_object_file(asm_state_t *state);

#endif
