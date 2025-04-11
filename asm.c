#include "asm.h"

bool assembler_write_object_file(asm_state_t *state) {

  int fd = open(state->output_file, O_WRONLY | O_CREAT | O_TRUNC,
                S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH); // Permissions rw-r--r--
  printf("Opened file %d", fd);
  close(fd);
  return true;
}
