/* CAMPAIGN-PREP candidate for func_020a72f0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     movs null-test on d; wide arg r9; 1-word stack mbbuf=sp+0; accumulate r7
 *   risk:       stmdb pushes r3 (8-reg even-align). The combined `cmpne r9,#0 / moveq r0,#0 / ldmeqia` entry guard is one fused null-check on BOTH d and s; mwcc may emit two separate branches. reshape-able: keep `if(!d||!s)return 0;` (short-circuit) so the second test is predicated off the first.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020a72f0 (main, class C) - brief p_0053.
 * UNVERIFIED build-free draft.
 *   recipe:     stack wchar temp (add r6,sp,#0); decl r4,r9,r8 in alloc order; movs null-test
 *   confidence: med
 */
/* wcstombs-style: r0=mb dst (r4), r1=wide src (r9, stride 2 ldrh), r2=cap (r8).
 * func_020a724c(&mbbuf, wch... ) = wctomb into a 1-word stack scratch, returns mb len (r5).
 * func_020aaec0(mbdst, &mbbuf, len) = memcpy. Loop accumulates into r7. */

extern int func_020a724c(char *mbbuf, unsigned int wch);
extern void func_020aaec0(char *dst, const char *src, int len);

int func_020a72f0(char *dst, const unsigned short *src, unsigned int cap)
{
    char *d = dst;                 /* r4 (movs r4,r0) */
    const unsigned short *s = src; /* r9 */
    unsigned int cp = cap;         /* r8 */
    unsigned int total = 0;        /* r7 */
    char mbbuf[4];                 /* r6 = sp+0 */

    if (d == 0 || s == 0)
        return 0;
    for (;;) {
        int len;
        unsigned short wc = *s;
        if (wc == 0) { d[total] = 0; break; }
        s++;
        len = func_020a724c(mbbuf, wc);
        if (total + (unsigned int)len > cp) break;
        func_020aaec0(d + total, mbbuf, len);
        total += len;
        if (total > cp) break;
    }
    return total;
}
