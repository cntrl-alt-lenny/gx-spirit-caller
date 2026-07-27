#include "ov002_core.h"

struct Ov002_0220aeb0Self {
    u16 b0 : 1;
    u16 _pad0 : 5;
    u16 field6 : 6;
    u16 _pad1 : 4;
};

extern char data_ov002_022cf098[];

int func_ov002_0220adc0(void *arg0)
{
    struct Ov002_0220aeb0Self *s = (struct Ov002_0220aeb0Self *)((char *)arg0 + 2);

    if (s->field6 == 5) {
        int bit0 = s->b0 & 1;
        return *(int *)(data_ov002_022cf098 + bit0 * 0x868) != 0;
    }
    return 1;
}
