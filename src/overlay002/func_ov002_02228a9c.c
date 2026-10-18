#include "ov002_core.h"

struct Ov002A9cSelf {
    char _pad0[2];
    unsigned short f2_b0 : 1;
    unsigned short : 15;
    unsigned short f_4;
};

extern int func_ov002_021b99b4(unsigned bit, unsigned field9);
extern int func_ov002_021d7d0c(void *self, int bit, void *ptr);

int func_ov002_02228a9c(struct Ov002A9cSelf *self) {
    int idx;
    char *ptr;

    idx = func_ov002_021b99b4(self->f2_b0, ((unsigned)(self->f_4 << 17)) >> 23);
    if (idx >= 0) {
        ptr = data_ov002_022cf16c + (self->f2_b0 & 1) * 0x868 + 0x418 + idx * 4;
        func_ov002_021d7d0c(self, self->f2_b0, ptr);
    }
    return 0;
}
