/* CAMPAIGN-PREP candidate for func_0206c9b0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     predicated tails (addne sp/mvnne); ldrsh-masked flag guards; strh then tail-call
 *   risk:       Orig keeps the 'sub sp,#4' slot and pays it back per-tail (addne sp,#4) — implies a spilled local; if mwcc allocates no frame the predicated epilogues won't form. reshape-able only by inducing a spill; otherwise permuter-class.
 *   confidence: med
 */
/* func_0206c9b0 (main, class D) — guard chain then store + tail call. */
typedef signed short s16;

extern int func_0206e4a4(void *a);
extern int func_0206c84c(void *cmd);

int func_0206c9b0(void *cmd, int a)
{
    char *p = (char *)cmd;

    if (func_0206e4a4(p) != 0) {
        return -0x1c;
    }
    if (!(p != 0 && (*(s16 *)(p + 0x70) & 0x1))) {
        return -0x27;
    }
    if (*(s16 *)(p + 0x70) & 0x2) {
        return -0x7;
    }
    *(unsigned short *)(p + 0x74) = (unsigned short)a;
    if (*(signed char *)(p + 0x73) != 1) {
        return 0;
    }
    return func_0206c84c(p);
}
