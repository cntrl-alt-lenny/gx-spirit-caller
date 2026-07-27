#include "ov002_core.h"

extern char data_ov002_022cf08c[];

int func_ov002_022912bc(struct Ov002Self *self)
{
    int bit0 = self->b0;
    int other = 1 - bit0;
    int a, b;

    bit0 &= 1;
    other &= 1;
    a = *(int *)(data_ov002_022cf08c + bit0 * 0x868);
    b = *(int *)(data_ov002_022cf08c + other * 0x868);

    return b < a + 0x1f4;
}
