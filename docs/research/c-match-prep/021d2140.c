/* CAMPAIGN-PREP candidate for func_021d2140 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     read h@2 early so it stays r1 into the call; result reused as guard+arg2; (flag&1)*0x868 OR-RMW
 *   risk:       ret held in a callee-saved reg (orig `mov r2,r0` keeps it across the switch); if mwcc reloads/recolours, the cmp+arg2 ldr/mov diverge. permuter-class.
 *   confidence: med
 */
/* func_ov002_021d2140 (ov002, class C) — campaign-prep, UNVERIFIED.
 * flag from sign-bit; ret = func_021b9aa8(flag, h@2) (its result is BOTH the
 * signed guard and arg2 of the cmd post). 3-state on +0x810: 0 bump; 1 if
 * ret>=0 post cmd 0x11 + OR bit2 into cf288[(flag&1)*0x868], then bump;
 * 2 if func_0229c7f8(0x11)==0 clear +0x80c. */
#include "ov002_core.h"

extern char data_ov002_022cf288[];
extern int  func_ov002_021b9aa8(int flag, int h2);
extern int  func_ov002_0229c7f8(int cmd);

void func_ov002_021d2140(void) {
    int flag;
    int ret;
    int st;
    flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    ret = func_ov002_021b9aa8(flag, *(u16 *)(data_ov002_022ce950 + 0x2));
    st = *(int *)(data_ov002_022ce950 + 0x810);
    if (st == 0) {
        *(int *)(data_ov002_022ce950 + 0x810) = st + 1;
        return;
    }
    if (st == 1) {
        if (ret >= 0) {
            func_ov002_0229ade0(0x11, flag, ret, 0);
            *(int *)(data_ov002_022cf288 + (flag & 1) * 0x868) |= 4;
        }
        *(int *)(data_ov002_022ce950 + 0x810) =
            *(int *)(data_ov002_022ce950 + 0x810) + 1;
        return;
    }
    if (st == 2) {
        if (func_ov002_0229c7f8(0x11) == 0)
            *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
