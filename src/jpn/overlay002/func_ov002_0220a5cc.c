#include "ov002_core.h"

typedef unsigned short u16;

extern int func_ov002_021b939c(int a);
extern int func_ov002_021b3ef8(int a, int b, int c, int d);

int func_ov002_0220a5cc(struct Ov002Self *self) {
    int (*fn)(int) = (int (*)(int))func_ov002_021ca1d8;
    if (fn(self->b0) == 0)
        return 0;

    u16 sf4 = *(u16 *)((char *)self + 4);
    unsigned int field9 = ((unsigned int)(sf4 << 17)) >> 23;
    int r = func_ov002_021b939c(field9);
    u16 lo16 = (u16)r;
    if (((lo16 >> 8) & 0xff) != 0xf)
        return 0;

    u16 sf4b = *(u16 *)((char *)self + 4);
    unsigned int field9b = ((unsigned int)(sf4b << 17)) >> 23;
    if (func_ov002_021b3ef8(self->b0, 0xb, 0x16be, field9b) == 0)
        return 1;
    return 0;
}
