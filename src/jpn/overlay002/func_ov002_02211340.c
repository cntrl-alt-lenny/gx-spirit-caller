/* func_ov002_02211340: post a 0x27 event (high bit = self bit0). */
#include "ov002_core.h"
int func_ov002_02211340(struct Ov002Self *self) {
    func_ov002_021d46ac((u16)((self->b0 ? 0x8000 : 0) | 0x27), 0, 0, 0);
    return 0;
}
