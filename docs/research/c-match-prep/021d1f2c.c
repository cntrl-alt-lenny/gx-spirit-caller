/* CAMPAIGN-PREP candidate for func_021d1f2c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     state dispatch (==0/==1) + counted loop of two sink calls (loop-invariant consts)
 *   risk:       the four call constants get hoisted into callee-saved regs (r4-r9,sl); mwcc may pick different regs or reorder the two bl args
 *   confidence: med
 */
/* func_ov002_021d1f2c: state machine on +0x810. State 0: kick subsystems 0,1
 * via func_021c31d4 and advance. State 1: for i in 0..1 post two (20,i,13|14,0)
 * commands, then clear +0x80c. Other states: no-op. */
#include "ov002_core.h"
extern void func_ov002_021c31d4(int a);

void func_ov002_021d1f2c(void) {
    int i;
    int st = *(int *)(data_ov002_022ce950 + 0x810);
    if (st == 0) {
        func_ov002_021c31d4(0);
        func_ov002_021c31d4(1);
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
        return;
    }
    if (st == 1) {
        for (i = 0; i < 2; i++) {
            func_ov002_0229ade0(20, i, 13, 0);
            func_ov002_0229ade0(20, i, 14, 0);
        }
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
