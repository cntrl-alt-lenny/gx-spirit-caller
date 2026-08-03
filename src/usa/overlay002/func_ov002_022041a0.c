#include "ov002_core.h"

/* func_ov002_022041a0: self->sixbit must be 0x12 or 0x13; self->b0 must
 * match data_ov002_022d008c's per-player flag at +0xcec; then either
 * cd3f4 side (f0/f1c or f4/f20) must match (b0, fivebit) -> tail-call
 * func_ov002_02207f4c(self, arg1) passing the incoming arg1 through;
 * else return 0. */
struct Self02204290 {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short fivebit : 5;
    unsigned short sixbit : 6;
    unsigned short _pad : 4;
};

extern char data_ov002_022d008c[];
extern char data_ov002_022cd314[];
extern int func_ov002_02207f4c(struct Self02204290 *self, int arg1);

int func_ov002_022041a0(struct Self02204290 *self, int arg1)
{
    if ((unsigned short)(self->sixbit + 0xffee) > 1)
        goto ret_zero_end;

    if (*(int *)(data_ov002_022d008c + 0xcec) != self->b0)
        return 0;

    if (*(int *)(data_ov002_022cd314 + 0) == self->b0 &&
        *(int *)(data_ov002_022cd314 + 0x1c) == self->fivebit)
        goto do_call;

    if (*(int *)(data_ov002_022cd314 + 4) != self->b0)
        goto ret_zero_mid;

    if (*(int *)(data_ov002_022cd314 + 0x20) == self->fivebit)
        goto do_call;

ret_zero_mid:
    return 0;

do_call:
    return func_ov002_02207f4c(self, arg1);

ret_zero_end:
    return 0;
}
