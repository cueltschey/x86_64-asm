#include <stdio.h>

void repeat_char(char c, int n) {
  for (int i = 0; i < n; ++i) {
    putchar(c);
  }
  putchar('\n');
}

int main(void) {
  repeat_char('*', 10);
  return 0;
}
