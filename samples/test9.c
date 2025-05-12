#include <stdio.h>

int factorial(int n) {
  if (n <= 1)
    return 1;
  return n * factorial(n - 1);
}

int main(void) {
  int n = 4;
  printf("Factorial of %d is %d\n", n, factorial(n));
  return 0;
}
