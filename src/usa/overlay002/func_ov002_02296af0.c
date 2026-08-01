/* func_ov002_02296af0: two independent 2-call guard blocks, self->b0
 * re-read fresh at each call site. */
#include "ov002_core.h"

extern int func_ov002_021bb82c(int bit0, int a);
extern int func_ov002_021c3a04(int bit0, int a);

int func_ov002_02296af0(struct Ov002Self *self) {
    if (func_ov002_021bb82c(self->b0, 0x160a) != 0) {
        if (func_ov002_021c3a04(self->b0, 0x1620) != 0)
            return 1;
    }
    if (func_ov002_021bb82c(self->b0, 0x190b) != 0) {
        if (func_ov002_021c3a04(self->b0, 0x1917) != 0)
            return 1;
    }
    return 0;
}
