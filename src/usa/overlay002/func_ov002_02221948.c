/* func_ov002_02221948: for each (player<2, slot<=4), if
 * func_ov002_02257564 gates open, dispatch func_ov002_021d5918 with
 * (self->f0, 5, self->b0) as the extra payload. */
#include "ov002_core.h"

extern int func_ov002_02257564(int self, int player, int slot);
extern int func_ov002_021d5918(struct Ov002Self *arg0, int arg1, int arg2, int arg3, unsigned short arg4, unsigned short arg5);

int func_ov002_02221948(struct Ov002Self *self) {
    int player;
    int slot;
    for (player = 0; player < 2; player++) {
        for (slot = 0; slot <= 4; slot++) {
            if (func_ov002_02257564((int)self, player, slot) != 0) {
                func_ov002_021d5918(self, player, slot, self->f0, 5, self->b0);
            }
        }
    }
    return 0;
}
