/* func_ov002_02288838: fetch a u16 via func_ov002_02215f14's output param,
 * gate on func_ov002_021c1d64(self, lo, hi), then compare cf16c[bit0] and
 * cf16c[1-bit0] against callresult/2 (signed division), and finally compare
 * the buffer's low byte against 1-bit0. */
#include "ov002_core.h"

extern int func_ov002_02215f14(struct Ov002Self *self, unsigned short *out);
extern int func_ov002_021c1d64(struct Ov002Self *self, int lo, int hi);

int func_ov002_02288838(struct Ov002Self *self) {
    unsigned short localbuf;
    int callresult;
    int bit0;
    int half;
    callresult = func_ov002_02215f14(self, &localbuf);
    if (func_ov002_021c1d64(self, localbuf & 0xff, (localbuf >> 8) & 0xff) != 0)
        return 0;
    bit0 = self->b0;
    half = callresult / 2;
    if (*(int *)(data_ov002_022cf08c + (bit0 & 1) * 0x868) <= half)
        return 0;
    if (*(int *)(data_ov002_022cf08c + ((1 - bit0) & 1) * 0x868) <= half)
        return 1;
    return ((localbuf & 0xff) == (1 - bit0)) ? 1 : 0;
}
