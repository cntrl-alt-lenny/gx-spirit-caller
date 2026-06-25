/* CAMPAIGN-PREP candidate for func_020a2cbc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     align-up (x+0x1f)&~0x1f; sequential calls; tail call
 *   risk:       must route .legacy.c or epilogue mismatches; r4/r5/r6 cache order of saved args may differ; bic vs and lowering
 *   confidence: med
 */
/* func_020a2cbc — align-up wrapper, 3 calls, final tail call.
 * Style A epilogue (ldmia {r4,r5,r6,lr}; bx lr) -> ROUTE AS *.legacy.c (mwcc 1.2/sp2p3).
 * a=r0 (ptr/size), b=r1, c=r2 (heap/handle).
 */

extern int func_02092904(int heap, int aligned_size);
extern void func_02092928(void);
extern int func_020a36dc(int c, int a, int b);

int func_020a2cbc(int a, int b, int c)
{
    func_02092904(c, (a + 0x1f) & ~0x1f);
    func_02092928();
    return func_020a36dc(c, a, b);
}
