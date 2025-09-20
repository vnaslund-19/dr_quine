/*
This program will print its own source when run.
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CODE "/*%1$cThis program will print its own source when run.%1$c*/%1$c#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c%1$c#define CODE %2$c%3$s%2$c%1$c%1$cint i = %4$d;%1$c%1$cint main(void)%1$c{%1$c    char cur[64], src[64], bin[64], cmd[256];%1$c    sprintf(cur, %2$cSully_%%d.c%2$c, i);%1$c    if (!strcmp(cur, __FILE__)) i--;%1$c    if (i < 0) return 0;%1$c    sprintf(src, %2$cSully_%%d.c%2$c, i);%1$c    sprintf(bin, %2$cSully_%%d%2$c, i);%1$c    FILE *f = fopen(src, %2$cw%2$c); if (!f) return 1;%1$c    fprintf(f, CODE, 10, 34, CODE, i);%1$c    fclose(f);%1$c    sprintf(cmd, %2$cclang -Wall -Wextra -Werror %%s -o %%s%2$c, src, bin);%1$c    system(cmd);%1$c    sprintf(cmd, %2$c./%%s%2$c, bin);%1$c    system(cmd);%1$c    return 0;%1$c}%1$c"

int i = 5;

int main(void)
{
    char cur[64], src[64], bin[64], cmd[256];
    sprintf(cur, "Sully_%d.c", i);
    if (!strcmp(cur, __FILE__)) i--;
    if (i < 0) return 0;
    sprintf(src, "Sully_%d.c", i);
    sprintf(bin, "Sully_%d", i);
    FILE *f = fopen(src, "w"); if (!f) return 1;
    fprintf(f, CODE, 10, 34, CODE, i);
    fclose(f);
    sprintf(cmd, "clang -Wall -Wextra -Werror %s -o %s", src, bin);
    system(cmd);
    sprintf(cmd, "./%s", bin);
    system(cmd);
    return 0;
}
