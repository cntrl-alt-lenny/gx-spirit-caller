/* CAMPAIGN-PREP candidate for func_021d1ce8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit15 ternary (movne;moveq); shifted-or A|(B<<16) keeps [+4] as orr Rn; RMW counter
 *   risk:       orig hoists the b15 flag + counter load to the very top (two separate ldr ce950 literals) before the gate; mwcc may CSE the literal or reorder the flag past the gate. reshape-able via decl-order / separate literal reads.
 *   confidence: med
 */
/* func_ov002_021d1ce8: ov002 one-shot (counter+0x810 gate) -> post cmd 0x3e
 * with arg-pack of two halfwords, then poll 0229c7f8 and clear +0x80c on 0.
 * b15 flag is the ternary form (movne#1;moveq#0). pack = [+4]|([+6]<<16).
 * cls D: orr-shift pack operand-order + bit15 ternary. */
#include "ov002_core.h"

extern int func_ov002_0229c7f8(int a);

void func_ov002_021d1ce8(void) {
    int flag;
    flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_0229ade0(0x3e, flag,
            *(unsigned short *)(data_ov002_022ce950 + 0x2),
            (int)((unsigned int)*(unsigned short *)(data_ov002_022ce950 + 0x4)
                | ((unsigned int)*(unsigned short *)(data_ov002_022ce950 + 0x6) << 16)));
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    }
    if (func_ov002_0229c7f8(0x3e) == 0)
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
