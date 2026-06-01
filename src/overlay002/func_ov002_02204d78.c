/* func_ov002_02204d78: bail if 021bb068(0x135D) fires, else report
 * 021c9df0(bit0) nonzero. */
#include "ov002_core.h"

extern int func_ov002_021bb068(int code);
extern int func_ov002_021c9df0(unsigned int bit);

int func_ov002_02204d78(struct Ov002Self *self) {
    if (func_ov002_021bb068(0x135D) != 0)
        return 0;
    return func_ov002_021c9df0(self->b0) != 0;
}
