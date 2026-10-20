typedef struct {
    char *name;
    char **aliases;
    unsigned short addrtype;
    unsigned short length;
    unsigned int **addr_list;
} hostent_0206ebe8_t;
typedef struct { int x0; volatile int socket; volatile int buf; volatile int size; } Stream;
typedef struct { int x0; Stream *stream; int x8; int xc; int x10; int ready; } Req;
typedef struct { unsigned char len; unsigned char family; unsigned short port; unsigned int addr; } Address;
extern int func_020453e8(int a);
/* This caller passes one argument beyond the C definition. */
extern void *func_02054bfc(int socket);
extern int func_02054db8(int socket, void *addr, int size);
/* This caller passes three arguments beyond the C definition. */
extern int func_02054e8c(int domain, int type, int protocol);
extern int func_02055250(void *self, int flag);
extern void func_020585d4(int *self, int state, int flag);
extern int func_0205ffc0(int *p, int b);
extern void func_0205ffd4(int *a0, int a1, int a2);
extern hostent_0206ebe8_t *func_0206ebe8(char *name);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_02100de0[], data_02100e20[], data_02100e50[], data_021010e8[], data_02101110[], data_02101144[], data_02101174[], data_02101194[];
int func_0205fb88(int *self, Req *req) {
    Stream *s = req->stream;
    hostent_0206ebe8_t *host;
    int err;
    int socket;
    s->size = 0x1000;
    s->buf = func_020453e8(s->size + 1);
    if (s->buf == 0) {
        func_0205ffc0(self, (int)data_02100e20);
        return 1;
    }
    s->socket = func_02054e8c(2, 1, 0);
    socket = s->socket;
    if (socket == -1) {
        func_0205ffd4(self, 5, (int)data_021010e8);
        func_020585d4(self, 3, 1);
        return 3;
    }
    if (func_02055250((void *)socket, 0) == 0) {
        func_0205ffd4(self, 5, (int)data_02101110);
        func_020585d4(self, 3, 1);
        return 3;
    }
    host = func_0206ebe8(data_02100de0);
    if (host == 0) {
        func_0205ffd4(self, 5, (int)data_02101144);
        func_020585d4(self, 3, 1);
        return 3;
    }
    Address addr = {0};
    addr.family = 2;
    addr.addr = **host->addr_list;
    if (addr.addr == 0) {
        func_020a6d54((int)data_02101174, (int)data_02100e50, 0, 0x59);
    }
    addr.port = 0xcd74;
    if (func_02054db8(s->socket, &addr, 8) == -1) {
        err = (int)func_02054bfc(s->socket);
        if (err != -6 && err != -26 && err != -76) {
            func_0205ffd4(self, 5, (int)data_02101194);
            func_020585d4(self, 3, 1);
            return 3;
        }
    }
    req->ready = 1;
    return 0;
}




