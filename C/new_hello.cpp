#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/io.h>
#include "stdio.h"
#include "unistd.h"
#include "inttypes.h"
#include <iostream>
using namespace std;

uintptr_t vtop(uintptr_t vaddr);
        
int main (){
        int value = 0;
        int * pointer = &value;
        int status;

        pid_t pid;

        printf("Parent: Initial value is %d\n",value);

        pid = fork();

        switch(pid){
                case -1: //Error (maybe?)
                        printf("Fork error, WTF?\n");
                        exit(-1);

                case 0: //Child process
                        printf("\tChild: I'll try to change the value\n\tChild: The pointer value is %p\n",pointer);
                        (*pointer) = 1;
                        printf("\tChild: I've set the value to %d\n",(*pointer));
                        printf("\tChild: The pointer value is %p\n",pointer);

                        cout << "\tthe physical address of pointer is: " << vtop((uintptr_t)pointer) << endl;

                        //sleep(20);

                        //pointer = NULL;
                        //printf("\tChild: The pointer value is %p\n", &pointer);

                        exit(EXIT_SUCCESS);
                        break;
        }

        while(pid != wait(&status)); //Wait for the child process

        printf("Parent: the pointer value is %p\nParent: The value is %d\n",pointer,value);
        cout << "\tthe physical address of pointer is: " << vtop((uintptr_t)pointer) << endl;

        //do {
        //        ;
        //} while (1);

        return 0;
}

uintptr_t vtop(uintptr_t vaddr) {
    FILE *pagemap;
    intptr_t paddr = 0;
    int offset = (vaddr / sysconf(_SC_PAGESIZE)) * sizeof(uint64_t);
    uint64_t e;

    // https://www.kernel.org/doc/Documentation/vm/pagemap.txt
    if ((pagemap = fopen("/proc/self/pagemap", "r"))) {
        if (lseek(fileno(pagemap), offset, SEEK_SET) == offset) {
            if (fread(&e, sizeof(uint64_t), 1, pagemap)) {
                if (e & (1ULL << 63)) { // page present ?
                    paddr = e & ((1ULL << 54) - 1); // pfn mask
                    paddr = paddr * sysconf(_SC_PAGESIZE);
                    // add offset within page
                    paddr = paddr | (vaddr & (sysconf(_SC_PAGESIZE) - 1));
                }   
            }   
        }   
        fclose(pagemap);
    }   

    cout << paddr << endl;

    return paddr;
} 

