#include "ov002_core.h"

extern int func_ov002_021e0f5c(int a, int b);
extern void func_ov002_021e050c(int a, int b);

int func_ov002_022174f0(struct Ov002Self *self)
{
    unsigned short f4 = *(unsigned short *)((char *)self + 4);

    if ((((unsigned)f4 << 29) >> 31) != 0)
        return 0;
    if (func_ov002_021e0f5c(self->b0, 1) != 0) {
        func_ov002_021e050c(1 - self->b0, 0x3e8);
    }
    return 0;
}
