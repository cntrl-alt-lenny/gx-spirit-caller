#include "ov002_core.h"

extern int func_ov002_021c1e10(struct Ov002Self *self, int player, int idx);

int func_ov002_021f0f4c(struct Ov002Self *self, int who, int idx) {
    if (idx >= 5) return 0;
    if (self->b0 != who) return 0;
    if (*(unsigned short *)(data_ov002_022cf0c4 + (who & 1) * 0x868 + idx * 0x14) == 0) return 0;
    if (func_ov002_021c1e10(self, who, idx) == 0) return 0;
    if (*(int *)(data_ov002_022cd314 + 4) == who && *(int *)(data_ov002_022cd314 + 0x20) == idx) return 0;
    return 1;
}
