#include <stdio.h>

// outside: let it all work out

char *src(void)
{
  return "#include <stdio.h>%1$c%1$c// outside: let it all work out%1$c%1$cchar *src(void)%1$c{%1$c  return %2$c%3$s%2$c;%1$c}%1$c%1$cint main(void)%1$c{%1$c  // inside: hej desde main%1$c  char *s = src();%1$c  printf(s, 10, 34, s);%1$c  return 0;%1$c}%1$c";
}

int main(void)
{
  // inside: hej desde main
  char *s = src();
  printf(s, 10, 34, s);
  return 0;
}
