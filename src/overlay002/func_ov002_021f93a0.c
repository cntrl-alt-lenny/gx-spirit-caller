/* func_ov002_021f93a0: guard func_ov002_0220898c(self,arg1)==0 -> -1; kind =
 * func_ov002_021f4a84(self,arg1); if kind==1, resolve an index via
 * func_ov002_021b99b4 and forward it to func_ov002_021d8128 (same template as
 * the already-shipped func_ov002_021fbec8). Return kind. */
#include "ov002_core.h"

struct Ov002F93a0Self {
    char _pad0[2];
    unsigned short f2_b0 : 1;
    unsigned short : 15;
    unsigned short f_4;
};

extern int func_ov002_0220898c(struct Ov002F93a0Self *self, int arg1);
extern int func_ov002_021f4a84(struct Ov002F93a0Self *self, int arg1);
extern int func_ov002_021b99b4(unsigned bit, unsigned field9);
extern int func_ov002_021d8128(int bit, void *ptr, int zero);

int func_ov002_021f93a0(struct Ov002F93a0Self *self, int arg1) {
    int kind;
    if (func_ov002_0220898c(self, arg1) == 0)
        return -1;
    kind = func_ov002_021f4a84(self, arg1);
    if (kind == 1) {
        int idx = func_ov002_021b99b4(self->f2_b0, ((unsigned)(self->f_4 << 17)) >> 23);
        char *ptr = data_ov002_022cf16c + (self->f2_b0 & 1) * 0x868 + 0x18 + 0x400 + idx * 4;
        func_ov002_021d8128(self->f2_b0, ptr, 0);
    }
    return kind;
}
