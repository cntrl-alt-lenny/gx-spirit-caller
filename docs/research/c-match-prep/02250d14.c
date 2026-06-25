/* CAMPAIGN-PREP candidate for func_02250d14 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     per-player scan loop; bitfield slot.id; guard+sink; do-while
 *   risk:       loop form (do-while vs for), count-reload, and bcc-unsigned may flip; eq-vs-ls on cf180 guard
 *   confidence: med
 */
/* func_ov002_02250d14: opponent (1-player) scan loop — for each row slot
 * whose 13-bit id maps via func_0202b878 to type 0x16, post a kind-0xe entry
 * to the func_ov002_02253458 list sink. */
#include "ov002_core.h"
extern int data_ov002_022cf180[];
extern int func_0202b878(int a);

void func_ov002_02250d14(int player) {
    int opp = 1 - player;
    char *base = (char *)data_ov002_022cf16c + (opp & 1) * 0x868;
    unsigned int i;
    if (*(int *)((char *)data_ov002_022cf180 + (opp & 1) * 0x868) == 0)
        return;
    i = 0;
    do {
        int id = ((struct Ov002Slot *)(base + 0x418))[i].id;
        if (func_0202b878(id) == 0x16)
            func_ov002_02253458(opp, 0xe, i);
    } while (++i < *(unsigned int *)(base + 0x14));
}
