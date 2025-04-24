#include "args.h"
#include "asm.h"
#include <string.h>

bool parse_args(int argc, char **argv, all_args_t *args) {
  if (argc < 2)
    return false;
  for (int idx = 1; idx < argc; idx++) {
    if (strcmp(argv[idx], "-o") == 0)
      args->output_file = argv[++idx];
    else
      args->input_file = argv[idx];
  }
  return true;
}

void usage(char **argv) {
  printf("Usage: %s <assembly> [assembly] <object>\n", argv[0]);
}
