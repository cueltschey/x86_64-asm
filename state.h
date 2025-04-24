#ifndef STATE_H
#define STATE_H

#define INITIAL_CAPACITY 1024

#define MAX_FILES 16
#define MAX_SYMBOLS 256
#define MAX_SECTIONS 10
#define MAX_RODATA_ENTRIES 10
#define MAX_LINE_SIZE 20
#define MAX_RELA 20

#define MAX_FUNCTIONS 26

#define INIT_INSTRUCTION_COUNT 1024

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

typedef enum {
  RELOC_ABSOLUTE,
  RELOC_PC_RELATIVE,
  RELOC_GOT,
  RELOC_PLT,
} reloc_type_t;

typedef struct elf_reloc_s {
  size_t offset;
  reloc_type_t type;
  const char *symbol;
  int64_t addend;
} elf_reloc_t;

typedef struct line_info_s {
  int tokens[MAX_LINE_SIZE];
  size_t nof_tokens;
  char *input_strings[10];
  size_t nof_input_strings;
} line_info_t;

typedef enum text_parse_mode_s {
  TEXT = 0,
  RODATA,
  GNU_STACK,
} text_parse_mode_t;

typedef enum inst_status_e {
  COMPLETE = 0,
  LEA_REQUIRES_OFFSET,
  JMP_REQUIRES_OFFSET
} inst_status_t;

typedef struct inst_s {
  uint8_t *machine_code;
  size_t machine_code_len;

  inst_status_t status;
} inst_t;

typedef struct func_s {
  const char *name;
  uint64_t size;
  uint64_t location;
  bool is_global = false;
} func_t;

typedef struct text_state_s {
  text_parse_mode_t parse_mode;
  uint64_t current_text_offset = 0;

  uint64_t rodata_entries[MAX_RODATA_ENTRIES];
  size_t nof_rodata_entries = 0;

  uint64_t text_labels[MAX_RODATA_ENTRIES];
  size_t nof_text_labels = 0;

  func_t functions[MAX_FUNCTIONS];
  size_t nof_functions = 0;

  inst_t *instructions;
  size_t nof_instructions = 0;

  const char *file_name;

  asm_buf_t *rodata_buffer;
} text_state_t;

typedef struct asm_state_s {
  // File paths
  const char *input_file;
  const char *output_file;

  // Indexes to sections
  size_t text_idx;
  size_t note_idx;
  size_t symtab_idx;
  size_t strtab_idx;
  size_t shstrtab_idx;
  size_t rodata_idx;
  size_t rela_text_idx;

  text_state_t text_state;

  // ELF data
  elf_symbol_t symbols[MAX_SYMBOLS];
  size_t nof_symbols;
  elf_section_t sections[MAX_SECTIONS];
  size_t nof_sections;
  elf_reloc_t relocations[MAX_RELA];
  size_t nof_relocations;

} asm_state_t;

#endif
