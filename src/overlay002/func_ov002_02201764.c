/* func_ov002_02201764: gate a player-command against several D016C state
 * checks, then dispatch to func_ov002_021b9aa8 / func_ov002_021bbf50. */
#include "ov002_core.h"

struct Self1764 {
    u16 f0;
    u16 b0 : 1;
    u16 _unused1 : 5;
    u16 field6 : 6;
};

extern int func_ov002_021b9aa8(int self_bit0, int field9);
extern int func_ov002_021bbf50(int player);

int func_ov002_02201764(struct Self1764 *self) {
    unsigned int field9;

    if (D016C->f_cf8 != 1)
        return 0;
    if (D016C->f_cec != self->b0)
        return 0;

    if ((unsigned int)self->field6 > 5)
        return 0;

    field9 = (unsigned int)(*(unsigned short *)((char *)self + 4) << 17) >> 23;
    if (func_ov002_021b9aa8(self->b0, field9) >= 0)
        return 0;

    if (func_ov002_021bbf50(self->b0) > 0)
        return 1;

    return func_ov002_021bbf50(1 - self->b0) > 0 ? 1 : 0;
}
