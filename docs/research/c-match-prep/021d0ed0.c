/* CAMPAIGN-PREP candidate for func_021d0ed0 (ov002, class C) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sign-bit flag (?1:0); switch(state) dispatch; post/poll arms
 *   risk:       mwcc may sink flag/f_2 reads into case 0 instead of hoisting to prologue; cls C codegen-sensitive
 *   confidence: low
 */
/* func_ov002_021d0ed0: sign-bit flag + read f_2, then 2-way state switch.
 * case 0 posts event 0x15 (carrying flag + f_2); case 1 polls 0x15 and on
 * done clears f_80c; any other state returns. flag/f_2 are read up front
 * to match the orig's pre-dispatch prologue. */
#include "ov002_core.h"

void func_ov002_021d0ed0(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    unsigned short a = *(unsigned short *)(data_ov002_022ce950 + 2);
    switch (*(int *)(data_ov002_022ce950 + 0x810)) {
    case 0:
        func_ov002_0229ade0(0x15, flag, a, 0);
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
        break;
    case 1:
        if (func_ov002_0229c7f8(0x15) == 0)
            *(int *)(data_ov002_022ce950 + 0x80C) = 0;
        break;
    }
}
