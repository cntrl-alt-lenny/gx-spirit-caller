#include "ov002_core.h"

extern int func_ov002_021bb068(int a);
extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_021bae7c(int a, int b, int c);
extern void func_ov002_0226ae0c(int a, int b);

int func_ov002_02265130(int arg0) {
    if (func_ov002_021bb068(0x1401) != 0)
        goto ret1;

    {
    int r4 = 6;
    if (func_ov002_021b3ecc(arg0, 0xb, 0x159f) != 0)
        r4 = 7;

    if (func_ov002_021bae7c(1 - arg0, 0x1800, -1) != 0)
        r4 = 5;

    int off = (arg0 & 1) * 0x868;
    unsigned int count = *(unsigned int *)((char *)data_ov002_022cf178 + off);
    if (count <= (unsigned int)r4)
        goto ret1;

    func_ov002_0226ae0c(arg0, count - r4);
    return 0;
    }
ret1:
    return 1;
}
