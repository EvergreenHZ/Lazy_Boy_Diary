#include "common.h"

sigjmp_buf buf;

void handler(int sig)
{
        siglongjmp(buf, 1);
}

int main()
{
        printf("Hello, this is main\n");
        signal(SIGINT, handler);
        printf("SIGINT, signal set\n");

        if (!sigsetjmp(buf, 1)) {
                printf ("starting\n");
        } else {
                printf ("restarting\n");
        }

        while (1) {
                sleep(1);
                printf("processing...\n");
        }
}
