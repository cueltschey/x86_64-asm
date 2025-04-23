#include "args.h"
#include "asm.h"
#include "elf.h"
#include "state.h"
#include <elf.h>
#include <stdio.h>
#include <stdlib.h>

// add rela to ELF

int main(int argc, char **argv) {
  asm_state_t state = {};
  assembler_init(&state);
  add_rela(&state, ".rodata", 0x12, RELOC_PC_RELATIVE, -4);
  add_rela(&state, "puts", 0x1a, RELOC_PLT, -4);
  if (!parse_args(argc, argv, &state)) {
    usage(argv);
    return EXIT_FAILURE;
  }
  if (!assembler_run(&state))
    return EXIT_FAILURE;

  char *info_str = get_asm_state_info(&state);
  if (info_str)
    printf("%s\n", info_str);

  return 0;
}
