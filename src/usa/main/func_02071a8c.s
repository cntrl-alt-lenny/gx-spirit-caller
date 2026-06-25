; func_02071a8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0207214c
        .extern func_02072288
        .extern func_0207229c
        .extern func_020723e0
        .extern func_020917e8
        .extern func_020918f0
        .extern func_02094688
        .global func_02071a8c
        .arm
func_02071a8c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r8, r0
    mov r7, r1
    mov r6, r2
    bl func_020723e0
    movs r5, r0
    bne .L_40
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, #0x0
    bl func_0207214c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_40:
    ldrh r3, [r7, #0x8]
    ldrh r1, [r7, #0xa]
    ldrb r4, [r7, #0xd]
    mov r2, r3, asr #0x8
    orr r2, r2, r3, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r3, r1, asr #0x8
    mov r2, r2, lsr #0x10
    orr r1, r3, r1, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r2, r1, lsr #0x10
    str r1, [r5, #0x30]
    ldrh r9, [r7, #0x4]
    ldrh r1, [r7, #0x6]
    ldrb r3, [r5, #0x8]
    mov r2, r9, asr #0x8
    orr r2, r2, r9, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r9, r1, asr #0x8
    mov r2, r2, lsr #0x10
    orr r1, r9, r1, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    cmp r3, #0x4
    orr r2, r2, r1, lsr #0x10
    bne .L_cc
    ldr r1, [r5, #0x24]
    cmp r1, r2
    beq .L_cc
    mov r1, #0x0
    bl func_0207229c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_cc:
    ldrh r1, [r7, #0xe]
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    strh r0, [r5, #0x2c]
    ldrb r0, [r5, #0x8]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_2fc
    b .L_114
    b .L_2fc
    b .L_114
    b .L_12c
    b .L_158
    b .L_2fc
    b .L_2d8
    b .L_264
    b .L_264
    b .L_2d8
.L_114:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, #0x0
    bl func_0207214c
    b .L_318
.L_12c:
    mov r0, #0x4
    strb r0, [r5, #0x8]
    ldr r0, [r5, #0x4]
    cmp r0, #0x1
    bne .L_150
    mov r0, #0x0
    str r0, [r5, #0x4]
    ldr r0, [r5]
    bl func_020918f0
.L_150:
    cmp r6, #0x0
    beq .L_318
.L_158:
    ldr r0, [r5, #0x34]
    add r0, r0, #0x1
    str r0, [r5, #0x34]
    ldr r1, [r5, #0x3c]
    ldr r0, [r5, #0x44]
    sub r0, r1, r0
    cmp r6, r0
    movhi r9, #0x0
    movhi r6, r0
    movls r9, #0x1
    cmp r6, #0x0
    beq .L_1f4
    bl OS_DisableIrq
    ldrb r1, [r7, #0xc]
    ldr ip, [r5, #0x40]
    ldr r3, [r5, #0x44]
    and r2, r1, #0xf0
    mov r1, r2, asr #0x1
    add r1, r2, r1, lsr #0x1e
    mov r8, r0
    mov r2, r6
    add r0, r7, r1, asr #0x2
    add r1, ip, r3
    bl func_02094688
    ldr r1, [r5, #0x44]
    mov r0, r8
    add r1, r1, r6
    str r1, [r5, #0x44]
    ldr r1, [r5, #0x24]
    add r1, r1, r6
    str r1, [r5, #0x24]
    bl OS_RestoreIrq
    ldr r0, [r5, #0x4]
    cmp r0, #0x2
    bne .L_1f4
    mov r0, #0x0
    str r0, [r5, #0x4]
    ldr r0, [r5]
    bl func_020918f0
.L_1f4:
    cmp r9, #0x0
    beq .L_24c
    ands r0, r4, #0x1
    beq .L_24c
    mov r0, #0x6
    strb r0, [r5, #0x8]
    ldr r1, [r5, #0x24]
    mov r0, r5
    add r2, r1, #0x1
    mov r1, #0x0
    str r2, [r5, #0x24]
    bl func_02072288
    cmp r6, #0x0
    bne .L_318
    ldr r0, [r5, #0x4]
    cmp r0, #0x2
    bne .L_318
    mov r0, #0x0
    str r0, [r5, #0x4]
    ldr r0, [r5]
    bl func_020918f0
    b .L_318
.L_24c:
    cmp r6, #0x0
    beq .L_318
    mov r0, r5
    mov r1, #0x0
    bl func_0207229c
    b .L_318
.L_264:
    ands r0, r4, #0x1
    beq .L_2ac
    ldr r1, [r5, #0x24]
    add r0, r6, #0x1
    add r2, r1, r0
    mov r0, r5
    mov r1, #0x0
    str r2, [r5, #0x24]
    bl func_0207229c
    mov r1, #0x0
    strb r1, [r5, #0x8]
    ldr r0, [r5, #0x4]
    cmp r0, #0x2
    bne .L_318
    str r1, [r5, #0x4]
    ldr r0, [r5]
    bl func_020918f0
    b .L_318
.L_2ac:
    cmp r6, #0x0
    beq .L_2cc
    ldr r1, [r5, #0x24]
    mov r0, r5
    add r2, r1, r6
    mov r1, #0x0
    str r2, [r5, #0x24]
    bl func_0207229c
.L_2cc:
    mov r0, #0x8
    strb r0, [r5, #0x8]
    b .L_318
.L_2d8:
    mov r1, #0x0
    strb r1, [r5, #0x8]
    ldr r0, [r5, #0x4]
    cmp r0, #0x2
    bne .L_318
    str r1, [r5, #0x4]
    ldr r0, [r5]
    bl func_020918f0
    b .L_318
.L_2fc:
    ands r0, r4, #0x1
    ldrne r0, [r5, #0x24]
    mov r1, #0x0
    addne r0, r0, #0x1
    strne r0, [r5, #0x24]
    mov r0, r5
    bl func_0207229c
.L_318:
    bl func_020917e8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
