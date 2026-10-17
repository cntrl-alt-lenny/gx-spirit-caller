#include "ov002_core.h"

struct Ent {
    u32 a : 13;
    u32 b : 1;
    u32 c : 8;
    u32 f : 8;
    u32 d : 2;
};

struct Slot {
    char pad[0x260];
    struct Ent ent[1];
};

extern int func_ov002_021ba294(int player);
extern int func_ov002_0226f4dc(int player, int val);

int func_ov002_02259990(int player) {
    int idx;
    struct Ent *e;

    idx = func_ov002_021ba294(player);
    if (idx < 0) {
        return 0;
    }
    e = &((struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868))->ent[idx];
    return func_ov002_0226f4dc(player, e->f * 2 + e->b);
}
