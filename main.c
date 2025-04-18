#include "args.h"
#include "asm.h"
#include "elf.h"
#include <elf.h>
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

  add_symbol(&state, ".file", SHN_ABS, 0, STT_FILE, STB_LOCAL);
  write_elf_object_file(&state);

  for (size_t i = 0; i < state.nof_symbols; i++) {
    printf("DEBUG: %d, %s\n", state.symbols[i].name_idx,
           (char *)&state.sections[state.strtab_idx]
               .content.data[state.symbols[i].name_idx]);
  }

  char *info_str = get_asm_state_info(&state);
  if (info_str)
    printf("%s\n", info_str);

  return 0;
}
