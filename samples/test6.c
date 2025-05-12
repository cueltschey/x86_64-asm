#include <stdio.h>
#include <stdlib.h>

int square(int x) { return x * x; }

int main(void) {
  int val = rand() % 10;
  printf("Square of %d is %d\n", val, square(val));
  return 0;
}
