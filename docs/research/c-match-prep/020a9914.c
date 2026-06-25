/* CAMPAIGN-PREP candidate for func_020a9914 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     epilogue-only fragment — not C-expressible, ship as .s
 *   risk:       no C produces a standalone epilogue symbol; any C body adds a prologue -> never matches; keep as .s
 *   confidence: low
 */
/* func_020a9914 (main, class A) — NOT a C-expressible function: the body
 * is a bare shared epilogue (deallocate 0x10, pop {r3-r11,pc}) that some
 * other function jumps into after a split. No C translation-unit compiles
 * to an epilogue-only symbol, so this must remain a hand-written .s TU.
 * Shipped verbatim below as the byte-exact target.
 */
        .text
        .global func_020a9914
        .arm
func_020a9914:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
