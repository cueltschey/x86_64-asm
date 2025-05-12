#include <stdio.h>

int main(void) {
  const char *days[] = {"Mon", "Tue", "Wed", "Thu", "Fri"};
  for (int i = 0; i < 5; ++i) {
    printf("Day %d: %s\n", i + 1, days[i]);
  }
  return 0;
}
