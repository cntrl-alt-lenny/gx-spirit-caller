/* CAMPAIGN-PREP candidate for func_0224bb54 (ov002, class D) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     id bitfield; predicate !=0 (beq-skip); bind-row pass-through; do/while unsigned
 *   risk:       loop rotation/i-hoist may reorder; != 0 predicate could emit movne/cmp variant; slot offset 0x260 inferred
 *   confidence: med
 */
/* func_ov002_0224bb54: sibling of 0224b948 but the predicate is
 * func_0202e358(id) != 0 (orig: cmp #0; beq skip). Posts kind-13. */
#include "ov002_core.h"
extern int func_0202e358(int id);
void func_ov002_0224bb54(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        if (func_0202e358(((struct Ov002Slot *)(row + 0x260))[i].id) != 0)
            func_ov002_02253458(player, 13, i);
        i++;
    } while (i < *(u32 *)(row + 0x10));
}
