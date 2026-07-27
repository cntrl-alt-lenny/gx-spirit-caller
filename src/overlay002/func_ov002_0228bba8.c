#include "ov002_core.h"

extern void func_ov002_0220eb00(int a, int *out);

int func_ov002_0228bba8(struct Ov002Self *self, int arg1)
{
    int buf[2];
    int bit0;

    if (arg1 == 0)
        return 0;
    func_ov002_0220eb00(arg1, buf);
    bit0 = self->b0;
    return buf[bit0] < 0;
}
