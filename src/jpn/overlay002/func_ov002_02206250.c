/* func_ov002_02206250: 021ff3bc-query predicate — require the self query,
 * then report func_ov002_021ca310(self->b0, 0x1639) nonzero. */
#include "ov002_core.h"

extern int func_ov002_021ca310(int a, int b);

int func_ov002_02206250(struct Ov002Self *self) {
    if (func_ov002_021ff2cc(self) == 0)
        return 0;
    return func_ov002_021ca310(self->b0, 0x1639) != 0;
}
