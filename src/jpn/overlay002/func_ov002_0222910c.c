#include "ov002_core.h"

extern int func_ov002_0223de48(void *self, int a, int *out);
extern int func_ov002_02257564(void *self, int a, int b);
extern void func_ov002_021e2a4c(void);
extern int func_ov002_021de3e8(void *self, int a, int b);
extern void func_ov002_021e050c(int a, int b);
extern void func_ov002_021e2b6c(void);

int func_ov002_0222910c(struct Ov002Self *self) {
    int local;
    if (func_ov002_0223de48(self, 0, &local) == 0) goto done;
    {
        int lo = local & 0xff;
        int hi = ((unsigned short)local >> 8) & 0xff;
        if (func_ov002_02257564(self, lo, hi) == 0) goto done;
        func_ov002_021e2a4c();
        if (func_ov002_021de3e8(self, lo, hi) != 0) {
            func_ov002_021e050c(1 - self->b0, 1000);
        }
        func_ov002_021e2b6c();
    }
done:
    return 0;
}
