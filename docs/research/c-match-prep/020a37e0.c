/* CAMPAIGN-PREP candidate for func_020a37e0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-arg marshalling; r4-cached return; tail-ish call
 *   risk:       must route .legacy.c; outgoing stack-arg store order [sp]/[sp+4]/[sp+8] vs const hoist; arg4 elision; e zero-extend (ldrh)
 *   confidence: med
 */
/* func_020a37e0 — stack-arg setup, 2 calls, returns first call's result.
 * Style A epilogue (ldmia {r4,lr}; bx lr) -> ROUTE AS *.legacy.c (mwcc 1.2/sp2p3).
 * Incoming: a=r0, b=r1, c=r2, d=r3 (UNUSED), e=[sp,#0x18] (u16, 5th arg).
 * Calls func_0209f2a8(a, 0, b, c, e, 1, 3); arg4 d is discarded.
 */

extern int func_0209f2a8(int a, int z, int b, int c, int e, int one, int three);
extern void func_020a35dc(int kind, int handle);

int func_020a37e0(int a, int b, int c, int d, unsigned short e)
{
    int r = func_0209f2a8(a, 0, b, c, e, 1, 3);
    func_020a35dc(0xf, r);
    return r;
}
