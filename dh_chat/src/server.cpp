#include "common.h"
#include "utils.h"
#include <algorithm>
#include <string>
#include <string>
#include <map>
#include <iostream>

using namespace std;

void parse_json(char* buf, map<string, string> &m) {
        char *p = buf;
        char *q = p;

        // buf must be json form
        while ('}' != *p && '\0' != *p) {
                while ('"' != *p) {
                        if ('}' == *p || '\0' == *p)
                                return;
                        p++;
                }  // *p == '"'
                p++;
                q = p;

                while('"' != *q) {
                        q++;
                }
                string key(p, q - p);

                p = q + 1;

                while ('"' != *p) {
                        p++;
                }
                q = (++p);
                while ('"' != *q) {
                        q++;
                }
                string value(p, q - p);
                m[key] = value;

                p = q + 1;
        }
}

void* handleRequest(void* connfdp) {

        int connfd = *((int*)connfdp);
        pthread_detach(pthread_self());

        delete (int*)connfdp;
        connfdp = NULL;

        char *buf = new char[MAX_BUFFER_SIZE];
        std::fill(buf, buf + MAX_BUFFER_SIZE, 0);

        // read to buffer
        int nread = -1;
        char* p = buf;
        while ((nread = recv(connfd, p, MAX_RECEIVED_SIZE, 0)) > 0) {
                cout << "Keep Reading" << endl;
                p += nread;
        }

        if (-1 == nread) {
                close(connfd);
                delete[] buf;
                return NULL;
        }

        // parsing json
        map<string, string> json;
        parse_json(buf, json);
        delete [] buf;

        cout << json["cmd"] << endl;

        /*
         * get Message & process it
         * you should close the fd
         */

        close(connfd);
        return NULL;
}

int main(int argc, char* argv[])
{
        int listenfd = openListenfd(PORT);
        if (-1 == listenfd) Error("Listenfd can not be opened");

        struct sockaddr_in clientaddr;
        socklen_t clientlen = sizeof(struct sockaddr_in);
        pthread_t tid;
        while (true) {
                cout << "Keep Listening" << endl;
                int *connfdp = new int;
                *connfdp = accept(listenfd, (struct sockaddr*)&clientaddr, &clientlen);
                cout << "Connection Built" << endl;
                pthread_create(&tid, NULL, handleRequest, connfdp);
        }
}
