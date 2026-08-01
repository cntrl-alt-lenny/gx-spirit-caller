#include "ov002_core.h"

extern int func_ov002_021c2d54(int player, int arg1);
extern int func_ov002_021ca5b8(int a, int b);
extern int data_ov002_022cf09c[];

struct Ov002PackedSelf2 {
    unsigned short f0;
    unsigned short b0 : 1;
};

int func_ov002_0220e164(struct Ov002PackedSelf2 *self, int arg1) {
    int b0;
    if (func_ov002_021c2d54(self->b0, self->f0) < 0) {
        return 0;
    }
    b0 = self->b0;
    if (func_ov002_021ca5b8(b0, b0) == 0) {
        return 0;
    }
    if (*(int *)((char *)data_ov002_022cf09c + (self->b0 & 1) * 0x868) == 0) {
        return 0;
    }
    return ((int (*)(void *, int))func_ov002_021ff2cc)(self, arg1) != 0;
}
