/* func_ov002_0220c384: if self->kind==5, gate on
 * func_ov002_021ca5b8(self->b0, self->b0)!=0 and on the player-cf180
 * count (indexed by self->b0) being nonzero; returns 1 whenever kind!=5
 * or both gates pass, 0 if either gate fails. */
#include "ov002_core.h"
extern int func_ov002_021ca5b8(int a, int b);
extern char data_ov002_022cf0a0[];

struct Ov002SelfBitKind {
    unsigned short f_0;
    unsigned short b0 : 1;
    unsigned short _pad1 : 5;
    unsigned short kind : 6;
    unsigned short _pad2 : 4;
};

int func_ov002_0220c384(struct Ov002SelfBitKind *self) {
    if (self->kind == 5) {
        if (func_ov002_021ca5b8(self->b0, self->b0) == 0) {
            return 0;
        }
        if (*(int *)(data_ov002_022cf0a0 + (self->b0 & 1) * 0x868) == 0) {
            return 0;
        }
    }
    return 1;
}
