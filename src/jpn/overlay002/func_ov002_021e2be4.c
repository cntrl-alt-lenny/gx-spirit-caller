#include "ov002_core.h"

extern int func_ov002_021c9a10(int bit, int set);

void func_ov002_021e2be4(int bit, int val)
{
    if (val == (((unsigned)D016C->f_d0 >> bit) & 1))
        return;
    func_ov002_021c9a10(bit, val);
    func_ov002_021d46ac(9, (unsigned short)bit, (unsigned short)val, 0);
}
