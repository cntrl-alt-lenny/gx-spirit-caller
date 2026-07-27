#include "ov002_core.h"

extern char data_ov002_022cf288[];

int func_ov002_02202d08(struct Ov002Self *self)
{
    int bit0;
    int val;

    if (D016C->f_cf8 != 2)
        return 0;
    bit0 = self->b0 & 1;
    val = *(int *)(data_ov002_022cf288 + bit0 * 0x868);
    return (((unsigned)val >> 20) & 1) == 0;
}
