#include <stdio.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/shm.h>
#include <unistd.h>
#include <string.h>

int main()
{

        key_t key;
        int segment_id = shmget(key, 1024, 0644 | IPC_CREAT);

        const char *message = "Hello World!";
        printf("message size is: %lu\n", sizeof(message));

        pid_t child_pid = fork();

        if (child_pid == 0) {  // child process
                /* attach the shared memory */
                char* shared_memory = (char*) shmat(segment_id, NULL, 0);
                sprintf(shared_memory, "Hello World!");
                /* deattch the shared memory */
                shmdt(shared_memory);
        } else {  // parent process
                char* shared_memory = (char*) shmat(segment_id, NULL, 0);
                sleep(0.1);
                char str[1024];
                //printf("message size is: %lu\n", sizeof("Hello World!"));
                printf("message size is: %lu\n", strlen(message) + 1);
                memcpy(str, shared_memory, strlen(message) + 1);

                printf("%s\n", str);
        }

        /* delete the shared memory */
        shmctl(segment_id, IPC_RMID, NULL);
        return 0;
}
