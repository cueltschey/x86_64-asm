#include "asm.h"
#include "state.h"

#define REX_PREFIX_BASE 0x40
#define REX_PREFIX_W 0x08
#define REX_PREFIX_R 0x04
#define REX_PREFIX_X 0x02
#define REX_PREFIX_B 0x01

bool add_new_inst(text_state_t *state, uint8_t *machine_code,
                  size_t machine_code_len, inst_status_t status,
                  rela_info_t *rela, void *extra);

bool apply_text_shift(text_state_t *state, size_t instruction_start,
                      size_t shift_by);

// Functions to handle control flow
bool handle_line(text_state_t *state, line_info_t *info);

bool handle_label(text_state_t *state, line_info_t *info);

bool handle_directive(text_state_t *state, line_info_t *info);

bool handle_machine_code(text_state_t *state, line_info_t *info);

// Insturction handlers
bool opcode_push(text_state_t *state, line_info_t *info);

bool opcode_mov(text_state_t *state, line_info_t *info);

bool opcode_sub(text_state_t *state, line_info_t *info);

bool opcode_cmp(text_state_t *state, line_info_t *info);

bool opcode_call(text_state_t *state, line_info_t *info);

bool opcode_pop(text_state_t *state, line_info_t *info);

bool opcode_lea(text_state_t *state, line_info_t *info);

bool opcode_jmp(text_state_t *state, line_info_t *info);

bool opcode_leave(text_state_t *state);

bool opcode_nop(text_state_t *state);

bool opcode_ret(text_state_t *state);
