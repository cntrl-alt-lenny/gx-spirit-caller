#include "ov002_core.h"

struct Row7868 { char _pad[0x30]; u32 id : 13; };

extern int func_ov002_021c1a2c(int player, int idx, int id);

int func_ov002_021e7868(struct Ov002Self *self, int player, int idx) {
    struct Row7868 *row;
    if (player == self->b0) return 0;
    if (idx >= 5) return 0;
    row = (struct Row7868 *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (row->id == 0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    if (func_ov002_021c1a2c(player, idx, self->f0) == 0) return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
