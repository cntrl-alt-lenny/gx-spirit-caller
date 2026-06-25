/* CAMPAIGN-PREP candidate for func_02242ea8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind 0x1518 to reg; asymmetric (x<<17)>>23 raw; stacked 5th arg; final strh
 *   risk:       022575c8 is called here with 3 args yet a matched .c declares it void(void); honoring the 3-arg extern is required to emit mov r1/r2. struct-guessed/sig-conflict — confirm 022575c8's real arity. Secondary: 0x1518 in r9 + 2 in r8 held across loop = reg-alloc (permuter-class).
 *   confidence: med
 */
/* func_ov002_02242ea8: nested loop (i<2, j in [0..4]); for each cell passing
 * the 022575c8(self,i,j) guard, extract a field from u16 (self+4) and call
 * 021d59cc(i, j, 0x1518, 2, field) with the field on the stack. Finally set
 * u16 (self+8)=1. Returns void. Class C: double counted loop, asymmetric
 * shift extract, stacked 5th arg. */
#include "ov002_core.h"
extern int  func_ov002_022575c8(void *self, int i, int j);
extern void func_ov002_021d59cc(int a, int b, int c, int d, int e);

void func_ov002_02242ea8(void *arg0) {
    int i;
    int c = 0x1518;
    int j;
    unsigned int field;
    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 4; j++) {
            if (func_ov002_022575c8(arg0, i, j) != 0) {
                field = ((unsigned int)*(u16 *)((char *)arg0 + 4) << 17) >> 23;
                func_ov002_021d59cc(i, j, c, 2, field);
            }
        }
    }
    *(u16 *)((char *)arg0 + 8) = 1;
}
