#include "ov002_core.h"

struct Wd {
    u32 cnt : 13;
    u32 : 19;
    char _p[0x10];
};

extern int func_0202e2f8(u32 id);

int func_ov002_021ead68(struct Ov002Self *self, unsigned player, int idx) {
    int off = (player & 1) * 0x868;
    int o = idx * 0x14;
    struct Wd *w = (struct Wd *)(data_ov002_022cf16c + off + 0x30 + o);
    u32 n = w->cnt;

    if (idx >= 5) {
        return 0;
    }
    if (n == 0) {
        return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + off + o) == 0) {
        return 0;
    }
    if (func_0202e2f8(n) != 0) {
        return 0;
    }
    if (func_ov002_021c1ef0(self, player, idx) == 0) {
        return 0;
    }
    return func_ov002_021c1e44(self, player, idx) == 0;
}
