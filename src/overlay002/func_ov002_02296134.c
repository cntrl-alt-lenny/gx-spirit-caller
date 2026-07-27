#include "ov002_core.h"

int func_ov002_02296134(struct Ov002Self *self) {
    int rawB0 = self->b0;
    int b0 = rawB0 & 1;
    char *row = (char *)data_ov002_022cf16c + b0 * 0x868;
    struct Ov002Slot *slot = (struct Ov002Slot *)(row + 0xf8);
    if (slot->id != 0x175e) {
        return 0;
    }
    {
        int opp = (1 - rawB0) & 1;
        int myVal = *(int *)row;
        int oppVal = *(int *)((char *)data_ov002_022cf16c + opp * 0x868);
        return (myVal >= oppVal * 2) ? 1 : 0;
    }
}
