/* CAMPAIGN-PREP candidate for func_020ac37c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     strtod wrapper; sp-homed scratch/consumed/errflag; 64-bit pair to range fns; errno=0x22
 *   risk:       STRUCT/ABI-guessed: r4:r5 is a returned 64-bit pair from func_020ab130 (mov r5,r1;mov r4,r0) carried to the end, and r6:r7 is func_020b005c's pair fed to func_020b2ab4/2978. The double-vs-longlong return ABI and which call yields which pair are inferred from reg moves; offsets sp+4/8/c/10 are guessed. struct-guessed: confirm the two helpers' signatures (double args -> r0:r1) and stack slot map against real defs before trusting the diff.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020ac37c (main, class C) - brief p_0053.
 * UNVERIFIED build-free draft.
 *   recipe:     strtod wrapper; many sp-homed args; pass 64-bit r6:r7 pair to range checks
 *   confidence: low (struct-guessed stack layout + double/longlong ABI pairing)
 */
/* strtod-style: r0=str (r7), r1=endptr (r6). Calls __strtod-core func_020ab130
 * with literal state-fn func_020aabac and 3 stack out-slots; converts the result
 * via func_020b005c; range-checks the 64-bit value (r6:r7) and sets errno (data_021aa460=22)
 * on overflow/underflow. Returns the double in r0:r1 (r4:r5). */

extern unsigned int data_021aa460;
extern int func_020aabac(void *m, int dflt, int sel);
extern int func_020ab130(int flags, void *statefn, void *pstr, void *pscratch, void *pconsumed);
extern long long func_020b005c(int a);
extern int func_020b2bdc(int lo, int hi, int alo, int ahi);
extern int func_020b2ab4(int lo, int hi, int clo, int chi);
extern int func_020b2978(int lo, int hi, int clo, int chi);

double func_020ac37c(const char *str, const char **endptr)
{
    const char *s = str;          /* r7 */
    const char **ep = endptr;     /* r6 */
    int scratch = 0;              /* sp+0x8 */
    int consumed;                 /* sp+0x10 */
    int errflag;                  /* sp+0xc */
    void *pstr;
    int rlo, rhi;                 /* r4, r5 (result mantissa pair) */
    long long cvt;                /* r6:r7 reused after */

    scratch = 0;
    pstr = (void *)&s;            /* sp+4 holds str */
    rlo = func_020ab130(0x80000001, (void *)func_020aabac, &pstr, &consumed, &errflag);
    rhi = 0; /* placeholder: r1 of the call */
    if (ep != 0)
        *ep = s + consumed;
    cvt = func_020b005c(rlo);
    if (errflag != 0)
        goto err;
    if (func_020b2bdc(0, 0, rlo, rhi) == 0)
        goto out;
    if (func_020b2ab4((int)cvt, (int)(cvt >> 32), 0, 0x100000))
        goto err;
    if (func_020b2978((int)cvt, (int)(cvt >> 32), -1, 0x7fefffff) > 0)
        goto err;
    goto out;
err:
    data_021aa460 = 0x22;
out:
    { union { long long ll; double d; } u; u.ll = ((long long)rhi << 32) | (unsigned int)rlo; return u.d; }
}
