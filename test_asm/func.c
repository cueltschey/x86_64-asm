#include <stdio.h>

void some_function(char *str) { printf("HERE: %s\n", str); }

int main(void) {
  some_function("hello function!");
  return 0;
}
