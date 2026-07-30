#include "ov002_core.h"

typedef unsigned short u16;

extern int func_ov002_021bb068(int a);
extern int func_ov002_022536e8(int a, int f0, int c);
extern char data_ov002_022cd73c[];

int func_ov002_0223bdb8(struct Ov002Self *self) {
    u16 s2 = *(u16 *)((char *)self + 2);
    unsigned int bit14 = ((unsigned int)(s2 << 17)) >> 31;
    unsigned int xorval = self->b0 ^ bit14;

    int (*fn)(int) = (int (*)(int))func_ov002_021ca2b8;
    if (fn(xorval) == 0)
        return 0;

    if (func_ov002_021bb068(0x197a) != 0)
        return 0;

    if ((int)xorval == *(int *)(data_ov002_022cd73c + 4))
        *(int *)(data_ov002_022d016c + 0xd80) = 14;

    if (func_ov002_022536e8(xorval, self->f0, 0) == 0)
        return 0;
    return 1;
}
