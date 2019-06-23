#include        <stdio.h>
#include        <stdlib.h>
#include        <unistd.h>
#include        <string.h>
#include        <sys/wait.h>
#include        <errno.h>

int main()
{
        //system("libreoffice --writer result");
        int e;
        char *envp[] = { NULL };
        char *argv[] = { "/usr/bin/libreoffice", "--writer", "readme.md", NULL };

        if (fork() == 0) {
                e = execve("/usr/bin/libreoffice", argv, envp);
                if (e == -1)
                        fprintf(stderr, "Error: %s\n", strerror(errno));
        } else {
                printf("hello this is parent process!\n");
                wait(NULL);
        }
        return 0;
}
