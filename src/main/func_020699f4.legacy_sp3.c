#include "runtime/intrinsics.h"
struct S0206b670_Obj;
extern void func_0206b670(struct S0206b670_Obj *r6, int r5);
extern int func_0206b6fc(char *a, int b, int c);
int func_020699f4(struct S0206b670_Obj *o, unsigned char *p, int len) {
    unsigned int addr;
    unsigned short port;
    int idx;
    if (len < 6) return 4;
    __memcpy(&addr, p, 4);
    __memcpy(&port, p + 4, 2);
    idx = func_0206b6fc((char *)o, addr, port);
    if (idx == -1) return 0;
    func_0206b670(o, idx);
    return 0;
}
