#include "ov002_core.h"

struct Self021f2710 {
    char _pad[6];
    u16 f6;
    u16 f8;
};

extern int func_ov002_021c8390(int player, int idx);

int func_ov002_021f2620(struct Self021f2710 *self, int player, int idx) {
    struct Ov002Slot *slot;
    int row, off;

    if (idx >= 5) {
        return 0;
    }

    row = (player & 1) * 0x868;
    off = idx * 20;
    slot = (struct Ov002Slot *)(data_ov002_022cf08c + row + 0x30 + off);
    if (slot->id == 0) {
        return 0;
    }
    if (*(u16 *)(data_ov002_022cf0c4 + row + off) == 0) {
        return 0;
    }
    if ((((unsigned int)self->f6 << 16) >> 24) != 0) {
        return self->f8 == func_ov002_021c8390(player, idx);
    }
    return 1;
}
