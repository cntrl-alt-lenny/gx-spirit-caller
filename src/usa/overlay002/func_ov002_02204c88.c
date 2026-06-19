/* func_ov002_02204c88: bail if 021bb068(0x135D) fires, else report
 * 021c9df0(bit0) nonzero. */
#include "ov002_core.h"

extern int func_ov002_021baf88(int code);
extern int func_ov002_021c9d10(unsigned int bit);

int func_ov002_02204c88(struct Ov002Self *self) {
    if (func_ov002_021baf88(0x135D) != 0)
        return 0;
    return func_ov002_021c9d10(self->b0) != 0;
}
