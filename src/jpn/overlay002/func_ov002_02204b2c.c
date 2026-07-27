/* func_ov002_02204b2c: gate on func_ov002_021baf88(0x135d)==0 and
 * func_ov002_021c9d10(self->b0)!=0, then return 1 iff
 * func_ov002_021b3dec(self->b0, self's 5-bit field at bits1-5, 0x152a)
 * returns 0. */
#include "ov002_core.h"
extern int func_ov002_021baf88(int a);
extern int func_ov002_021c9d10(int bit0);
extern int func_ov002_021b3dec(int bit0, int field, int c);

struct Ov002SelfF2 {
    unsigned short f_0;
    unsigned short b0 : 1;
    unsigned short field5 : 5;
    unsigned short _pad : 10;
};

int func_ov002_02204b2c(struct Ov002SelfF2 *self) {
    if (func_ov002_021baf88(0x135d) != 0) {
        return 0;
    }
    if (func_ov002_021c9d10(self->b0) == 0) {
        return 0;
    }
    return func_ov002_021b3dec(self->b0, self->field5, 0x152a) == 0 ? 1 : 0;
}
