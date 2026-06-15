; func_0208be9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208be9c
        .arm
func_0208be9c:
    ldr r1, _LIT0
    mov r3, #0x1
    ldr r2, _LIT1
    strh r3, [r1]
    mov ip, #0x0
    str ip, [r2]
    mov r3, #0x1000
    ldr r1, _LIT2
    str r3, [r2, #0x4]
    str r0, [r1]
    str ip, [r1, #0x4]
    bx lr
_LIT0: .word 0x04000280
_LIT1: .word 0x04000290
_LIT2: .word 0x04000298
