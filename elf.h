#ifndef ELF_H
#define ELF_H

#include "state.h"

void buffer_init(asm_buf_t *buf);

void buffer_destroy(asm_buf_t *buf);

void buffer_ensure_capacity(asm_buf_t *buf, size_t additional_needed);

void buffer_append(asm_buf_t *buf, const void *data, size_t size);

elf_symbol_t *find_symbol(asm_state_t *state, const char *name);

int add_symbol(asm_state_t *state, const char *name, uint16_t shndx,
               Elf64_Addr value, uint8_t type, uint8_t binding);

void add_section(asm_state_t *state, const char *name, Elf64_Word type,
                 Elf64_Xword flags, Elf64_Xword addralign, Elf64_Xword entsize);

void build_elf_strtab_symtab(asm_state_t *state);

bool write_elf_object_file(asm_state_t *state);

#endif
