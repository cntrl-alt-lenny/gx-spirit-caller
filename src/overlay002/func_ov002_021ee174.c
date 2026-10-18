#include "ov002_core.h"

extern int func_ov002_021b9ecc(int a, int b);
extern int func_0202e79c(int a);

int func_ov002_021ee174(struct Ov002Self *self, int player, int idx) {
    if (idx >= 5)
        return 0;
    int off = (player & 1) * 0x868;
    struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf16c + off + 0x30 + idx * 0x14);
    if (slot->id == 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + idx * 0x14) == 0)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    if (player != self->b0)
        return 1;
    return func_0202e79c(func_ov002_021b9ecc(player, idx));
}
