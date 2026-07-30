#include "ov002_core.h"

extern int func_ov002_021bbc34(int player, int code);
extern int func_ov002_021bbe70(int player);
extern int func_ov002_021c3a04(int player, int code);
extern int func_ov002_02280870(int player);

int func_ov002_02293124(struct Ov002Self *self) {
    if (func_ov002_021bbc34(self->b0, 0x16a0) != 0) return 1;
    if (func_ov002_021bbe70(self->b0) != 0) {
        if (func_ov002_021c3a04(self->b0, 0x18ca) != 0) return 1;
        if (func_ov002_02280870(self->b0) > 0) return 1;
    }
    return 0;
}
