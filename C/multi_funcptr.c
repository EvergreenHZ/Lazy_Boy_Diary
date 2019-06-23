#include <stdio.h>

void foo()
{
        printf("FOO\n");
}

void bar()
{
        printf("BAR\n");
}

typedef void (*funcptr)();

funcptr funcs[] = {foo, bar};

int main()
{
        for (int i = 0; i < 2; i++) {
                funcs[i]();
        }
}
