#include "ov002_core.h"

typedef int (*Fn1)(int);

extern int func_ov002_021ff2b8(struct Ov002Self *self, int b0);
extern int func_ov002_022536e8(int a, int b, int c);

int func_ov002_0220b7ac(struct Ov002Self *self) {
    if (func_ov002_021ff2b8(self, self->b0) < 3) return 0;
    if (((Fn1)func_ov002_021ca2b8)(self->b0) == 0) return 0;
    if (func_ov002_022536e8(self->b0, self->f0, 0x194f) < 2) return 0;
    return func_ov002_022536e8(self->b0, self->f0, 0x1950) >= 1;
}
