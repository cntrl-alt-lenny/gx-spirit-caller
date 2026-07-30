#include "ov002_core.h"

extern int func_ov002_021c2084(struct Ov002Self *self, int player, int idx, int d);

int func_ov002_021eb8c8(struct Ov002Self *self, int player, int idx) {
    if (player == self->b0) {
        return 0;
    }
    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0) {
            return 0;
        }
    }
    char *rowptr = data_ov002_022cf16c + (player & 1) * 0x868;
    struct Ov002Slot *slot = (struct Ov002Slot *)(rowptr + idx * 0x14 + 0x30);
    if (slot->id == 0) {
        return 0;
    }
    return func_ov002_021c2084(self, player, idx, 0) != 0;
}
