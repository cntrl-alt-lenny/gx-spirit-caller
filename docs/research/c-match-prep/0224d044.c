/* CAMPAIGN-PREP candidate for func_0224d044 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u32 guard==0; do/while unsigned; id bitfield; 3rd predicate takes loop i
 *   risk:       3rd predicate consumes i (loop induction) so i must stay in callee-saved across bls; reg-alloc of {player,row,i,id} vs orig {r7,r6,r4,r9} — permuter-class (reg-alloc).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224d044 (ov002, class D, MED tier) — brief p_0066.
 * UNVERIFIED + ITERATION-EXPECTED (ov002 MED = permuter/.s-walled, briefs 358/360).
 *   recipe: u32 guard==0; do/while unsigned; Ov002Slot.id bitfield; 3-deep && (3rd takes i); cf180 guard, row+0x418, limit row[0x14], kind 14
 */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_0202e42c(int id);
extern int func_ov002_021c33e4(int a, int b, int idx);
extern int data_ov002_022cf180[];
void func_ov002_0224d044(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(u32 *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x418))[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202e42c(id) != 0 &&
            func_ov002_021c33e4(player, player, i) != 0)
            func_ov002_02253458(player, 14, i);
        i++;
    } while (i < *(u32 *)(row + 0x14));
}
