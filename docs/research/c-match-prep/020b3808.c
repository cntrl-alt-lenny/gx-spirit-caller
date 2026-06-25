/* CAMPAIGN-PREP candidate for func_020b3808 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alternate-entry / shared-tail wall — ship as .s
 *   risk:       C cannot branch into another function's interior; any C TU links as a separate symbol and breaks the fallthrough — must remain .s
 *   confidence: low
 */
/* func_020b3808 (main, A) — NOT C-MATCHABLE: alternate entry point.
 * asm: stmdb {r4,r5,r6,r7,r11,ip,lr}; mov r4,#0; .word 0xea000001
 * The final word is a raw `b` into the INTERIOR of the next function
 * (func_020b3814 + 8) — an alternate prologue that sets r4=0 then falls into a
 * shared body. mwcc cannot emit a branch into the middle of another function, so
 * this must ship verbatim as .s (the original itself was emitted as a `.word`
 * branch because the target is mid-function). No valid standalone C TU exists. */

/* ship-as-.s:
        .text
        .global func_020b3808
        .arm
func_020b3808:
        stmdb   sp!, {r4, r5, r6, r7, r11, ip, lr}
        mov     r4, #0x0
        .word   0xea000001                      ; b func_020b3814 + 8
*/
