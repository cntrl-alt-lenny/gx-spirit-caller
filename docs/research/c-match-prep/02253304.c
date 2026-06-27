/* CAMPAIGN-PREP candidate for func_02253304 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 bitfield id (proven family form); 4 sequential guards, signed `< 5` early-return (cmp #5;ldmlt); sink kind 11; bind id across all calls
 *   risk:       orig holds id in callee-saved r5 across all four bl guards (no reload); mwcc should mirror via the bound `id` local. Closest-to-template (matches 02251d78 family) — likely first-build or a single decl-order tweak. reshape-able
 *   confidence: med
 */
/* func_ov002_02253304 (ov002, class D, MED) — straight guard-chain, bitfield.
 * id (:13) at row+0x120+idx*4; gates func_0202e234(!=0), func_0202b8a8(id) >= 5
 * (signed), func_0202e258(id)!=0, func_ov002_021ca440(player,id)!=0; post kind 11. */
#include "ov002_core.h"
extern int func_0202b8a8(int id);
extern int func_0202e234(int id);
extern int func_0202e258(int id);
extern int func_ov002_021ca440(int player, int id);
void func_ov002_02253304(int player, int arg1, int idx) {
    int id = ((struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + idx * 4 + 0x120))->id;
    if (func_0202e234(id) == 0)
        return;
    if (func_0202b8a8(id) < 5)
        return;
    if (func_0202e258(id) == 0)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    func_ov002_02253458(player, 0xb, idx);
}
