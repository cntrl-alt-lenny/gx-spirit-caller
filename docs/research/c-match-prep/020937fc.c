/* CAMPAIGN-PREP candidate for func_020937fc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     asm-in-.legacy.c CPSR read & mask (privileged mrs)
 *   risk:       None structurally — asm block assembles verbatim under mwcc 1.2/sp2p3. Three-instruction body (mrs/and #0x80/bx) emits literally; same routing as matched siblings.
 *   confidence: high
 */
/*
 * func_020937fc (0x020937fc, size 0xc): read the CPSR I-bit (bit 7) and
 * return it masked (0x80 if IRQs disabled, else 0) — OS_GetIrqDisable
 * state. Privileged mrs -> `asm` function via .legacy.c routing
 * (mwcc 1.2/sp2p3), as with the matched OS_protectionUnit siblings.
 */

asm unsigned long func_020937fc(void)
{
        mrs     r0, cpsr
        and     r0, r0, #0x80
        bx      lr
}
