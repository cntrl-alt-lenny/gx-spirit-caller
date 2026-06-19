/* func_ov002_02217040: post a 0x1C event (high bit = self bit0), payload 1. */
#include "ov002_core.h"
int func_ov002_02217040(struct Ov002Self *self) {
    func_ov002_021d46ac((u16)((self->b0 ? 0x8000 : 0) | 0x1C), 1, 0, 0);
    return 0;
}
