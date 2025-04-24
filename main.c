#include "args.h"
#include "asm.h"
#include <elf.h>
#include <stdlib.h>

// Improve data struct
// Two passes
// Separate instructions into units
// handle functions better
// store info on text labels
// jmp
// cmp

int main(int argc, char **argv) {
  all_args_t args = {};
  if (!parse_args(argc, argv, &args)) {
    usage(argv);
    return EXIT_FAILURE;
  }
  printf("Assembling %s into %s\n", args.input_file, args.output_file);
  if (!assemble_file(args.input_file, args.output_file))
    return EXIT_FAILURE;

  return 0;
}
