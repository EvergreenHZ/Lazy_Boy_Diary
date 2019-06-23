#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>

#define N 2

char **ptr;  // this can be shared

void* thread(void *vargp)
{
        //int myid = *((int*)vargp);
        int myid = (int)vargp;
        static int cnt = 0;
        printf("[%d]: %s (cnt=%d)\n", myid, ptr[myid], ++cnt);
        return NULL;
}

int main()
{
        int i;
        pthread_t tid;
        char *msgs[N] = {
                "hello from foo",
                "hello from bar",
        };

        ptr = msgs;
        for (int i = 0; i < N; i++) {
                //pthread_create(&tid, NULL, thread, (void*)(&i)); error
                pthread_create(&tid, NULL, thread, (void*)i);
        }
        pthread_exit(NULL);
        //char *hello = "hello";
        //char *found = strchr(hello, '\0');
        //if (found) {
        //        printf("%ld\n", found - hello);
        //}

        return 0;
}
