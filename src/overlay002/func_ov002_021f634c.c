/* func_ov002_021f634c: 021ff3bc-query forwarding wrapper — return -1 if the
 * self query fails, else forward (self, arg1) to 021f4a84. */
#include "ov002_core.h"

extern int func_ov002_021f4a84(struct Ov002Self *self, int arg1);

int func_ov002_021f634c(struct Ov002Self *self, int arg1) {
    if (func_ov002_021ff3bc(self) == 0)
        return -1;
    return func_ov002_021f4a84(self, arg1);
}
