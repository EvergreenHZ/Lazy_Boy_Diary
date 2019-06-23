#include <stdio.h>
void foo(char **p)
{
}

int main()
{
        char a[10];
        char *p = a;
        foo(&p);
        //foo(&a);
        return 0;
}
