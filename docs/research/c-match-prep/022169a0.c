/* CAMPAIGN-PREP candidate for func_022169a0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 bitfield held; cf17c byte-offset (1-bit0)&1*0x868; cd744[bit0] int-index; guard chain
 *   risk:       orig holds bit0 in r0 across both table loads AND derives (1-bit0)&1 via rsb;and. If mwcc re-extracts the bitfield per use (2nd ldrh) the load count diverges. reshape-able (single bit0 local already forces one read).
 *   confidence: med
 */
/* func_ov002_022169a0: bit0 of self->f2; gate on cf17c[other-player 0x868] and
 * cd744[bit0]; if first set and second clear, fire 021af9d0(self,5,f0,0). ret 0. */
#include "ov002_core.h"
extern void func_ov002_021af9d0(int a, int b, int c, int d);

int func_ov002_022169a0(struct Ov002Self *arg0) {
    int bit0 = arg0->b0;
    if (*(int *)((char *)data_ov002_022cf17c + ((1 - bit0) & 1) * 0x868) == 0) return 0;
    if (*(int *)((char *)data_ov002_022cd744 + bit0 * 4) != 0) return 0;
    func_ov002_021af9d0((int)arg0, 5, arg0->f0, 0);
    return 0;
}
