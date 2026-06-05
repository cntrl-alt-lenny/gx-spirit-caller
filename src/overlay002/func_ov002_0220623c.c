/* func_ov002_0220623c: 0 when the active player (d016c+3308) already owns this
 * self's flag; else query func_ov002_021ff3bc (arg1 passed through). */
#include "ov002_core.h"
int func_ov002_0220623c(struct Ov002Self *self, int arg1) {
    if (*(int *)(data_ov002_022d016c + 3308) == self->b0) return 0;
    return ((int (*)(struct Ov002Self *, int))func_ov002_021ff3bc)(self, arg1);
}
