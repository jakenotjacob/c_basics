#include <stdio.h>
#define MAXLINE 1000 /* maximum input length */

int getline(char line[], int maxline);
void copy(char to[], char from[]);

int main(){
        int len; /* current line length */
        int max; /* max line length SO FAR */
        char line[MAXLINE]; /* current input line */
        char longest[MAXLINE]; /* longest line saved here*/

        max = 0;
        /* while there's another line */
        while ((len = getline(line, MAXLINE)) > 0)
                /* if it's longer than the prev. longest */
                if (len > max) {
                        /* save it */
                        max = len;
                        /* save its length */
                        copy(longest, line);
                }
        /* print longest line*/
        if (max > 0) /*there was a line */
                printf("%s", longest);
        return 0;

}

/* getline: read a line into s, return length */
int getline(char str[], int lim)
{
        int c, i;

        for (i = 0; i < lim-1 && (c = getchar())!=EOF && c!='\n'; ++i)
                str[i] = c;
        if (c == '\n') {
                str[i] = c;
                ++i;
        }
        str[i] = '\0';
        return i;
}

/* copy: copy 'from' into 'to'; assume to is big enough */
void copy(char to[], char from[])
{
        int i;

        i = 0;
        while ((to[i] = from[i]) != '\0')
                ++i;
}
