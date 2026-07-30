#include "ov002_core.h"

typedef unsigned short u16;

extern int func_ov002_021f3368(struct Ov002Self *self);
extern int func_ov002_021f4994(struct Ov002Self *self, int arg1);
extern void func_ov002_021df690(int a, int b);

int func_ov002_021fa7e4(struct Ov002Self *self, int arg1) {
    u16 s2 = *(u16 *)((char *)self + 2);
    unsigned int xorval = self->b0 ^ (((unsigned int)(s2 << 17)) >> 31);

    int called = func_ov002_021f3368(self);

    if (((int (*)(struct Ov002Self *, int))func_ov002_021ff2cc)(self, arg1) == 0)
        return -1;

    int off = (xorval & 1) * 0x868;
    int count = *(int *)((char *)data_ov002_022cf08c + off);
    if (count <= called)
        return -1;

    int r = func_ov002_021f4994(self, arg1);
    if (r == 1)
        func_ov002_021df690(xorval, called);
    return r;
}
