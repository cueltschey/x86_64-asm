#ifndef ASM_H
#define ASM_H

#include "elf.h"
#include "state.h"

void assembler_init(asm_state_t *state);

char *get_asm_state_info(const asm_state_t *state);

bool assemble_file(const char *input_file, const char *output_file);

#endif
