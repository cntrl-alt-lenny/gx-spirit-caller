/* CAMPAIGN-PREP candidate for func_0226cf50 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch over cmp;beq chain; inline d9c reload per tail (no ptr bind); other=1-arg0 via rsb
 *   risk:       the two cases share an identical 'd9c++ ; return 0' tail; mwcc may MERGE them into one epilogue where orig duplicates it (L_620/L_640), diverging on the shared block. permuter-class (inline-vs-branch, C-form can't force duplication).
 *   confidence: med
 */
/* func_ov002_0226cf50: two early-out guards (cd744[arg0]==1; other-player
 * cf17c[0]==0) then a 3-way dispatch on *(d016c+0xd9c). cases 0 and 1 share an
 * 'increment d9c, return 0' tail; default returns 1. d016c base + d9c value are
 * RELOADED in each tail (orig re-emits ldr base; ldr [+0xd9c]) -> inline the
 * access, don't bind a pointer. */
#include "ov002_core.h"

extern int func_ov002_021af9d0(int a, int b, int c, int d);

int func_ov002_0226cf50(int arg0) {
    int other = 1 - arg0;
    if (data_ov002_022cd744[arg0] == 1) return 1;
    if (*(int *)((char *)data_ov002_022cf17c + (other & 1) * 0x868) == 0)
        return 1;
    switch (*(int *)(data_ov002_022d016c + 0xd9c)) {
    case 0:
        func_ov002_021ae400(arg0, 0xf9);
        *(int *)(data_ov002_022d016c + 0xd9c) += 1;
        return 0;
    case 1:
        func_ov002_021af9d0(other, 2, -1, 13);
        *(int *)(data_ov002_022d016c + 0xd9c) += 1;
        return 0;
    default:
        return 1;
    }
}
