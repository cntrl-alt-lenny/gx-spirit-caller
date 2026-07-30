#include "ov002_core.h"

extern int func_ov002_0223df38(void *self, int a, int b);
extern void func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, unsigned short arg4, unsigned short arg5);

int func_ov002_0221c538(struct Ov002Self *self) {
    if (func_ov002_0223df38(self, 0, 0) == 0) goto done;
    {
        unsigned int packed = func_ov002_0223de94(self, 0);
        int lo = packed & 0xff;
        int hi = ((unsigned short)packed >> 8) & 0xff;
        u16 val = *(u16 *)((char *)data_ov002_022cf1a4 + (lo & 1) * 0x868 + hi * 20);
        if (val == 0) goto done;
        func_ov002_021d5a08(self, lo, hi, self->f0, 2, 700);
    }
done:
    return 0;
}
