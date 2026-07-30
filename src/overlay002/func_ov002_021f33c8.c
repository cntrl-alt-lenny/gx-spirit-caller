/* func_ov002_021f33c8: leaf guard chain, idx must ==10; cf1a4 u16!=0; bit6 of
 * cf1ac word clear; slot id == 0x1a0c. First arg (self) is unused. */
#include "ov002_core.h"

extern char data_ov002_022cf1ac[];

int func_ov002_021f33c8(void *self, int player, int idx) {
    int poff;
    int ioff;
    (void)self;
    if (idx != 10)
        return 0;
    poff = (player & 1) * 0x868;
    ioff = idx * 0x14;
    if (*(unsigned short *)(data_ov002_022cf1a4 + poff + ioff) == 0)
        return 0;
    if ((*(unsigned int *)(data_ov002_022cf1ac + poff + ioff) >> 6) & 1)
        return 0;
    {
        char *p = data_ov002_022cf16c + poff;
        p += ioff;
        return ((struct Ov002Slot *)(p + 0x30))->id == 0x1a0c;
    }
}
