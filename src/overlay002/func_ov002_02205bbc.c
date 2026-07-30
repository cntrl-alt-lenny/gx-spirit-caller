#include "ov002_core.h"

typedef int (*Fn2)(struct Ov002Self *, int);

extern int func_ov002_021ca698(int a, int b);
extern int func_ov002_022536e8(int a, int b, int c);
extern int func_ov002_021ca3f0(int a, int b);

int func_ov002_02205bbc(struct Ov002Self *self, int arg1) {
    if (func_ov002_021ca698(self->b0, self->b0) == 0) return 0;
    if (func_ov002_022536e8(self->b0, self->f0, 0) < 2) return 0;
    if (((Fn2)func_ov002_021ff3bc)(self, arg1) == 0) return 0;
    return func_ov002_021ca3f0(self->b0, 0x15be) != 0;
}
