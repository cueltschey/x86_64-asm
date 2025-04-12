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

void buffer_append(asm_buf_t *buf, const void *data, size_t size) {
  buffer_ensure_capacity(buf, size);
  memcpy(buf->data + buf->size, data, size);
  buf->size += size;
}

void buffer_ensure_capacity(asm_buf_t *buf, size_t additional_needed) {
  if (buf->size + additional_needed > buf->capacity) {
    size_t new_capacity =
        (buf->capacity == 0) ? INITIAL_CAPACITY : buf->capacity * 2;
    while (new_capacity < buf->size + additional_needed) {
      new_capacity *= 2;
    }
    uint8_t *new_data = (uint8_t *)realloc(buf->data, new_capacity);
    if (!new_data) {
      perror("realloc failed for buffer");
      // In a real assembler, need more robust error handling than exit
      exit(EXIT_FAILURE);
    }
    buf->data = new_data;
    buf->capacity = new_capacity;
  }
}
