/* CAMPAIGN-PREP candidate for func_020a7268 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl s,d,cnt,budget,i in alloc order; bind strlen; if-assign advance
 *   risk:       func_020a71e4 result feeds addgt r7 AND subgt r5 under one cmp; if mwcc re-cmps or splits the gt-predicated add/sub, advance diverges. reshape-able: single if(k<=0)return, then unconditional s+=k;budget-=k.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020a7268 (main, class C) - brief p_0053.
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe:     decl-order src,dst,cnt,budget,i; bind strlen result; if-assign advance
 *   confidence: med
 */
/* mbstowcs-style: r0=wide dst (stride 2, strh), r1=mb src, r2=n wides.
 * func_020aaddc(src) = signed-byte strlen -> remaining mb budget (r5).
 * func_020a71e4(wdst, src, budget) = mbtowc; returns mb-bytes consumed (>0) or <=0 on error. */

extern int func_020aaddc(const char *s);
extern int func_020a71e4(unsigned short *wdst, const char *src, int budget);

int func_020a7268(unsigned short *dst, const char *src, unsigned int n)
{
    const char *s = src;        /* r7 */
    unsigned short *d = dst;    /* r8 */
    unsigned int cnt = n;       /* r6 */
    int budget;                 /* r5 */
    int i = 0;                  /* r4 */

    budget = func_020aaddc(s);
    if (d == 0 || cnt == 0)
        return 0;
    do {
        int k;
        if (*s == 0) { *d = 0; return i; }
        k = func_020a71e4(d, s, budget);
        d++;
        if (k <= 0) return -1;
        s += k;
        budget -= k;
        i++;
    } while ((unsigned int)i < cnt);
    return i;
}
