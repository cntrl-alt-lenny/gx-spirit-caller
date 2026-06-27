/* CAMPAIGN-PREP candidate for func_0224d0f8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u32 guard==0; do/while unsigned; id bitfield; 2nd predicate passes literal 1
 *   risk:       Orig hoists literal 1 into callee-saved r9 across loop; mwcc likely re-`mov r1,#1` inline each iter — permuter-class (reg-alloc/loop-invariant hoist), C-reshape unlikely.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224d0f8 (ov002, class D, MED tier) — brief p_0066.
 * UNVERIFIED + ITERATION-EXPECTED (currently ships as .s; reg-alloc-walled, brief 302).
 *   recipe: u32 guard==0; do/while unsigned; Ov002Slot.id bitfield; 2-deep && (2nd passes const 1); cf180 guard, row+0x418, limit row[0x14], kind 14
 */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_ov002_021b9128(int id, int arg1);
extern int data_ov002_022cf180[];
void func_ov002_0224d0f8(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(u32 *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x418))[i].id;
        if (func_0202e234(id) != 0 &&
            func_ov002_021b9128(id, 1) != 0)
            func_ov002_02253458(player, 14, i);
        i++;
    } while (i < *(u32 *)(row + 0x14));
}
