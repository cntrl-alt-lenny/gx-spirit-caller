/* func_ov002_021efac8: 0x868-per-player row / 0x14 sub-row accessor guard,
 * matching the ov002_core.h "0x868 sub-row accessors" family. Guards on
 * self->b0 == player, idx < 5 and the sub-row's slot id != 0, then inverts
 * func_ov002_021c1e44's result. */
#include "ov002_core.h"

int func_ov002_021efac8(struct Ov002Self *self, int player, int idx) {
    if (self->b0 != player) return 0;
    if (idx >= 5) return 0;
    struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf16c
        + (player & 1) * 0x868 + idx * 0x14 + 0x30);
    if (slot->id == 0) return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
