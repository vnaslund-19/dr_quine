#include <stdio.h>

// This program is a quine

#define SRC "#include <stdio.h>%c%c// This program is a quine%c%c#define SRC %c%s%c%c#define FT() int main(void){FILE *f=fopen(%cGrace_kid.c%c,%cw%c);if(f){fprintf(f,SRC,10,10,10,10,34,SRC,34,10,34,34,34,34,10,10,10);}return 0;}%c#define MAIN FT()%cMAIN%c"
#define FT() int main(void){FILE *f=fopen("Grace_kid.c","w");if(f){fprintf(f,SRC,10,10,10,10,34,SRC,34,10,34,34,34,34,10,10,10);}return 0;}
#define MAIN FT()
MAIN
