/* func_ov002_02233114: dispatch on CE288.f_5a8: 0x7f sums three
 * d0e6c halfwords *100 and forwards to func_ov002_021df728; 0x80
 * extracts a 5-bit field from self+2 and forwards to
 * func_ov002_0226b184, returning 0x7f; anything else returns 0. */
#include "ov002_core.h"

extern char data_ov002_022d0d8c[];
extern int func_ov002_021df728(int self, int arg1, int arg2);
extern int func_ov002_0226b184(int arg0, int arg1, int arg2);

int func_ov002_02233114(struct Ov002Self *self) {
    if (CE288->f_5a8 == 0x7f) {
        goto is_7f;
    }
    if (CE288->f_5a8 != 0x80) {
        goto fail;
    }
    {
        unsigned short raw = *(unsigned short *)((char *)self + 2);
        unsigned int field = (unsigned int)(raw << 26) >> 27;
        func_ov002_0226b184(self->b0, field, 3);
        return 0x7f;
    }
is_7f:
    {
        unsigned short h0 = *(unsigned short *)(data_ov002_022d0d8c + 0xb0);
        unsigned short h1 = *(unsigned short *)(data_ov002_022d0d8c + 0xb2);
        unsigned short h2 = *(unsigned short *)(data_ov002_022d0d8c + 0xb4);
        int sum = h0 + h1 + h2;
        func_ov002_021df728((int)self, 1 - self->b0, sum * 100);
    }
fail:
    return 0;
}
