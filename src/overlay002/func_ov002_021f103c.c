#include "ov002_core.h"

extern int func_ov002_021c1ef0(struct Ov002Self *self, int player, int idx);

int func_ov002_021f103c(struct Ov002Self *self, int who, int idx) {
    if (idx >= 5) return 0;
    if (self->b0 != who) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + (who & 1) * 0x868 + idx * 0x14) == 0) return 0;
    if (func_ov002_021c1ef0(self, who, idx) == 0) return 0;
    if (*(int *)(data_ov002_022cd3f4 + 4) == who && *(int *)(data_ov002_022cd3f4 + 0x20) == idx) return 0;
    return 1;
}
