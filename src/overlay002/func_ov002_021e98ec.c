#include "ov002_core.h"

struct Row98ec { char _pad[0x30]; u32 id : 13; };

extern int func_ov002_021c1a2c(int player, int idx, int id);

int func_ov002_021e98ec(struct Ov002Self *self, int player, int idx) {
    struct Row98ec *row;
    if (idx >= 5) return 0;
    row = (struct Row98ec *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (row->id == 0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    if (player == self->b0) {
        if (func_ov002_021c1a2c(player, idx, self->f0) == 0) return 0;
    } else {
        if (func_ov002_021c2084(self, player, idx, 1) == 0) return 0;
    }
    return 1;
}
