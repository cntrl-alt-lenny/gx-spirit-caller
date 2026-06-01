/* func_ov002_0220a0bc: 021ff3bc-query forwarding predicate — require the self
 * query, then require 021ff320(self, arg1), then report 0220803c(self, arg1). */
#include "ov002_core.h"

extern int func_ov002_021ff320(struct Ov002Self *self, int arg1);
extern int func_ov002_0220803c(struct Ov002Self *self, int arg1);

int func_ov002_0220a0bc(struct Ov002Self *self, int arg1) {
    if (func_ov002_021ff3bc(self) == 0)
        return 0;
    if (func_ov002_021ff320(self, arg1) == 0)
        return 0;
    return func_ov002_0220803c(self, arg1) != 0;
}
