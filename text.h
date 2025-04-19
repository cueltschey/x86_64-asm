#include "asm.h"

bool define_label(asm_state_t *state, const char *label);

bool handle_directive(asm_state_t *state, char *tokens[10], size_t nof_tokens);
