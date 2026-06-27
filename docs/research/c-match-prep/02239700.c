/* CAMPAIGN-PREP candidate for func_02239700 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order i/k/j; bind 0x1a90 to one local kept in reg
 *   risk:       reg-alloc: orig holds 0x1a90 in r4 and inner-init 0 in r6 across both loops; if mwcc reloads the constant or renumbers callee-saved (r7/r9/r4), the mov-block diverges. permuter-class.
 *   confidence: med
 */
/* func_ov002_02239700: nested counted loop over (i<2, j in [0..4]); for each
 * cell that passes the 0225764c guard, dispatch 021d94ac(i, j, 2, 0x1a90).
 * Returns 0. Class C: decl-order + constant-in-reg binding. */
#include "ov002_core.h"
extern int func_ov002_0225764c(void *self, int player, int slot);
extern void func_ov002_021d94ac(int a, int b, int c, int d);

int func_ov002_02239700(void *arg0) {
    int i;
    int k = 0x1a90;
    int j;
    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 4; j++) {
            if (func_ov002_0225764c(arg0, i, j) != 0) {
                func_ov002_021d94ac(i, j, 2, k);
            }
        }
    }
    return 0;
}
