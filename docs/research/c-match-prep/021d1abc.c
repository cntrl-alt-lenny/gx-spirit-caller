/* CAMPAIGN-PREP candidate for func_021d1abc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     step-dispatch: no hi-bit flag; guarded d016c copy-store; f2 passed as arg a
 *   risk:       the eq-guarded cf0->cf4 copy must stay predicated (streq); f2 in r1 must survive as arg a without a reload
 *   confidence: med
 */
/* func_ov002_021d1abc: step 0x3d. On counter==0: when f@+2 == 0 copy
 * d016c[+0xcf0] -> d016c[+0xcf4], post (0x3d, f@+2, 0, 0), bump counter.
 * Otherwise poll and clear +0x80c when idle. (No hi-bit flag here.) */
#include "ov002_core.h"
extern int func_ov002_0229c7f8(int cmd);

void func_ov002_021d1abc(void) {
    u16 f2 = *(u16 *)(data_ov002_022ce950 + 0x2);
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        if (f2 == 0)
            *(int *)(data_ov002_022d016c + 0xcf4) =
                *(int *)(data_ov002_022d016c + 0xcf0);
        func_ov002_0229ade0(0x3d, f2, 0, 0);
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    } else if (func_ov002_0229c7f8(0x3d) == 0) {
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
