#include <stdio.h>

int add(int a, int b) { return a + b; }

int main(void) {
  int result = add(3, 7);
  printf("3 + 7 = %d\n", result);
  return 0;
}
