#include "ov002_core.h"

struct Ov002LevelWord {
    unsigned int id : 13;
    unsigned int half : 1;
    unsigned int : 8;
    unsigned int level : 8;
    unsigned int : 2;
};

extern int func_ov002_021c194c(int player, int idx, u16 f0);
extern int func_ov002_021c1d64(struct Ov002Self *self, int player, int idx);

int func_ov002_021f0fe0(struct Ov002Self *self, int player, int idx) {
    if (idx >= 5) {
        return 0;
    }
    char *rowptr = data_ov002_022cf08c + (player & 1) * 0x868;
    struct Ov002LevelWord *w = (struct Ov002LevelWord *)((rowptr + 0x30) + idx * 0x14);
    if (w->id == 0) {
        return 0;
    }
    if (player == w->half) {
        return 0;
    }
    if (func_ov002_021c194c(player, idx, self->f0) == 0) {
        return 0;
    }
    return func_ov002_021c1d64(self, player, idx) == 0;
}
