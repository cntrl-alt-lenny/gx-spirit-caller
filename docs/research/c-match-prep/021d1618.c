/* CAMPAIGN-PREP candidate for func_021d1618 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sign-bit flag; post(flag,f_2,f_4)+second-call+inc / poll+clear; f_4 callee-saved
 *   risk:       callee-saved reg holding f_4 across the call may pick a different number; flag/f_2/f_4 hoist may sink
 *   confidence: med
 */
/* func_ov002_021d1618: sign-bit flag + read f_2,f_4; 2-arm state machine.
 * state==0 -> post event 0x2e(flag,f_2,f_4), then call 021b0bdc(0x25,f_4),
 * then inc counter; else poll 0x2e and on done clear f_80c. f_4 is kept in
 * a callee-saved reg across the first call (orig frame {r4,lr}). */
#include "ov002_core.h"
extern int func_ov002_021b0bdc(int a, int b);

void func_ov002_021d1618(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    unsigned short a = *(unsigned short *)(data_ov002_022ce950 + 2);
    unsigned short b = *(unsigned short *)(data_ov002_022ce950 + 4);
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_0229ade0(0x2e, flag, a, b);
        func_ov002_021b0bdc(0x25, b);
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    } else if (func_ov002_0229c7f8(0x2e) == 0) {
        *(int *)(data_ov002_022ce950 + 0x80C) = 0;
    }
}
