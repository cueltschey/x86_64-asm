#include "elf.h"

void buffer_init(asm_buf_t *buf) {
  buf->data = NULL;
  buf->size = 0;
  buf->capacity = 0;
}

void buffer_destroy(asm_buf_t *buf) {
  free(buf->data);
  buffer_init(buf); // Reset state
}
