#include "ov002_core.h"

extern int func_0202e2a4(int id);

int func_ov002_021efe0c(struct Ov002Self *self, int player, int idx) {
    struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf08c
        + (player & 1) * 0x868 + idx * 0x14 + 0x30);
    int id = slot->id;
    if (id == 0) {
        return 0;
    }
    if (func_0202e2a4(id) == 0) {
        return 0;
    }
    return func_ov002_021c1d64(self, player, idx) == 0;
}
