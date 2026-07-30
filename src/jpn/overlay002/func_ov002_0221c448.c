#include "ov002_core.h"

extern int func_ov002_0223de48(void *self, int a, int b);
extern void func_ov002_021d5918(struct Ov002Self *arg0, int arg1, int arg2, int arg3, unsigned short arg4, unsigned short arg5);

int func_ov002_0221c448(struct Ov002Self *self) {
    if (func_ov002_0223de48(self, 0, 0) == 0) goto done;
    {
        unsigned int packed = func_ov002_0223dda4(self, 0);
        int lo = packed & 0xff;
        int hi = ((unsigned short)packed >> 8) & 0xff;
        u16 val = *(u16 *)((char *)data_ov002_022cf0c4 + (lo & 1) * 0x868 + hi * 20);
        if (val == 0) goto done;
        func_ov002_021d5918(self, lo, hi, self->f0, 2, 700);
    }
done:
    return 0;
}
