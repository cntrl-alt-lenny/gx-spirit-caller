/* CAMPAIGN-PREP candidate for func_0224cf14 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     id bitfield; cf17c guard; 0x260 array; getter 0202b8c0 ==3; do/while unsigned
 *   risk:       loop rotation/i-hoist may reorder; slot offset 0x260 inferred
 *   confidence: med
 */
/* func_ov002_0224cf14: identical shape to 0224cd18 (cf17c guard, 0x260 array,
 * limit row[0x10], getter func_0202b8c0 == 3, kind-13). */
#include "ov002_core.h"
extern int func_0202b8c0(int id);
void func_ov002_0224cf14(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        if (func_0202b8c0(((struct Ov002Slot *)(row + 0x260))[i].id) == 3)
            func_ov002_02253458(player, 13, i);
        i++;
    } while (i < *(u32 *)(row + 0x10));
}
