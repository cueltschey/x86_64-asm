#ifndef STATE_H
#define STATE_H

#define INITIAL_CAPACITY 1024

#define MAX_FILES 16
#define MAX_SYMBOLS 256
#define MAX_SECTIONS 10
#define MAX_RODATA_ENTRIES 10
#define MAX_LINE_SIZE 20

#include <elf.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

typedef struct asm_buf_s {
  uint8_t *data;
  size_t size;
  size_t capacity;
} asm_buf_t;

typedef struct elf_section_s {
  char name[32];
  uint32_t name_idx;
  Elf64_Word type;
  Elf64_Xword flags;
  Elf64_Addr addr;
  Elf64_Off offset;
  Elf64_Xword size;
  uint32_t link;
  uint32_t info;
  Elf64_Xword addralign;
  Elf64_Xword entsize;
  asm_buf_t content;
  bool allocated;
} elf_section_t;

typedef struct elf_symbol_s {
  char name[64];
  uint32_t name_idx;
  Elf64_Addr value;
  Elf64_Xword size;
  uint8_t info;
  uint8_t other;
  uint16_t shndx;
  bool defined;
  bool global;
} elf_symbol_t;

typedef enum asm_mode_e {
  TEXT = 0,
  RODATA,
  GNU_STACK,
} asm_mode_t;

typedef struct rodata_label_s {
  const char *name;
  uint64_t offset;
} rodata_label_t;

typedef struct asm_state_s {
  // File paths
  const char *input_files[MAX_FILES];
  size_t nof_input_files;
  const char *output_file;

  // What mode to parse
  asm_mode_t parse_mode;

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
  size_t rodata_idx;

  // Label data
  rodata_label_t rodata_entries[MAX_RODATA_ENTRIES];
  size_t nof_rodata_entries;

  // ELF data
  elf_symbol_t symbols[MAX_SYMBOLS];
  size_t nof_symbols;
  elf_section_t sections[MAX_SECTIONS];
  size_t nof_sections;
} asm_state_t;

#endif
