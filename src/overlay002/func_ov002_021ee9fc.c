/* func_ov002_021ee9fc: slot id guard, then arg0->b0 vs player guard, then
 * (idx<5) func_ov002_021b8fcc(player,idx) guard, then final cf1a4 u16==0. */
#include "ov002_core.h"

extern int func_ov002_021b8fcc(int player, int idx);

int func_ov002_021ee9fc(struct Ov002Self *arg0, int player, int idx) {
    int poff = (player & 1) * 0x868;
    int ioff = idx * 0x14;
    struct Ov002Slot *slot = (struct Ov002Slot *)(data_ov002_022cf16c + poff + 0x30 + ioff);
    if (slot->id == 0)
        return 0;
    if (player == arg0->b0)
        return 0;
    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0)
            return 0;
    }
    if (*(unsigned short *)(data_ov002_022cf1a4 + poff + ioff) != 0)
        return 0;
    return 1;
}
