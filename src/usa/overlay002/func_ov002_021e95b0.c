#include "ov002_core.h"

int func_ov002_021e95b0(struct Ov002Self *self, int player, int idx) {
    char *row;
    struct Ov002Slot *slot;
    if (player == self->b0) {
        return 0;
    }
    if (idx >= 5) {
        return 0;
    }
    row = data_ov002_022cf08c + (player & 1) * 0x868;
    slot = (struct Ov002Slot *)(row + idx * 20 + 0x30);
    if (slot->id == 0) {
        return 0;
    }
    if (func_ov002_021c1d64(self, player, idx) != 0) {
        return 0;
    }
    return func_ov002_021c1fa4(self, player, idx, 0) != 0;
}
