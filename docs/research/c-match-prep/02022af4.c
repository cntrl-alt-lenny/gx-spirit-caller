/* CAMPAIGN-PREP candidate for func_02022af4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: mul P[i]*(y-x) -> helper(.,y); bind d; store-order; if(d&2) negate out[0..2] in place
 *   risk:       reshape-able: orig binds d=(y-x) in r5 across the 3 muls AND the tst d&2; out(r4) held. The negate block re-loads each out[i] then rsb then stores in field order — must not collapse. First bl has implicit r1=y. struct-guessed: P int[3], arg2 truly unused (no reg load).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02022af4 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: D: mul P[i]*(y-x) -> func_020b3870(.,y); store-order out[0..2]; if(d&2) negate-in-place out[0..2]; arg2 unused.
 */
extern int func_020b3870(int num, int den);

int func_02022af4(int x, int y, int unused, int *P, int *out) {
    int d = y - x;                                /* sub r5, r7(y), r0(x) */
    out[0] = func_020b3870(P[0] * d, y);
    out[1] = func_020b3870(P[1] * d, y);
    out[2] = func_020b3870(P[2] * d, y);
    if (d & 2) {                                  /* tst r5,#2; beq */
        out[0] = -out[0];                         /* ldr; rsb #0; str */
        out[1] = -out[1];
        out[2] = -out[2];
    }
    return 1;
}
