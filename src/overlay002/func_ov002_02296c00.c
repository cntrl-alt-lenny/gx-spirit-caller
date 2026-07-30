/* func_ov002_02296c00: two independent 2-call guard blocks, self->b0
 * re-read fresh at each call site. */
#include "ov002_core.h"

extern int func_ov002_021bb90c(int bit0, int a);
extern int func_ov002_021c3ae4(int bit0, int a);

int func_ov002_02296c00(struct Ov002Self *self) {
    if (func_ov002_021bb90c(self->b0, 0x160a) != 0) {
        if (func_ov002_021c3ae4(self->b0, 0x1620) != 0)
            return 1;
    }
    if (func_ov002_021bb90c(self->b0, 0x190b) != 0) {
        if (func_ov002_021c3ae4(self->b0, 0x1917) != 0)
            return 1;
    }
    return 0;
}
