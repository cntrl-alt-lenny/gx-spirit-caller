/* func_ov002_02206a10: guard on self's 2-bit field (bits12-13 of +2) == 2;
 * then check whether EITHER half (high u16 >>16, or low u16) of the packed
 * int at self+0x14, each shifted >>3 and run through func_ov002_021b939c,
 * yields a byte1(result)==0xf category. */
#include "ov002_core.h"

extern int func_ov002_021b939c(int val);

int func_ov002_02206a10(struct Ov002Self *self) {
    int field2 = (unsigned)(*(unsigned short *)((char *)self + 2) << 18) >> 30;
    unsigned short id_high, id_low;
    int r;

    if (field2 != 2)
        return 0;

    id_high = (unsigned short)((unsigned int)(*(int *)((char *)self + 0x14)) >> 16);
    r = func_ov002_021b939c(id_high >> 3);
    if ((((unsigned short)r >> 8) & 0xff) == 0xf)
        return 1;

    id_low = (unsigned short)(*(int *)((char *)self + 0x14));
    r = func_ov002_021b939c(id_low >> 3);
    return (((unsigned short)r >> 8) & 0xff) == 0xf;
}
