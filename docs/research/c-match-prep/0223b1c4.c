/* CAMPAIGN-PREP candidate for func_0223b1c4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind 0xa to one local; eor key=scalar^i; reload d016c+0xcec each iter
 *   risk:       orig keeps two regs both =0xa (r8,r9) plus the d016c base in r6 across the loop; mwcc may CSE the two 0xa locals into one reg or fail to hold the base, shifting the callee-saved block. permuter-class (reg-mirror).
 *   confidence: med
 */
/* func_ov002_0223b1c4: loop i<2; key = (d016c+0xcec scalar) ^ i; if the
 * 0225764c guard passes for (self, key, 10), run 021d93e0(key, 10, 2).
 * Returns 0. Class C: decl-order + eor-index, base held in reg. */
#include "ov002_core.h"
extern int  func_ov002_0225764c(void *self, int a, int b);
extern void func_ov002_021d93e0(int a, int b, int c);

int func_ov002_0223b1c4(void *arg0) {
    int ten = 0xa;
    int i;
    int key;
    for (i = 0; i < 2; i++) {
        key = *(int *)(data_ov002_022d016c + 0xcec) ^ i;
        if (func_ov002_0225764c(arg0, key, ten) != 0) {
            func_ov002_021d93e0(key, ten, 2);
        }
    }
    return 0;
}
