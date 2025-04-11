#ifndef ELF_H
#define ELF_H

#include <elf.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>

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

#endif
