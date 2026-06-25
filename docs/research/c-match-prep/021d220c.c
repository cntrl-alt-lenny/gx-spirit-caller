/* CAMPAIGN-PREP candidate for func_021d220c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order flag,st,h2 to match r5/r1/r4 alloc; h2 kept in callee-saved across both calls; (flag&1)*0x868 OR-RMW
 *   risk:       orig loads +0x810 then h@4-style h2 into r4 BEFORE the state cmp; if mwcc emits the h2 ldrh after the branch, the prologue load order diverges. reshape-able (decl/read-order).
 *   confidence: med
 */
/* func_ov002_021d220c (ov002, class C) — campaign-prep, UNVERIFIED.
 * flag from sign-bit; h2=h@2. 2-state on +0x810: 0 -> func_021c9b2c(flag,1,h2),
 * post cmd 0x12, and if h2!=0 OR bit2 into cf288[(flag&1)*0x868], then bump;
 * 1 -> if func_0229c7f8(0x12)==0 clear +0x80c. */
#include "ov002_core.h"

extern char data_ov002_022cf288[];
extern void func_ov002_021c9b2c(int flag, int one, int h2);
extern int  func_ov002_0229c7f8(int cmd);

void func_ov002_021d220c(void) {
    int flag;
    int st;
    int h2;
    flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    st = *(int *)(data_ov002_022ce950 + 0x810);
    h2 = *(u16 *)(data_ov002_022ce950 + 0x2);
    if (st == 0) {
        func_ov002_021c9b2c(flag, 1, h2);
        func_ov002_0229ade0(0x12, flag, h2, 0);
        if (h2 != 0)
            *(int *)(data_ov002_022cf288 + (flag & 1) * 0x868) |= 4;
        *(int *)(data_ov002_022ce950 + 0x810) =
            *(int *)(data_ov002_022ce950 + 0x810) + 1;
        return;
    }
    if (st == 1) {
        if (func_ov002_0229c7f8(0x12) == 0)
            *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
