#ifndef ELF_H
#define ELF_H

#define INITIAL_CAPACITY 1024

#include <elf.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
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

void buffer_init(asm_buf_t *buf);

void buffer_destroy(asm_buf_t *buf);

void buffer_ensure_capacity(asm_buf_t *buf, size_t additional_needed);

void buffer_append(asm_buf_t *buf, const void *data, size_t size);

#endif
