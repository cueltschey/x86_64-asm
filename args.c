#include "args.h"

bool parse_args(int argc, char **argv, all_args_t *args) {
  if (argc < 2)
    return false;
  for (int idx = 1; idx < argc; idx++) {
    if (strcmp(argv[idx], "-v") == 0)
      args->log_level = DEBUG;
    else if (strcmp(argv[idx], "-o") == 0)
      args->output_file = argv[++idx];
    else
      args->input_file = argv[idx];
  }
  return true;
}

void usage(char **argv) {
  ASM_ERROR("Usage: %s <assembly> [assembly] <object>", argv[0]);
}
