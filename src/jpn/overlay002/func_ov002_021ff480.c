/* func_ov002_021ff480: gate chain -- arg1 must be 0, D016C.f_cec must
 * differ from self->b0, D016C.f_cf8 must be 3, self's 6-bit kind field
 * must be 0xe; then return whether self->b0 equals bit 21 of self->f_14. */
#include "ov002_core.h"

struct Ov002SelfKind {
    unsigned short f_0;
    unsigned short b0 : 1;
    unsigned short _pad1 : 5;
    unsigned short kind : 6;
    unsigned short _pad2 : 4;
    char _pad3[16];
    int f_14;
};

int func_ov002_021ff480(struct Ov002SelfKind *self, int arg1) {
    int b0;
    if (arg1 != 0) {
        return 0;
    }
    b0 = self->b0;
    if (D016C->f_cec == b0) {
        return 0;
    }
    if (D016C->f_cf8 != 3) {
        return 0;
    }
    if (self->kind == 0xe) {
        return b0 == (int)((unsigned)(self->f_14 << 10) >> 31);
    }
    return 0;
}
