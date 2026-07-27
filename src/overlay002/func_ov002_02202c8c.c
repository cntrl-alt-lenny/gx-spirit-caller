#include "ov002_core.h"

struct SelfDual {
    u16 f0;
    u16 b0 : 1;
    u16 _pad1 : 13;
    u16 b14 : 1;
    u16 _pad2 : 1;
};

extern int func_ov002_021bae7c(int player, int code, int arg);

int func_ov002_02202c8c(struct SelfDual *self) {
    int b0 = self->b0;
    int sel = (b0 ^ self->b14) & 1;
    int count = *(int *)((char *)data_ov002_022cf17c + sel * 0x868);
    if (count == 0) return 0;
    if (D016C->f_cf8 != 0) {
        if (func_ov002_021bae7c(1 - b0, 0x178b, -1) != 0)
            return 0;
    }
    return 1;
}
