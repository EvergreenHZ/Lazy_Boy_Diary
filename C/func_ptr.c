#include <stdio.h>

static int g_calling_count = 0;

typedef void (*func_ptr1)(void);

typedef void func_myth(void);

void foo()
{
        printf("Foo called: %d\n", ++g_calling_count);
}

int main()
{
        func_ptr1 hello = foo;

        hello();

        func_myth *farewell = foo;

        //func_myth goodbye = *foo;
        //func_myth goodbye;

        //goodbye();

        (*farewell)();
        farewell();
}
