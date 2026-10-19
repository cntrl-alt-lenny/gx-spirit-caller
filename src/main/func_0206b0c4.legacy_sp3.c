typedef struct {
    char *name;
    char **aliases;
    unsigned short addrtype;
    unsigned short length;
    unsigned int **addr_list;
} hostent_0206ebe8_t;
typedef struct { unsigned char bytes[4]; } Address;
typedef struct { unsigned char len, family; unsigned short port; Address addr; } SocketAddress;
typedef struct { char pad[0x4b0]; int socket; } Context;
extern void *__memcpy(void *, const void *, unsigned long);
extern char *data_0219ecd0;
extern char data_02101df8[];
extern int func_0206b1f8(char *, int);
extern char *func_020aadf8(char *, const char *);
extern int func_020a978c(char *, const char *, ...);
extern int func_02054c0c(int a);
extern hostent_0206ebe8_t *func_0206ebe8(char *name);
/* These wrappers forward the incoming argument registers to their callees. */
extern int func_02054e8c(int, int, int);
extern int func_02054e70(int);
extern int func_02054db8(int, SocketAddress *, int);
int func_0206b0c4(Context *ctx) {
    char name[128];
    SocketAddress address;
    hostent_0206ebe8_t *host;
    int hash = func_0206b1f8((char *)ctx + 0xc, 20);
    if (data_0219ecd0 != 0)
        func_020aadf8(name, data_0219ecd0);
    else
        func_020a978c(name, data_02101df8 + 4, (char *)ctx + 0xc, hash);
    address.family = 2;
    address.port = 0xee70;
    *(int *)&address.addr = func_02054c0c((int)name);
    if (*(int *)&address.addr == -1) {
        host = func_0206ebe8(name);
        if (host == 0) return 2;
        __memcpy(&address.addr, host->addr_list[0], 4);
    }
    if (ctx->socket == -1) {
        ctx->socket = func_02054e8c(2, 1, 0);
        if (ctx->socket == -1) return 1;
    }
    if (func_02054db8(ctx->socket, &address, 8) == 0) return 0;
    func_02054e70(ctx->socket);
    ctx->socket = -1;
    return 3;
}


