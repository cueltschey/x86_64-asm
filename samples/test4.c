#include <stdio.h>

void check_sign(int num) {
  if (num > 0)
    printf("Positive\n");
  else if (num < 0)
    printf("Negative\n");
  else
    printf("Zero\n");
}

int main(void) {
  check_sign(5);
  check_sign(-3);
  check_sign(0);
  return 0;
}
