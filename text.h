#include "asm.h"
#include "state.h"

#define REX_PREFIX_BASE 0x40
#define REX_PREFIX_W 0x08
#define REX_PREFIX_R 0x04
#define REX_PREFIX_X 0x02
#define REX_PREFIX_B 0x01

bool add_new_inst(text_state_t *state, uint8_t *machine_code,
                  size_t machine_code_len, inst_status_t status);

// Functions to handle control flow
bool handle_line(text_state_t *state, line_info_t *info);

bool handle_label(text_state_t *state, line_info_t *info);

bool handle_directive(text_state_t *state, line_info_t *info);

bool handle_machine_code(text_state_t *state, line_info_t *info);

// Insturction handlers
int opcode_push(text_state_t *state, line_info_t *info);

int opcode_mov(text_state_t *state, line_info_t *info);

int opcode_sub(text_state_t *state, line_info_t *info);

int opcode_call(text_state_t *state, line_info_t *info);

int opcode_lea(text_state_t *state, line_info_t *info);

bool opcode_leave(text_state_t *state);

int opcode_ret(text_state_t *state);
