#include "ov002_core.h"

extern int func_0202e2d4(int id);

int func_ov002_021ef574(struct Ov002Self *self, int player, int idx) {
    if (player == self->b0)
        return 0;
    if (idx > 4)
        return 0;
    int off = (player & 1) * 0x868;
    struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf08c + off + 0x30 + idx * 0x14);
    int id = slot->id;
    if (id == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf0c4 + off + idx * 0x14) == 0)
        return 0;
    return func_0202e2d4(id) != 0;
}
