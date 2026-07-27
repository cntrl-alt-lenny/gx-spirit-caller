/* func_ov002_02292d20: for i in [0,5), check the OTHER player's
 * (1-self->b0) Slot at row+i*0x14+0x30; if id!=0 and
 * func_ov002_021bc72c(self->b0, other, i) is nonzero, return 0 early.
 * Otherwise tail-call func_ov002_02292bac(self, arg1). */
#include "ov002_core.h"

extern int func_ov002_021bc72c(int a, int player, int idx);
extern int func_ov002_02292bac(struct Ov002Self *self, int arg1);

int func_ov002_02292d20(struct Ov002Self *self, int arg1) {
    int i;
    for (i = 0; i < 5; i++) {
        int other = 1 - self->b0;
        char *row = data_ov002_022cf16c + (other & 1) * 0x868 + 0x30;
        struct Ov002Slot *slot = (struct Ov002Slot *)(row + i * 0x14);
        if (slot->id != 0) {
            if (func_ov002_021bc72c(self->b0, other, i) != 0) {
                return 0;
            }
        }
    }
    return func_ov002_02292bac(self, arg1);
}
