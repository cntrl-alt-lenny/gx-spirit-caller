/* CAMPAIGN-PREP candidate for func_021d1a54 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     step-dispatch: bool ternary + counter guard + poll-clear (zero payload)
 *   risk:       flag computed but counter loaded into r0 (not r2) — mwcc may keep the base in a different reg; otherwise clean
 *   confidence: med
 */
/* func_ov002_021d1a54: step 0x3c. On counter==0 post (0x3c, hi-bit flag, 0, 0)
 * and bump the counter; otherwise poll and clear +0x80c when idle. */
#include "ov002_core.h"
extern int func_ov002_0229c7f8(int cmd);

void func_ov002_021d1a54(void) {
    int flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_0229ade0(0x3c, flag, 0, 0);
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    } else if (func_ov002_0229c7f8(0x3c) == 0) {
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
