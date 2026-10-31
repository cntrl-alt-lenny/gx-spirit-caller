static inline void clear_addr(void *p) { int *dst = p; dst[0] = 0; dst[1] = 0; }
typedef struct { unsigned char b[8]; } SockAddr;
typedef struct { char *name; char **aliases; unsigned short addrtype, length; unsigned int **addr_list; } Host;
typedef struct { char pad0[0x10c]; int mode; char pad1[0xc4]; int sock; int state; char pad2[0x28]; int listener; int port; } Owner;
typedef struct { int f[5]; int active; } Node;
extern int func_02054e8c(int unused0, int unused1, int unused2);
extern int func_02055250(void *self, int flag);
extern int func_02054dfc(int sock, SockAddr *addr, unsigned char len);
/* Original caller supplies socket and backlog, although current C wrapper has no parameters. */
extern int func_02054d9c(int sock, int backlog);
/* Original caller tests r0, although current C wrapper declares void. */
extern int func_02054c30(int a, unsigned char *b, int *c);
extern int func_02054db8(int sock, SockAddr *addr, unsigned char len);
extern void *func_02054bfc(int unused0);
extern void func_0205ffd4(int *a0, int a1, int a2);
extern void func_020585d4(Owner **pp, int a, int b);
extern Host *func_0206ebe8(char *name);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_02100310[], data_021003b0[], data_021005e4[], data_0210060c[], data_02100640[], data_02100668[], data_02100694[], data_021006c4[], data_021006f8[], data_02100718[];
#define FAIL(msg) { func_0205ffd4((int *)pp, 5, (int)msg); func_020585d4(pp, 3, 1); return 3; }
int func_0205999c(Owner **pp, Node *node) {
    Owner *ctx = *pp;
    SockAddr addr;
    int size;
    Host *host;
    int error; int socket;
    if (ctx->mode == 0) {
        ctx->listener = func_02054e8c(2, 1, 0);
        socket = ctx->listener;
        if (socket == -1) FAIL(data_021005e4)
        if (func_02055250((void *)socket, 0) == 0) FAIL(data_0210060c)
        clear_addr(&addr);
        addr.b[1] = 2;
        if (func_02054dfc(ctx->listener, &addr, 8) == -1) FAIL(data_02100640)
        if (func_02054d9c(ctx->listener, 5) == -1) FAIL(data_02100668)
        size = 8;
        if (func_02054c30(ctx->listener, addr.b, &size) == -1) FAIL(data_02100694)
        ctx->port = *(unsigned short *)&addr.b[2];
    } else {
        ctx->listener = -1;
        ctx->port = 0;
    }
    ctx->sock = func_02054e8c(2, 1, 0);
    socket = ctx->sock;
    if (socket == -1) FAIL(data_021005e4)
    if (func_02055250((void *)socket, 0) == 0) FAIL(data_0210060c)
    host = func_0206ebe8(data_02100310);
    if (host == 0) FAIL(data_021006c4)
    clear_addr(&addr);
    addr.b[1] = 2;
    *((unsigned int *)&addr + 1) = **host->addr_list;
    if (*((unsigned int *)&addr + 1) == 0) func_020a6d54((int)data_021006f8, (int)data_021003b0, 0, 0x90);
    *(unsigned short *)&addr.b[2] = 0xcc74;
    if (func_02054db8(ctx->sock, &addr, 8) == -1) {
        error = (int)func_02054bfc(ctx->sock);
        if (error != -6 && error != -26 && error != -76) FAIL(data_02100718)
    }
    node->active = 1;
    ctx->state = 1;
    return 0;
}






