#include <stdio.h>
#include <string.h>

void print_length(const char *str) {
  printf("Length of \"%s\" is %lu\n", str, strlen(str));
}

int main(void) {
  print_length("Assembly test");
  return 0;
}
