/* CAMPAIGN-PREP candidate for func_0224d2ec (ov002, class D) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     id bitfield; cf180 guard; 0x418 array; getter 0202b878 ==0x16; do/while unsigned
 *   risk:       loop rotation/i-hoist may reorder; 0x418 two-add split must match; cf180/0x418/0x14 inferred
 *   confidence: med
 */
/* func_ov002_0224d2ec: cf180 guard, 0x418 array, limit row[0x14]; getter
 * func_0202b878, compare == 0x16 -> post kind-14. */
#include "ov002_core.h"
extern int func_0202b878(int id);
extern int data_ov002_022cf180[];
void func_ov002_0224d2ec(int player) {
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
