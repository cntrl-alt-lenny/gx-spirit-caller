/* func_ov002_021f30cc: guard chain (player!=self->b0, 5<=idx<10,
 * slot.id!=0) to a shared "return 0" tail; else forward to
 * func_ov002_021c1fa4 as a boolean. */
#include "ov002_core.h"

int func_ov002_021f30cc(struct Ov002Self *self, int player, int idx) {
    if (player == self->b0) {
        return 0;
    }
    if (idx < 5) {
        return 0;
    }
    if (idx >= 10) {
        return 0;
    }
    {
        char *row = data_ov002_022cf08c + (player & 1) * 0x868;
        struct Ov002Slot *slot = (struct Ov002Slot *)(idx * 20 + row + 0x30);
        if (slot->id == 0) {
            return 0;
        }
    }
    return func_ov002_021c1fa4(self, player, idx, 0) != 0;
}
