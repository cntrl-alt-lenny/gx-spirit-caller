#include "ov002_core.h"

int func_ov002_021f16d4(struct Ov002Self *self, int player, int idx) {
    struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20 + 0x30);
    int id = slot->id;
    if (id == 0) return 0;
    if (player == self->b0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
