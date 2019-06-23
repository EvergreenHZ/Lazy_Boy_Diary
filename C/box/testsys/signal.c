#include <stdio.h>
#include <signal.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <pthread.h>
#include <unistd.h>

pid_t pid;
int counter = 2;

void handler(int sig)
{
        pid_t pid_in_handler = getpid();
        printf("pid in handler is %d\n", pid_in_handler);
        counter--;
        printf("%d\n", counter);
        fflush(stdout);
        exit(0);
}

int main()
{
        pid_t main_pid = getpid();
        printf("main pid is %d\n", main_pid);

        signal(SIGUSR1, handler);

        printf("parent %d\n", counter);
        fflush(stdout);

        if ((pid = fork()) == 0) {
                while(1) {
                        if (counter == 2) {
                                printf("child %d\n", counter);
                                counter--;
                        } else if (counter == 1) {
                                printf("child %d\n", counter);
                                counter--;
                        }
                };
        } else {
                printf("child pid is %d\n", pid);
        
                sleep(1);
                kill(pid, SIGUSR1);
                waitpid(-1, NULL, 0);
                counter++;
                printf("parent %d\n", counter);

                exit(0);
        }
}
