; func_0209aa80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a82f8
        .extern data_021a8300
        .extern func_020904f4
        .extern func_02090574
        .extern func_02093720
        .extern func_02093bf0
        .extern func_0209a760
        .extern func_0209a954
        .extern func_0209a990
        .extern func_0209acf0
        .extern func_0209ad68
        .extern func_0209ae54
        .extern func_0209af20
        .extern func_0209b0ec
        .extern func_020a5f8c
        .global func_0209aa80
        .arm
func_0209aa80:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    ldr r3, _LIT0
    mov sl, r0
    ldr r0, [r3]
    mov r9, r1
    mov fp, r2
    mov r8, #0x0
    bl func_0209a760
    ldr r1, _LIT1
    mov r0, r8
    ldrh r4, [r1]
    strh r0, [r1]
    bl OS_DisableIrq
    str r0, [sp]
    ldr r0, _LIT2
    bl func_020904f4
    str r0, [sp, #0x4]
    mov r0, #0x40000
    bl func_02090574
    ldr r0, [sp]
    bl OS_RestoreIrq
    ldr r2, _LIT1
    mov r1, #0x1
    ldrh r0, [r2]
    ands r0, sl, #0x8
    strh r1, [r2]
    beq .L_80
    ldr r0, _LIT3
    ldrh r0, [r0]
    cmp r0, #0x2
    biceq sl, sl, #0x8
.L_80:
    ands r0, sl, #0x10
    beq .L_94
    bl func_020a5f8c
    cmp r0, #0x0
    biceq sl, sl, #0x10
.L_94:
    ldr r0, _LIT4
    mov r1, #0x4000000
    ldr r7, [r1]
    ldr r6, [r0]
    bl func_0209a954
    str r0, [sp, #0x8]
    add r0, sp, #0xc
    add r1, sp, #0x10
    bl func_0209acf0
    mov r0, #0x2
    mov r1, #0x0
    bl func_0209ae54
    ldr r2, _LIT5
    ldr r0, [r2]
    str r0, [sp, #0x14]
.L_d0:
    ldr r1, [r2]
    ldr r0, [sp, #0x14]
    cmp r0, r1
    beq .L_d0
    ldr r0, [r2]
    mov r2, #0x4000000
    str r0, [sp, #0x14]
    ldr r0, [r2]
    ldr r1, _LIT4
    bic r0, r0, #0x30000
    str r0, [r2]
    ldr r0, [r1]
    bic r0, r0, #0x10000
    str r0, [r1]
    ldr r2, _LIT5
.L_10c:
    ldr r1, [r2]
    ldr r0, [sp, #0x14]
    cmp r0, r1
    beq .L_10c
    ldr r0, [r2]
    str r0, [sp, #0x14]
    ldr r2, _LIT5
.L_128:
    ldr r1, [r2]
    ldr r0, [sp, #0x14]
    cmp r0, r1
    beq .L_128
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x10]
    orr r0, sl, r0, lsl #0x5
    orr r0, r0, r1, lsl #0x6
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    orr r0, r9, fp
    mov r0, r0, lsl #0x10
    mov r9, r0, lsr #0x10
.L_15c:
    mov r0, r5
    mov r1, r9
    bl func_0209b0ec
    cmp r0, #0x0
    bne .L_15c
    bl func_02093bf0
    ldr r0, _LIT6
    bl func_02093720
    ands r0, sl, #0x8
    beq .L_194
    ldr r0, _LIT7
    ldr r0, [r0]
    ands r0, r0, #0x100000
    movne r8, #0x1
.L_194:
    cmp r8, #0x0
    bne .L_1d8
    ldr r0, [sp, #0x8]
    cmp r0, #0x1
    bne .L_1c0
    mov r0, #0x1
    mov r1, r0
    mov r2, r0
    mov r3, #0x0
    bl func_0209a990
    b .L_1c8
.L_1c0:
    mov r0, #0x1
    bl func_0209af20
.L_1c8:
    mov r1, #0x4000000
    ldr r0, _LIT4
    str r7, [r1]
    str r6, [r0]
.L_1d8:
    bl OS_DisableIrq
    ldr r0, [sp, #0x4]
    bl func_02090574
    ldr r0, [sp]
    bl OS_RestoreIrq
    ldr r1, _LIT1
    cmp r8, #0x0
    ldrh r0, [r1]
    strh r4, [r1]
    beq .L_204
    bl func_0209ad68
.L_204:
    ldr r0, _LIT8
    ldr r0, [r0]
    bl func_0209a760
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021a82f8
_LIT1: .word 0x04000208
_LIT2: .word 0x003fffff
_LIT3: .word 0x027ffc40
_LIT4: .word 0x04001000
_LIT5: .word 0x027ffc3c
_LIT6: .word 0x00996a00
_LIT7: .word 0x04000214
_LIT8: .word data_021a8300
