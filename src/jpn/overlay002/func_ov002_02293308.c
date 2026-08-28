#include "ov002_core.h"

extern int data_ov002_022cdb98[];
extern int func_ov002_02280594(int a, int b, int c);
extern int func_ov002_0227ed24(int a, int b);
extern int func_0202b89c(int id);
extern int func_0202b8cc(int id);
extern int func_0202de48(int id);
extern int func_0202f994(int id);
extern void func_ov002_0228090c(int side, int *out1, int *out0, int flag);

int func_ov002_02293308(struct Ov002Self *self)
{
    int id;
    int val;
    int out1, out0;
    int m;

    if (func_ov002_02280594(self->b0, self->f0, 0) < 0)
        goto fail;

    if (func_ov002_0227ed24(self->f0, *(int *)((char *)data_ov002_022cdb98 + 8)) != 0)
        goto fail;

    id = ((struct Ov002Slot *)func_ov002_021afa94())->id;

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
    val = func_0202b8cc(id);
    goto f0;
b0:
    {
        int r;
        if (func_0202b89c(id) > func_0202b8cc(id)) {
            r = func_0202b89c(id);
        } else {
            r = func_0202b8cc(id);
        }
        val = r;
    }
    goto f0;
e4:
    val = func_0202b89c(id);

f0:
    func_ov002_0228090c(1 - self->b0, &out1, &out0, 0);

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
    if (func_0202de48(id) == 0)
        goto fail;
    if (func_0202f994(id) != 0)
        goto fail;

success:
    return 1;

fail:
    return 0;
}
