#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int gen_int(int x)
{
        srand(time(NULL));

        int random_integer = rand() % x;

        return random_integer;
}

int main()
{
        int y = gen_int(100);
        printf("%4d\n", y);

        return 0;
}
