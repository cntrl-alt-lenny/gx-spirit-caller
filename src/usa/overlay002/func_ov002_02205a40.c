#include "ov002_core.h"

typedef unsigned short u16;

extern int func_ov002_021b939c(int a);
extern u16 data_ov002_022d0170[];

int func_ov002_02205a40(struct Ov002Self *self) {
    u16 s2 = *(u16 *)((char *)self + 2);
    unsigned int field2 = ((unsigned int)(s2 << 18)) >> 30;
    if (field2 != 2)
        return 0;

    unsigned int v = (unsigned int)(*(int *)((char *)self + 0x14)) >> 3;
    int r = func_ov002_021b939c(v);
    u16 lo16 = (u16)r;
    if (((lo16 >> 8) & 0xff) != 0xf)
        goto ret0;

    {
        u16 s4 = *(u16 *)((char *)self + 4);
        if (v == (((unsigned int)(s4 << 17)) >> 23)) {
            u16 id = *(u16 *)((char *)data_ov002_022d0170 + v * 4);
            u16 f0 = *(u16 *)((char *)self);
            if (f0 != (((unsigned int)(id << 19)) >> 19))
                return 0;
        }
    }
    return 1;
ret0:
    return 0;
}
