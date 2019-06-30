#ifndef __UTILS_H__
#define __UTILS_H__

void Error(const char*);

int openListenfd(int);

int openClientfd(char* hostname, int port);

#endif
