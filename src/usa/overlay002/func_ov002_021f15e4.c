#include "ov002_core.h"

int func_ov002_021f15e4(struct Ov002Self *self, int player, int idx) {
    struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf08c + (player & 1) * 0x868 + idx * 20 + 0x30);
    int id = slot->id;
    if (id == 0) return 0;
    if (player == self->b0) return 0;
    if (func_ov002_021c1e10(self, player, idx) == 0) return 0;
    return func_ov002_021c1d64(self, player, idx) == 0;
}
