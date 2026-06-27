/* CAMPAIGN-PREP candidate for func_021aa4a8 (ov009, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: dense switch(0..3) => addls pc jump-table; r1=0 carried from field-clear into arms
 *   risk:       reshape-able (cmp r5,#3 + addls pc): a contiguous case 0..3 with default fall-through should emit the jump table; main risk is mwcc materialising r1=0 fresh per arm vs the orig's carried `mov r1,#0` (op-order/temp tweak). The cleanest of the batch.
 *   confidence: med
 */
/* func_ov009_021aa4a8 — branch-table dispatch (addls pc) with clean arms (class D).
 * Zeroes three buffers (memset via func_02094504(fill,dst,n)), clears two ctrl
 * fields, then a switch(b) calls func_ov009_021aacc4(ctrl, x, code). Returns 1. */
#include "ov009_core.h"

extern void func_02094504(int fill, void *dst, int n);
extern void *func_0208e200(void);
extern void *func_0208e1ac(void);
extern void func_ov009_021aacc4(int *ctrl, int x, int code);
extern void func_02005ee0(void);

extern char data_ov009_021adbcc[];
extern char data_02104f4c[];

int func_ov009_021aa4a8(int *ctrl, int b) {
    func_02094504(0, data_ov009_021adbcc, 0x28);
    func_02094504(0, func_0208e200(), 0x400);
    func_02094504(0, func_0208e1ac(), 0x400);
    ctrl[0] = 0;
    ctrl[0x18 / 4] = 0;
    switch (b) {
    case 0:
        if (*(int *)(data_02104f4c + 0xa60) >= *(int *)data_ov009_021adc54) {
            func_ov009_021aacc4(ctrl, 1, 9);
        } else {
            func_ov009_021aacc4(ctrl, 0, 0xa);
            ctrl[0x18 / 4] = 1;
        }
        break;
    case 1:
        func_ov009_021aacc4(ctrl, 0, 0xb);
        break;
    case 2:
        func_ov009_021aacc4(ctrl, 2, 2);
        break;
    case 3:
        func_ov009_021aacc4(ctrl, 0, 0xc);
        break;
    }
    func_02005ee0();
    return 1;
}
