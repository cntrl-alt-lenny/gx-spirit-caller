#include "ov002_core.h"

struct Ov002Fbec8Self {
    char _pad0[2];
    unsigned short f2_b0 : 1;
    unsigned short : 15;
    unsigned short f_4;
};

extern int func_ov002_021b99b4(unsigned bit, unsigned field9);
extern int func_ov002_021d8128(int bit, void *ptr, int zero);

int func_ov002_021fbec8(struct Ov002Fbec8Self *self) {
    int idx;
    char *ptr;

    idx = func_ov002_021b99b4(self->f2_b0, ((unsigned)(self->f_4 << 17)) >> 23);
    ptr = data_ov002_022cf16c + (self->f2_b0 & 1) * 0x868 + 0x18 + 0x400 + idx * 4;
    func_ov002_021d8128(self->f2_b0, ptr, 0);
    return 1;
}
