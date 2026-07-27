/* func_ov002_02295350: scan the player's 5-slot sub-row array (row+0x30,
 * stride 0x14); for each slot with a nonzero id, call
 * func_ov002_0228dd84(self->b0, idx) and return 1 as soon as it's
 * nonzero. Returns 0 if no slot triggers that. */
#include "ov002_core.h"
extern int func_ov002_0228dd84(int bit0, int i);

int func_ov002_02295350(struct Ov002Self *self) {
    int i;
    for (i = 0; i <= 4; i++) {
        char *row = data_ov002_022cf16c + (self->b0 & 1) * 0x868;
        struct Ov002Slot *slot = (struct Ov002Slot *)(row + 0x30 + i * 0x14);
        if (slot->id != 0) {
            if (func_ov002_0228dd84(self->b0, i) != 0) {
                return 1;
            }
        }
    }
    return 0;
}
