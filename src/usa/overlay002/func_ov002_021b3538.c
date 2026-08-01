#include "ov002_core.h"

extern int func_ov002_021b3414(int lo2, int hi2, int lo, int hi);

int func_ov002_021b3538(int player, int idx) {
    struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf08c + (player & 1) * 0x868 + idx * 20 + 0x30);
    int i, j;

    if (slot->id == 0)
        return 0xffff;

    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 10; j++) {
            if (func_ov002_021b3414(i, j, player, idx) != 0) {
                return (unsigned short)((unsigned char)i | ((unsigned char)j << 8));
            }
        }
    }
    return 0xffff;
}
