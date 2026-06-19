/* func_ov002_02209fcc: 021ff3bc-query forwarding predicate — require the self
 * query, then require 021ff320(self, arg1), then report 0220803c(self, arg1). */
#include "ov002_core.h"

extern int func_ov002_021ff230(struct Ov002Self *self, int arg1);
extern int func_ov002_02207f4c(struct Ov002Self *self, int arg1);

int func_ov002_02209fcc(struct Ov002Self *self, int arg1) {
    if (func_ov002_021ff2cc(self) == 0)
        return 0;
    if (func_ov002_021ff230(self, arg1) == 0)
        return 0;
    return func_ov002_02207f4c(self, arg1) != 0;
}
