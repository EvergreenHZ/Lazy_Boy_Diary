#include "common.h"

extern char **environ;

void handler(int sig)
{
        pid_t child_pid;
        if ((child_pid = waitpid(-1, NULL, 0))) {
                printf("child %d has been reaped\n", child_pid);
        }
}

int main()
{
        //signal(SIGCHLD, handler);
        pid_t pid;

        if ((pid = fork()) == 0) {  /* child process */
                setpgid(0, 0);
                for (int i = 0; i < 10; i++) {
                        sleep(1);
                        printf("child %d\n", i);
                        //printf("CHILD GID: %d\n", getpgrp());
                }

                exit(0);
        } else {
                //while (1) {
                //printf("\nPARENT %d\n\n", getpid());
                //sleep(5);

                sleep(5);
                kill(-pid, SIGTSTP);
                for (int i = 1; i <= 5; i++) {
                        sleep(1);
                        printf("parent %d\n", i);
                }
                //kill(-pid, SIGCONT);
                int state;
                pid_t t_pid = waitpid(-1, &state, WUNTRACED);
                //kill(-pid, SIGCONT);
                printf("\nbackground to foreground\n");
                //waitpid(pid, &state, 0);
                //if (state == 0) {
                        //goto LAST;
                        //exit(0);
                //}
                while (1) {
                        //sleep(1);
                        //printf("parent\n");
                }
                //if (state == 0) {
                //        printf("child %d has been reaped\n", pid);
                //        exit(0);
                //}
                //}
//LAST:
                //while (1) {
                        //;
                //}
        }
}
