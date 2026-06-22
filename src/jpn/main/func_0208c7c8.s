; func_0208c7c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208c7c8
        .arm
func_0208c7c8:
    ldr r2, _LIT0
    ldr r1, [r2]
    bic r1, r1, #0x7
    orr r0, r1, r0
    str r0, [r2]
    bx lr
_LIT0: .word 0x04001000
