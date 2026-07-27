/* func_ov002_02203738: if the 6-bit kind field at +0x2 is 0x23, return 1.
 * Otherwise compare the OTHER player's row field0 to 0x868+0x350. */
#include "ov002_core.h"
struct S02203738 {
    char _pad0[2];
    unsigned short b0 : 1;
    unsigned short _r1 : 5;
    unsigned short kind : 6;
    unsigned short _r2 : 4;
};

int func_ov002_02203738(struct S02203738 *self) {
    int *row;
    if (self->kind == 0x23) return 1;
    row = (int *)(data_ov002_022cf16c + ((1 - self->b0) & 1) * 0x868);
    return *row > (0x868 + 0x350);
}
