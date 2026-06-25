/* CAMPAIGN-PREP candidate for func_021d15b0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sign-bit flag; 2-arm state machine post(flag,f_2)+inc / poll+clear
 *   risk:       mwcc may sink flag/f_2 into the post arm instead of computing them in the prologue as the orig does
 *   confidence: med
 */
/* func_ov002_021d15b0: sign-bit flag + read f_2, 2-arm state machine.
 * state==0 -> post event 0x42 (flag,f_2) and inc counter; else poll 0x42
 * and on done clear f_80c. cmd 0x42 is shared so mov r0,#0x42 hoists. */
#include "ov002_core.h"

void func_ov002_021d15b0(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    unsigned short a = *(unsigned short *)(data_ov002_022ce950 + 2);
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_0229ade0(0x42, flag, a, 0);
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    } else if (func_ov002_0229c7f8(0x42) == 0) {
        *(int *)(data_ov002_022ce950 + 0x80C) = 0;
    }
}
