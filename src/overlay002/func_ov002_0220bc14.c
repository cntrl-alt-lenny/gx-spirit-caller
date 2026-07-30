#include "ov002_core.h"

extern int func_0202b878(int id);
extern int func_0202b8c0(int id);
extern int func_ov002_021ff2c8(void *self, int b0);

struct Ov002PackedSelf {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short fivebit : 5;
    unsigned short _pad : 6;
    unsigned short twobit : 2;
    unsigned short _pad2 : 2;
};

int func_ov002_0220bc14(struct Ov002PackedSelf *self, struct Ov002PackedSelf *other) {
    if (other == 0) {
        return 0;
    }
    if (other->fivebit > 10) {
        return 0;
    }
    if (other->twobit != 0) {
        return 0;
    }
    if (other->b0 == self->b0) {
        return 0;
    }
    if (func_0202b878(other->f0) != 0x16) {
        return 0;
    }
    if (func_0202b8c0(other->f0) != 0) {
        return 0;
    }
    return func_ov002_021ff2c8(self, self->b0) != 0;
}
