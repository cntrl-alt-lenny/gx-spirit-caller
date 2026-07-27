#include "ov002_core.h"

struct Ov002_022032f0Self {
    u16 b0 : 1;
    u16 _pad0 : 5;
    u16 field6 : 6;
    u16 _pad1 : 4;
};

extern int func_ov002_021bb90c(int bit0, int c);

int func_ov002_022032f0(void *arg0)
{
    struct Ov002_022032f0Self *s = (struct Ov002_022032f0Self *)((char *)arg0 + 2);

    if (s->field6 == 0x23)
        goto ret1;
    if (func_ov002_021bb90c(s->b0, 0xfc9) == 0)
        return 0;
ret1:
    return 1;
}
