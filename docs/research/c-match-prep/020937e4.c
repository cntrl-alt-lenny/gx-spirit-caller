/* CAMPAIGN-PREP candidate for func_020937e4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     asm-in-.legacy.c CPSR replace-mask-from-arg (privileged)
 *   risk:       None structurally — asm block assembles verbatim under mwcc 1.2/sp2p3. The single arg arrives in r0 and is used in the orr; bic/and 0xc0 immediates emit literally.
 *   confidence: high
 */
/*
 * func_020937e4 (0x020937e4, size 0x18): replace CPSR I+F mask bits
 * (6,7) with the bits passed in r0, returning the previous mask. The
 * IRQ/FIQ restore primitive. Privileged mrs/msr -> `asm` function via
 * .legacy.c routing (mwcc 1.2/sp2p3). The `register` arg keeps the
 * value in r0 as the original expects, matching func_02092e6c's style.
 */

asm unsigned long func_020937e4(register unsigned long newMask)
{
        mrs     r1, cpsr
        bic     r2, r1, #0xc0
        orr     r2, r2, r0
        msr     cpsr_c, r2
        and     r0, r1, #0xc0
        bx      lr
}
