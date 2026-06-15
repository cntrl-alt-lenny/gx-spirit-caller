; func_0209ab74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a83d8
        .extern data_021a83e0
        .extern func_020905dc
        .extern func_0209065c
        .extern func_02093814
        .extern func_02093bf0
        .extern func_0209a854
        .extern func_0209aa48
        .extern func_0209aa84
        .extern func_0209ade4
        .extern func_0209ae5c
        .extern func_0209af48
        .extern func_0209b014
        .extern func_0209b1e0
        .extern func_020a5f8c
        .global func_0209ab74
        .arm
func_0209ab74:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    ldr r3, _LIT0
    mov sl, r0
    ldr r0, [r3]
    mov r9, r1
    mov fp, r2
    mov r8, #0x0
    bl func_0209a854
    ldr r1, _LIT1
    mov r0, r8
    ldrh r4, [r1]
    strh r0, [r1]
    bl OS_DisableIrq
    str r0, [sp]
    ldr r0, _LIT2
    bl func_020905dc
    str r0, [sp, #0x4]
    mov r0, #0x40000
    bl func_0209065c
    ldr r0, [sp]
    bl OS_RestoreIrq
    ldr r2, _LIT1
    mov r1, #0x1
    ldrh r0, [r2]
    ands r0, sl, #0x8
    strh r1, [r2]
    beq .L_170
    ldr r0, _LIT3
    ldrh r0, [r0]
    cmp r0, #0x2
    biceq sl, sl, #0x8
.L_170:
    ands r0, sl, #0x10
    beq .L_184
    bl func_020a5f8c
    cmp r0, #0x0
    biceq sl, sl, #0x10
.L_184:
    ldr r0, _LIT4
    mov r1, #0x4000000
    ldr r7, [r1]
    ldr r6, [r0]
    bl func_0209aa48
    str r0, [sp, #0x8]
    add r0, sp, #0xc
    add r1, sp, #0x10
    bl func_0209ade4
    mov r0, #0x2
    mov r1, #0x0
    bl func_0209af48
    ldr r2, _LIT5
    ldr r0, [r2]
    str r0, [sp, #0x14]
.L_1c0:
    ldr r1, [r2]
    ldr r0, [sp, #0x14]
    cmp r0, r1
    beq .L_1c0
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
.L_1fc:
    ldr r1, [r2]
    ldr r0, [sp, #0x14]
    cmp r0, r1
    beq .L_1fc
    ldr r0, [r2]
    str r0, [sp, #0x14]
    ldr r2, _LIT5
.L_218:
    ldr r1, [r2]
    ldr r0, [sp, #0x14]
    cmp r0, r1
    beq .L_218
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x10]
    orr r0, sl, r0, lsl #0x5
    orr r0, r0, r1, lsl #0x6
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    orr r0, r9, fp
    mov r0, r0, lsl #0x10
    mov r9, r0, lsr #0x10
.L_24c:
    mov r0, r5
    mov r1, r9
    bl func_0209b1e0
    cmp r0, #0x0
    bne .L_24c
    bl func_02093bf0
    ldr r0, _LIT6
    bl func_02093814
    ands r0, sl, #0x8
    beq .L_284
    ldr r0, _LIT7
    ldr r0, [r0]
    ands r0, r0, #0x100000
    movne r8, #0x1
.L_284:
    cmp r8, #0x0
    bne .L_2c8
    ldr r0, [sp, #0x8]
    cmp r0, #0x1
    bne .L_2b0
    mov r0, #0x1
    mov r1, r0
    mov r2, r0
    mov r3, #0x0
    bl func_0209aa84
    b .L_2b8
.L_2b0:
    mov r0, #0x1
    bl func_0209b014
.L_2b8:
    mov r1, #0x4000000
    ldr r0, _LIT4
    str r7, [r1]
    str r6, [r0]
.L_2c8:
    bl OS_DisableIrq
    ldr r0, [sp, #0x4]
    bl func_0209065c
    ldr r0, [sp]
    bl OS_RestoreIrq
    ldr r1, _LIT1
    cmp r8, #0x0
    ldrh r0, [r1]
    strh r4, [r1]
    beq .L_2f4
    bl func_0209ae5c
.L_2f4:
    ldr r0, _LIT8
    ldr r0, [r0]
    bl func_0209a854
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021a83d8
_LIT1: .word 0x04000208
_LIT2: .word 0x003fffff
_LIT3: .word 0x027ffc40
_LIT4: .word 0x04001000
_LIT5: .word 0x027ffc3c
_LIT6: .word 0x00996a00
_LIT7: .word 0x04000214
_LIT8: .word data_021a83e0
