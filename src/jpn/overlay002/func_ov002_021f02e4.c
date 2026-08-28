#include "ov002_core.h"

extern int func_ov002_021b8fc8(int player, int idx);
extern int func_ov002_021c8400(int player, int idx);

int func_ov002_021f02e4(int unused0, int player, int idx) {
    struct Ov002Slot *slot;
    int row;

    if (idx >= 5) {
        return 0;
    }

    row = (player & 1) * 0x868;
    slot = (struct Ov002Slot *)(data_ov002_022cf08c + row + 0x30 + idx * 20);
    if (slot->id == 0) {
        return 0;
    }
    if (*(u16 *)(data_ov002_022cf0c4 + row + idx * 20) == 0) {
        return 0;
    }
    if (func_ov002_021b8fc8(player, idx) == 0) {
        return 0;
    }
    if (func_ov002_021c8400(player, idx) <= 2) {
        return 1;
    }
    return 0;
}
