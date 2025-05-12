#include <stdio.h>

char get_response(void) {
  char c;
  printf("Continue? (y/n): ");
  c = getchar();
  return c;
}

int main(void) {
  if (get_response() == 'y')
    printf("Continuing...\n");
  else
    printf("Exiting...\n");
  return 0;
}
