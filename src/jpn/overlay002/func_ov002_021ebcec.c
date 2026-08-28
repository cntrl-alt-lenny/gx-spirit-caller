/* func_ov002_021ebcec: gate chain on self/player/idx: verify via
 * func_ov002_021c1e10(self,player,idx), player must equal self's bit0
 * flag, idx must be < 5, the Ov002Slot id at row(player)+idx*20+0x30
 * must be nonzero, and func_0202e2a4(id) must return 0. If all pass,
 * return 1 iff func_ov002_021b3dec(player, idx, self->f0) returns 0.
 */
#include "ov002_core.h"

extern char data_ov002_022cf08c[];
extern int func_ov002_021c1e10(struct Ov002Self *self, int player, int idx);
extern int func_0202e2a4(int id);
extern int func_ov002_021b3dec(int player, int idx, u16 f0);

int func_ov002_021ebcec(struct Ov002Self *self, int player, int idx) {
    char *row;
    struct Ov002Slot *s;
    int id;

    row = (char *)data_ov002_022cf08c + (player & 1) * 0x868;
    s = (struct Ov002Slot *)(row + idx * 20 + 0x30);
    id = s->id;

    if (func_ov002_021c1e10(self, player, idx) == 0) {
        return 0;
    }
    if (player != self->b0) {
        return 0;
    }
    if (idx >= 5) {
        return 0;
    }
    if (id == 0) {
        return 0;
    }
    if (func_0202e2a4(id) != 0) {
        return 0;
    }
    return func_ov002_021b3dec(player, idx, self->f0) == 0 ? 1 : 0;
}
