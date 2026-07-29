/* func_ov002_02292c10: for i in [0,5), check the OTHER player's
 * (1-self->b0) Slot at row+i*0x14+0x30; if id!=0 and
 * func_ov002_021bc64c(self->b0, other, i) is nonzero, return 0 early.
 * Otherwise tail-call func_ov002_02292a9c(self, arg1). */
#include "ov002_core.h"

extern int func_ov002_021bc64c(int a, int player, int idx);
extern int func_ov002_02292a9c(struct Ov002Self *self, int arg1);

int func_ov002_02292c10(struct Ov002Self *self, int arg1) {
    int i;
    for (i = 0; i < 5; i++) {
        int other = 1 - self->b0;
        char *row = data_ov002_022cf08c + (other & 1) * 0x868 + 0x30;
        struct Ov002Slot *slot = (struct Ov002Slot *)(row + i * 0x14);
        if (slot->id != 0) {
            if (func_ov002_021bc64c(self->b0, other, i) != 0) {
                return 0;
            }
        }
    }
    return func_ov002_02292a9c(self, arg1);
}
