#include "ov002_core.h"

extern int data_ov002_022cdc78[];
extern int func_ov002_022806a4(int a, int b, int c);
extern int func_ov002_0227ee34(int a, int b);
extern int func_0202b8f0(int id);
extern int func_0202b920(int id);
extern int func_0202de9c(int id);
extern int func_0202f9e8(int id);
extern void func_ov002_02280a1c(int side, int *out1, int *out0, int flag);

int func_ov002_02293418(struct Ov002Self *self)
{
    int id;
    int val;
    int out1, out0;
    int m;

    if (func_ov002_022806a4(self->b0, self->f0, 0) < 0)
        goto fail;

    if (func_ov002_0227ee34(self->f0, *(int *)((char *)data_ov002_022cdc78 + 8)) != 0)
        goto fail;

    id = ((struct Ov002Slot *)func_ov002_021afb74())->id;

    {
        int f0 = self->f0;

        if (f0 > 0x1536)
            goto gt1536;
        if (f0 >= 0x1536)
            goto b0;
        if (f0 != 0x1536 - 0x3f)
            goto e4;
        goto a0;

gt1536:
        if (f0 > 0x1881)
            goto e4;
        if (f0 < 0x1880)
            goto e4;
        if (f0 == 0x1880)
            goto a0;
        if (f0 != 0x1881)
            goto e4;
        goto b0;
    }

a0:
    val = func_0202b920(id);
    goto f0;
b0:
    {
        int r;
        if (func_0202b8f0(id) > func_0202b920(id)) {
            r = func_0202b8f0(id);
        } else {
            r = func_0202b920(id);
        }
        val = r;
    }
    goto f0;
e4:
    val = func_0202b8f0(id);

f0:
    func_ov002_02280a1c(1 - self->b0, &out1, &out0, 0);

    if (val > 0x6a4) {
        {
            int t0 = out0;
            m = out1;
            if (out1 <= t0)
                m = t0;
        }
        if (val >= m - 500)
            goto success;
    }
    if (val <= 1000)
        goto fail;
    if (func_0202de9c(id) == 0)
        goto fail;
    if (func_0202f9e8(id) != 0)
        goto fail;

success:
    return 1;

fail:
    return 0;
}
