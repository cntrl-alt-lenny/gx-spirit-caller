/* CAMPAIGN-PREP candidate for func_0224c8c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u32 guard==0; do/while unsigned; Ov002Slot.id 13-bit bitfield; 4-deep && chain
 *   risk:       Orig holds id in callee-saved reg across 4 bls; if mwcc reloads slots[i].id per call, lsl/lsr+ldr diverge. permuter-class (reg-alloc).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224c8c4 (ov002, class D, MED tier) — brief p_0066.
 * UNVERIFIED + ITERATION-EXPECTED: ov002 MED tier is permuter/.s-walled per
 * briefs 358/360; first-build byte-match not expected. Drop into src/, run
 * ninja + objdiff, apply the risk note.
 *   recipe: u32 guard==0; do/while unsigned; Ov002Slot.id 13-bit bitfield; 4-deep && chain; cf17c guard, row+0x260, limit row[0x10], kind 13
 */
#include "ov002_core.h"
extern int func_0202b878(int id);
extern int func_0202b8a8(int id);
extern int func_0202e234(int id);
extern int func_ov002_021ca440(int player, int id);
void func_ov002_0224c8c4(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(u32 *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x260))[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202b8a8(id) <= 2 &&
            func_0202b878(id) == 0x12 &&
            func_ov002_021ca440(player, id) != 0)
            func_ov002_02253458(player, 13, i);
        i++;
    } while (i < *(u32 *)(row + 0x10));
}
