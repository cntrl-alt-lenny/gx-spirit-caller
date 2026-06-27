/* CAMPAIGN-PREP candidate for func_0224ca08 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Twin of 0224c1e4; first predicate signed `<=6`; do/while unsigned; id bitfield
 *   risk:       `<=6` may emit cmp;movle vs orig cmp#6;bgt (proceed-arm) — reshape-able (already proceed-on-<=). Deeper: id-in-callee-saved across 4 bls — permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224ca08 (ov002, class D, MED tier) — brief p_0066.
 * UNVERIFIED + ITERATION-EXPECTED (ov002 MED = permuter/.s-walled, briefs 358/360).
 * Twin of shipped draft 0224c1e4 but predicate 1 is `<=6` not `==arg2`, kind 12.
 *   recipe: u32 guard==0; do/while unsigned; Ov002Slot.id bitfield; 4-deep && chain; cf184 guard, row+0x3a0, limit row[0x18], kind 12
 */
#include "ov002_core.h"
extern int func_0202b8a8(int id);
extern int func_02030808(int id);
extern int func_02030b84(int id);
extern int func_ov002_021ca3f0(int player, int id);
void func_ov002_0224ca08(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(u32 *)((char *)data_ov002_022cf184 + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x3a0))[i].id;
        if (func_0202b8a8(id) <= 6 &&
            func_02030808(id) != 0 &&
            func_02030b84(id) != 0 &&
            func_ov002_021ca3f0(player, id) != 0)
            func_ov002_02253458(player, 12, i);
        i++;
    } while (i < *(u32 *)(row + 0x18));
}
