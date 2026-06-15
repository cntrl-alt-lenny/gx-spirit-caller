; func_020a3a2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a98f8
        .extern func_020a3ab4
        .extern func_020a3ac0
        .extern func_020a5668
        .extern func_020a5878
        .global func_020a3a2c
        .arm
func_020a3a2c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, #0x1
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, [r1]
    add r0, r2, #0x500
    ldrh r0, [r0, #0x26]
    cmp r0, #0x0
    bne .L_254
    mov r0, #0x0
    str r0, [r2, #0x5e4]
    ldr r0, [r1]
    mov r1, r5
    add r0, r0, #0x500
    strh r1, [r0, #0x26]
    bl func_020a5878
    cmp r0, #0x0
    beq .L_24c
    ldr r0, _LIT1
    bl func_020a5668
    mov r5, #0x0
    b .L_254
.L_24c:
    bl func_020a3ac0
    mov r5, r0
.L_254:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a98f8
_LIT1: .word func_020a3ab4
