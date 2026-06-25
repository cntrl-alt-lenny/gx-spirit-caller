/* CAMPAIGN-PREP candidate for func_0226de80 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     eor x=arg0^i; nested i<2/j<=4; mvn -1 arg; OR-test two near constants k==A||k==A+2
 *   risk:       orig materializes 0x13e5 once (r5) and derives 0x13e7 as r5+2 (add r4,r5,#2); mwcc will most likely load 0x13e7 independently, so the 2nd compare's constant setup diverges. permuter-class (shipped .s; also 8 callee regs + reg-mirror).
 *   confidence: low
 */
/* func_ov002_0226de80: precondition func_021bcd80(arg0,-1) >= 2; then nested
 * loop i:0..1 x j:0..4 with x = arg0 ^ i (eor). For each (x,j) that passes the
 * 021bc8c8 gate, fetch a tag via 021b9ecc and succeed (return 1) iff tag is
 * 0x13e5 or 0x13e7. Deep 8-reg callee-save frame; currently ships as .s. */
#include "ov002_core.h"

extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021bc8c8(int a, int b, int c);
extern int func_ov002_021bcd80(int a, int b);

int func_ov002_0226de80(int arg0) {
    int i, j, k, x;
    if (func_ov002_021bcd80(arg0, -1) < 2) return 0;
    for (i = 0; i < 2; i++) {
        x = arg0 ^ i;
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021bc8c8(arg0, x, j) == 0) continue;
            k = func_ov002_021b9ecc(x, j);
            if (k == 0x13e5 || k == 0x13e7) return 1;
        }
    }
    return 0;
}
