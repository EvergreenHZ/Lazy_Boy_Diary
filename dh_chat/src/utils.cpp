#include "common.h"
#include "utils.h"

void Error(const char* msg) {
        printf("%S\n", msg);
        exit(-1);
}

int openListenfd(int port) {

        int listenfd = socket(AF_INET, SOCK_STREAM, 0);

        if (listenfd < 0) return -1;

        int opt = 1;
        if (setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR,
                                (const void*)&opt, sizeof(int)) < 0)
                return -1;

        // set server address
        struct sockaddr_in serveraddr;
        bzero((char*)&serveraddr, sizeof(serveraddr));
        serveraddr.sin_family = AF_INET;
        serveraddr.sin_addr.s_addr = htonl(INADDR_ANY);
        serveraddr.sin_port = htons((unsigned short)port);

        if (bind(listenfd, (struct sockaddr*)&serveraddr, sizeof(serveraddr)) < 0)
                return -1;

        if (listen(listenfd, LISTENQ) <0) return -1;

        return listenfd;
}

int openClientfd(char* hostname, int port) {
        int clientfd = socket(AF_INET, SOCK_STREAM, 0);
        if (clientfd < 0) return -1;

        struct hostent *hp;
        if (NULL == (hp = gethostbyname(hostname)))
                return -2;

        struct sockaddr_in serveraddr;
        bzero((char*)&serveraddr, sizeof(serveraddr));
        //bcopy((char*)hp->h_addr_list[0], \
        (char*)&serveraddr.sin_addr.s_addr, hp->h_length);

        //serveraddr.sin_addr.s_addr = htonl(INADDR_ANY);

        serveraddr.sin_port = htons(port);

        if (connect(clientfd, (struct sockaddr*) &serveraddr,
                                sizeof(serveraddr)) <0)
                return -1;
        return clientfd;
}
