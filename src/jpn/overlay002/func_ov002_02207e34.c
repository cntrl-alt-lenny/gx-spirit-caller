#include "ov002_core.h"

typedef unsigned short u16;

extern int data_ov002_022cf09c[];
extern int func_ov002_0223f5dc(struct Ov002Self *self);
extern int func_ov002_02253600(int bit0, int f0, int arg2);

int func_ov002_02207e34(struct Ov002Self *self) {
    if (func_ov002_021ff2cc(self) == 0)
        return 0;

    u16 s2 = *(u16 *)((char *)self + 2);
    int bit = (int)(((unsigned int)(s2 << 31)) >> 31) & 1;
    int off = bit * 0x868;
    int count = *(int *)((char *)data_ov002_022cf09c + off);
    if (count != 0 && self->f0 != 0x1741)
        goto ret1;

    {
        int r = func_ov002_0223f5dc(self);
        if (func_ov002_02253600(self->b0, self->f0, r) == 0)
            return 0;
    }
ret1:
    return 1;
}
