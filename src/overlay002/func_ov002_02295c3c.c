/* func_ov002_02295c3c: guard func_ov002_02291248(self) and
 * func_ov002_02259f74(self->b0); double loop outer=0..1, inner=0..4 —
 * if func_ov002_022575c8(self,outer,inner) and
 * func_ov002_0228de04(outer,inner)>=0x1f4, return 1. */
#include "ov002_core.h"

extern int func_ov002_02291248(void *self);
extern int func_ov002_02259f74(int bit0);
extern int func_ov002_022575c8(void *self, int outer, int inner);
extern int func_ov002_0228de04(int outer, int inner);

int func_ov002_02295c3c(struct Ov002Self *self) {
    int outer, inner;

    if (func_ov002_02291248(self) == 0)
        return 0;
    if (func_ov002_02259f74(self->b0) == 0)
        return 0;

    for (outer = 0; outer < 2; outer++) {
        for (inner = 0; inner < 5; inner++) {
            if (func_ov002_022575c8(self, outer, inner) != 0) {
                if (func_ov002_0228de04(outer, inner) >= 0x1f4)
                    return 1;
            }
        }
    }
    return 0;
}
