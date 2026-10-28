#include "runtime/intrinsics.h"
typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct Obj Obj;
struct Obj {
    char pad[0x490];
    void (*cb)(Obj *, u8 *, u32, u16, u32, u8 *, int);
    int arg;
};
extern int func_0206b44c(signed char *s, int n);
int func_02069c14(Obj *o, u8 *p, int len) {
    u32 addr;
    u32 value;
    u16 port;
    int flag, count, i, n;
    u8 *name;
    if (len < 2) return 4;
    flag = p[0];
    count = p[1];
    p += 2;
    len -= 2;
    for (i = 0; i < count; i++) {
        name = p;
        n = func_0206b44c((signed char *)p, len);
        if (n == -1) return 4;
        p += n;
        len -= n;
        if (len < 11) return 4;
        __memcpy(&addr, p, 4);
        __memcpy(&port, p + 4, 2);
        __memcpy(&value, p + 6, 4);
        value = ((value >> 24) & 0xff) | ((value >> 8) & 0xff00) | ((value << 8) & 0xff0000) | ((value << 24) & 0xff000000);
        p += 10;
        len -= 10;
        n = func_0206b44c((signed char *)p, len);
        if (n == -1) return 4;
        o->cb(o, name, addr, port, value, p, o->arg);
        p += n;
        len -= n;
    }
    if (flag) o->cb(o, 0, 0, 0, 0, 0, o->arg);
    return 0;
}

