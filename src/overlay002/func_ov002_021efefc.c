#include "ov002_core.h"

extern int func_0202e2f8(int id);

int func_ov002_021efefc(struct Ov002Self *self, int player, int idx) {
    struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf16c
        + (player & 1) * 0x868 + idx * 0x14 + 0x30);
    int id = slot->id;
    if (id == 0) {
        return 0;
    }
    if (func_0202e2f8(id) == 0) {
        return 0;
    }
    return func_ov002_021c1e44(self, player, idx) == 0;
}
