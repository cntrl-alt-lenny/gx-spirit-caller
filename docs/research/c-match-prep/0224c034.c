/* CAMPAIGN-PREP candidate for func_0224c034 (ov002, class D) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     id bitfield; type==0x17; bind-row pass-through; do/while unsigned
 *   risk:       loop rotation/i-hoist may reorder; slot offset 0x260 inferred
 *   confidence: med
 */
/* func_ov002_0224c034: sibling of 0224b948 with type compare == 0x17. */
#include "ov002_core.h"
extern int func_0202b878(int id);
void func_ov002_0224c034(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        if (func_0202b878(((struct Ov002Slot *)(row + 0x260))[i].id) == 0x17)
            func_ov002_02253458(player, 13, i);
        i++;
    } while (i < *(u32 *)(row + 0x10));
}
