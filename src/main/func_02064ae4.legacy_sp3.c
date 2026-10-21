typedef struct { unsigned char len; unsigned char family; unsigned short port; int address; } SockAddr;
typedef struct { void **items; int count; int extra; int a3; int a4; } Obj;
typedef struct { void **items; int count; } Self02054684;
typedef struct Q { int field0; unsigned short field4; } Q_02064d88;
typedef struct { Q_02064d88 *q; } T_02064d88;
typedef struct {
    int sock; int address; unsigned short port; unsigned short pad;
    Obj *list; void *array; char gap[0x10]; int param;
    char gap2[0x10]; int size1; int size2; int tail;
} State;
extern int func_020453e8(int a);
/* This caller supplies only the allocation pointer to the four-argument thunk. */
extern int func_020453b4();
extern void func_02054148(void *p);
extern void *func_020541b8(int elemSize, int count, int extra);
extern void func_02054684(Self02054684 *self);
extern Obj *func_02054700(int elemSize, int count, int capacity, int a3, int a4, int extra);
extern void func_02054c30(int a, unsigned char *b, int *c);
extern int func_02054dfc(int sock, SockAddr *addr, unsigned char len);
extern int func_02054e70(int unused0);
/* The original passes three arguments despite the current no-argument wrapper definition. */
extern int func_02054e8c(int domain, int type, int protocol);
extern void func_02055320(void);
extern int func_02064d48(int *p);
extern int func_02064d58(int **a0, int **a1);
extern int func_02064d88(T_02064d88 *p, unsigned int divisor);
extern int func_02064dfc(char *name, int *addr, unsigned short *port);
extern int func_020a73d4(int x, int unused1, int unused2);
static inline void clear_address(int value, void *p) { int *q = p; q[0] = value; q[1] = value; }
int func_02064ae4(State **out, char *name, int size1, int size2, int param) {
    State *s;
    unsigned short port;
    SockAddr addr;
    int address;
    int len;
    func_02055320();
    if (size2 == 0) size2 = 0x10000;
    if (size1 == 0) size1 = 0x10000;
    if (func_02064dfc(name, &address, &port) == 0) return 4;
    s = (State *)func_020453e8(0x44);
    if (s == 0) return 1;
    func_020a73d4((int)s, 0, 0x44);
    s->sock = -1;
    s->size2 = size2;
    s->size1 = size1;
    s->param = param;
    s->list = func_02054700(4, 0x20, 2, (int)func_02064d88, (int)func_02064d58, 0);
    if (s->list == 0) { func_020453b4(s); return 1; }
    s->array = func_020541b8(4, 4, (int)func_02064d48);
    if (s->array == 0) { func_02054684((Self02054684 *)s->list); func_020453b4(s); return 1; }
    s->sock = func_02054e8c(2, 2, 0);
    if (s->sock == -1) { func_02054684((Self02054684 *)s->list); func_02054148(s->array); func_020453b4(s); return 3; }
    clear_address(0, &addr);
    addr.family = 2;
    addr.address = address;
    addr.port = ((port >> 8) & 0xff) | ((port << 8) & 0xff00);
    if (func_02054dfc(s->sock, &addr, 8) == -1) { func_02054e70(s->sock); func_02054684((Self02054684 *)s->list); func_02054148(s->array); func_020453b4(s); return 3; }
    len = 8;
    func_02054c30(s->sock, (unsigned char *)&addr, &len);
    s->address = addr.address;
    s->port = ((addr.port >> 8) & 0xff) | ((addr.port << 8) & 0xff00);
    *out = s;
    return 0;
}






