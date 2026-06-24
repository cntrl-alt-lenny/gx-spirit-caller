; func_0208bd50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208bd50
        .arm
func_0208bd50:
    ldr r2, _LIT0
    mov ip, #0x1
    ldr r3, _LIT1
    strh ip, [r2]
    mov ip, #0x0
    str ip, [r3]
    ldr r2, _LIT2
    str r0, [r3, #0x4]
    str r1, [r2]
    str ip, [r2, #0x4]
    bx lr
_LIT0: .word 0x04000280
_LIT1: .word 0x04000290
_LIT2: .word 0x04000298
