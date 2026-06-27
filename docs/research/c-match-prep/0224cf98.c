/* CAMPAIGN-PREP candidate for func_0224cf98 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     arg2 held in callee-saved; 3-deep &&; UNSIGNED `<arg2`; do/while; id bitfield
 *   risk:       3rd predicate must be unsigned (orig `cmp r0,r7; bcs`) — reshape-able via (u32) casts (applied). Residual: arg2 held in callee-saved (r7) across loop — mwcc usually agrees; permuter-class if not.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224cf98 (ov002, class D, MED tier) — brief p_0066.
 * UNVERIFIED + ITERATION-EXPECTED (ov002 MED = permuter/.s-walled, briefs 358/360).
 *   recipe: arg2 held; u32 guard==0; do/while unsigned; Ov002Slot.id bitfield; 3-deep && with UNSIGNED `<arg2`; cf17c guard, row+0x260, limit row[0x10], kind 13
 */
#include "ov002_core.h"
extern int func_0202b8a8(int id);
extern int func_0202e234(int id);
extern int func_0202e42c(int id);
void func_ov002_0224cf98(int player, int arg1, int arg2) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(u32 *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x260))[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202e42c(id) != 0 &&
            (u32)func_0202b8a8(id) < (u32)arg2)
            func_ov002_02253458(player, 13, i);
        i++;
    } while (i < *(u32 *)(row + 0x10));
}
