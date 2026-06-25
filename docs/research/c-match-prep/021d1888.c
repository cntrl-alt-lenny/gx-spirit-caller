/* CAMPAIGN-PREP candidate for func_021d1888 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     step-dispatch: bool ternary + counter guard + poll-branch with conditional helper
 *   risk:       f2 (r4) may land in a different callee-saved reg; poll-path inline-vs-branch of the f2-guard could mis-predicate
 *   confidence: low
 */
/* func_ov002_021d1888: step 0x39. On counter==0 post (0x39, hi-bit flag, f2, 0)
 * and bump the counter; otherwise poll, and if not busy optionally fire
 * func_021b0b54(0x3e,1) when f2!=0, then clear the +0x80c scalar. */
#include "ov002_core.h"
extern int func_ov002_0229c7f8(int cmd);
extern void func_ov002_021b0b54(int a, int b);

void func_ov002_021d1888(void) {
    int flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    u16 f2 = *(u16 *)(data_ov002_022ce950 + 0x2);
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_0229ade0(0x39, flag, f2, 0);
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    } else {
        if (func_ov002_0229c7f8(0x39) != 0)
            return;
        if (f2 != 0)
            func_ov002_021b0b54(0x3e, 1);
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
