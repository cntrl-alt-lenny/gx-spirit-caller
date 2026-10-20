#include "runtime/intrinsics.h"
typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct Obj Obj;
struct Obj {
    char pad[0x48c];
    void (*cb)(Obj *, int, u32, int, u8 **, int);
    int pad490;
    int arg;
};
extern int func_0206b6fc(char *a, int b, int c);
/* This caller supplies the index in r1 in addition to the C callee's p. */
extern int func_0206b644(int *p, int index);
extern int func_0206b44c(signed char *s, int n);
int func_02069a84(Obj *o, u8 *p, int len) {
    u8 *items[16];
    u32 value;
    u32 addr;
    u16 port;
    int rec, idx, count, i, n;
    if (len < 11) return 4;
    __memcpy(&addr, p, 4);
    __memcpy(&port, p + 4, 2);
    idx = func_0206b6fc((char *)o, addr, port);
    if (idx == -1) return 0;
    rec = func_0206b644((int *)o, idx);
    __memcpy(&value, p + 6, 4);
    value = ((value >> 24) & 0xff) | ((value >> 8) & 0xff00) | ((value << 8) & 0xff0000) | ((value << 24) & 0xff000000);
    count = p[10];
    p += 11;
    len -= 11;
    for (i = 0; i < count && i < 16; i++) {
        if (len < 1) break;
        n = func_0206b44c((signed char *)p, len);
        if (n == -1) return 4;
        items[i] = p;
        p += n;
        len -= n;
    }
    if (o->cb == 0) return 0;
    o->cb(o, rec, value, i, items, o->arg);
    return 0;
}


