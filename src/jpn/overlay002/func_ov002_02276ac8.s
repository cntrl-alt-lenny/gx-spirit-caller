; func_ov002_02276ac8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern data_ov002_022d0170
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_0202eeb4
        .extern func_ov002_021ae558
        .extern func_ov002_021b939c
        .extern func_ov002_021babc8
        .extern func_ov002_021bac78
        .extern func_ov002_021c4bbc
        .extern func_ov002_021c83ac
        .extern func_ov002_021c92ec
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021d8fd0
        .extern func_ov002_021d92f0
        .extern func_ov002_021dea94
        .extern func_ov002_021df53c
        .extern func_ov002_021df5e4
        .extern func_ov002_021e2fc4
        .extern func_ov002_021fe2e4
        .extern func_ov002_02253f84
        .extern func_ov002_02256e50
        .extern func_ov002_022767c4
        .extern func_ov002_022861bc
        .global func_ov002_02276ac8
        .arm
func_ov002_02276ac8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x44
    ldr r7, _LIT0
    ldr r2, [r7, #0x18]
    mov r0, r2, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_220c
    b .L_fdc
    b .L_1084
    b .L_1760
    b .L_17f0
    b .L_17f0
    b .L_17f0
    b .L_17f0
    b .L_17f0
    b .L_1800
    b .L_18a4
.L_fdc:
    ldr r2, [r7]
    mov r0, r2, lsl #0x18
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_1054
    mov r0, r2, lsl #0x1f
    ldr r1, _LIT1
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_1040
    add r1, r7, #0x10
    str r1, [sp]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r1, [r7]
    ldrb r3, [r7, #0x8]
    mov r4, r1, lsl #0x9
    mov r2, r1, lsl #0x1a
    mov r1, r4, lsr #0x11
    mov r2, r2, lsr #0x1f
    bl func_ov002_022861bc
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_1054
.L_1040:
    mov r0, r2, lsl #0x1a
    mov r1, r2, lsr #0x17
    mov r2, r0, lsr #0x1f
    mov r0, #0xf7
    bl func_ov002_021ae558
.L_1054:
    ldr r3, _LIT3
    add sp, sp, #0x44
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1084:
    ldr r1, [r7]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_10c0
    ldr r0, _LIT2
    bic r1, r1, #0xc0
    ldr r0, [r0, #0xd44]
    mov r0, r0, lsl #0x1e
    orr r1, r1, r0, lsr #0x18
    mov r0, r1, lsl #0x18
    movs r0, r0, lsr #0x1e
    str r1, [r7]
    orreq r0, r1, #0x20
    streq r0, [r7]
.L_10c0:
    ldr r0, [r7]
    mov r1, r0, lsl #0x1a
    movs r1, r1, lsr #0x1f
    beq .L_1118
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, [r7]
    orr r3, r1, #0x60
    mov r1, r0, lsl #0x9
    mov r0, r0, lsl #0x18
    mov r2, r0, lsr #0x1e
    mov r0, r3, lsl #0x10
    mov r1, r1, lsr #0x11
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    ldrb r3, [r7, #0x8]
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d46ac
.L_1118:
    ldrb r0, [r7, #0x8]
    mov r8, #0x0
    mov r9, r8
    strb r8, [r7, #0x9]
    cmp r0, #0x0
    ble .L_11a8
    mov r5, r8
    mov r6, #0x8000
    mov r4, r8
.L_113c:
    add r0, r7, r9, lsl #0x1
    ldrh r1, [r0, #0x10]
    mov r2, r4
    mov r3, r4
    tst r1, #0xff
    movne r0, r6
    moveq r0, r5
    orr r0, r0, #0x4a
    mov r0, r0, lsl #0x10
    mov r1, r1, asr #0x8
    mov r0, r0, lsr #0x10
    and r1, r1, #0xff
    bl func_ov002_021d46ac
    cmp r9, #0x0
    beq .L_118c
    add r0, r7, r9, lsl #0x1
    ldrh r1, [r0, #0x10]
    ldrh r0, [r0, #0xe]
    cmp r1, r0
    beq .L_1198
.L_118c:
    ldrb r0, [r7, #0x9]
    add r0, r0, #0x1
    strb r0, [r7, #0x9]
.L_1198:
    ldrb r0, [r7, #0x8]
    add r9, r9, #0x1
    cmp r9, r0
    blt .L_113c
.L_11a8:
    cmp r0, #0x0
    mov r6, #0x0
    ble .L_122c
    ldr r4, _LIT4
    ldr r9, _LIT5
    mov r5, #0x1
    mov sl, #0x14
.L_11c4:
    add fp, r7, r6, lsl #0x1
    ldrh r3, [fp, #0x10]
    cmp r6, #0x0
    mov r0, r3, asr #0x8
    and r2, r0, #0xff
    and r1, r3, #0xff
    add r0, r2, r1, lsl #0x4
    orr r8, r8, r5, lsl r0
    ble .L_121c
    ldrh r0, [fp, #0xe]
    cmp r3, r0
    bne .L_121c
    and r1, r1, #0x1
    mla r0, r1, r9, r4
    mla r0, r2, sl, r0
    ldr r1, [r7]
    ldr r0, [r0, #0x30]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x13
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x13
    bl func_ov002_021df5e4
.L_121c:
    ldrb r0, [r7, #0x8]
    add r6, r6, #0x1
    cmp r6, r0
    blt .L_11c4
.L_122c:
    ldr r0, [r7]
    mov r1, r8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021dea94
    ldr r6, [r7]
    ldr r0, [r7]
    mov r1, r6, lsl #0x1b
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne sl, #0x8000
    mov r3, r1, lsr #0x1c
    mov r1, r6, lsl #0x18
    mov r2, r6, lsl #0x1a
    mov r9, r1, lsr #0x1e
    ldrh r5, [r7, #0x16]
    moveq sl, #0x0
    mov r4, r6, lsr #0x17
    mov r1, r6, lsl #0x9
    mov r8, r2, lsr #0x1f
    mov r2, r1, lsr #0x11
    orr r6, sl, #0x4f
    mov r1, r6, lsl #0x10
    and r6, r0, #0x1
    mov r0, r3, lsl #0x1b
    orr r0, r6, r0, lsr #0x1a
    mov r3, r8, lsl #0x1f
    mov r6, r9, lsl #0x1f
    orr r0, r0, r3, lsr #0x11
    orr r0, r0, r6, lsr #0x10
    mov r3, r0, lsl #0x10
    mov r5, r5, lsl #0x1d
    mov r0, r4, lsl #0x1
    add r0, r0, r5, lsr #0x1f
    mov r4, r0, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r1, lsr #0x10
    mov r1, r2, lsr #0x10
    mov r2, r3, lsr #0x10
    mov r3, r4, lsr #0x10
    bl func_ov002_021d46ac
    ldrb r1, [r7, #0x8]
    mov r6, #0x0
    mov r4, r6
    cmp r1, #0x0
    ble .L_1324
    add r0, sp, #0x38
.L_12e8:
    cmp r4, #0x0
    beq .L_1304
    add r2, r7, r4, lsl #0x1
    ldrh r3, [r2, #0x10]
    ldrh r2, [r2, #0xe]
    cmp r3, r2
    beq .L_1318
.L_1304:
    add r2, r7, r4, lsl #0x1
    ldrh r2, [r2, #0x10]
    mov r3, r6
    add r6, r6, #0x1
    str r2, [r0, r3, lsl #0x2]
.L_1318:
    add r4, r4, #0x1
    cmp r4, r1
    blt .L_12e8
.L_1324:
    ldr r2, [r7]
    ldr r3, _LIT6
    mov r0, r2, lsl #0x9
    cmp r3, r0, lsr #0x11
    mov r0, r0, lsr #0x11
    bcc .L_1374
    cmp r0, r3
    bcs .L_1590
    sub r1, r3, #0x39
    cmp r0, r1
    bhi .L_1364
    bcs .L_1494
    sub r1, r3, #0x300
    cmp r0, r1
    beq .L_13e0
    b .L_1730
.L_1364:
    sub r1, r3, #0x34
    cmp r0, r1
    beq .L_151c
    b .L_1730
.L_1374:
    add r2, r3, #0x1dc
    cmp r0, r2
    bhi .L_139c
    mov r1, r2
    cmp r0, r1
    bcs .L_15e4
    add r1, r3, #0x1b0
    cmp r0, r1
    beq .L_15e4
    b .L_1730
.L_139c:
    ldr r3, _LIT7
    cmp r0, r3
    bhi .L_13d0
    sub r2, r3, #0x4
    cmp r0, r2
    bcc .L_1730
    beq .L_1610
    sub r2, r3, #0x1
    cmp r0, r2
    beq .L_1678
    cmp r0, r3
    beq .L_16b0
    b .L_1730
.L_13d0:
    add r2, r3, #0xf
    cmp r0, r2
    beq .L_16e8
    b .L_1730
.L_13e0:
    mov r0, r2, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_1730
    cmp r6, #0x3
    bne .L_1730
    mov sl, #0x0
    mov r9, sl
    mov r8, sl
    cmp r6, #0x0
    ble .L_144c
    add r5, sp, #0x38
    add r4, sp, #0xc
.L_1410:
    ldr r3, [r5, r8, lsl #0x2]
    mov r2, r4
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    and r0, r3, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c4bbc
    ldr r1, [sp, #0x28]
    ldr r0, [sp, #0x2c]
    add r8, r8, #0x1
    cmp r8, r6
    add sl, sl, r1
    add r9, r9, r0
    blt .L_1410
.L_144c:
    ldr r0, _LIT8
    ldr r1, [r7]
    cmp r9, r0
    movgt r9, r0
    ldr r0, _LIT8
    mov r4, r1, lsl #0x1f
    cmp sl, r0
    movgt sl, r0
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsl #0x1b
    mov r3, r0, lsl #0x10
    mov r2, sl, lsl #0x10
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1c
    orr r2, r3, r2, lsr #0x10
    bl func_ov002_021d8fd0
    b .L_1730
.L_1494:
    cmp r6, #0x1
    blt .L_1730
    ldr r2, [sp, #0x38]
    mov r1, r0, lsl #0x10
    and r0, r2, #0xff
    ldr r5, _LIT4
    and r4, r0, #0x1
    sub r0, r3, #0xe20
    mla r3, r4, r0, r5
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r2, r0, #0xff
    mov r0, #0x14
    smulbb r0, r2, r0
    add r2, r3, #0x30
    ldr r3, [r2, r0]
    mov r2, r1, lsr #0x10
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldr r0, [r7]
    mov r3, #0x5
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d58dc
    b .L_1730
.L_151c:
    mov r0, r2, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_1730
    cmp r6, #0x2
    bne .L_1730
    ldr r2, [sp, #0x38]
    ldr r5, [sp, #0x3c]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    and r0, r2, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c83ac
    mov r1, r5, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    mov r4, r0
    and r0, r5, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c83ac
    ldr r1, [r7]
    mov r2, r0
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1c
    add r2, r4, r2
    bl func_ov002_021d8fd0
    b .L_1730
.L_1590:
    mov r0, r2, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_1730
    cmp r6, #0x1
    bne .L_1730
    ldr r2, [sp, #0x38]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    and r0, r2, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c83ac
    ldr r1, [r7]
    mov r2, r0
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r2, r2, lsl #0x1
    bl func_ov002_021d8fd0
    b .L_1730
.L_15e4:
    ldrh r0, [r7, #0x6]
    cmp r0, #0x0
    beq .L_1730
    ldr r0, [r7]
    mov r2, #0x1
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d8fd0
    b .L_1730
.L_1610:
    cmp r1, #0x0
    beq .L_1730
    ldrh r1, [r7, #0xa]
    ldr r0, _LIT9
    mov r1, r1, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202eeb4
    cmp r0, #0x0
    beq .L_1730
    ldrh r1, [r7, #0xa]
    ldr r2, [r7]
    ldr r0, _LIT9
    mov r1, r1, lsl #0x2
    ldrh r0, [r0, r1]
    mov r4, r2, lsl #0x1f
    mov r3, r2, lsl #0x1b
    mov r0, r0, lsl #0x13
    mov r1, r0, lsr #0x13
    mov r0, #0xa
    mul r2, r1, r0
    mov r0, r4, lsr #0x1f
    mov r1, r3, lsr #0x1c
    bl func_ov002_021d8fd0
    b .L_1730
.L_1678:
    cmp r1, #0x0
    bne .L_1730
    mov r1, #0x0
    str r1, [sp]
    ldr r1, [r7]
    mov r2, r0, lsl #0x10
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r2, r2, lsr #0x10
    mov r3, #0x5
    bl func_ov002_021d58dc
    b .L_1730
.L_16b0:
    cmp r6, #0x1
    bne .L_1730
    mov r1, #0x0
    str r1, [sp]
    ldr r1, [r7]
    mov r2, r0, lsl #0x10
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r2, r2, lsr #0x10
    mov r3, #0x5
    bl func_ov002_021d58dc
    b .L_1730
.L_16e8:
    cmp r1, #0x0
    beq .L_1730
    ldrh r4, [r7, #0x10]
    bl func_0202b83c
    mov r1, r4, asr #0x8
    mov r2, r0
    and r0, r4, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c92ec
    cmp r0, #0x0
    beq .L_1730
    ldr r0, [r7]
    mov r2, #0x1
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d8fd0
.L_1730:
    ldr r3, _LIT3
    add sp, sp, #0x44
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1760:
    ldr r0, [r7]
    mov r1, r0, lsl #0x1a
    movs r1, r1, lsr #0x1f
    bne .L_1788
    bic r0, r2, #0xff
    orr r0, r0, #0x9
    str r0, [r7, #0x18]
    add sp, sp, #0x44
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1788:
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, [r7]
    orr r3, r1, #0x2c
    mov r1, r0, lsl #0x9
    mov r0, r0, lsl #0x1b
    mov r2, r0, lsr #0x1c
    mov r0, r3, lsl #0x10
    mov r1, r1, lsr #0x11
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d46ac
    ldr r1, _LIT0
    add sp, sp, #0x44
    ldr r2, [r1, #0x18]
    mov r0, #0x0
    bic r2, r2, #0xff
    orr r2, r2, #0x3
    str r2, [r1, #0x18]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_17f0:
    mov r0, #0x1f
    bl func_ov002_022767c4
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1800:
    ldr r4, [r7]
    ldr r0, _LIT5
    mov r1, r4, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r1, _LIT4
    and r2, r3, #0x1
    mla r1, r2, r0, r1
    mov r0, r4, lsl #0x1b
    mov r4, r0, lsr #0x1c
    mov r0, #0x14
    mla r0, r4, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addeq sp, sp, #0x44
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r3, #0x0
    movne r1, #0x8000
    ldr r0, _LIT0
    moveq r1, #0x0
    orr r1, r1, #0x45
    ldrh r2, [r0, #0x4]
    mov r0, r1, lsl #0x10
    mov r1, r4, lsl #0x10
    ldrb r3, [r7, #0x8]
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d46ac
    ldr r3, _LIT3
    add sp, sp, #0x44
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18a4:
    bl func_ov002_021fe2e4
    cmp r0, #0x0
    addne sp, sp, #0x44
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r3, [r7, #0x8]
    mov r4, #0x0
    cmp r3, #0x0
    ble .L_19c4
    ldr r5, _LIT10
    ldr r9, _LIT9
    sub r6, r5, #0x39
    mov fp, #0x1
.L_18d8:
    add r1, r7, r4, lsl #0x1
    ldrh r0, [r1, #0xa]
    mov r0, r0, lsl #0x2
    ldrh r0, [r9, r0]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    cmp sl, r6
    beq .L_1904
    cmp sl, r5
    beq .L_193c
    b .L_19b4
.L_1904:
    ldrh r0, [r1, #0x10]
    ldr r1, [r7]
    mov r2, r1, lsl #0x1f
    and r0, r0, #0xff
    cmp r0, r2, lsr #0x1f
    bne .L_19b4
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202b824
    mov r8, r0
    mov r0, sl
    bl func_0202b824
    cmp r8, r0
    bne .L_19b4
.L_193c:
    add r0, r7, r4, lsl #0x1
    ldrh r8, [r0, #0xa]
    mov r0, r8
    bl func_ov002_021b939c
    ldr r2, [r7]
    and r1, r8, #0x1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    cmp r2, r1
    mov r8, r1, lsl #0x1f
    movne r2, fp
    mov r0, r0, lsl #0x10
    moveq r2, #0x0
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    mov r2, r2, lsl #0x18
    and r0, r0, #0xff
    mov r0, r0, lsl #0x10
    add r1, r7, r4, lsl #0x1
    and r8, r8, #-2147483648
    and r2, r2, #0x1000000
    orr r2, r8, r2
    and r0, r0, #0x1f0000
    orr r2, r2, #0x400000
    orr r0, r0, r2
    mov r3, sl, lsl #0x10
    ldrh r1, [r1, #0xa]
    mov r2, #0x0
    orr r0, r0, r3, lsr #0x10
    bl func_ov002_021e2fc4
.L_19b4:
    ldrb r3, [r7, #0x8]
    add r4, r4, #0x1
    cmp r4, r3
    blt .L_18d8
.L_19c4:
    mov r2, #0x0
    mov r4, r2
    cmp r3, #0x0
    ble .L_1a00
.L_19d4:
    cmp r4, #0x0
    beq .L_19f0
    add r0, r7, r4, lsl #0x1
    ldrh r1, [r0, #0x10]
    ldrh r0, [r0, #0xe]
    cmp r1, r0
    beq .L_19f4
.L_19f0:
    add r2, r2, #0x1
.L_19f4:
    add r4, r4, #0x1
    cmp r4, r3
    blt .L_19d4
.L_1a00:
    cmp r2, #0x2
    blt .L_1aac
    ldr r4, _LIT4
    ldr r5, _LIT11
    ldr r9, _LIT5
    mov r8, #0x5
    mov r6, #0x64
    mov sl, #0x0
.L_1a20:
    ldr r0, [r7]
    mov r1, r8
    mov r0, r0, lsl #0x1f
    mov r2, r5
    mov r0, r0, lsr #0x1f
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_1a9c
    ldr r1, [r7]
    mov r0, r8, lsl #0x10
    mov r1, r1, lsl #0x1f
    mov fp, r1, lsr #0x1f
    and r1, fp, #0x1
    mla r2, r1, r9, r4
    add r1, r2, #0x30
    ldr r3, [r1, r6]
    mov fp, fp, lsl #0x1f
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    and r1, fp, #-2147483648
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    mov r3, r2, lsl #0x10
    orr r1, r1, #0x200000
    and r0, r0, #0x1f0000
    orr r0, r1, r0
    mov r2, sl
    orr r0, r0, r5
    mov r1, r3, lsr #0x10
    bl func_ov002_021e2fc4
.L_1a9c:
    add r8, r8, #0x1
    cmp r8, #0xa
    add r6, r6, #0x14
    blt .L_1a20
.L_1aac:
    ldr r6, _LIT12
    ldr r4, _LIT2
    mov sl, #0x0
    mov r5, #0x1
    mov fp, #0x5
.L_1ac0:
    ldr r0, [r4, #0xcec]
    mov r9, fp
    eor r8, r0, sl
.L_1acc:
    mov r0, r8
    mov r1, r9
    mov r2, r6
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_1af4
    mov r0, r8
    mov r1, r9
    mov r2, r5
    bl func_ov002_021d92f0
.L_1af4:
    add r9, r9, #0x1
    cmp r9, #0x9
    ble .L_1acc
    add sl, sl, #0x1
    cmp sl, #0x2
    blt .L_1ac0
    ldr r1, [r7]
    mov r0, r1, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_21dc
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_02253f84
    ldr r0, [r7]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_ov002_02256e50
    ldr r0, [r7]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021bac78
    cmp r0, #0x0
    beq .L_20d4
    ldr r4, [r7]
    ldr r2, _LIT4
    mov r0, r4, lsl #0x1f
    mov r5, r0, lsr #0x1f
    mov r0, r4, lsl #0x1b
    mov r1, r0, lsr #0x1c
    ldr r0, _LIT5
    and r5, r5, #0x1
    mla r6, r5, r0, r2
    ldr r2, [sp, #0x8]
    mov r3, #0x14
    bic r2, r2, #0x200
    orr r2, r2, r5, lsl #0x9
    mov r0, r4, lsl #0x18
    mul r5, r1, r3
    add r6, r6, #0x30
    ldr r6, [r6, r5]
    mov r0, r0, lsr #0x1e
    mov r5, r6, lsl #0x2
    ldr r4, _LIT0
    bic r2, r2, #0x3c00
    mov r1, r1, lsl #0x1c
    orr r1, r2, r1, lsr #0x12
    orr r1, r1, #0x8000
    bic r9, r1, #0x4000
    ldrh r4, [r4, #0x4]
    mov r5, r5, lsr #0x18
    mov r8, r0, lsl #0x1f
    mov r0, r5, lsl #0x1
    mov r2, r6, lsl #0x12
    add r2, r0, r2, lsr #0x1f
    and r4, r4, #0x1
    ldr r1, _LIT13
    orr r5, r9, r8, lsr #0x11
    sub r0, r3, #0x214
    and r3, r5, r0
    and r0, r2, r1
    orr r0, r3, r0
    bic r0, r0, #0x10000
    str r0, [sp, #0x8]
    cmp r4, #0x0
    movgt r3, #0x1
    ldr r0, [sp, #0x8]
    ldrb r1, [r7, #0x9]
    movle r3, #0x0
    bic r2, r0, #0x20000
    mov r0, r3, lsl #0x1f
    orr r2, r2, r0, lsr #0xe
    ldr r0, [r7]
    bic r2, r2, #0xc0000
    mov r1, r1, lsl #0x1e
    orr r2, r2, r1, lsr #0xc
    mov r0, r0, lsl #0x9
    ldr r1, _LIT14
    str r2, [sp, #0x8]
    cmp r1, r0, lsr #0x11
    mov r3, r0, lsr #0x11
    bcc .L_1e50
    cmp r3, r1
    bcs .L_2088
    ldr r0, _LIT15
    cmp r3, r0
    bhi .L_1d50
    bcs .L_2088
    sub r2, r1, #0x3d8
    cmp r3, r2
    bhi .L_1ce4
    mov r0, r2
    cmp r3, r0
    bcs .L_2088
    ldr r1, _LIT16
    cmp r3, r1
    bhi .L_1cc0
    sub r0, r1, #0x4
    cmp r3, r0
    bcc .L_1c9c
    cmpne r3, r1
    beq .L_2088
    b .L_20d4
.L_1c9c:
    sub r0, r1, #0xf4
    cmp r3, r0
    bhi .L_1cb0
    beq .L_2088
    b .L_20d4
.L_1cb0:
    sub r0, r1, #0x80
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1cc0:
    add r0, r1, #0x5
    cmp r3, r0
    bhi .L_1cd4
    beq .L_2088
    b .L_20d4
.L_1cd4:
    add r0, r1, #0x26
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1ce4:
    sub r1, r0, #0x57
    cmp r3, r1
    bhi .L_1d20
    sub r0, r0, #0x57
    cmp r3, r0
    bcs .L_2088
    ldr r0, _LIT17
    cmp r3, r0
    bhi .L_1d10
    beq .L_2088
    b .L_20d4
.L_1d10:
    add r0, r0, #0x74
    cmp r3, r0
    beq .L_2070
    b .L_20d4
.L_1d20:
    sub r1, r0, #0x37
    cmp r3, r1
    bhi .L_1d40
    bcs .L_2088
    sub r0, r0, #0x3d
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1d40:
    sub r0, r0, #0x6
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1d50:
    add r2, r0, #0xcd
    cmp r3, r2
    bhi .L_1dd4
    mov r1, r2
    cmp r3, r1
    bcs .L_2088
    add r1, r0, #0x67
    cmp r3, r1
    bhi .L_1da4
    bcs .L_207c
    add r1, r0, #0x23
    cmp r3, r1
    bhi .L_1d94
    add r0, r0, #0x23
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1d94:
    add r0, r0, #0x48
    cmp r3, r0
    beq .L_2070
    b .L_20d4
.L_1da4:
    add r1, r0, #0x8b
    cmp r3, r1
    bhi .L_1dc4
    bcs .L_2088
    add r0, r0, #0x88
    cmp r3, r0
    beq .L_207c
    b .L_20d4
.L_1dc4:
    add r0, r0, #0xb3
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1dd4:
    sub r2, r1, #0xc2
    cmp r3, r2
    bhi .L_1e18
    sub r1, r1, #0xc2
    cmp r3, r1
    bcs .L_2088
    add r1, r0, #0xd1
    cmp r3, r1
    bhi .L_1e08
    add r0, r0, #0xd1
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1e08:
    add r0, r0, #0x114
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1e18:
    sub r2, r1, #0x14
    cmp r3, r2
    bhi .L_1e40
    mov r0, r2
    cmp r3, r0
    bcs .L_2088
    sub r0, r1, #0x78
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1e40:
    rsb r0, r0, #0x2c00
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1e50:
    add r0, r1, #0x20c
    cmp r3, r0
    bhi .L_1fa0
    bcs .L_207c
    add r0, r1, #0x100
    cmp r3, r0
    bhi .L_1eec
    add r0, r1, #0xff
    cmp r3, r0
    bcc .L_1e88
    addne r0, r1, #0x100
    cmpne r3, r0
    beq .L_2088
    b .L_20d4
.L_1e88:
    add r0, r1, #0x41
    cmp r3, r0
    bhi .L_1ebc
    bcs .L_207c
    add r0, r1, #0x21
    cmp r3, r0
    bhi .L_1eac
    beq .L_207c
    b .L_20d4
.L_1eac:
    add r0, r1, #0x2b
    cmp r3, r0
    beq .L_207c
    b .L_20d4
.L_1ebc:
    add r0, r1, #0xe2
    cmp r3, r0
    bhi .L_1edc
    bcs .L_2088
    add r0, r1, #0xd6
    cmp r3, r0
    beq .L_207c
    b .L_20d4
.L_1edc:
    add r0, r1, #0xfb
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1eec:
    add r0, r1, #0x158
    cmp r3, r0
    bhi .L_1f20
    bcs .L_207c
    ldr r0, _LIT18
    cmp r3, r0
    bhi .L_1f10
    beq .L_207c
    b .L_20d4
.L_1f10:
    add r0, r0, #0x31
    cmp r3, r0
    beq .L_207c
    b .L_20d4
.L_1f20:
    add r0, r1, #0x1d4
    cmp r3, r0
    bhi .L_1f40
    bcs .L_207c
    ldr r0, _LIT19
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1f40:
    cmp r3, #0x1900
    beq .L_2088
    b .L_20d4
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022cd238
_LIT4: .word data_ov002_022cf08c
_LIT5: .word 0x00000868
_LIT6: .word 0x00001688
_LIT7: .word 0x00001a21
_LIT8: .word 0x0000ffff
_LIT9: .word data_ov002_022d0170
_LIT10: .word 0x000014f3
_LIT11: .word 0x00001662
_LIT12: .word 0x000019b2
_LIT13: .word 0x000001ff
_LIT14: .word 0x0000170c
_LIT15: .word 0x00001503
_LIT16: .word 0x0000128e
_LIT17: .word 0x00001341
_LIT18: .word 0x0000182e
_LIT19: .word 0x0000189e
_LIT20: .word 0x00001a1d
.L_1fa0:
    ldr r1, _LIT20
    cmp r3, r1
    bhi .L_2010
    bcs .L_207c
    cmp r3, #0x19c0
    bhi .L_1fe0
    bcs .L_2088
    sub r0, r1, #0xe5
    cmp r3, r0
    bhi .L_1fd0
    beq .L_2088
    b .L_20d4
.L_1fd0:
    sub r0, r1, #0x87
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_1fe0:
    sub r0, r1, #0x4a
    cmp r3, r0
    bhi .L_2000
    bcs .L_2088
    sub r0, r1, #0x57
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_2000:
    sub r0, r1, #0x13
    cmp r3, r0
    beq .L_207c
    b .L_20d4
.L_2010:
    add r0, r1, #0x91
    cmp r3, r0
    bhi .L_2040
    bcs .L_2088
    add r0, r1, #0x13
    cmp r3, r0
    bhi .L_2034
    beq .L_207c
    b .L_20d4
.L_2034:
    cmp r3, #0x1a80
    beq .L_2088
    b .L_20d4
.L_2040:
    add r0, r1, #0x93
    cmp r3, r0
    bhi .L_2060
    bcs .L_2088
    add r0, r1, #0x92
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_2060:
    add r0, r1, #0xfd
    cmp r3, r0
    beq .L_2088
    b .L_20d4
.L_2070:
    ldrb r0, [r7, #0x8]
    cmp r0, #0x3
    bcc .L_20d4
.L_207c:
    ldrb r0, [r7, #0x8]
    cmp r0, #0x0
    beq .L_20d4
.L_2088:
    ldr r0, [r7]
    ldr r2, [sp, #0x8]
    mov r1, r0, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1b
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1c
    and r5, r1, #-2147483648
    mov r4, r0, lsl #0x10
    mov r0, r2, lsl #0x17
    mov r0, r0, lsr #0x17
    mov r1, r0, lsl #0x10
    orr r5, r5, #0xc200000
    and r4, r4, #0x1f0000
    mov r0, r3, lsl #0x10
    orr r3, r5, r4
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_20d4:
    ldr r3, [r7]
    ldr r4, _LIT5
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r3, lsl #0x1b
    and r5, r0, #0x1
    mov r1, r1, lsr #0x1c
    mov r2, #0x14
    mul r6, r5, r4
    ldr r5, _LIT21
    ldr r4, _LIT22
    mul r2, r1, r2
    add r5, r5, r6
    ldr r8, [r2, r5]
    add r6, r4, r6
    mov r5, r8, lsr #0x6
    mov r4, r8, lsr #0x2
    and r5, r5, #0x1
    orr r4, r4, r8, lsr #0x1
    and r4, r4, #0x1
    ldrh r6, [r2, r6]
    mvn r5, r5
    mvn r2, r4
    and r4, r6, r5
    tst r4, r2
    beq .L_21dc
    ldr r4, _LIT23
    mov r2, r3, lsl #0x9
    cmp r4, r2, lsr #0x11
    mov r5, r2, lsr #0x11
    bcc .L_2168
    cmp r5, r4
    bcs .L_218c
    sub r2, r4, #0xdc
    cmp r5, r2
    beq .L_218c
    b .L_21dc
.L_2168:
    add r2, r4, #0x4f
    cmp r5, r2
    bhi .L_217c
    beq .L_218c
    b .L_21dc
.L_217c:
    add r2, r4, #0xac
    cmp r5, r2
    beq .L_21b8
    b .L_21dc
.L_218c:
    ldr r2, [r7]
    mov r2, r2, lsr #0x17
    bl func_ov002_021df53c
    ldr r0, [r7]
    mov r2, #0x3
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d92f0
    b .L_21dc
.L_21b8:
    mov r2, r3, lsr #0x17
    bl func_ov002_021df53c
    ldr r0, [r7]
    mov r2, #0x2
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d92f0
.L_21dc:
    ldr r3, _LIT3
    add sp, sp, #0x44
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_220c:
    mov r0, #0x1
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT21: .word data_ov002_022cf0cc
_LIT22: .word data_ov002_022cf0c4
_LIT23: .word 0x00001913
