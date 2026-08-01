#include "ov002_core.h"

extern int func_0202b824(int id);
extern int func_0202b86c(int id);
extern int func_ov002_021ff1d8(void *self, int b0);

struct Ov002PackedSelf {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short fivebit : 5;
    unsigned short _pad : 6;
    unsigned short twobit : 2;
    unsigned short _pad2 : 2;
};

int func_ov002_0220bb24(struct Ov002PackedSelf *self, struct Ov002PackedSelf *other) {
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
    if (func_0202b824(other->f0) != 0x16) {
        return 0;
    }
    if (func_0202b86c(other->f0) != 0) {
        return 0;
    }
    return func_ov002_021ff1d8(self, self->b0) != 0;
}
