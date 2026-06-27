/* CAMPAIGN-PREP candidate for func_021e2d20 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: per-player mul-base (and#1;mul 0x868) shift-mask test; arg-pack tail; flag|0x22
 *   risk:       reg-alloc: orig computes base as `mul ip,(r6&1),0x868` then `ldr [_LIT1, ip]` and holds arg0->r6/arg1->r5/arg2->r4 across the call. The mul-index + 3 held callee regs make the coloring fragile. permuter-class.
 *   confidence: low
 */
/* func_ov002_021e2d20: index a per-player table (cf288, stride 0x868 by arg0&1),
 * test bit arg1 of its word; if arg2 == that bit, no-op; else func_ov002_021c9b2c()
 * and post a 0x22 event (high bit from arg0) via func_ov002_021d479c. */
#include "ov002_core.h"

extern char data_ov002_022cf288[];
extern int  func_ov002_021c9b2c(void);

void func_ov002_021e2d20(int arg0, int arg1, int arg2) {
    unsigned int w = *(unsigned int *)(data_ov002_022cf288 + (arg0 & 1) * 0x868);
    int bit = (w >> arg1) & 1;
    if (arg2 == bit)
        return;
    func_ov002_021c9b2c();
    func_ov002_021d479c((unsigned short)((arg0 ? 0x8000 : 0) | 0x22),
                        (unsigned short)arg1,
                        (unsigned short)arg2,
                        0);
}
