/* CAMPAIGN-PREP candidate for func_022507c0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard==0; counted loop; id bitfield held in reg; two &&-guards; sink
 *   risk:       id must stay in callee reg (r9) across both calls; locals reg-alloc may flip; off-CSE
 *   confidence: high
 */
/* func_ov002_022507c0: per-player slot scan. For each slot whose id passes
 * BOTH func_0202e234 and func_0202ef38 (id held across both), mark via the
 * list sink. */
#include "ov002_core.h"

extern char data_ov002_022cf180[];
extern int func_0202e234(int id);
extern int func_0202ef38(int id);

void func_ov002_022507c0(int player) {
    int i;
    struct Ov002Slot *slots;
    char *base;
    int off = (player & 1) * 0x868;
    if (*(int *)(data_ov002_022cf180 + off) == 0)
        return;
    base = data_ov002_022cf16c + off;
    slots = (struct Ov002Slot *)(base + 0x418);
    for (i = 0; i < *(unsigned int *)(base + 0x14); i++) {
        int id = slots[i].id;
        if (func_0202e234(id) != 0 && func_0202ef38(id) != 0)
            func_ov002_02253458(player, 0xe, i);
    }
}
