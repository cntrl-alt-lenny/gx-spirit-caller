/* CAMPAIGN-PREP candidate for func_02251bb0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 bitfield id; mla base row+0x120; RELOAD slot word post-guards; addr-unpack ((v>>22)&0xff)<<1 + (v>>13)&1; sink kind 11
 *   risk:       orig RE-LOADS the slot word for the unpack (two `ldr [r6,r4,lsl#2]`); mwcc -O4 may CSE the bitfield id and the unpack into one load across the bl guards -> a missing ldr. reshape-able (bind/reload flip: keep two separate derefs)
 *   confidence: med
 */
/* func_ov002_02251bb0 (ov002, class D, MED) — straight guard-chain + addr-unpack.
 * id (:13) at row+0x120+arg2*4; gates func_0202e234(!=0), func_0202b878(id)==0x11,
 * func_ov002_021ca5bc(unpack)!=0; then post kind 11. unpack = ((v>>22)&0xff)<<1 +
 * (v>>13)&1 from a RELOAD of the slot word (orig re-loads after the guards). */
#include "ov002_core.h"
extern int func_0202b878(int id);
extern int func_0202e234(int id);
extern int func_ov002_021ca5bc(int code);
void func_ov002_02251bb0(int player, int arg1, int arg2) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x120;
    unsigned int v;
    int id = ((struct Ov002Slot *)(row + arg2 * 4))->id;
    if (func_0202e234(id) == 0)
        return;
    if (func_0202b878(id) != 0x11)
        return;
    v = *(unsigned int *)(row + arg2 * 4);
    if (func_ov002_021ca5bc((int)(((v >> 22) & 0xff) << 1) + (int)((v >> 13) & 1)) == 0)
        return;
    func_ov002_02253458(player, 0xb, arg2);
}
