/* func_ov002_02202ef0: guard on self's 2-bit field (bits12-13 of +2) == 2;
 * call func_ov002_021b947c(self->+0x14 >> 3), decompose the result into
 * byte0 (low byte), byte1 (bits8-15 of the low u16) and hi (upper u16).
 * byte1 must be 0xf; then look up cf8f4[bit0(byte0)*0x868 + hi*2] and
 * check its low byte against 0x40. */
#include "ov002_core.h"

extern char data_ov002_022cf8f4[];
extern int func_ov002_021b947c(int val);

int func_ov002_02202ef0(struct Ov002Self *self) {
    int field2 = (unsigned)(*(unsigned short *)((char *)self + 2) << 18) >> 30;
    int result;
    unsigned short lo, hi;
    int byte1, byte0, bit0;
    unsigned short val2;

    if (field2 != 2)
        return 0;

    result = func_ov002_021b947c((unsigned int)(*(int *)((char *)self + 0x14)) >> 3);
    lo = (unsigned short)result;
    byte1 = (lo >> 8) & 0xff;
    byte0 = result & 0xff;
    hi = (unsigned short)((unsigned int)result >> 16);
    if (byte1 != 0xf)
        goto fail;

    bit0 = byte0 & 1;
    val2 = *(unsigned short *)(data_ov002_022cf8f4 + bit0 * 0x868 + hi * 2);
    if ((val2 & 0xff) == 0x40)
        return 1;

fail:
    return 0;
}
