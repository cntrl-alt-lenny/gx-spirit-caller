/* CAMPAIGN-PREP candidate for func_020b41d4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     privileged SWI debugger trap — ship as .s
 *   risk:       no C construct emits `swi 0x123456`; already shipped as src/main/func_020b41d4.s — C path impossible
 *   confidence: low
 */
/* func_020b41d4 (main, A) — NOT C-MATCHABLE: privileged SWI thunk (selector 7).
 * asm: str lr,[sp,#-4]!; mov r1,#0; mov r0,#7; swi 0x123456; ldr pc,[sp],#4
 * Sibling of 020b41c0; mwcc cannot emit `swi`. Ships verbatim as .s. */

/* ship-as-.s:
        .text
        .global func_020b41d4
        .arm
func_020b41d4:
        str     lr, [sp, #-0x4]!
        mov     r1, #0x0
        mov     r0, #0x7
        swi     0x123456
        ldr     pc, [sp], #0x4
*/
