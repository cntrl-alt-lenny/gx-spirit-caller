/* func_ov002_021d63fc: forward (arg1,arg2,arg3, self->f0, arg1!=self->b0) to
 * func_021d6434; the 5th (stacked) arg is the bit0-compare computed first.
 * self->b0 = bit0 of the u16 at +2 (lsl#31;lsr#31 -> bitfield, folded into cmp). */
#include "ov002_core.h"

extern int func_ov002_021d6434(int a, int b, int c, int d, int e);

int func_ov002_021d63fc(struct Ov002Self *self, int arg1, int arg2, int arg3) {
    return func_ov002_021d6434(arg1, arg2, arg3, self->f0, arg1 != self->b0);
}
