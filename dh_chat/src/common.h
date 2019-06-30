#ifndef __COMMON_H__
#define __COMMON_H__

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <memory.h> /*使用memcpy所需的头文件*/

#include <time.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>

#include <sys/ipc.h>
#include <sys/msg.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/select.h>
#include <sys/time.h>
#include <pthread.h>

//extern const int PORT;
//extern const int LISTENQ;
//extern const int MAX_LINE_SIZE;
//extern const int MAX_FILE_SIZE;

const int PORT = 6666;
const int LISTENQ = 1024;
const int MAX_LINE_SIZE = 0x1 << 12;
const int MAX_FILE_SIZE = 0x1 << 24;
const int MAX_BUFFER_SIZE =  MAX_LINE_SIZE + MAX_FILE_SIZE;
const int MAX_RECEIVED_SIZE = 1024;

const int NUMBER_OF_MESSAGE = 10;
//const char* g_message[NUMBER_OF_MESSAGE] = {
//        "REGISTER_GRP1",
//        "REGISTER_GRP4",
//        "LOGIN",
//        "ADD_FRIEND",
//        "PERSONAL_CHAT",
//        "GROUP_CHAT",
//        "VIEW_RECORDS",
//        "FILE_TRANSFER"
//};

enum MessageType {
        REGISTER_GRP1,
        REGISTER_GRP4,
        LOGIN,
        ADD_FRIEND,
        PERSONAL_CHAT,
        GROUP_CHAT,
        VIEW_RECORDS,
        FILE_TRANSFER
};

#endif
