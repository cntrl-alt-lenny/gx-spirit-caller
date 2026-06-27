/* CAMPAIGN-PREP candidate for func_0208f780 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     threshold dispatch: bind handle (reuse r0), free add p+b base-first
 *   risk:       reg-alloc: handle must reuse loaded r0 not reload, and p (inner-ret) may land in ip vs a callee-saved reg; reshape-able via decl-order if it flips.
 *   confidence: med
 */
/* func_0208f780 (main, cls C): clone-dispatch copy-vs-func.
 * Shape proven by sibling cluster (docs/research/c-match-prep/0208f850.c,
 * 0208f8b8.c): inner returns u8*; read handle once; threshold dispatch. */
typedef unsigned char u8;
typedef unsigned int  u32;

extern int  data_0210249c;
extern u8  *func_0208de4c(void *a);
extern void func_02094030(int handle, void *a, void *src, u32 size);
extern void Copy32(void *a, void *src, u32 size);

void func_0208f780(void *a, int b, u32 c)
{
    u8 *p = func_0208de4c(a);
    int handle = data_0210249c;
    if (handle != -1 && c > 0x30)
        func_02094030(handle, a, p + b, c);
    else
        Copy32(a, p + b, c);
}
