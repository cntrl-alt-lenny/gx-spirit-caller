#include "ov002_core.h"

extern int func_0202e328(int id);

int func_ov002_021ef664(struct Ov002Self *self, int player, int idx) {
    if (player == self->b0)
        return 0;
    if (idx > 4)
        return 0;
    int off = (player & 1) * 0x868;
    struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf16c + off + 0x30 + idx * 0x14);
    int id = slot->id;
    if (id == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + off + idx * 0x14) == 0)
        return 0;
    return func_0202e328(id) != 0;
}
