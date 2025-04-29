#include <stdio.h>

int main(int argc, char *argv[]) {
  char opt = getchar();
  if (opt == 'y') {
    printf("Yes!\n");
    return 0;
  }
  printf("Not today\n");
  return 0;
}
