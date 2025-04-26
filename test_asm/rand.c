#include <stdio.h>
#include <stdlib.h>

int get_random_num(int max) { return rand() % max; }

int main(int argc, char *argv[]) {
  printf("You got a number\n\t%d!", get_random_num(100));
  return 0;
}
