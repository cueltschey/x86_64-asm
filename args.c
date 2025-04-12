#include "args.h"
#include "asm.h"
#include <string.h>

bool parse_args(int argc, char **argv, asm_state_t *state) {
  if (argc < 2)
    return false;
  for (int idx = 1; idx < argc; idx++) {
    if (strcmp(argv[idx], "-o") == 0)
      assembler_set_output_file(state, argv[++idx]);
    else
      assembler_add_input_file(state, argv[idx]);
  }
  return true;
}

void usage(char **argv) {
  printf("Usage: %s <assembly> [assembly] <object>\n", argv[0]);
}
