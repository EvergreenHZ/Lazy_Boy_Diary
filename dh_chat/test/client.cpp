#include "common.h"
#include "utils.h"
#include <iostream>
using namespace std;


int main() {
        //char hostname[100] = "localhost";
        //int clientfd = openClientfd(hostname, 4321);

        //if (clientfd < 0) {
        //        cout << "Error" << endl;
        //        return 0;
        //}
        cout << "Main" << endl;
        int clientfd = socket(AF_INET, SOCK_STREAM, 0);
        if (clientfd < 0) {
                cout << "ERROR: socket failed" << endl;
                return -1;
        }

        cout << "Socket Opened" << endl;
        int port = PORT;
        struct sockaddr_in serveraddr;
        bzero((char*)&serveraddr, sizeof(serveraddr));
        serveraddr.sin_family = AF_INET;
        serveraddr.sin_port = htons(port);
        serveraddr.sin_addr.s_addr = htonl(INADDR_ANY);
        if(inet_pton(AF_INET, "127.0.0.1", &serveraddr.sin_addr)<=0)  
        { 
                printf("\nInvalid address/ Address not supported \n"); 
                return -1; 
        } 

        cout << "Start Connecting..." << endl;

        if (connect(clientfd, (struct sockaddr*) &serveraddr,
                                sizeof(serveraddr)) <0) {
                cout << "connection failed" << endl;
                return -1;
        }

        cout << "clientfd is: " << clientfd << endl;

        char buf[1000] = "{ \"cmd\"  : \"LOGIN\", \"account\" : \"huaizhi\" }";
        int nwrite = -1;
        char *p = buf;
        //cout << sizeof(p) << endl;
        exit(0);
        cout << "Start Writing" << endl;
        while ((nwrite = write(clientfd, p, 10)) > 0) {
                cout << "Keep Writing" << endl;
                p += nwrite;
        }
}
