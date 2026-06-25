/* CAMPAIGN-PREP candidate for func_021badb0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl base in r4; field loads as self[idx]; preserve guard order; movne r0,#0 early-return
 *   risk:       the [r4,#0x8]!=0 branch: orig falls through to the bl func_021bd85c tail for BOTH arms, but the else-arm (0202f9e8==1) is nested before it. if mwcc duplicates the 021bd85c tail or reorders, control-flow blocks differ. reshape-able (adjust if/else nesting).
 *   confidence: med
 */
/* func_ov002_021badb0 (ov002, class C): guard chain of calls w/ early
 * returns. Returns 1 only if every guard passes; any failing guard -> 0. */
extern int func_0202e270(int a);
extern int func_0202f9e8(int a);
extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bd85c(int a, int b);

int func_ov002_021badb0(int *self) {
    if (func_0202e270(self[4])) {            /* [r4,#0x10] */
        if (self[13]) return 0;              /* [r4,#0x34] */
        if (func_ov002_021bb068(0x166c)) return 0;
        if (self[2]) {                        /* [r4,#0x8] */
            if (func_ov002_021b3ecc(0, 0xb, 0x12bf)) return 0;
        } else if (func_0202f9e8(self[4]) == 1) {
            if (func_ov002_021bb068(0x148e)) return 0;
            if (func_ov002_021bb068(0x14da)) return 0;
        }
        if (func_ov002_021bd85c(self[4], self[3])) return 0; /* [r4,#0x10],[r4,#0xc] */
    }
    return 1;
}
