/* func_ov002_02288048: gate on func_ov002_02281964(self->b0); if
 * func_ov002_02281650(self, 1-self->b0, 0) is nonzero return 1; else
 * return whether func_ov002_02280870(self->b0) is negative. */
#include "ov002_core.h"
extern int func_ov002_02281964(int bit0);
extern int func_ov002_02281650(void *self, int a, int b);
extern int func_ov002_02280870(int bit0);

int func_ov002_02288048(struct Ov002Self *self) {
    if (func_ov002_02281964(self->b0) == 0) {
        return 0;
    }
    if (func_ov002_02281650(self, 1 - self->b0, 0) != 0) {
        return 1;
    }
    return func_ov002_02280870(self->b0) < 0 ? 1 : 0;
}
