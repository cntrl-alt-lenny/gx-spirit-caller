/* CAMPAIGN-PREP candidate for func_021d1690 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sign-bit flag; 2-arm state machine post(flag,f_2,f_4)+inc / poll+clear
 *   risk:       mwcc may sink flag/f_2/f_4 into the post arm; the f_2/f_4 load order relative to the state compare may differ
 *   confidence: med
 */
/* func_ov002_021d1690: sign-bit flag + read f_2,f_4; 2-arm state machine.
 * state==0 -> post event 0x2f(flag,f_2,f_4) and inc counter; else poll 0x2f
 * and on done clear f_80c. Single call per arm; f_4 lands in r3. */
#include "ov002_core.h"

void func_ov002_021d1690(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    unsigned short a = *(unsigned short *)(data_ov002_022ce950 + 2);
    unsigned short b = *(unsigned short *)(data_ov002_022ce950 + 4);
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_0229ade0(0x2f, flag, a, b);
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    } else if (func_ov002_0229c7f8(0x2f) == 0) {
        *(int *)(data_ov002_022ce950 + 0x80C) = 0;
    }
}
