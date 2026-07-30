#include "ov002_core.h"

typedef unsigned short u16;

extern int data_ov002_022cf17c[];
extern int func_ov002_0223f6c4(struct Ov002Self *self);
extern int func_ov002_022536e8(int bit0, int f0, int arg2);

int func_ov002_02207f24(struct Ov002Self *self) {
    if (func_ov002_021ff3bc(self) == 0)
        return 0;

    u16 s2 = *(u16 *)((char *)self + 2);
    int bit = (int)(((unsigned int)(s2 << 31)) >> 31) & 1;
    int off = bit * 0x868;
    int count = *(int *)((char *)data_ov002_022cf17c + off);
    if (count != 0 && self->f0 != 0x1741)
        goto ret1;

    {
        int r = func_ov002_0223f6c4(self);
        if (func_ov002_022536e8(self->b0, self->f0, r) == 0)
            return 0;
    }
ret1:
    return 1;
}
