#include "ov002_core.h"
extern unsigned short data_ov002_022cf1a2[];

int func_ov002_021ebd5c(struct Ov002Self *self, int arg1, int idx) {
    int player;
    char *row2;
    struct Ov002Slot *slot;
    if (idx >= 5) return 0;
    player = arg1 & 1;
    row2 = data_ov002_022cf16c + player * 0x868;
    row2 = row2 + idx * 20;
    slot = (struct Ov002Slot *)(row2 + 0x30);
    if (slot->id == 0) return 0;
    if (arg1 == self->b0) return 0;
    return *(unsigned short *)((char *)data_ov002_022cf1a2 + player * 0x868 + idx * 20) == 0;
}
