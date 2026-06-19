/* func_ov002_0220af14: bail if 021c2e34(bit0, 0x12E5) is negative, else
 * forward to 021ff500(self, arg1). */
#include "ov002_core.h"

extern int func_ov002_021c2d54(unsigned int bit, int code);
extern int func_ov002_021ff410(struct Ov002Self *self, int arg1);

int func_ov002_0220af14(struct Ov002Self *self, int arg1) {
    if (func_ov002_021c2d54(self->b0, 0x12E5) < 0)
        return 0;
    return func_ov002_021ff410(self, arg1);
}
