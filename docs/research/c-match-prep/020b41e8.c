/* CAMPAIGN-PREP candidate for func_020b41e8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     privileged SWI debugger trap — ship as .s
 *   risk:       no C construct emits `swi 0x123456`; already shipped as src/main/func_020b41e8.s — C path impossible
 *   confidence: low
 */
/* func_020b41e8 (main, A) — NOT C-MATCHABLE: privileged SWI thunk (selector 0x18).
 * asm: mov r1,#0; mov r0,#0x18; swi 0x123456; mov pc,lr
 * Frameless sibling of 020b41c0/d4; mwcc cannot emit `swi`. Ships verbatim as .s. */

/* ship-as-.s:
        .text
        .global func_020b41e8
        .arm
func_020b41e8:
        mov     r1, #0x0
        mov     r0, #0x18
        swi     0x123456
        mov     pc, lr
*/
