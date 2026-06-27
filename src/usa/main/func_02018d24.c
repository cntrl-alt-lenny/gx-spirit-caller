/* CAMPAIGN-PREP candidate for func_02018d24 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod: constant-divisor /40 magic, keep n*4+20 pre-scale unsimplified
 *   risk:       reshape-able: if mwcc folds (n*4+20)/40 to (n+5)/10 the pre-scale shifts diverge; pin the literal form. Magic match itself is high-confidence.
 *   confidence: med
 */
/* func_02018d24 (main, class D) — constant-divisor magic-divide (0x66666667 asr#4 = /40).
 * UNVERIFIED build-free draft; MED tier, expect iteration.
 * Sequence: p=r0(->r4 across calls). GetSystemWork() (side effect, result discarded).
 * func_02011ab8(p, 0) (side effect). n = func_02011a48(). Then r0=n<<2; r1=r0+0x14;
 * result = (n*4+20)/40 + 1. The /40 is the 0x66666667 magic with asr#4 (proven /40).
 * KEEP the pre-scale literal: write (n*4 + 20)/40, NOT the algebraically-equal (n+5)/10,
 * so mwcc emits lsl#2;add#0x14 before the magic, matching the asm's r0<<2 / add r1,#0x14. */
extern char *GetSystemWork(void);
extern void func_02011ab8(int a, int b);
extern int func_02011a48(void);

int func_02018d24(int p) {
    int n;
    GetSystemWork();
    func_02011ab8(p, 0);
    n = func_02011a48();
    return (n * 4 + 20) / 40 + 1;
}
