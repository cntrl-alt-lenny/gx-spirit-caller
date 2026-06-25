/* CAMPAIGN-PREP candidate for func_021d9144 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested-call guard 02030ea4(021b9ecc); two-branch kind-0x3b arg-pack
 *   risk:       reshape-able: both arms rebuild the same `(arg0?0x8000:0)|0x3b` + `(u16)arg1` pack; mwcc may CSE/share them into one block where orig emits two, shifting the flag reg-choice (r0 reuse). If it diverges, duplicate the pack inline per arm.
 *   confidence: med
 */
/* func_ov002_021d9144: guard 02030ea4(021b9ecc(arg0,arg1)); then two-branch
 * arg-pack kind 0x3b into 021d479c (cls C). If arg2!=0 post with tag=1; else
 * gate on 021b9bd4(arg0,arg1) and post with tag=0. Flag bit from arg0. */
#include "ov002_core.h"

extern int func_02030ea4(int a);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021b9bd4(int a, int b);

void func_ov002_021d9144(int arg0, int arg1, int arg2) {
    if (func_02030ea4(func_ov002_021b9ecc(arg0, arg1)) == 0)
        return;
    if (arg2 != 0) {
        func_ov002_021d479c((u16)((arg0 ? 0x8000 : 0) | 0x3b),
                            (u16)arg1, 1, 0);
        return;
    }
    if (func_ov002_021b9bd4(arg0, arg1) == 0)
        return;
    func_ov002_021d479c((u16)((arg0 ? 0x8000 : 0) | 0x3b),
                        (u16)arg1, 0, 0);
}
