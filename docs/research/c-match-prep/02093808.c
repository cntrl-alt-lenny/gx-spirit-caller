/* CAMPAIGN-PREP candidate for func_02093808 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     asm-block (mrs privileged, not C-expressible)
 *   risk:       Belongs as hand .s; relies on mwcc accepting an ARM asm{} body — verify it emits identical bytes.
 *   confidence: low
 */
/* func_02093808: CPSR mode-bits accessor — reads the current processor
 * mode field (CPSR[4:0]). mrs is privileged and NOT expressible in pure C,
 * so this stays an asm body (same rationale as OS_DisableIrq.s). */

asm unsigned long func_02093808(void) {
    nofralloc
    mrs r0, cpsr
    and r0, r0, #0x1f
    bx  lr
}
