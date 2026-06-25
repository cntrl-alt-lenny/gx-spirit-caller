; func_0209a1bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a82b4
        .global func_0209a1bc
        .arm
func_0209a1bc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r4, r0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streqh r1, [r0, #0x30]
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    bl OS_DisableIrq
    ldrsh lr, [r4, #0x4]
    cmp lr, #0x0
    beq .L_8c
    ldr r5, _LIT1
    mov ip, #0x0
    ldr r2, _LIT2
    strh ip, [r5]
    mov r3, #0x10000000
    ldr r1, _LIT3
    str r3, [r2]
    str lr, [r1]
    str ip, [r1, #0x4]
    ldrsh r2, [r4]
    ldr r1, _LIT0
    str r2, [r1, #0x18]
    ldrsh r2, [r4, #0x4]
    str r2, [r1, #0x1c]
.L_6c:
    ldrh r1, [r5]
    ands r1, r1, #0x8000
    bne .L_6c
    ldr r2, _LIT4
    ldr r1, _LIT0
    ldr r2, [r2]
    str r2, [r1, #0x20]
    b .L_a0
.L_8c:
    ldr r1, _LIT0
    mov r2, #0x0
    str r2, [r1, #0x18]
    str r2, [r1, #0x1c]
    str r2, [r1, #0x20]
.L_a0:
    ldrsh r5, [r4, #0x6]
    cmp r5, #0x0
    beq .L_104
    ldr ip, _LIT1
    mov lr, #0x0
    ldr r2, _LIT2
    strh lr, [ip]
    mov r3, #0x10000000
    ldr r1, _LIT3
    str r3, [r2]
    str r5, [r1]
    str lr, [r1, #0x4]
    ldrsh r2, [r4, #0x2]
    ldr r1, _LIT0
    str r2, [r1, #0x24]
    ldrsh r2, [r4, #0x6]
    str r2, [r1, #0x28]
.L_e4:
    ldrh r1, [ip]
    ands r1, r1, #0x8000
    bne .L_e4
    ldr r2, _LIT4
    ldr r1, _LIT0
    ldr r2, [r2]
    str r2, [r1, #0x2c]
    b .L_118
.L_104:
    ldr r1, _LIT0
    mov r2, #0x0
    str r2, [r1, #0x24]
    str r2, [r1, #0x28]
    str r2, [r1, #0x2c]
.L_118:
    bl OS_RestoreIrq
    ldr r0, _LIT0
    mov r1, #0x1
    strh r1, [r0, #0x30]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a82b4
_LIT1: .word 0x04000280
_LIT2: .word 0x04000290
_LIT3: .word 0x04000298
_LIT4: .word 0x040002a0
