#include "ov002_core.h"

extern unsigned char data_ov002_022cf1a2[];

int func_ov002_021ef5a0(struct Ov002Self *self, int player, int idx) {
    if (idx > 4)
        return 0;
    int off = (player & 1) * 0x868;
    struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf16c + off + 0x30 + idx * 0x14);
    if (slot->id == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a2 + off + idx * 0x14) == 0)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c2084(self, player, idx, 1) == 0)
        return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
