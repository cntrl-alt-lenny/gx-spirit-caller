; func_ov005_021abe5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_ov005_021b17e0
        .extern data_ov005_021b17e4
        .extern func_02001c98
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001e40
        .extern func_02001e54
        .extern func_02004fb8
        .extern func_02004fe8
        .extern func_020054a4
        .extern func_020945f4
        .extern func_020a6a00
        .extern func_020a6afc
        .extern func_ov005_021abdb8
        .extern func_ov005_021abe04
        .global func_ov005_021abe5c
        .arm
func_ov005_021abe5c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x54
    mov r9, r0
    ldr r1, _LIT0
    ldrsh r2, [r9, #0xc]
    mov r0, #0x0
    ldr r1, [r1, #0x4]
    str r0, [sp, #0x18]
    str r0, [sp, #0x14]
    and r0, r2, #0x7
    mov r1, r1, lsl #0x1d
    str r0, [sp, #0x20]
    movs r0, r1, lsr #0x1d
    ldr r0, [r9, #0x2c]
    mov r1, #0xe
    str r0, [sp, #0x24]
    ldreq r0, _LIT1
    ldr r4, [r9, #0x28]
    streq r0, [sp, #0x8]
    ldrne r0, _LIT2
    ldr fp, [r9, #0x60]
    strne r0, [sp, #0x8]
    ldr r0, [sp, #0x8]
    ldr sl, [r9, #0x3c]
    bl func_020054a4
    ldrh r1, [r9, #0x5c]
    str r0, [sp, #0x10]
    mov r0, r1, lsl #0x16
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    addcc sp, sp, #0x54
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [r9, #0x14]
    ldr r0, _LIT3
    mov r2, #0x20
    bl func_02001d0c
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c98
    mov r0, r4
    mov r1, #0x0
    ldrh r2, [r9, #0x16]
    mov r3, #0xc
    mov r5, r2, lsl #0x3
    mov r2, r5, asr #0x3
    add r2, r5, r2, lsr #0x1c
    mov r2, r2, asr #0x4
    add r5, r2, #0x2
    mul r2, r5, r3
    bl func_020945f4
    ldrh r0, [r9, #0x5c]
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1e
    beq .L_16c
    ldrh r2, [r9, #0x16]
    mov r1, #0x0
    mov r3, r2, lsl #0x3
    mov r2, r3, asr #0x3
    add r2, r3, r2, lsr #0x1c
    mov r2, r2, asr #0x4
    add r2, r2, #0x2
    mul r2, r0, r2
    cmp r2, #0x0
    ble .L_16c
    mov r3, #0x4000
    mov r2, r1
    rsb r3, r3, #0x0
.L_120:
    ldr r5, [r9, #0x3c]
    add r1, r1, #0x1
    ldrh r0, [r5, r2]
    and r0, r0, r3
    orr r0, r0, r3, lsr #0x12
    strh r0, [r5, r2]
    add r2, r2, #0x60
    ldrh r0, [r9, #0x5c]
    ldrh r5, [r9, #0x16]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1e
    mov r6, r5, lsl #0x3
    mov r5, r6, asr #0x3
    add r5, r6, r5, lsr #0x1c
    mov r5, r5, asr #0x4
    add r5, r5, #0x2
    mul r5, r0, r5
    cmp r1, r5
    blt .L_120
.L_16c:
    ldrh r2, [r9, #0x16]
    ldr r0, [r9, #0x2c]
    mov r1, #0x0
    mov r3, r2, lsl #0x3
    mov r2, r3, asr #0x3
    add r2, r3, r2, lsr #0x1c
    mov r2, r2, asr #0x4
    add r2, r2, #0x2
    mov r2, r2, lsl #0x2
    bl func_020945f4
    ldr r0, [fp, #0x4]
    cmp r0, #0x0
    beq .L_85c
.L_1a0:
    ldrsh r2, [r9, #0x12]
    ldrsh r1, [r9, #0xe]
    ldr r0, [r9, #0x34]
    sub r1, r2, r1
    add r2, r0, r1
    ldr r1, [sp, #0x18]
    cmp r1, r2
    bgt .L_85c
    ldrh r1, [r9, #0x16]
    mov r2, r1, lsl #0x3
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    mov r1, r1, asr #0x4
    add r2, r1, #0x2
    ldr r1, [sp, #0x14]
    cmp r1, r2
    bge .L_85c
    sub r1, r0, #0x10
    ldr r0, [sp, #0x18]
    cmp r0, r1
    ble .L_840
    ldrh r0, [r9, #0x5c]
    mov r1, #0x0
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1e
    beq .L_290
    ldrh r0, [fp, #0xc]
    ldr r2, _LIT4
    ldrh r3, [sl]
    and r0, r0, r2
    mov r0, r0, lsl #0x10
    and r2, r2, r0, lsr #0x10
    sub r0, r1, #0x4000
    and r0, r3, r0
    orr r0, r0, r2
    strh r0, [sl]
    ldrh r0, [fp, #0xc]
    ldrh r2, [sl]
    and r0, r0, #0xc000
    mov r0, r0, lsl #0x4
    mov r0, r0, lsr #0x10
    bic r2, r2, #0xc000
    mov r0, r0, lsl #0x1e
    orr r0, r2, r0, lsr #0x10
    strh r0, [sl]
    ldrsh r2, [r9, #0xc]
    ldrh r0, [fp, #0xa]
    add r0, r2, r0, lsl #0x4
    strh r0, [sl, #0x2]
    ldrsh r3, [r9, #0xe]
    ldr r0, [sp, #0x18]
    ldr r2, [r9, #0x34]
    add r0, r3, r0
    sub r0, r0, r2
    add r0, r0, #0x1
    strh r0, [sl, #0x4]
    str r1, [sl, #0x8]
    ldrh r0, [r9, #0x3a]
    add sl, sl, #0x60
    add r1, r1, r0
.L_290:
    ldrh r0, [r9, #0x5c]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bls .L_338
    ldrh r2, [fp, #0xe]
    mov r0, #0x4000
    rsb r0, r0, #0x0
    and r2, r2, r0, lsr #0x12
    ldrh r5, [sl]
    mov r3, r0, lsr #0x12
    mov r2, r2, lsl #0x10
    and r2, r3, r2, lsr #0x10
    and r0, r5, r0
    orr r0, r0, r2
    strh r0, [sl]
    ldrh r0, [fp, #0xe]
    ldrh r3, [sl]
    mov r2, #0x0
    and r0, r0, #0xc000
    mov r0, r0, lsl #0x4
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xc000
    mov r0, r0, lsl #0x1e
    orr r0, r3, r0, lsr #0x10
    strh r0, [sl]
    ldrsh r3, [r9, #0xc]
    ldrh r0, [fp, #0xa]
    add r3, r3, r1
    add r0, r3, r0, lsl #0x4
    strh r0, [sl, #0x2]
    ldrsh r5, [r9, #0xe]
    ldr r0, [sp, #0x18]
    ldr r3, [r9, #0x34]
    add r0, r5, r0
    sub r0, r0, r3
    add r0, r0, #0x1
    strh r0, [sl, #0x4]
    str r2, [sl, #0x8]
    ldrh r0, [r9, #0x3a]
    add sl, sl, #0x60
    add r1, r1, r0
.L_338:
    ldr r2, [sp, #0x20]
    ldrh r3, [fp, #0xa]
    add r2, r2, r1
    ldr r0, [fp]
    add r7, r2, r3, lsl #0x4
    ldr r2, [sp, #0x18]
    mov r1, #0xe
    and r2, r2, #0xff
    str r2, [sp, #0x1c]
    bl func_020054a4
    ldrsh r0, [fp, #0x8]
    cmp r0, #0x0
    bge .L_784
    ldr r0, [fp]
    mov r1, #0x0
    str r1, [sp, #0xc]
    bl func_020a6a00
    mov r5, r0
    add r0, r5, #0x4
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    ldr r3, _LIT3
    add r2, r5, #0x4
    ldr r5, [r3, #0x20]
    mov r1, #0x0
    orr r5, r5, #0x800000
    str r5, [r3, #0x20]
    mov r6, r0
    bl func_020945f4
    ldr r1, [fp]
    mov r0, r6
    bl func_020a6afc
    mov r0, r6
    mov r1, #0xe
    bl func_020054a4
    add r0, r7, r0
    add r2, r0, #0x1
    str r2, [sp, #0x50]
    ldrsh r1, [r9, #0x10]
    ldrsh r0, [r9, #0xc]
    sub r0, r1, r0
    cmp r2, r0
    blt .L_57c
    ldr r0, _LIT3
    mov r2, #0xe
    ldr r3, [r0, #0x24]
    mov r1, r6
    bic r3, r3, #0xf00
    orr r3, r3, #0x100
    bic r3, r3, #0xf000
    orr r3, r3, #0x1000
    str r3, [r0, #0x24]
    ldr r3, [sp, #0x1c]
    str r2, [sp]
    mov r2, r7
    add r3, r3, #0x1
    bl func_02004fb8
    ldr r0, _LIT3
    add r1, sp, #0x50
    add r2, sp, #0x4c
    bl func_02001e40
    ldr r0, _LIT3
    ldr r1, [r0, #0x24]
    bic r1, r1, #0xf00
    bic r1, r1, #0xf000
    str r1, [r0, #0x24]
    bl func_02001e54
    mov r5, r0
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_4c4
    mov r0, #0x0
    strb r0, [r5]
    sub r0, r5, r6
    cmp r0, #0x3
    ble .L_57c
    ldrsb r0, [r5, #-2]
    tst r0, #0x80
    beq .L_490
    ldr r1, [sp, #0x8]
    sub r0, r5, #0x2
    bl func_020a6afc
    b .L_57c
.L_490:
    ldrsb r0, [r5, #-3]
    tst r0, #0x80
    beq .L_4b4
    ldr r1, [sp, #0x8]
    sub r0, r5, #0x3
    bl func_020a6afc
    mov r0, #0x0
    strh r0, [r5, #-1]
    b .L_57c
.L_4b4:
    ldr r1, [sp, #0x8]
    sub r0, r5, #0x2
    bl func_020a6afc
    b .L_57c
.L_4c4:
    ldrsb r8, [r5]
    mov r1, #0x0
    mov r0, r6
    strb r1, [r5]
    mov r1, #0xe
    bl func_020054a4
    ldr r1, [sp, #0x50]
    add r0, r1, r0
    str r0, [sp, #0x50]
    strb r8, [r5]
    ldr r2, [sp, #0x50]
    ldr r0, [sp, #0x10]
    ldrh r1, [r9, #0x14]
    add r0, r2, r0
    add r0, r0, #0x1
    cmp r0, r1, lsl #0x3
    movlt r0, #0x1
    strlt r0, [sp, #0xc]
    blt .L_57c
    mov r0, #0x0
    strb r0, [r5]
    mov r8, r0
.L_51c:
    sub r5, r5, #0x1
    ldrsb r0, [r5, #-1]
    mov r1, #0xe
    tst r0, #0x80
    subne r5, r5, #0x1
    mov r0, r6
    strb r8, [r5]
    bl func_020054a4
    add r0, r7, r0
    add r1, r0, #0x2
    ldr r0, [sp, #0x10]
    add r2, r0, r1
    ldrsh r1, [r9, #0x10]
    ldrsh r0, [r9, #0xc]
    sub r0, r1, r0
    cmp r2, r0
    blt .L_568
    cmp r5, r6
    bgt .L_51c
.L_568:
    ldr r1, [sp, #0x8]
    mov r0, r5
    bl func_020a6afc
    mov r0, #0x0
    strb r0, [r5, #0x3]
.L_57c:
    ldrh r1, [r9, #0x5c]
    ldr r2, [sp, #0x1c]
    mov r0, r9
    mov r1, r1, lsl #0x1c
    mov r3, #0x10
    mov r1, r1, lsr #0x1f
    bl func_ov005_021abdb8
    ldr r1, [sp, #0x1c]
    ldr r2, [fp, #0x4]
    mov r0, r9
    mov r3, #0x10
    bl func_ov005_021abe04
    ldr r0, [sp, #0x1c]
    mov r3, r7
    add r0, r0, #0x1
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldrh r2, [r9, #0x5c]
    ldr r0, _LIT3
    mov r1, r6
    mov r2, r2, lsl #0x1c
    mov r2, r2, lsr #0x1f
    add r2, r9, r2, lsl #0x2
    ldr r2, [r2, #0x18]
    bl func_02004fe8
    ldr r0, [sp, #0xc]
    cmp r0, #0x1
    bne .L_774
    ldr r0, _LIT3
    add r1, sp, #0x48
    add r2, sp, #0x44
    bl func_02001e40
    ldr r0, _LIT3
    bl func_02001e54
    mov r5, r0
    ldrsb r2, [r5]
    mov r1, #0x0
    mov r0, r6
    strb r2, [sp, #0x40]
    strb r1, [r5]
    mov r1, #0xe
    bl func_020054a4
    add r1, r0, #0x1
    ldr r2, [sp, #0x48]
    ldrsb r0, [sp, #0x40]
    add r1, r2, r1
    str r1, [sp, #0x48]
    strb r0, [r5]
    ldrsh r1, [r9, #0x10]
    ldrsh r0, [r9, #0xc]
    ldr r7, [sp, #0x48]
    sub r0, r1, r0
    cmp r7, r0
    bge .L_73c
    ldr r0, [sp, #0x10]
    add r0, r0, #0x1
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x1
    str r0, [sp, #0x2c]
.L_670:
    ldrsb r0, [r5]
    tst r0, #0x80
    movne r8, #0x2
    moveq r8, #0x1
    strb r0, [sp, #0x40]
    cmp r8, #0x2
    movne r0, #0x0
    strneb r0, [sp, #0x41]
    bne .L_6a4
    ldrsb r0, [r5, #0x1]
    strb r0, [sp, #0x41]
    mov r0, #0x0
    strb r0, [sp, #0x42]
.L_6a4:
    add r0, sp, #0x40
    mov r1, #0xe
    bl func_020054a4
    add r0, r7, r0
    ldrsh r2, [r9, #0x10]
    ldrsh r1, [r9, #0xc]
    add r0, r0, #0x1
    sub r2, r2, r1
    ldr r1, [sp, #0x28]
    sub r1, r2, r1
    cmp r0, r1
    bge .L_73c
    ldr r0, [sp, #0x2c]
    mov r3, r7
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldrh r2, [r9, #0x5c]
    ldr r0, _LIT3
    add r1, sp, #0x40
    mov r2, r2, lsl #0x1c
    mov r2, r2, lsr #0x1f
    add r2, r9, r2, lsl #0x2
    ldr r2, [r2, #0x18]
    bl func_02004fe8
    ldr r0, _LIT3
    add r1, sp, #0x48
    add r2, sp, #0x44
    bl func_02001e40
    ldrsb r0, [r5, r8]!
    cmp r0, #0x0
    beq .L_73c
    ldr r7, [sp, #0x48]
    ldrsh r1, [r9, #0x10]
    ldrsh r0, [r9, #0xc]
    sub r0, r1, r0
    cmp r7, r0
    blt .L_670
.L_73c:
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x1
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldrh r1, [r9, #0x5c]
    ldr r3, [sp, #0x48]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1f
    add r1, r9, r1, lsl #0x2
    ldr r2, [r1, #0x18]
    ldr r1, [sp, #0x8]
    bl func_02004fe8
.L_774:
    ldr r1, [sp, #0x1c]
    mov r0, r6
    strh r1, [fp, #0x8]
    bl Task_InvokeLocked
.L_784:
    ldr r0, [fp, #0x4]
    str r0, [r4]
    ldrsh r0, [r9, #0xc]
    strh r0, [r4, #0x4]
    ldrsh r2, [r9, #0xe]
    ldr r0, [sp, #0x18]
    ldr r1, [r9, #0x34]
    add r0, r2, r0
    sub r0, r0, r1
    strh r0, [r4, #0x6]
    ldrsh r0, [r9, #0x10]
    strh r0, [r4, #0x8]
    ldrsh r0, [r4, #0x6]
    add r0, r0, #0x10
    strh r0, [r4, #0xa]
    ldrsh r1, [r4, #0x6]
    ldrsh r0, [r9, #0xe]
    cmp r1, r0
    blt .L_7f0
    ldrsh r1, [r4, #0xa]
    ldrsh r0, [r9, #0x12]
    cmp r1, r0
    bge .L_7f0
    ldr r1, [fp, #0x4]
    ldr r0, [sp, #0x24]
    str r1, [r0], #0x4
    str r0, [sp, #0x24]
.L_7f0:
    ldrsh r1, [r9, #0xc]
    ldrsh r0, [r4, #0x4]
    cmp r0, r1
    strlth r1, [r4, #0x4]
    ldrsh r1, [r9, #0xe]
    ldrsh r0, [r4, #0x6]
    cmp r0, r1
    strlth r1, [r4, #0x6]
    ldrsh r1, [r9, #0x10]
    ldrsh r0, [r4, #0x8]
    cmp r0, r1
    strgth r1, [r4, #0x8]
    ldrsh r1, [r9, #0x12]
    ldrsh r0, [r4, #0xa]
    cmp r0, r1
    ldr r0, [sp, #0x14]
    strgth r1, [r4, #0xa]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    add r4, r4, #0xc
.L_840:
    add fp, fp, #0x10
    ldr r0, [sp, #0x18]
    ldr r1, [fp, #0x4]
    add r0, r0, #0x10
    str r0, [sp, #0x18]
    cmp r1, #0x0
    bne .L_1a0
.L_85c:
    ldrsh r1, [r9, #0x12]
    ldrsh r0, [r9, #0xe]
    ldr r2, [r9, #0x34]
    sub r0, r1, r0
    add r2, r2, r0
    ldr r0, [sp, #0x18]
    cmp r0, r2
    bge .L_8b4
    ldrh r1, [r9, #0x5c]
    sub r4, r2, r0
    ldr r2, [sp, #0x18]
    mov r1, r1, lsl #0x1c
    mov r0, r9
    mov r1, r1, lsr #0x1f
    add r3, r4, #0x1
    bl func_ov005_021abdb8
    ldr r1, [sp, #0x18]
    mov r0, r9
    and r1, r1, #0xff
    add r3, r4, #0x1
    mov r2, #0x0
    bl func_ov005_021abe04
.L_8b4:
    ldrh r0, [r9, #0x5c]
    mov r1, r0, lsl #0x1d
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    addne sp, sp, #0x54
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [r9, #0x5c]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1f
    mov r1, r1, lsl #0x1e
    mvneq r0, #0x0
    mov r1, r1, lsr #0x1e
    movne r0, #0x1
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_a6c
    b .L_904
    b .L_964
    b .L_9c4
    b .L_a1c
.L_904:
    ldr r5, _LIT5
    ldrh r1, [r5]
    strh r1, [sp, #0x36]
    ldrh r4, [sp, #0x36]
    ldrh r6, [r5]
    mov r7, r4, lsl #0x10
    mov r8, r4, lsl #0x18
    mov r7, r7, lsr #0x1e
    and r6, r6, #0x43
    mov r2, r4, lsl #0x1a
    mov r1, r4, lsl #0x13
    orr r6, r6, r7, lsl #0xe
    mov r8, r8, lsr #0x1f
    mov r7, r1, lsr #0x1b
    orr r1, r6, r8, lsl #0x7
    add r2, r0, r2, lsr #0x1c
    orr r0, r1, r7, lsl #0x8
    mov r3, r4, lsl #0x12
    mov r1, r3, lsr #0x1f
    orr r0, r0, r2, lsl #0x2
    orr r0, r0, r1, lsl #0xd
    strh r4, [sp, #0x3e]
    strh r0, [r5]
    b .L_a6c
.L_964:
    ldr r5, _LIT6
    ldrh r1, [r5]
    strh r1, [sp, #0x34]
    ldrh r4, [sp, #0x34]
    ldrh r6, [r5]
    mov r7, r4, lsl #0x10
    mov r8, r4, lsl #0x18
    mov r7, r7, lsr #0x1e
    and r6, r6, #0x43
    mov r2, r4, lsl #0x1a
    mov r1, r4, lsl #0x13
    orr r6, r6, r7, lsl #0xe
    mov r8, r8, lsr #0x1f
    mov r7, r1, lsr #0x1b
    orr r1, r6, r8, lsl #0x7
    add r2, r0, r2, lsr #0x1c
    orr r0, r1, r7, lsl #0x8
    mov r3, r4, lsl #0x12
    mov r1, r3, lsr #0x1f
    orr r0, r0, r2, lsl #0x2
    orr r0, r0, r1, lsl #0xd
    strh r4, [sp, #0x3c]
    strh r0, [r5]
    b .L_a6c
.L_9c4:
    ldr r3, _LIT7
    ldrh r1, [r3]
    strh r1, [sp, #0x32]
    ldrsh r1, [sp, #0x32]
    ldrh r2, [sp, #0x32]
    ldrh r4, [r3]
    mov r5, r2, lsl #0x10
    mov r6, r2, lsl #0x18
    mov r1, r2, lsl #0x1a
    mov r5, r5, lsr #0x1e
    and r4, r4, #0x43
    mov r7, r2, lsl #0x13
    orr r4, r4, r5, lsl #0xe
    mov r6, r6, lsr #0x1f
    mov r5, r7, lsr #0x1b
    orr r4, r4, r6, lsl #0x7
    add r1, r0, r1, lsr #0x1c
    orr r0, r4, r5, lsl #0x8
    orr r0, r0, r1, lsl #0x2
    strh r2, [sp, #0x3a]
    strh r0, [r3]
    b .L_a6c
.L_a1c:
    ldr r3, _LIT8
    ldrh r1, [r3]
    strh r1, [sp, #0x30]
    ldrh r2, [sp, #0x30]
    ldrh r4, [r3]
    mov r5, r2, lsl #0x10
    mov r6, r2, lsl #0x18
    mov r5, r5, lsr #0x1e
    and r4, r4, #0x43
    mov r1, r2, lsl #0x1a
    mov r7, r2, lsl #0x13
    orr r4, r4, r5, lsl #0xe
    mov r6, r6, lsr #0x1f
    mov r5, r7, lsr #0x1b
    orr r4, r4, r6, lsl #0x7
    add r1, r0, r1, lsr #0x1c
    orr r0, r4, r5, lsl #0x8
    orr r0, r0, r1, lsl #0x2
    strh r2, [sp, #0x38]
    strh r0, [r3]
.L_a6c:
    ldrh r1, [r9, #0x5c]
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1f
    eor r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r9, #0x5c]
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov005_021b17e0
_LIT2: .word data_ov005_021b17e4
_LIT3: .word data_02102c90
_LIT4: .word 0x00003fff
_LIT5: .word 0x04001008
_LIT6: .word 0x0400100a
_LIT7: .word 0x0400100c
_LIT8: .word 0x0400100e
