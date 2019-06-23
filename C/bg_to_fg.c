#include "common.h"

void handler(int sig)
{
        pid_t child_pid;
        if ((child_pid = waitpid(-1, NULL, 0))) {
                printf("child %d has been reaped\n", child_pid);
        }
}

int main()
{
        signal(SIGCHLD, handler);
        pid_t pid;

        if ((pid = fork()) == 0) {  /* child process */
                setpgid(0, 0);
                for (int i = 0; i < 10; i++) {
                        sleep(1);
                        printf("child %d\n", i);
                }

                exit(0);
        } else {
                //while (1) {
                sleep(5);
                printf("PARENT %d\n", getpid());
                int state;
                pid_t pid = waitpid(-1, &state, WUNTRACED);
                if (state == 0) {
                        printf("child %d has been reaped\n", pid);
                        exit(0);
                }
                //}
        }
}
