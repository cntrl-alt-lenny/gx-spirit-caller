; func_0201af9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b5a8c
        .extern data_020b6dd0
        .extern data_02102b84
        .extern func_02013990
        .extern func_020139a0
        .extern func_02018a88
        .extern func_02018f4c
        .extern func_02018f5c
        .extern func_0201908c
        .extern func_0201909c
        .extern func_020193f8
        .extern func_0201a010
        .extern func_0201a084
        .extern func_0201a0dc
        .extern func_0201a3b8
        .extern func_0201a464
        .extern func_0201ad60
        .global func_0201af9c
        .arm
func_0201af9c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x74
    str r0, [sp]
    mov sl, r2
    mov r9, r3
    bl GetSystemWork
    bl func_020139a0
    bl func_02018f4c
    bl func_02018a88
    bl func_02018f4c
    mov fp, r0
    bl func_02013990
    ldr r6, _LIT0
    str r0, [sp, #0x18]
    ldr r1, [r6, #0x8]
    ldr r7, [r6]
    ldr r5, [r6, #0x4]
    umull ip, r8, r1, r7
    mla r8, r1, r5, r8
    ldr r0, [r6, #0xc]
    ldr r3, [r6, #0x10]
    mla r8, r0, r7, r8
    mov r4, #0x0
    ldr r2, [r6, #0x14]
    adds r5, r3, ip
    adc ip, r2, r8
    umull r8, r7, r1, r5
    mla r7, r1, ip, r7
    mla r7, r0, r5, r7
    adds r0, r3, r8
    mov r4, r4, lsl #0x2
    stmia r6, {r5, ip}
    adc r1, r2, r7
    mov lr, #0x65
    stmia r6, {r0, r1}
    umull r0, r5, r1, lr
    mov r0, #0x0
    mla r5, r1, r0, r5
    mla r5, r0, lr, r5
    orr r4, r4, ip, lsr #0x1e
    bl func_0201a010
    cmp r0, r5
    movhi r0, #0x1
    movls r0, #0x0
    muls r0, r4, r0
    str r0, [sp, #0x2c]
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_120
    ldr r2, _LIT0
    mov r1, #0x0
    ldr r3, [r2]
    ldmib r2, {r0, r4}
    umull r6, r5, r4, r3
    mla r5, r4, r0, r5
    ldr r0, [r2, #0xc]
    ldr r4, [r2, #0x10]
    mla r5, r0, r3, r5
    ldr r0, [r2, #0x14]
    adds r6, r4, r6
    adc r5, r0, r5
    mov r0, #0x65
    umull r3, r4, r5, r0
    mla r4, r5, r1, r4
    str r6, [r2]
    mla r4, r1, r0, r4
    str r5, [r2, #0x4]
    bl func_0201a084
    cmp r0, r4
    movhi r0, #0x1
    movls r0, #0x0
.L_120:
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    beq .L_13c
    ldr r0, [sp, #0x2c]
    sub r0, r0, #0x1
    str r0, [sp, #0x10]
.L_13c:
    mov r4, #0x0
    bl func_0201908c
    mov r6, r0
    bl func_0201a3b8
    str r0, [sp, #0x28]
    bl func_0201a464
    str r0, [sp, #0x24]
    add r0, sp, #0x34
    str r0, [sp, #0x1c]
    mov r0, #0x10000
    mov r5, r4
    rsb r0, r0, #0x0
    str r5, [r9]
    str r0, [sp, #0x30]
.L_174:
    add r7, r5, #0x1
    bl func_02018f5c
    mov r8, r0
    bl func_02018f4c
    mov r1, #0x64
    mla r1, r0, r1, r8
    str r1, [sp, #0x20]
    ldr r0, _LIT1
    rsb r1, r7, r7, lsl #0x3
    ldrsb r1, [r0, r1]
    ldr r0, [sp, #0x30]
    str r1, [sp, #0x14]
    cmp r1, r0, asr #0x10
    beq .L_354
    mov r1, r7
    mov r0, #0x28
    mul r8, r1, r0
    mov r0, fp
    bl func_02018a88
    str r0, [sp, #0xc]
    mov r0, r6
    bl func_0201909c
    ldr r1, [sp, #0xc]
    cmp r0, #0x0
    sub r3, r1, #0x1
    moveq r0, #0x1
    ldr r1, _LIT2
    mov r2, #0xf00
    mla r1, r3, r2, r1
    add r2, r1, r8
    movne r0, #0x0
    mov r1, #0x14
    mul r1, r0, r1
    ldrsh r1, [r2, r1]
    ldr r0, [sp, #0x20]
    cmp r0, r1
    blt .L_354
    mov r0, fp
    bl func_02018a88
    str r0, [sp, #0x8]
    mov r0, r6
    bl func_0201909c
    ldr r1, [sp, #0x8]
    mov r2, #0xf00
    sub r3, r1, #0x1
    ldr r1, _LIT2
    cmp r0, #0x0
    mla r1, r3, r2, r1
    moveq r0, #0x1
    add r2, r1, r8
    movne r0, #0x0
    mov r1, #0x14
    mla r1, r0, r1, r2
    ldrsh r1, [r1, #0x2]
    ldr r0, [sp, #0x20]
    cmp r0, r1
    bgt .L_354
    mov r0, fp
    bl func_02018a88
    str r0, [sp, #0x4]
    mov r0, r6
    bl func_0201909c
    ldr r1, [sp, #0x4]
    mov r2, #0xf00
    sub r3, r1, #0x1
    ldr r1, _LIT2
    cmp r0, #0x0
    mla r1, r3, r2, r1
    moveq r0, #0x1
    add r2, r1, r8
    movne r0, #0x0
    mov r1, #0x14
    mla r1, r0, r1, r2
    ldr r0, [sp, #0x18]
    add r0, r0, r1
    ldrb r1, [r0, #0x4]
    ldr r0, [sp]
    cmp r0, r1
    bne .L_354
    cmp r7, #0x2f
    bne .L_2c8
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_354
    b .L_32c
.L_2c8:
    mov r0, r7
    bl func_020193f8
    cmp r0, #0x0
    beq .L_2f8
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    beq .L_354
    mov r0, r7
    bl func_0201a0dc
    cmp r0, #0x0
    bne .L_354
    b .L_32c
.L_2f8:
    ldr r0, [sp, #0x14]
    cmp r0, #0x3
    beq .L_310
    cmp r0, #0x4
    beq .L_320
    b .L_32c
.L_310:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_354
    b .L_32c
.L_320:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_354
.L_32c:
    ldr r0, [sp, #0x1c]
    mov r1, r7, lsl #0x10
    ldr r2, [r0]
    ldr r0, [sp, #0x30]
    add r4, r4, #0x1
    and r0, r2, r0
    orr r1, r0, r1, lsr #0x10
    ldr r0, [sp, #0x1c]
    str r1, [r0], #0x4
    str r0, [sp, #0x1c]
.L_354:
    add r5, r5, #0x1
    cmp r5, #0x5f
    blt .L_174
    ldr r0, [sp]
    bl func_0201ad60
    ldr r0, [sp]
    bl func_0201ad60
    ldr r1, _LIT0
    add r0, r0, #0x0
    ldr r3, [r1]
    ldmib r1, {r2, r5}
    umull r7, r6, r5, r3
    mla r6, r5, r2, r6
    ldr r2, [r1, #0xc]
    ldr r8, [r1, #0x10]
    mla r6, r2, r3, r6
    ldr r5, [r1, #0x14]
    adds r2, r8, r7
    adc r5, r5, r6
    stmia r1, {r2, r5}
    cmp r0, #0x0
    beq .L_3c0
    mov r3, #0x0
    umull r2, r1, r5, r0
    mla r1, r5, r3, r1
    mla r1, r3, r0, r1
    mov r5, r1
.L_3c0:
    cmp r4, #0x0
    moveq r0, #0x0
    streq r0, [r9]
    ldr r0, [sp]
    add r2, r5, #0x1
    cmp r0, #0x10
    movgt r2, #0x1
    cmp r4, r2
    bgt .L_444
    cmp r4, #0x0
    addle sp, sp, #0x74
    mov r0, #0x0
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r2, #0x10000
    add r1, sp, #0x34
    rsb r2, r2, #0x0
.L_400:
    ldr r6, [r9]
    ldr r3, [r1], #0x4
    ldr r5, [sl, r6, lsl #0x2]
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    and r5, r5, r2
    mov r3, r3, lsl #0x10
    orr r3, r5, r3, lsr #0x10
    str r3, [sl, r6, lsl #0x2]
    ldr r3, [r9]
    add r0, r0, #0x1
    add r3, r3, #0x1
    str r3, [r9]
    cmp r0, r4
    blt .L_400
    add sp, sp, #0x74
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_444:
    cmp r2, #0x0
    addle sp, sp, #0x74
    mov r3, #0x0
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_454:
    ldr r0, _LIT0
    ldr r5, [r0]
    ldmib r0, {r1, r6}
    umull r8, r7, r6, r5
    mla r7, r6, r1, r7
    ldr r1, [r0, #0xc]
    ldr r6, [r0, #0x10]
    mla r7, r1, r5, r7
    ldr r1, [r0, #0x14]
    adds r6, r6, r8
    adc r5, r1, r7
    str r6, [r0]
    str r5, [r0, #0x4]
    cmp r4, #0x0
    beq .L_4a4
    mov r6, #0x0
    umull r1, r0, r5, r4
    mla r0, r5, r6, r0
    mla r0, r6, r4, r0
    mov r5, r0
.L_4a4:
    add r0, sp, #0x34
    ldr r1, [r9]
    ldr r7, [r0, r5, lsl #0x2]
    mov r6, #0x10000
    mov r7, r7, lsl #0x10
    ldr r8, [sl, r1, lsl #0x2]
    rsb r6, r6, #0x0
    mov r7, r7, lsr #0x10
    and r8, r8, r6
    mov r6, r7, lsl #0x10
    orr r6, r8, r6, lsr #0x10
    str r6, [sl, r1, lsl #0x2]
    ldr r1, [r9]
    sub r6, r4, #0x1
    add r1, r1, #0x1
    str r1, [r9]
    cmp r5, r6
    bge .L_504
.L_4ec:
    add r1, r0, r5, lsl #0x2
    ldr r1, [r1, #0x4]
    str r1, [r0, r5, lsl #0x2]
    add r5, r5, #0x1
    cmp r5, r6
    blt .L_4ec
.L_504:
    add r3, r3, #0x1
    cmp r3, r2
    sub r4, r4, #0x1
    blt .L_454
    add sp, sp, #0x74
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102b84
_LIT1: .word data_020b5a8c
_LIT2: .word data_020b6dd0
