/* CAMPAIGN-PREP candidate for func_021d20b0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag ?1:0; unsigned bound checks; (flag&1)*0x868 inline index; long long helper for r1 reuse
 *   risk:       func_020b3a7c return-ABI guessed: orig does `mov r3,r1` after the bl; if it isn't a 64-bit return mwcc won't route r1->r3. struct-guessed.
 *   confidence: med
 */
/* func_ov002_021d20b0 (ov002, class C) — campaign-prep, UNVERIFIED.
 * flag = sign-bit of h@0. Index event table cf178 by (flag&1)*0x868: if the
 * word there is unsigned >=2, bail by clearing +0x80c. Else, gate on +0x810:
 * if >0x20 clear +0x80c; else bump +0x810, call func_020b3a7c(old>>1) and post
 * cmd 7 with the helper's high return word as arg3. */
#include "ov002_core.h"

extern long long func_020b3a7c(int a);

void func_ov002_021d20b0(void) {
    int flag;
    int n;
    int v;
    long long r;
    flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    if (*(unsigned int *)(data_ov002_022cf178 + (flag & 1) * 0x868) < 2) {
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
        return;
    }
    v = *(int *)(data_ov002_022ce950 + 0x810);
    if ((unsigned int)v > 0x20) {
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
        return;
    }
    *(int *)(data_ov002_022ce950 + 0x810) = v + 1;
    n = (unsigned int)v >> 1;
    r = func_020b3a7c(n);
    func_ov002_0229ade0(7, flag, 0xb, (int)(r >> 32));
}
