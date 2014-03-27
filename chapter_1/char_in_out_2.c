#include <stdio.h>

main()
{
        int c;
        printf("EOF is: %d\n", EOF);

        while ((c = getchar()) != EOF) {
                putchar(c);
        }
}
