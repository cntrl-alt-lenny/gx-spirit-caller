/* CAMPAIGN-PREP candidate for func_020225b4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: bind dst=base+a0*0x10 once (loop-invariant), inline j*4; load a1[j], store +0x4c
 *   risk:       orig binds r3=data_02197434+a0*0x10 before loop and reloads a1[j] each iter; if mwcc strength-reduces dst into a pointer-walk or fails to CSE a0*0x10, the inner add/str pattern diverges. reshape-able (keep dst hoisted as written)
 *   confidence: med
 */
/* func_020225b4: guard data_0219747c[a0]>=0, else 0; copy a2 words from a1
 * into data_02197434[a0] strip at +0x4c; return 1. */

extern char data_02197434[];
extern char data_0219747c[];

int func_020225b4(int a0, int *a1, int a2) {
    if (*(int *)(data_0219747c + (a0 << 4)) < 0) return 0;
    {
        char *dst = data_02197434 + (a0 << 4);
        int j;
        for (j = 0; j < a2; j++) {
            *(int *)(dst + (j << 2) + 0x4c) = a1[j];
        }
    }
    return 1;
}
