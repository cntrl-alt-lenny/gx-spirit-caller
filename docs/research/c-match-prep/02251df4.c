/* CAMPAIGN-PREP candidate for func_02251df4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id:13 bitfield; cf188 guard; row+0x5d0 array; 4-deep chain (021c3608 player,player,i; 021c988c kind 15); do/while
 *   risk:       orig keeps kind 0xf in two callee-saved regs (r8,r9) reused for both 021c988c arg and sink arg; passing literal 15 twice may not mirror that register reuse. permuter-class (callee-saved const sharing)
 *   confidence: med
 */
/* func_ov002_02251df4: per-player slot scan (kind 15). For each slot whose id
 * (13-bit) passes func_0202e234(!=0), has func_0202b878(id)==0x11, passes
 * func_ov002_021c3608(player,player,i) and func_ov002_021c988c(player,15,i),
 * post a kind-15 entry. Guard cf188; slot array row+0x5d0; count row+0x1c. */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_0202b878(int id);
extern int func_ov002_021c3608(int player, int player2, int idx);
extern int func_ov002_021c988c(int player, int kind, int idx);
extern int data_ov002_022cf188[];
void func_ov002_02251df4(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf188 + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x5d0))[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202b878(id) == 0x11 &&
            func_ov002_021c3608(player, player, i) != 0 &&
            func_ov002_021c988c(player, 15, i) != 0)
            func_ov002_02253458(player, 15, i);
        i++;
    } while (i < *(u32 *)(row + 0x1c));
}
