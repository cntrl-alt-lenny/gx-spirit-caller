/* CAMPAIGN-PREP candidate for func_021d3420 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     step-dispatch variant: counter guard then UNCONDITIONAL poll-clear (fall-through, not else)
 *   risk:       poll must run on both paths (no else); the f2/f4 reads feed args (val@2,val@4); reg-alloc of the early field reads may shift
 *   confidence: med
 */
/* func_ov002_021d3420: step 0x45. On counter==0 post (0x45, hi-bit flag,
 * f@+2, f@+4) and bump the counter. Then UNCONDITIONALLY poll 0x45 and clear
 * +0x80c when idle (the init block falls through into the poll). */
#include "ov002_core.h"
extern int func_ov002_0229c7f8(int cmd);

void func_ov002_021d3420(void) {
    int flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_0229ade0(0x45, flag,
                            *(u16 *)(data_ov002_022ce950 + 0x2),
                            *(u16 *)(data_ov002_022ce950 + 0x4));
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    }
    if (func_ov002_0229c7f8(0x45) == 0) {
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
