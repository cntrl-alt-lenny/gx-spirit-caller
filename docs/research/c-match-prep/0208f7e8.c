/* CAMPAIGN-PREP candidate for func_0208f7e8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     threshold dispatch (clone of f780); bind handle, add p+b base-first
 *   risk:       same as f780: handle r0-reuse vs reload and p reg-choice (ip vs callee-save) may flip; reshape-able. threshold 0x30 and -1 sentinel fixed.
 *   confidence: med
 */
/* func_0208f7e8 (main, cls C): clone of 0208f780, inner = func_0208de94.
 * Same threshold-dispatch recipe as the 0208f8xx sibling cluster. */
typedef unsigned char u8;
typedef unsigned int  u32;

extern int  data_0210249c;
extern u8  *func_0208de94(void *a);
extern void func_02094030(int handle, void *a, void *src, u32 size);
extern void Copy32(void *a, void *src, u32 size);

void func_0208f7e8(void *a, int b, u32 c)
{
    u8 *p = func_0208de94(a);
    int handle = data_0210249c;
    if (handle != -1 && c > 0x30)
        func_02094030(handle, a, p + b, c);
    else
        Copy32(a, p + b, c);
}
