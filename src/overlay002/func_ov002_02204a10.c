#include "ov002_core.h"

struct Ov002_02204a10Self {
    u16 b0 : 1;
    u16 _pad0 : 5;
    u16 field6 : 6;
    u16 _pad1 : 4;
};

int func_ov002_02204a10(void *arg0)
{
    struct Ov002_02204a10Self *s = (struct Ov002_02204a10Self *)((char *)arg0 + 2);
    int bit0 = s->b0;
    int field6;
    int f14;

    if (D016C->f_cec != 1 - bit0)
        return 0;
    field6 = s->field6;
    if (field6 == 0x19) {
        f14 = *(int *)((char *)arg0 + 0x14);
        return (((unsigned)f14 << 21) >> 31) == 0;
    }
    return 0;
}
