/* CAMPAIGN-PREP candidate for func_0224e660 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard==0; counted loop; Ov002Slot.id bitfield; predicate!=0; sink
 *   risk:       reg-alloc i/slots/base may flip; off-CSE may emit two muls
 *   confidence: high
 */
/* func_ov002_0224e660: per-player slot scan. For each slot whose id passes
 * func_0202eab0 (non-zero), mark via the list sink. */
#include "ov002_core.h"

extern char data_ov002_022cf180[];
extern int func_0202eab0(int id);

void func_ov002_0224e660(int player) {
    int i;
    struct Ov002Slot *slots;
    char *base;
    int off = (player & 1) * 0x868;
    if (*(int *)(data_ov002_022cf180 + off) == 0)
        return;
    base = data_ov002_022cf16c + off;
    slots = (struct Ov002Slot *)(base + 0x418);
    for (i = 0; i < *(unsigned int *)(base + 0x14); i++) {
        if (func_0202eab0(slots[i].id) != 0)
            func_ov002_02253458(player, 0xe, i);
    }
}
