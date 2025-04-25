#ifndef ASM_H
#define ASM_H

#include "elf.h"
#include "state.h"

// Initialize ELF sections
// allocate memory
// prepare text_state_t substruct
void assembler_init(asm_state_t *state);

// Process functions, labels and relocations from
// text_state_t
bool assembler_process_symbols(asm_state_t *state);

// Assemble one source file into an object file
bool assemble_file(const char *input_file, const char *output_file);

// Print debug info on text_state_t
void print_text_debug(text_state_t *state);

#endif
