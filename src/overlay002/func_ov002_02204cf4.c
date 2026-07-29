#include "ov002_core.h"
extern int func_ov002_021ca698(int a, int b);
extern int func_ov002_022536e8(int a, int b, int c);

int func_ov002_02204cf4(struct Ov002Self *self, int arg1) {
    int b0 = self->b0;
    if (func_ov002_021ca698(b0, 1 - b0) == 0) return 0;
    b0 = self->b0;
    if (func_ov002_022536e8(b0, self->f0, 0) == 0) return 0;
    b0 = self->b0;
    if (func_ov002_022536e8(b0, self->f0, 1) == 0) return 0;
    return ((int (*)(struct Ov002Self *, int))func_ov002_021ff3bc)(self, arg1);
}
