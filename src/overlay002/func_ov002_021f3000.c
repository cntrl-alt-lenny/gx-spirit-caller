/* func_ov002_021f3000: gate chain -- self->b0 must equal player, idx must
 * be <5, func_ov002_021c1ef0(self,player,idx) must be nonzero, and
 * func_ov002_021c1e44(self,player,idx) must be ZERO. Then, if idx<4 and
 * func_ov002_021bc55c(player,idx+1) is nonzero, return 1; else if idx>0
 * and func_ov002_021bc55c(player,idx-1) is nonzero, return 1; else 0. */
#include "ov002_core.h"

extern int func_ov002_021bc55c(int player, int idx);

int func_ov002_021f3000(struct Ov002Self *self, int player, int idx) {
    if (self->b0 != player) {
        return 0;
    }
    if (idx >= 5) {
        return 0;
    }
    if (func_ov002_021c1ef0(self, player, idx) == 0) {
        return 0;
    }
    if (func_ov002_021c1e44(self, player, idx) != 0) {
        return 0;
    }
    if (idx < 4) {
        if (func_ov002_021bc55c(player, idx + 1) != 0) {
            return 1;
        }
    }
    if (idx > 0) {
        if (func_ov002_021bc55c(player, idx - 1) != 0) {
            return 1;
        }
    }
    return 0;
}
