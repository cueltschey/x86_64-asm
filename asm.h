#ifndef ASM_H
#define ASM_H

#include "elf.h"
#include "state.h"

void assembler_init(asm_state_t *state);

bool assemble_file(const char *input_file, const char *output_file);

void print_text_debug(text_state_t *state);

#endif
