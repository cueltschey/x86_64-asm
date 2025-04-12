#include "args.h"
#include "asm.h"
#include "elf.h"
#include <stdio.h>
#include <stdlib.h>

// 1. make ELF file
// 2. create sections from directives
// 3. parse instructions for translation
// 4. implement funcions and fix bugs

int main(int argc, char **argv) {
  asm_state_t state = {};
  assembler_init(&state);
  if (!parse_args(argc, argv, &state)) {
    usage(argv);
    return EXIT_FAILURE;
  }
  write_elf_object_file(&state);

  char *info_str = get_asm_state_info(&state);
  if (info_str)
    printf("%s\n", info_str);

  return 0;
}
