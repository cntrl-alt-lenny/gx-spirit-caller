#include "ov002_core.h"

typedef struct {
    u16 f0;
    u16 bit0 : 1;    /* +0x2 bit0 */
    u16 _pad2 : 15;
    u16 _pad4a : 6;
    u16 f6_14 : 9;   /* +0x4 bits[14:6] */
} Ov002_ec50_Self;

extern int func_ov002_021b99c8(int a, int b);
extern int func_ov002_021bc538(int arg0);
extern int func_ov002_021ca310(int arg0, int arg1);
extern int func_ov002_0227acc8(int a, int b, int c, int d);

int func_ov002_0222eb60(Ov002_ec50_Self *self) {
    int r4;

    r4 = func_ov002_021b99c8(self->bit0, self->f6_14);
    if (r4 < 0) {
        return 0;
    }

    if (func_ov002_021bc538(self->bit0) == 0) {
        return 0;
    }
    if (((int (*)(int))func_ov002_021ca1d8)(self->bit0) == 0) {
        return 0;
    }
    if (func_ov002_021ca310(self->bit0, self->f0) == 0) {
        return 0;
    }

    {
        char *rowBase = data_ov002_022cf08c + (self->bit0 & 1) * 0x868;
        int *arr = (int *)(rowBase + 0x120);
        func_ov002_0227acc8(self->bit0, (int)&arr[r4], 1, (int)self->f0 << 16);
    }
    return 0;
}
