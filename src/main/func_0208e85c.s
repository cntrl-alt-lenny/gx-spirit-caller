; func_0208e85c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208e43c
        .global func_0208e85c
        .arm
func_0208e85c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    bl func_0208e43c
    ldr r1, _LIT1
.L_1c4:
    ldr r0, [r1]
    ands r0, r0, #0x8000000
    bne .L_1c4
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x04000400
_LIT1: .word 0x04000600
