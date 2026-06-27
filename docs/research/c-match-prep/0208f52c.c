/* CAMPAIGN-PREP candidate for func_0208f52c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     020900a0 template + 3rd global; dst=(base0+b)-base1 (base0-first add then sub base1); 2 stack zeros vs Copy32
 *   risk:       orig loads base0/base1 into lr/r4 and does add-then-sub before the cmp; if mwcc reorders the sub past the -1 compare or reloads a global, the pre-branch arithmetic diverges. reshape-able (precompute order) but extra global raises reg-pressure. struct-guessed bases.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208f52c (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Marshalling wrapper — sub-compute base.
 * Three globals: base0=data_021a6330, base1=data_021a632c, handle=data_0210249c.
 * dst = (data_021a6330 + b) - data_021a632c  (orig: add r5,lr(base0),r1(b);
 * sub r4,r5,r4(base1) — base0-first add, then subtract base1). Both bases and
 * the add/sub are computed before the -1 compare. handle!=-1 ->
 * func_02093e38(handle, a, dst, n, 0, 0) else Copy32(a, dst, n).
 * Note arg a stays in r0 then `mov r1,r0` -> a is func_02093e38's src (r1). */
extern void Copy32(void *dst, void *src, int n);
extern void func_02093e38(int handle, void *src, void *dst, int n, int e, int f);
extern int  data_0210249c;
extern int  data_021a632c;
extern int  data_021a6330;

void func_0208f52c(void *a, int b, int n)
{
    int handle = data_0210249c;
    char *dst = ((char *)data_021a6330 + b) - data_021a632c;
    if (handle != -1)
        func_02093e38(handle, a, dst, n, 0, 0);
    else
        Copy32(a, dst, n);
}
