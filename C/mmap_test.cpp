#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/fcntl.h>
#include <iostream>
#include <unistd.h>

using namespace std;

#define LOG(...)\
        printf(__VA_ARGS__)

void Log(char* msg)
{
        printf("%s\n", msg);
}

void mmapcopy(int fd, int size)
{
        char* bufp = (char*)mmap(NULL, size, PROT_READ, MAP_PRIVATE, fd, 0);
        write(1, bufp, size);
}

int main(int argc, char* argv[])
{
        //struct stat stat;
        //int fd;

        //fd = open(argv[1], O_RDONLY, 0);
        //fstat(fd, &stat);
        //mmapcopy(fd, stat.st_size);

        //exit(0);
        //unsigned long long x = 1;
        //printf("size of unsigned long long: %lu\n", sizeof(x));
        ////unsigned long long y = 32;
        //int y = 64;
        //x <<= 64;  // 64 % 32 = 0, x keeps same
        //x <<= y;  // 64 % 32 = 0, x keeps same
        //printf("after shifting 64 bits, x is: %llu\n", x);
        //char s[32];
        //int x;
        //scanf("%*s, %d", &x);
        //printf("%d\n", x);
        //printf("size is : %ld\n", sizeof(unsigned long long));

        //char sentence[] = "This is a line.";
        //char str [20];
        //int i;

        //sscanf (sentence,"%s %*s %d",str,&i);

        //printf ("%s -> %d\n",str,i);

        //return 0;

        //LOG("%s\n", "Hello World");
        //char **s;
        //char c[10][10];
        ////foo(s);
        //foo(c);

        //FILE *fp;
        //char filename[20] = "yi.trace";
        //fp = fopen(filename, "r");
        //char s[32] = "";
        //char c;
        //long int add;
        //int size;

        //while(fgets(s, 32, fp)) {
        //        printf("%s\n", s);
        //        sscanf(s, "%c, %lx, %d", &c, &add, &size);
        //        printf("%c, %ld, %d\n", c, add, size);
        //}

        return 0;
}
