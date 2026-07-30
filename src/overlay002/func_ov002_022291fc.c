#include "ov002_core.h"

extern int func_ov002_0223df38(void *self, int a, int *out);
extern int func_ov002_0225764c(void *self, int a, int b);
extern void func_ov002_021e2b3c(void);
extern int func_ov002_021de4d8(void *self, int a, int b);
extern void func_ov002_021e05fc(int a, int b);
extern void func_ov002_021e2c5c(void);

int func_ov002_022291fc(struct Ov002Self *self) {
    int local;
    if (func_ov002_0223df38(self, 0, &local) == 0) goto done;
    {
        int lo = local & 0xff;
        int hi = ((unsigned short)local >> 8) & 0xff;
        if (func_ov002_0225764c(self, lo, hi) == 0) goto done;
        func_ov002_021e2b3c();
        if (func_ov002_021de4d8(self, lo, hi) != 0) {
            func_ov002_021e05fc(1 - self->b0, 1000);
        }
        func_ov002_021e2c5c();
    }
done:
    return 0;
}
