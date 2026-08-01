/* func_ov002_0220ae10: guard on func_ov002_021ff2cc(self); if
 * cf17c[player]==0, run func_ov002_0223f5dc/022536e8 and bail if that
 * fails; finally return func_ov002_021c2e44(player, 0x1919) != 0. */
#include "ov002_core.h"

extern int func_ov002_0223f5dc(struct Ov002Self *self);
extern int func_ov002_02253600(int player, int f0, int result);
extern int func_ov002_021c2e44(int player, int k);

int func_ov002_0220ae10(struct Ov002Self *self) {
    if (func_ov002_021ff2cc(self) == 0)
        return 0;
    if (*(int *)((char *)data_ov002_022cf09c + (self->b0 & 1) * 0x868) == 0) {
        int result = func_ov002_0223f5dc(self);
        if (func_ov002_02253600(self->b0, self->f0, result) == 0)
            return 0;
    }
    if (func_ov002_021c2e44(self->b0, 0x1919) == 0)
        return 0;
    return 1;
}
