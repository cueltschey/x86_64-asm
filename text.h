#include "asm.h"

#define REX_PREFIX_BASE 0x40
#define REX_PREFIX_W 0x08
#define REX_PREFIX_R 0x04
#define REX_PREFIX_X 0x02
#define REX_PREFIX_B 0x01

bool define_label(asm_state_t *state, const char *label);

bool handle_directive(asm_state_t *state, char *tokens[10], size_t nof_tokens);

bool handle_machine_code(asm_state_t *state, char *tokens[10],
                         size_t nof_tokens);
