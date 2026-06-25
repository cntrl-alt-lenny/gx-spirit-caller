/* CAMPAIGN-PREP candidate for func_0208f6b0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone of proven f850 template; bind p(ip), handle in r0; c unsigned->bls; free add p+b
 *   risk:       reg-alloc: handle must reuse the loaded r0 (orig does); mwcc could reload from global or pick ip vs callee-save for p. reshape-able — template (func_0208f850) already byte-matched with this exact form.
 *   confidence: high
 */
/* func_0208f6b0 (main, class C) — handle-valid dispatch (async DMA vs Copy32).
 * Byte-identical structure to the PROVEN-matched func_0208f850 template (brief 302),
 * only the inner base-getter differs: func_0208dd9c instead of func_0208deec.
 *   p = func_0208dd9c(a); h = data_0210249c;
 *   if (h != -1 && c > 0x30) func_02094030(h, a, p+b, c); else Copy32(a, p+b, c);
 * a->r6, b->r5, c->r4; p->ip; h reused in r0 from the load (no callee-save copy). */
typedef unsigned char u8;
typedef unsigned int  u32;

extern int  data_0210249c;
extern u8  *func_0208dd9c(void *a);
extern void func_02094030(int handle, void *dst, void *src, u32 size);
extern void Copy32(void *dst, void *src, u32 size);

void func_0208f6b0(void *a, int b, u32 c)
{
    u8 *p = func_0208dd9c(a);
    int handle = data_0210249c;
    if (handle != -1 && c > 0x30)
        func_02094030(handle, a, p + b, c);
    else
        Copy32(a, p + b, c);
}
