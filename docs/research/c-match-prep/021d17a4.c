/* CAMPAIGN-PREP candidate for func_021d17a4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sign-bit flag; pre-call + post(flag,f_2,f_4) + inc / poll+clear; 3 callee-saved
 *   risk:       021b009c assumed void (no arg setup in asm); callee-saved assignment of flag/f_2/f_4 to r4/r5/r6 may permute
 *   confidence: low
 */
/* func_ov002_021d17a4: sign-bit flag + read f_2,f_4; 2-arm state machine.
 * state==0 -> call 021b009c(), then post event 0x38(flag,f_2,f_4), then inc
 * counter; else poll 0x38 and on done clear f_80c. flag/f_2/f_4 survive the
 * 021b009c call in callee-saved regs (orig frame {r4,r5,r6,lr}). */
#include "ov002_core.h"
extern void func_ov002_021b009c(void);

void func_ov002_021d17a4(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    unsigned short a = *(unsigned short *)(data_ov002_022ce950 + 2);
    unsigned short b = *(unsigned short *)(data_ov002_022ce950 + 4);
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_021b009c();
        func_ov002_0229ade0(0x38, flag, a, b);
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    } else if (func_ov002_0229c7f8(0x38) == 0) {
        *(int *)(data_ov002_022ce950 + 0x80C) = 0;
    }
}
