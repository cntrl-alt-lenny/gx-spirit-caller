#include "ov002_core.h"

extern int func_ov002_02259e8c(int b0);
extern int func_ov002_022575f0(void *self);
extern int func_ov002_0228cf9c(int b0, int val, int c);
extern unsigned short data_ov002_022cf0c2[];

struct Ov002PackedSelf3 {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short fivebit : 5;
};

int func_ov002_02296580(struct Ov002PackedSelf3 *self) {
    int result;
    if (func_ov002_02259e8c(self->b0) == 0) {
        return 0;
    }
    if (*(unsigned short *)((char *)data_ov002_022cf0c2 + (self->b0 & 1) * 0x868 + self->fivebit * 20) != 0) {
        return 0;
    }
    result = func_ov002_022575f0(self);
    return func_ov002_0228cf9c(self->b0, result, 1) >= 0;
}
