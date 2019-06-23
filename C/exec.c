#include "common.h"

int main()
{
        /* never return, execute and exit */
        execl("/bin/ls", "-l", NULL);

        /* control will never reach here */
        while (1) {
                printf("Hello\n");

                sleep(1);
        }
}
