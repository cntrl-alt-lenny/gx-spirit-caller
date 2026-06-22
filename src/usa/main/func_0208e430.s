; func_0208e430 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208e430
        .arm
func_0208e430:
    ldr r2, _LIT0
    ldr r1, [r2]
    ands r1, r1, #0x4000
    ldreq r1, [r2]
    mvnne r0, #0x0
    andeq r1, r1, #0x1f00
    moveq r1, r1, lsr #0x8
    streq r1, [r0]
    moveq r0, #0x0
    bx lr
_LIT0: .word 0x04000600
