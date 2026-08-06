#include "ov002_core.h"

extern int func_ov002_021b90a8(int player, int idx);
extern int func_ov002_021c84e0(int player, int idx);

int func_ov002_021f03d4(int unused0, int player, int idx) {
    struct Ov002Slot *slot;
    int row;

    if (idx >= 5) {
        return 0;
    }

    row = (player & 1) * 0x868;
    slot = (struct Ov002Slot *)(data_ov002_022cf16c + row + 0x30 + idx * 20);
    if (slot->id == 0) {
        return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + row + idx * 20) == 0) {
        return 0;
    }
    if (func_ov002_021b90a8(player, idx) == 0) {
        return 0;
    }
    if (func_ov002_021c84e0(player, idx) <= 2) {
        return 1;
    }
    return 0;
}
