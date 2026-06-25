/* CAMPAIGN-PREP candidate for func_020937d0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     asm-in-.legacy.c CPSR set-bits (privileged mrs/msr)
 *   risk:       None structurally — asm block assembles verbatim under mwcc 1.2/sp2p3. orr/and immediate 0xc0 emit literally; same routing as the matched sibling asm functions.
 *   confidence: high
 */
/*
 * func_020937d0 (0x020937d0, size 0x14): set CPSR I+F bits (0xc0,
 * disable both IRQ and FIQ), returning the previous values of bits 6+7.
 * Privileged mrs/msr -> `asm` function via .legacy.c routing
 * (mwcc 1.2/sp2p3), as with the matched OS_protectionUnit siblings.
 */

asm unsigned long func_020937d0(void)
{
        mrs     r0, cpsr
        orr     r1, r0, #0xc0
        msr     cpsr_c, r1
        and     r0, r0, #0xc0
        bx      lr
}
