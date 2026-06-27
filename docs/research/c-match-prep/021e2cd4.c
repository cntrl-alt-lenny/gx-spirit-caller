/* CAMPAIGN-PREP candidate for func_021e2cd4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: shift-mask bit-test (lsr reg;and#1); compare-equal early-out; arg-pack tail
 *   risk:       reg-alloc: brief-360 catalogued this exact addr as reg-mirror. Orig keeps arg0->r5, arg1->r4 across the call then re-narrows; mwcc likely picks different callee regs / re-narrow order. permuter-class.
 *   confidence: low
 */
/* func_ov002_021e2cd4: if arg1 == bit arg0 of (d016c+0xd0) then no-op; else
 * func_ov002_021c9af0() and post a 0x9 event via func_ov002_021d479c with the u16
 * halves of arg0 and arg1. */
#include "ov002_core.h"

extern char data_ov002_022d016c[];
extern int  func_ov002_021c9af0(void);

void func_ov002_021e2cd4(int arg0, int arg1) {
    int bit = (*(unsigned int *)(data_ov002_022d016c + 0xd0) >> arg0) & 1;
    if (arg1 == bit)
        return;
    func_ov002_021c9af0();
    func_ov002_021d479c(9, (unsigned short)arg0, (unsigned short)arg1, 0);
}
