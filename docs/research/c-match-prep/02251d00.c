/* CAMPAIGN-PREP candidate for func_02251d00 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 bitfield id (proven family form); nested call result of func_0202b890(arg1) becomes 2nd arg of 021b9128; sink kind 11
 *   risk:       orig evaluates func_0202b890(arg1) (-> r0->r1) before binding func_ov002_021b9128(r0=id, r1=result); if mwcc orders id setup first the two `mov r1,r0`/`mov r0,r5` swap. reshape-able (operand/eval-order; could split into a temp)
 *   confidence: med
 */
/* func_ov002_02251d00 (ov002, class D, MED) — guard-chain, bitfield extract.
 * id (:13) at row+0x120+idx*4. Calls func_0202b890(arg1) -> r0, passes (id, that)
 * to func_ov002_021b9128; then func_ov002_021ca440(player,id); then post kind 11. */
#include "ov002_core.h"
extern int func_0202b890(int a);
extern int func_ov002_021b9128(int id, int arg1r);
extern int func_ov002_021ca440(int player, int id);
void func_ov002_02251d00(int player, int arg1, int idx) {
    int id = ((struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + idx * 4 + 0x120))->id;
    if (func_ov002_021b9128(id, func_0202b890(arg1)) == 0)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    func_ov002_02253458(player, 0xb, idx);
}
