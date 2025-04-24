#include "asm.h"

typedef struct all_args_s {
  const char *input_file;
  const char *output_file;
} all_args_t;

bool parse_args(int argc, char **argv, all_args_t *state);

void usage(char **argv);
