#include <stdio.h>

main()
{
        /* Use int instead of char to it can hold EOF */
        int c;

        c = getchar();
        while (c != EOF) {
                putchar(c);
                c = getchar();
        }
}
