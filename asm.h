#ifndef ASM_H
#define ASM_H

#include "elf.h"
#include "state.h"

void assembler_init(asm_state_t *state);

void assembler_add_input_file(asm_state_t *state, const char *filename);

void assembler_set_output_file(asm_state_t *state, const char *filename);

void assembler_free(asm_state_t *state);

char *get_asm_state_info(const asm_state_t *state);

bool assembler_run(asm_state_t *state);

bool assemble_file(asm_state_t *state, size_t file_idx);

#endif
