/* func_ov002_02206340: 021ff3bc-query predicate — require the self query,
 * then report func_ov002_021ca3f0(self->b0, 0x1639) nonzero. */
#include "ov002_core.h"

extern int func_ov002_021ca3f0(int a, int b);

int func_ov002_02206340(struct Ov002Self *self) {
    if (func_ov002_021ff3bc(self) == 0)
        return 0;
    return func_ov002_021ca3f0(self->b0, 0x1639) != 0;
}
