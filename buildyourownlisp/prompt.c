#include <stdio.h>
#include <stdlib.h>

/* If we are compiling on Windows... */
#ifdef _WIN32

#include <string.h>

static char buffer[2048];

/* Fake readline */
char* readline(char* prompt) {
  fputs(prompt, stdout);
  fgets(buffer, 2048, stdin);
  char* cpy = malloc(strlen(buffer)+1);
  strcpy(cpy, buffer);
  cpy[strlen(cpy)-1] = '\0';
  return cpy;
}

/* Fake add_history */
void add_history(char* unused) {}

/* Otherwise include editline headers */
#else

#include <readline/readline.h>
#include <readline/history.h>

#endif

int main(int argc, char** argv) {

  /* Print version and exit information */
  puts("Lispy Version 0.0.0.0.1");
  puts("Press Ctrl+C to Exit\n");

  /* In a never ending loop */

  while(1) {
    
    /* Output prompt, get input */
    char* input = readline("lispy> ");

    /* Add input to history */
    add_history(input);

    /* Echo input back to user */
    printf("No you're a %s\n", input);

    /* Free retreived input */
    free(input);
  }
  
  return 0;
}
