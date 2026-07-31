#include "ov002_core.h"

extern char data_ov002_022cf1a8[];

int func_ov002_02202c18(struct Ov002Self *self)
{
    int bit0;
    int val;

    if (D016C->f_cf8 != 2)
        return 0;
    bit0 = self->b0 & 1;
    val = *(int *)(data_ov002_022cf1a8 + bit0 * 0x868);
    return (((unsigned)val >> 20) & 1) == 0;
}
