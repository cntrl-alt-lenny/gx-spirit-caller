/* CAMPAIGN-PREP candidate for func_021d5ab4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     021d479c arg-pack family; (short)arg2>>8 hi-byte; flag ternary
 *   risk:       permuter-class: ov002_core.h already SHIPS this as .s (brief 358) for a reg-alloc wall — orig pre-unpacks arg2 into ip/r4/r5 and colours r4..r7 in a way C reshapes won't reproduce. Likely escapes back to .s.
 *   confidence: low
 */
/* func_ov002_021d5ab4: guard 021b34f4(self,row, arg2 lo byte, arg2 hi byte),
 * then arg-pack kind 0x37 (flag from arg0, arg1|0xa00, arg2, arg3) into
 * 021d479c (cls C). NOTE: already routed to .s on main (ov002_core.h brief
 * 358) as a reg-alloc wall — this C is the conversion ATTEMPT. */
#include "ov002_core.h"

extern int func_ov002_021b34f4(int self, int row, int a, int b);

void func_ov002_021d5ab4(int arg0, int arg1, int arg2, int arg3) {
    if (func_ov002_021b34f4(arg0, arg1, arg2 & 0xff,
                            (((short)arg2 >> 8) & 0xff)) == 0)
        return;
    func_ov002_021d479c((u16)((arg0 ? 0x8000 : 0) | 0x37),
                        (u16)((arg1 & 0xff) | 0xa00),
                        (u16)arg2, (u16)arg3);
}
