#include "ov002_core.h"

extern int func_ov002_021c1e44(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021c1ef0(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021c2084(struct Ov002Self *self, int player, int idx, int one);

int func_ov002_021e99a4(struct Ov002Self *self, int player, int idx) {
    struct Ov002Slot *slot;

    if (idx >= 5)
        return 0;

    slot = (struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20 + 0x30);
    if (slot->id == 0)
        return 0;

    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;

    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;

    return func_ov002_021c2084(self, player, idx, 1) != 0;
}
