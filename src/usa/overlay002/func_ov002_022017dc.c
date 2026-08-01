#include "ov002_core.h"

extern int func_ov002_022574e0(void *a, int b, int c);

int func_ov002_022017dc(void *arg0, int player, int idx) {
    struct Ov002Slot *slot;
    int result;

    if (!arg0)
        return 0;

    slot = (struct Ov002Slot *)((char *)data_ov002_022cf08c + (player & 1) * 0x868 + idx * 20 + 0x30);
    if (slot->id == 0)
        return 0;

    {
        unsigned char lo = (unsigned char)player;
        unsigned char hi = (unsigned char)idx;
        unsigned short packed = (unsigned short)(lo | (hi << 8));
        if (func_ov002_0223dda4(arg0, 0) == packed)
            return 0;
    }

    CE288->f_5c4 = 1;
    result = func_ov002_022574e0(arg0, player, idx);
    CE288->f_5c4 = 0;
    return result;
}
