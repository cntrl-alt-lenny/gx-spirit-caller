/* CAMPAIGN-PREP candidate for func_021d190c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     step-dispatch: bool ternary + counter guard + poll-clear; RTL arg eval
 *   risk:       arg b/c read order (+4 then +2) relies on mwcc right-to-left eval landing +4 in r2, +2 in r3; could swap
 *   confidence: med
 */
/* func_ov002_021d190c: step 0x3b. On counter==0 post (0x3b, hi-bit flag,
 * f@+4, f@+2) and bump the counter; otherwise poll and clear +0x80c when idle.
 * NOTE: arg order is (val@4, val@2) per the asm's r2/r3 assignment. */
#include "ov002_core.h"
extern int func_ov002_0229c7f8(int cmd);

void func_ov002_021d190c(void) {
    int flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_0229ade0(0x3b, flag,
                            *(u16 *)(data_ov002_022ce950 + 0x4),
                            *(u16 *)(data_ov002_022ce950 + 0x2));
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    } else if (func_ov002_0229c7f8(0x3b) == 0) {
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
