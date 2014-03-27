#include <stdio.h>

main()
{
        int c;
        int tb, sp, nl;
        
        nl = 0;

        while ((c = getchar()) != EOF)
                if (c == '\n')
                        ++nl;
                else if (c == '\t')
                        ++tb;
                else if (c == ' ')
                        ++sp; 
        printf("Number of newlines: %d\n", nl);
        printf("Number of tabs: %d\n", tb);
        printf("Number of whitespaces: %d\n", sp);
}
