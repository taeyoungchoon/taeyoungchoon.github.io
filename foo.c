#include <stdio.h>

#define MIN 0
#define MAX 3
#define SPACE 3

int main()
{
  /*
    int MAX = 5;
  */
  printf("p1-p2-\n");
  for (int i=MIN; i<MAX; i++)
    printf("%3d%3d\n", i, i*i);
}
