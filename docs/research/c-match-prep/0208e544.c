/* CAMPAIGN-PREP candidate for func_0208e544 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     global-direct read (no local)->reload-for-call2; if-else 2-way; volatile fixed-addr loop store
 *   risk:       reg-alloc: orig saves NO callee reg and reloads handle from global for call2; if mwcc pushes r4 to cache handle it emits `mov r0,r4` not `ldr;ldr`. reshape-able (already global-direct to force reload).
 *   confidence: med
 */
/* func_0208e544 (main, class C) — handle-valid dispatch (async DMA vs Fill32) + clear loop.
 * if (data_0210249c != -1): func_02093ee0(handle,0x4000330,0,0x10,0,0); func_020940ac(handle,0x4000360,0,0x60);
 * else: Fill32(0,0x4000330,0x10); Fill32(0,0x4000360,0x60);
 * then 0x20x: *(volatile u32*)0x40004d0 = 0 (same addr, no ptr increment).
 * Global read DIRECTLY (no local) so call2's arg reloads from the global; frame keeps no callee-save. */
typedef unsigned int u32;

extern int  data_0210249c;
extern void func_02093ee0(int handle, void *dst, int a, int b, int c, int d);
extern void func_020940ac(int handle, void *dst, int a, int b);
extern void Fill32(int val, void *dst, int n);

void func_0208e544(void)
{
    int i;
    if (data_0210249c != -1) {
        func_02093ee0(data_0210249c, (void *)0x04000330, 0, 0x10, 0, 0);
        func_020940ac(data_0210249c, (void *)0x04000360, 0, 0x60);
    } else {
        Fill32(0, (void *)0x04000330, 0x10);
        Fill32(0, (void *)0x04000360, 0x60);
    }
    for (i = 0; i < 0x20; i++)
        *(volatile u32 *)0x040004d0 = 0;
}
