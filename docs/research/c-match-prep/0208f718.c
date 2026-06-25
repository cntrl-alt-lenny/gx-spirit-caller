/* CAMPAIGN-PREP candidate for func_0208f718 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone of proven f850 template; inner=ddec; bind p(ip), handle r0; c unsigned->bls
 *   risk:       reg-alloc: handle r0-reuse vs reload; p in ip vs callee-save. reshape-able — identical to f850 which matched byte-exact; only the bl target symbol changes.
 *   confidence: high
 */
/* func_0208f718 (main, class C) — clone dispatch; inner base-getter func_0208ddec.
 * Byte-identical structure to the PROVEN-matched func_0208f850 template (brief 302),
 * only the inner getter differs (func_0208ddec). Same handle-valid + size>0x30 guard.
 * NOTE: the extern sig for func_0208ddec here is TU-local (made to take `a`) so codegen
 * passes `a` in r0 at the call, matching `mov r6,r0; bl`. */
typedef unsigned char u8;
typedef unsigned int  u32;

extern int  data_0210249c;
extern u8  *func_0208ddec(void *a);
extern void func_02094030(int handle, void *dst, void *src, u32 size);
extern void Copy32(void *dst, void *src, u32 size);

void func_0208f718(void *a, int b, u32 c)
{
    u8 *p = func_0208ddec(a);
    int handle = data_0210249c;
    if (handle != -1 && c > 0x30)
        func_02094030(handle, a, p + b, c);
    else
        Copy32(a, p + b, c);
}
