#include "asm.h"

#define REX_PREFIX_BASE 0x40
#define REX_PREFIX_W 0x08
#define REX_PREFIX_R 0x04
#define REX_PREFIX_X 0x02
#define REX_PREFIX_B 0x01

bool handle_line(asm_state_t *state, int tokens[MAX_LINE_SIZE],
                 size_t nof_tokens, char *input_strings[10],
                 size_t nof_input_strings);

bool handle_label(asm_state_t *state, int label_tok, char *label_name);

bool handle_directive(asm_state_t *state, int tokens[MAX_LINE_SIZE],
                      size_t nof_tokens, char *directive_str);

bool handle_machine_code(asm_state_t *state, int tokens[MAX_LINE_SIZE],
                         size_t nof_tokens, char *input_strings[10],
                         size_t nof_input_strings);
