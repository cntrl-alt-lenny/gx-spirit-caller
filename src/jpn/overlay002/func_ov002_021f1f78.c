/* func_ov002_021f1f78: dispatch on whether arg1 matches the self.player flag
 * (arg1/arg2 passed through to both targets). */
#include "ov002_core.h"
extern int func_ov002_021f26c4(struct Ov002Self *self, int arg1, int arg2);
extern int func_ov002_021f1f9c(struct Ov002Self *self, int arg1, int arg2);
int func_ov002_021f1f78(struct Ov002Self *self, int arg1, int arg2) {
    if (arg1 == self->b0) return func_ov002_021f26c4(self, arg1, arg2);
    return func_ov002_021f1f9c(self, arg1, arg2);
}
