/* func_ov002_022951c4: two direct sink checks, then scan 10 per-player
 * slots (row+i*20+0x30); if a slot is occupied (id!=0) and its +0x38
 * halfword flag is set, forward slot.id to func_02031208. */
#include "ov002_core.h"

extern int func_ov002_02281920(int bit, int val);
extern int func_02031208(int id);

int func_ov002_022951c4(struct Ov002Self *self) {
    int i;

    if (func_ov002_02281920(self->b0, 0x12be) != 0)
        return 1;
    if (func_ov002_02281920(self->b0, 0xfbb) != 0)
        return 1;

    for (i = 0; i <= 10; i++) {
        char *slot_row = data_ov002_022cf16c + (self->b0 & 1) * 0x868 + i * 20;
        unsigned int id = ((struct Ov002Slot *)(slot_row + 0x30))->id;
        if (id != 0 && *(unsigned short *)(slot_row + 0x38) != 0) {
            if (func_02031208(id) != 0)
                return 1;
        }
    }
    return 0;
}
