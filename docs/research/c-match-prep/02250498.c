/* CAMPAIGN-PREP candidate for func_02250498 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard==0; counted loop; id bitfield; two &&-guards; sink
 *   risk:       saved player(r8)/arg2(r7)/locals reg-alloc may flip; off-CSE; arg2 liveness
 *   confidence: med
 */
/* func_ov002_02250498: per-player slot scan with a payload arg (r2). For each
 * slot whose id passes func_0202df78(id,arg2) AND func_ov002_021c33e4 holds,
 * mark via the list sink. */
#include "ov002_core.h"

extern char data_ov002_022cf180[];
extern int func_0202df78(int id, int arg2);
extern int func_ov002_021c33e4(int player, int player2, int idx);

void func_ov002_02250498(int player, int unused, int arg2) {
    int i;
    struct Ov002Slot *slots;
    char *base;
    int off = (player & 1) * 0x868;
    if (*(int *)(data_ov002_022cf180 + off) == 0)
        return;
    base = data_ov002_022cf16c + off;
    slots = (struct Ov002Slot *)(base + 0x418);
    for (i = 0; i < *(unsigned int *)(base + 0x14); i++) {
        if (func_0202df78(slots[i].id, arg2) != 0 &&
            func_ov002_021c33e4(player, player, i) != 0)
            func_ov002_02253458(player, 0xe, i);
    }
}
