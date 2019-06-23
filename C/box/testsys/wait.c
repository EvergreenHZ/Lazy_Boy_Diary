#include "common.h"

extern char **environ;

void handler(int sig)
{
        pid_t child_pid;
        while ((child_pid = waitpid(-1, NULL, WNOHANG)) > 0) {
                printf("child %d has been reaped\n", child_pid);
        }
}

int main()
{
        pid_t pid;

        signal(SIGCHLD, handler);

        for (int i = 0; i < 10; i++) {
                if ((pid = fork()) == 0) {  // child
                        printf("child %d pid: %d \n", i, getpid());
                        sleep(i + 1);
                        exit(0);
                }
        }

        int j = 0;
        while (j++ < 10) {
                printf("PARENT %d\n", j);
                //pause();
                sleep(3);
        }

        while (1) {
                sleep(1);
                printf("parent keep running\n");
        }
}
