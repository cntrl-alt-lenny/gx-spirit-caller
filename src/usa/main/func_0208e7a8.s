; func_0208e7a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208e618
        .global func_0208e7a8
        .arm
func_0208e7a8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
.L_c:
    ldr r0, [r2]
    ands r0, r0, #0x8000000
    bne .L_c
    ldr r0, [r2]
    ldr r1, _LIT1
    orr r0, r0, #0x8000
    str r0, [r2]
    ldrh r0, [r1]
    orr r0, r0, #0x2000
    strh r0, [r1]
    ldrh r0, [r1]
    orr r0, r0, #0x1000
    strh r0, [r1]
    bl func_0208e618
    ldr r2, _LIT2
    ldr r0, _LIT3
    ldr r1, _LIT4
    str r2, [r0]
    mov r2, #0x0
    ldr r0, _LIT5
    str r2, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x04000600
_LIT1: .word 0x04000060
_LIT2: .word 0x001f0080
_LIT3: .word 0x040004a4
_LIT4: .word 0x040004a8
_LIT5: .word 0x040004ac
