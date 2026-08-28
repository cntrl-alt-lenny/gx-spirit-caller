#include "ov002_core.h"

struct SelfB4 {
    u16 f0;
    u16 b0 : 1;
    u16 pad0 : 11;
    u16 twobit : 2;
    u16 pad1 : 2;
    u16 pad2 : 6;
    u16 field9 : 9;
    u16 pad3 : 1;
};

extern int func_ov002_021ca4dc(int field9);
extern int func_0202e1e0(int f0);
extern int func_ov002_021b6338(struct SelfB4 *other);

int func_ov002_022082c4(struct SelfB4 *self, struct SelfB4 *other) {
    if (func_ov002_021ca4dc(self->field9) == 0) return 0;
    if (other == 0) return 0;
    if (other->b0 == self->b0) return 0;
    if (func_0202e1e0(other->f0) == 0) {
        if (other->twobit != 0) return 0;
    }
    return (func_ov002_021b6338(other) & 2) > 0;
}
