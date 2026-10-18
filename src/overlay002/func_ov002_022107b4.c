#include "ov002_core.h"

struct Obj {
    u16 f0;
    u16 a : 1;
    u16 b : 13;
    u16 c : 1;
    u16 d : 1;
};

int func_ov002_022107b4(int a, int b, int c)
{
    struct Obj *p = *(struct Obj **)(data_ov002_022ce288 + 0x48c);
    if (a == (p->a ^ p->c) && b == 11) {
        int v = p->f0;
        if (v == 0x183e) {
            v = ((u16 *)p)[-12];
        }
        if (func_ov002_022536e8(a, v, c) != 0) {
            return 0x800;
        }
    }
    return 0;
}
