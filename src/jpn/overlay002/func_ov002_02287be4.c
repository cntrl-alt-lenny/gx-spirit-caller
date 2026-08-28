/* func_ov002_02287be4: if D016C->f_cec == self->b0 return 0. Else scan 11
 * sub-rows (i=0..10) of the self->b0 player's cf16c row: for a nonzero
 * Ov002Slot.id at row+i*0x14+0x30 whose row+i*0x14+0x40 bit 6 is clear, call
 * func_ov002_02267d0c(id) and return 1 if its result is >0. Returns 0 if no
 * sub-row qualifies. */
#include "ov002_core.h"

extern int func_ov002_02267d0c(int id);

int func_ov002_02287be4(struct Ov002Self *self) {
    if (D016C->f_cec == self->b0) return 0;
    {
        int i = 0;
        int off = 0;
        do {
            char *base = data_ov002_022cf08c + (self->b0 & 1) * 0x868 + off;
            struct Ov002Slot *s = (struct Ov002Slot *)(base + 0x30);
            int id = s->id;
            if (id != 0) {
                unsigned int flag = *(unsigned int *)(base + 0x40);
                if (((flag >> 6) & 1) == 0) {
                    if (func_ov002_02267d0c(id) > 0) return 1;
                }
            }
            i++;
            off += 0x14;
        } while (i <= 10);
    }
    return 0;
}
