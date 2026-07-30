/* func_ov002_0221cf38: bit2 of self+4 guards; then self's field5 (bits1-5 of
 * self+2) indexes the player's cf16c sub-row array (0x30 base, 20-byte
 * stride) to read a slot record whose field8:flag13 (bits22-29 / bit13) is
 * compared against self's own field9 (bits6-14 of self+4). On match, forward
 * to func_ov002_021de318(self, 0x04000400). */
#include "ov002_core.h"

struct FullSlot {
    unsigned int id : 13;
    unsigned int flag13 : 1;
    unsigned int _pad : 8;
    unsigned int field8 : 8;
};

extern int func_ov002_021de318(void *self, int mask);

int func_ov002_0221cf38(struct Ov002Self *self) {
    unsigned short f4raw = *(unsigned short *)((char *)self + 4);
    int bit2 = (unsigned)(f4raw << 29) >> 31;

    if (bit2 != 0)
        return 0;

    {
        int field9 = (unsigned)(f4raw << 17) >> 23;
        int field5 = (unsigned)(*(unsigned short *)((char *)self + 2) << 26) >> 27;
        int bit0 = self->b0;
        char *row = data_ov002_022cf08c + (bit0 & 1) * 0x868;
        struct FullSlot *slot = (struct FullSlot *)(row + 0x30 + field5 * 20);

        if (field9 != slot->field8 * 2 + slot->flag13)
            return 0;
    }

    func_ov002_021de318(self, 0x04000400);
    return 0;
}
