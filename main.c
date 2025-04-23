#include "args.h"
#include "asm.h"
#include <elf.h>
#include <stdio.h>
#include <stdlib.h>

// sub
// lea
// call

int main(int argc, char **argv) {
  asm_state_t state = {};
  assembler_init(&state);
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
