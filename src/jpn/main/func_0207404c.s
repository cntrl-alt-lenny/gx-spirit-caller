; func_0207404c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ee30
        .extern data_0219efd8
        .extern func_020918f0
        .extern func_020919f8
        .global func_0207404c
        .arm
func_0207404c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl OS_DisableIrq
    mov r5, r0
    ldr r0, _LIT0
    bl func_020919f8
    movs r4, r0
    bne .L_40
    ldr r1, _LIT1
    ldr r0, [r1]
    cmp r0, #0x0
    bne .L_40
    ldr r0, _LIT0
    mov r2, #0x1
    str r2, [r1]
    bl func_020918f0
.L_40:
    mov r0, r5
    bl OS_RestoreIrq
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_0219efd8
_LIT1: .word data_0219ee30
