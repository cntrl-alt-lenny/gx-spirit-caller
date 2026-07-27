#include "ov002_core.h"

struct Ov002Field4 {
    unsigned short _pad_lo : 6;
    unsigned short f6_9 : 9;
    unsigned short _pad_hi : 1;
};

extern int func_ov002_021b3fd8(int b0, int k, int konst, int field9);
extern int func_ov002_021ca698(int a, int b);
extern int func_ov002_022536e8(int b0, int f0, int zero);

int func_ov002_02207060(struct Ov002Self *self) {
    struct Ov002Field4 *f4 = (struct Ov002Field4 *)((char *)self + 4);

    if (func_ov002_021b3fd8(self->b0, 11, 0x16b8, f4->f6_9) != 0) {
        return 0;
    }
    if (func_ov002_021ca698(self->b0, self->b0) == 0) {
        return 0;
    }
    return func_ov002_022536e8(self->b0, self->f0, 0) >= 2;
}
