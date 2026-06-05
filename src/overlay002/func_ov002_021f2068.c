/* func_ov002_021f2068: dispatch on whether arg1 matches the self.player flag
 * (arg1/arg2 passed through to both targets). */
#include "ov002_core.h"
extern int func_ov002_021f27b4(struct Ov002Self *self, int arg1, int arg2);
extern int func_ov002_021f208c(struct Ov002Self *self, int arg1, int arg2);
int func_ov002_021f2068(struct Ov002Self *self, int arg1, int arg2) {
    if (arg1 == self->b0) return func_ov002_021f27b4(self, arg1, arg2);
    return func_ov002_021f208c(self, arg1, arg2);
}
