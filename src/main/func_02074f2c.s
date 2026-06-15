; func_02074f2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eee0
        .extern data_0219ef0c
        .extern func_020705d4
        .extern func_020757e0
        .extern func_02075d44
        .extern func_02077ab4
        .extern func_02077aec
        .extern func_02078f50
        .extern func_0207947c
        .extern func_02094688
        .global func_02074f2c
        .arm
func_02074f2c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov fp, r0
    ldr sl, [fp, #0xc]
    mov r0, #0x3
    strb r0, [sl]
    mov r0, #0x0
    strb r0, [sl, #0x1]
    add r0, sl, #0x2
    mov r1, #0x2e
    bl func_020757e0
    ldr r4, [sl, #0x594]
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1
    ldr r2, [r0]
    add r1, r1, r1, lsr #0x1f
    mov r0, r4
    mov r6, r1, asr #0x1
    blx r2
    movs r5, r0
    moveq r0, #0x9
    addeq sp, sp, #0xc
    streqb r0, [sl, #0x455]
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    mov r0, #0x0
    strb r0, [r5]
    mov r2, #0x2
    add r0, r5, #0x2
    sub r1, r4, #0x33
    strb r2, [r5, #0x1]
    bl func_020757e0
    add r1, r5, r4
    mov r0, sl
    sub r3, r4, #0x31
    mov r7, #0x0
    sub r1, r1, #0x30
    mov r2, #0x30
    strb r7, [r5, r3]
    bl func_02094688
    ldr r1, _LIT0
    mov r0, r6, lsl #0x3
    ldr r1, [r1]
    blx r1
    movs r9, r0
    bne .L_1b0
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1]
    blx r1
    mov r0, #0x9
    add sp, sp, #0xc
    strb r0, [sl, #0x455]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_1b0:
    add r0, r9, r6, lsl #0x1
    add r8, r0, r6, lsl #0x1
    mov r1, r5
    mov r2, r4
    mov r3, r6
    str r0, [sp, #0x4]
    add r7, r8, r6, lsl #0x1
    bl func_02078f50
    ldr r1, _LIT2
    ldr r2, [sl, #0x5a0]
    mov r0, r8
    add r1, sl, r1
    mov r3, r6
    bl func_02078f50
    ldr r1, _LIT3
    mov r0, r7
    mov r2, r4
    add r1, sl, r1
    mov r3, r6
    bl func_02078f50
    bl func_02077aec
    mov r3, r6
    mov r6, r0
    ldr r1, [sp, #0x4]
    mov r2, r8
    mov r0, r9
    str r7, [sp]
    bl func_0207947c
    mov r0, r6
    bl func_02077ab4
    ldr r1, _LIT0
    add r0, r4, #0x49
    ldr r1, [r1]
    blx r1
    movs r6, r0
    bne .L_274
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1]
    blx r1
    ldr r1, _LIT1
    mov r0, r9
    ldr r1, [r1]
    blx r1
    mov r0, #0x9
    add sp, sp, #0xc
    strb r0, [sl, #0x455]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_274:
    mov r0, #0x16
    strb r0, [r6]
    mov r1, #0x3
    add r0, r4, #0x4
    strb r1, [r6, #0x1]
    mov r1, #0x0
    strb r1, [r6, #0x2]
    mov r1, r0, asr #0x8
    strb r1, [r6, #0x3]
    add r2, r6, #0x9
    strb r0, [r6, #0x4]
    mov r0, #0x10
    strb r0, [r6, #0x5]
    mov r0, r4, asr #0x10
    strb r0, [r6, #0x6]
    mov r0, r4, asr #0x8
    strb r0, [r6, #0x7]
    mov r0, r2
    strb r4, [r6, #0x8]
    ands r1, r4, #0x1
    beq .L_2e0
    add r0, r4, r4, lsr #0x1f
    mov r0, r0, asr #0x1
    mov r0, r0, lsl #0x1
    ldrh r1, [r9, r0]
    add r0, r2, #0x1
    strb r1, [r2]
.L_2e0:
    add r1, r4, r4, lsr #0x1f
    mov r1, r1, asr #0x1
    subs r7, r1, #0x1
    bmi .L_318
.L_2f0:
    mov r3, r7, lsl #0x1
    ldrh r1, [r9, r3]
    add r2, r0, #0x1
    subs r7, r7, #0x1
    mov r1, r1, asr #0x8
    strb r1, [r0]
    ldrh r1, [r9, r3]
    add r0, r0, #0x2
    strb r1, [r2]
    bpl .L_2f0
.L_318:
    mov r2, #0x0
    mov r0, r6
    mov r3, r2
    add r1, r4, #0x9
    str fp, [sp]
    bl func_020705d4
    mov r0, sl
    add r1, r6, #0x5
    add r2, r4, #0x4
    bl func_02075d44
    ldr r1, _LIT1
    mov r0, r6
    ldr r1, [r1]
    blx r1
    ldr r1, _LIT1
    mov r0, r9
    ldr r1, [r1]
    blx r1
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1]
    blx r1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219eee0
_LIT1: .word data_0219ef0c
_LIT2: .word 0x00000598
_LIT3: .word 0x00000494
