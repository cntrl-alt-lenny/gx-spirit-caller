/* CAMPAIGN-PREP candidate for func_021d1820 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sign-bit flag; 2-arm state machine post(flag)+inc / poll+clear; shared cmd hoist
 *   risk:       mwcc may sink the flag computation into the post arm rather than the prologue as the orig does
 *   confidence: med
 */
/* func_ov002_021d1820: sign-bit flag only; 2-arm state machine.
 * state==0 -> post event 0x3a(flag,0,0) and inc counter; else poll 0x3a and
 * on done clear f_80c. f_2/f_4 are NOT read here. cmd 0x3a is shared. */
#include "ov002_core.h"

void func_ov002_021d1820(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_0229ade0(0x3a, flag, 0, 0);
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    } else if (func_ov002_0229c7f8(0x3a) == 0) {
        *(int *)(data_ov002_022ce950 + 0x80C) = 0;
    }
}
