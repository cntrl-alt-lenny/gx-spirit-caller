/* CAMPAIGN-PREP candidate for func_02092e38 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     asm-in-.legacy.c CP15 coprocessor read+mask (privileged)
 *   risk:       None structurally — asm block assembles verbatim under mwcc 1.2/sp2p3; only risk is the =0xfffff000 literal pool placement, which matches the sibling OS_protectionUnit files.
 *   confidence: high
 */
/*
 * func_02092e38 (0x02092e38, size 0x10): read CP15 c9/c1/0 (DTCM region
 * register), mask off the size/enable low bits, return the base (top 20
 * bits). Privileged `mrc` is not expressible in mwcc C, so this ships as
 * an `asm` function via .legacy.c routing (mwcc 1.2/sp2p3) — exactly the
 * pattern used by the neighbouring OS_protectionUnit/Region functions
 * (func_02092e4c/5c/6c) that already match byte-for-byte.
 */

asm unsigned long func_02092e38(void)
{
        mrc     p15, 0x0, r0, c9, c1, 0x0
        ldr     r1, =0xfffff000
        and     r0, r0, r1
        bx      lr
}
