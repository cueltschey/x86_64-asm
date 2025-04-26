#include "args.h"
#include "asm.h"
#include "log.h"
#include <elf.h>
#include <stdlib.h>

// cmp

int main(int argc, char **argv) {
  all_args_t args = {};
  if (!parse_args(argc, argv, &args)) {
    usage(argv);
    return EXIT_FAILURE;
  }
  log_level = args.log_level;
  ASM_INFO("Assembling %s into %s", args.input_file, args.output_file);
  if (!assemble_file(args.input_file, args.output_file))
    return EXIT_FAILURE;

  return 0;
}
