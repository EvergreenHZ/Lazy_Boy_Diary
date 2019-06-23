#include <stdio.h>

int main(int argc, char **argv, char **env)
{
        printf("Command line arguments:\n");
        for (int i = 0; i < argc; i++) {
                printf("argv[%d]: %s\n", i, argv[i]);
        }

        printf("\n");

        printf("Environment variables:\n");
        for (int i = 0; env[i] != NULL; i++) {
                printf("envp[%d]: %s\n", i, env[i]);
        }
        
}
