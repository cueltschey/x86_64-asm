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

#define MAX_LINE_SIZE 1024

typedef struct asm_state_s {
  // File paths
  const char *input_files[MAX_FILES];
  size_t nof_input_files;
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
  size_t nof_symbols;
  elf_section_t sections[MAX_SECTIONS];
  size_t nof_sections;
} asm_state_t;

void assembler_init(asm_state_t *state);
void assembler_add_input_file(asm_state_t *state, const char *filename);
void assembler_set_output_file(asm_state_t *state, const char *filename);
void assembler_free(asm_state_t *state);
void asm_error(asm_state_t *state, const char *err_msg);

void add_section(asm_state_t *state, const char *name, Elf64_Word type,
                 Elf64_Xword flags, Elf64_Xword addralign, Elf64_Xword entsize);

bool write_elf_object_file(asm_state_t *state);

char *get_asm_state_info(const asm_state_t *state);

int add_symbol(asm_state_t *state, const char *name, uint16_t shndx,
               Elf64_Addr value, uint8_t type, uint8_t binding);

bool assembler_run(asm_state_t *state);

bool assemble_file(asm_state_t *state, size_t file_idx);

bool encode_instr(asm_state_t *state, char line_buffer[MAX_LINE_SIZE]);

#endif
