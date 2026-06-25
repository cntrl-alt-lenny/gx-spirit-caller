/* CAMPAIGN-PREP candidate for func_02093790 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     asm-in-.legacy.c CPSR clear-bit (privileged mrs/msr)
 *   risk:       None structurally — asm block assembles verbatim under mwcc 1.2/sp2p3 (same routing as func_02092e4c/5c/6c). bic/and immediate 0x80 emit literally.
 *   confidence: high
 */
/*
 * func_02093790 (0x02093790, size 0x14): clear CPSR I-bit (bit 7,
 * re-enable IRQs), returning the previous value of that bit. Privileged
 * mrs/msr are not expressible in mwcc C — ship as an `asm` function via
 * .legacy.c routing (mwcc 1.2/sp2p3), matching the neighbouring
 * OS_protectionUnit asm-function siblings that already match.
 */

asm unsigned long func_02093790(void)
{
        mrs     r0, cpsr
        bic     r1, r0, #0x80
        msr     cpsr_c, r1
        and     r0, r0, #0x80
        bx      lr
}
