/* CAMPAIGN-PREP candidate for func_020b41c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     privileged SWI debugger trap — ship as .s
 *   risk:       no C construct emits `swi 0x123456` byte-exact; already shipped as src/main/func_020b41c0.s — C path impossible
 *   confidence: low
 */
/* func_020b41c0 (main, A) — NOT C-MATCHABLE: privileged SWI thunk.
 * asm: str lr,[sp,#-4]!; mov r1,r0; mov r0,#3; swi 0x123456; ldr pc,[sp],#4
 * mwcc cannot emit `swi 0x123456` from C; documented .s wall (codegen-walls C-8,
 * brief 029). Ships verbatim as .s. */

/* ship-as-.s:
        .text
        .global func_020b41c0
        .arm
func_020b41c0:
        str     lr, [sp, #-0x4]!
        mov     r1, r0
        mov     r0, #0x3
        swi     0x123456
        ldr     pc, [sp], #0x4
*/
