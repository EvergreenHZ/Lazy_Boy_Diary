#include "common.h"

typedef void (*sighandler_t)(int);

sighandler_t sig(int signum, sighandler_t handler)
{
        printf("*******************\n");
        return handler;
}

void hello(int x)
{
        printf("x is %d\n", x);
}

int main()
{
        int x = 1;
        sighandler_t h = sig(1, hello);

        h(x);
}
