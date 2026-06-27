/* CAMPAIGN-PREP candidate for func_0224b1e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Ov002Slot :13 id; reload word; raw asymmetric shifts; *2+topbit (add)
 *   risk:       021ca5bc arg: mwcc may bind base across the two loads (CSE the addr) and reuse the id-word instead of reloading -> 1 ldr off. reshape-able (split base+idx expr, or reload via fresh ptr).
 *   confidence: med
 */
/* func_ov002_0224b1e0: idx slot in player's cf16c block; guard id via
 * func_0202e234, require its func_0202b878 type to equal arg1's, then gate on
 * func_ov002_021ca5bc(2*B + topbit) before posting kind 11 to 02253458.
 * cls D: :13 id bitfield (lsl19;lsr19) + asymmetric B/C extract on a RELOADED
 * packed word (orig re-loads at [r8,r4,lsl#2] for the 021ca5bc arg). */
#include "ov002_core.h"
extern int func_0202e234(int a);
extern int func_0202b878(int a);
extern int func_ov002_021ca5bc(int a);
void func_ov002_0224b1e0(int player, int arg1, int idx) {
    char *base = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int id = ((struct Ov002Slot *)(base + idx * 4 + 288))->id;
    unsigned int word;
    if (func_0202e234(id) == 0)
        return;
    if (func_0202b878(id) != func_0202b878(arg1))
        return;
    word = *(unsigned int *)(base + idx * 4 + 288);
    if (func_ov002_021ca5bc((int)(((unsigned)(word << 2) >> 24) * 2 + ((unsigned)(word << 18) >> 31))) == 0)
        return;
    func_ov002_02253458(player, 11, idx);
}
