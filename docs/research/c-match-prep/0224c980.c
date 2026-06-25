/* CAMPAIGN-PREP candidate for func_0224c980 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     id bitfield; arg2 player; cf180 guard; 0x418 array; do/while unsigned
 *   risk:       loop rotation/i-hoist may reorder; 0x418 two-add split must match; cf180/0x418/0x14 offsets inferred
 *   confidence: med
 */
/* func_ov002_0224c980: player is arg2; scans the 0x418 slot array (offset
 * 0x18+0x400), limit at row[0x14], guard table cf180. Type == 0x16 -> post
 * kind-14. */
#include "ov002_core.h"
extern int func_0202b878(int id);
extern int data_ov002_022cf180[];
void func_ov002_0224c980(int a0, int a1, int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    do {
        if (func_0202b878(((struct Ov002Slot *)(row + 0x418))[i].id) == 0x16)
            func_ov002_02253458(player, 14, i);
        i++;
    } while (i < *(u32 *)(row + 0x14));
}
