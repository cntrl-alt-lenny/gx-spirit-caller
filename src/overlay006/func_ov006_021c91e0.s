; func_ov006_021c91e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov006_021ce650
        .extern data_ov006_021ce8a8
        .extern data_ov006_021cebfc
        .extern data_ov006_021cec00
        .extern data_ov006_0224f448
        .extern data_ov006_0225e138
        .extern func_02001cd0
        .extern func_02005240
        .extern func_02007104
        .extern func_0202b100
        .extern func_0202c0c0
        .extern func_0208de4c
        .extern func_02094504
        .extern func_020a978c
        .extern func_020aaddc
        .extern func_ov006_021b6d1c
        .extern func_ov006_021cb0d8
        .extern func_ov006_021cb158
        .global func_ov006_021c91e0
        .arm
func_ov006_021c91e0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x94
    str r0, [sp, #0x8]
    ldr r8, _LIT0
    bl func_0208de4c
    ldr r1, [sp, #0x8]
    ldr r2, _LIT1
    ldr r3, [r1, #0x44]
    ldr r1, [r2, #0x4]
    add r0, r0, r3, lsl #0x5
    str r0, [sp, #0x30]
    mov r0, r1, lsl #0x1d
    movs r0, r0, lsr #0x1d
    ldrne r0, [sp, #0x8]
    ldrne r2, _LIT2
    ldrne r1, [r0, #0x74]
    bne .L_200
    ldr r0, [sp, #0x8]
    ldr r2, _LIT3
    ldr r1, [r0, #0x74]
.L_200:
    mov r0, #0x14
    mla r9, r1, r0, r2
    ldrsh r0, [r9, #0x2]
    cmp r0, #0x2
    moveq r2, #0x0
    streq r2, [sp, #0x10]
    beq .L_24c
    ldr r2, [sp, #0x8]
    ldr r3, [r2, #0x78]
    mov r2, #0x14
    mul r4, r3, r2
    ldr r2, [sp, #0x8]
    ldr r2, [r2, #0x90]
    sub r2, r4, r2
    add r3, r2, #0x7
    mov r2, r3, asr #0x2
    add r2, r3, r2, lsr #0x1d
    mov r2, r2, asr #0x3
    str r2, [sp, #0x10]
.L_24c:
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0xc]
    beq .L_28c
    ldr r0, [sp, #0x8]
    ldr r2, [r0, #0x7c]
    mov r0, #0x14
    mul r3, r2, r0
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x94]
    sub r0, r3, r0
    add r2, r0, #0x7
    mov r0, r2, asr #0x2
    add r0, r2, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    str r0, [sp, #0xc]
.L_28c:
    ldr r0, [sp, #0x8]
    ldr r4, [r0, #0x80]
    ldr r3, [r0, #0x78]
    ldr r2, [r0, #0x84]
    mov r0, #0x0
    mla r5, r3, r2, r4
    ldr r2, [r9, #0x10]
    str r0, [sp, #0x14]
    cmp r2, #0x0
    beq .L_354
    ldrb r1, [r9, #0x6]
    ldrb r0, [r9, #0x7]
    smulbb r1, r1, r0
    cmp r5, r1
    blt .L_324
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x5c]
    cmp r0, #0x0
    beq .L_304
    cmp r5, r1
    ldreq r0, _LIT4
    beq .L_32c
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    movne r0, #0x9
    moveq r0, #0x8
    add r0, r0, #0xea
    add r0, r0, #0x300
    b .L_32c
.L_304:
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    movne r0, #0x9
    moveq r0, #0x8
    add r0, r0, #0xea
    add r0, r0, #0x300
    b .L_32c
.L_324:
    mov r0, r5, lsl #0x1
    ldrsh r0, [r2, r0]
.L_32c:
    cmp r0, #0x0
    blt .L_3c0
    bl func_0202c0c0
    mov r2, r0
    ldr r1, _LIT5
    add r0, sp, #0x54
    bl func_020a978c
    add r0, sp, #0x54
    str r0, [sp, #0x14]
    b .L_3c0
.L_354:
    sub r0, r1, #0x15
    cmp r0, #0x8
    bhi .L_3c0
    ldr r0, [sp, #0x8]
    add r0, r0, r5, lsl #0x1
    ldrsh r0, [r0, #0xac]
    cmp r0, #0x0
    blt .L_3c0
    mov r0, #0x3f0
    bl func_0202c0c0
    ldr r2, [sp, #0x8]
    ldr r1, [sp, #0x8]
    add r2, r2, r5, lsl #0x1
    ldr r3, [sp, #0x8]
    mov r4, r0
    ldrsh r2, [r2, #0xac]
    ldr r1, [r1, #0x4c]
    ldr r3, [r3, #0x50]
    mov r0, r8
    bl func_ov006_021b6d1c
    bl func_0202b100
    mov r2, r0
    mov r1, r4
    add r0, sp, #0x54
    bl func_020a978c
    add r0, sp, #0x54
    str r0, [sp, #0x14]
.L_3c0:
    mov r0, r5, asr #0x4
    add r0, r5, r0, lsr #0x1b
    mov r1, r0, asr #0x5
    ldr r0, [sp, #0x8]
    mov r3, #0x1
    add r0, r0, r1, lsl #0x2
    mov r1, r5, lsr #0x1f
    ldr r2, [r0, #0x64]
    rsb r0, r1, r5, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    tst r2, r3, lsl r0
    movne r0, #0x0
    strne r0, [sp, #0x14]
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    beq .L_4e0
    ldr r1, _LIT6
    mov r3, #0x0
    mov r2, r0
    strb r3, [r2, #0x28]
    mov r4, #0x1
    bl func_02007104
    cmp r0, #0x0
    blt .L_474
    mov r3, #0x0
    ldr r2, [sp, #0x14]
    mov r5, r3
    mov r0, r3
.L_430:
    ldrsb r1, [r2]
    cmp r1, #0x0
    beq .L_460
    cmp r1, #0xa
    moveq r3, r0
    addeq r4, r4, #0x1
    beq .L_458
    add r3, r3, #0x1
    cmp r3, r5
    movgt r5, r3
.L_458:
    add r2, r2, #0x1
    b .L_430
.L_460:
    mov r0, #0x6
    mul r0, r5, r0
    add r0, r0, #0xb
    str r0, [sp, #0x2c]
    b .L_48c
.L_474:
    ldr r0, [sp, #0x14]
    bl func_020aaddc
    mov r1, #0x6
    mul r1, r0, r1
    add r0, r1, #0xb
    str r0, [sp, #0x2c]
.L_48c:
    sub r1, r4, #0x1
    mov r0, #0xc
    mul r0, r1, r0
    add r1, r0, #0x14
    ldr r0, [sp, #0x2c]
    add r6, r1, #0x7
    add r3, r0, #0x7
    mov r2, r3, asr #0x2
    add r3, r3, r2, lsr #0x1d
    mov r4, r0, lsr #0x1f
    ldr r2, [sp, #0x2c]
    mov r5, r6, asr #0x2
    add r5, r6, r5, lsr #0x1d
    rsb r2, r4, r2, lsl #0x1d
    mov r0, r1, lsr #0x1f
    add fp, r4, r2, ror #0x1d
    rsb r2, r0, r1, lsl #0x1d
    mov r1, r5, asr #0x3
    mov r6, r3, asr #0x3
    str r1, [sp, #0x28]
    add r7, r0, r2, ror #0x1d
.L_4e0:
    ldrsh r0, [r9, #0x2]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_55c
    b .L_500
    b .L_500
    b .L_51c
    b .L_51c
.L_500:
    ldr r1, [sp, #0x30]
    ldr r0, [sp, #0xc]
    mov r2, #0xc00
    add r1, r1, r0, lsl #0xa
    mov r0, #0x0
    bl func_02094504
    b .L_55c
.L_51c:
    ldr r0, [sp, #0xc]
    mov r5, #0x0
    add r4, r0, #0x1
    cmp r4, #0x0
    ble .L_55c
    mov r8, r5
    mov sl, r5
.L_538:
    ldr r1, [sp, #0x30]
    mov r0, sl
    add r1, r1, r8
    mov r2, #0x400
    bl func_02094504
    add r5, r5, #0x1
    add r8, r8, #0x400
    cmp r5, r4
    blt .L_538
.L_55c:
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    beq .L_b6c
    ldr r1, [sp, #0x8]
    ldr r0, _LIT7
    ldr r2, [sp, #0x30]
    add r1, r1, #0x4
    bl func_ov006_021cb0d8
    ldrsh r0, [r9, #0x2]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_b6c
    b .L_59c
    b .L_59c
    b .L_7a4
    b .L_9a0
.L_59c:
    ldr r0, [sp, #0x8]
    ldr r1, [r0, #0x78]
    mov r0, #0x14
    mul r4, r1, r0
    ldr r0, [sp, #0x8]
    ldr r3, [r0, #0x90]
    ldr r2, [r0, #0x98]
    ldr r0, [sp, #0x2c]
    add r2, r3, r2
    add r1, r0, r0, lsr #0x1f
    add r0, r4, r4, lsr #0x1f
    add r1, r2, r1, asr #0x1
    rsb r0, r1, r0, asr #0x1
    str r0, [sp, #0x24]
    cmp r0, #0x3
    movlt r0, #0x3
    strlt r0, [sp, #0x24]
    blt .L_600
    mov r1, r0
    ldr r0, [sp, #0x2c]
    add r0, r1, r0
    cmp r0, #0xfd
    ldrgt r0, [sp, #0x2c]
    rsbgt r0, r0, #0xfd
    strgt r0, [sp, #0x24]
.L_600:
    ldr r0, [sp, #0x28]
    mov sl, #0x0
    cmp r0, #0x0
    ble .L_71c
.L_610:
    cmp r6, #0x0
    mov r8, #0x0
    ble .L_70c
    ldr r0, [sp, #0xc]
    ldr r9, [sp, #0x24]
    add r0, r0, sl
    str r0, [sp, #0x34]
    sub r0, fp, #0x8
    str r0, [sp, #0x3c]
    sub r0, r7, #0x8
    str r0, [sp, #0x38]
    ldr r0, [sp, #0x28]
    sub r5, r6, #0x1
    sub r4, r0, #0x1
.L_648:
    cmp sl, #0x0
    bne .L_66c
    cmp r8, #0x0
    moveq r2, #0x0
    beq .L_6a8
    cmp r8, r5
    moveq r2, #0x2
    movne r2, #0x1
    b .L_6a8
.L_66c:
    cmp sl, r4
    bne .L_690
    cmp r8, #0x0
    moveq r2, #0x6
    beq .L_6a8
    cmp r8, r5
    moveq r2, #0x8
    movne r2, #0x7
    b .L_6a8
.L_690:
    cmp r8, #0x0
    moveq r2, #0x3
    beq .L_6a8
    cmp r8, r5
    moveq r2, #0x5
    movne r2, #0x4
.L_6a8:
    cmp sl, r4
    bne .L_6c0
    cmp r7, #0x0
    ldrgt r1, [sp, #0x38]
    movle r1, #0x0
    b .L_6c4
.L_6c0:
    mov r1, #0x0
.L_6c4:
    cmp r8, r5
    bne .L_6dc
    cmp fp, #0x0
    ldrgt r3, [sp, #0x3c]
    movle r3, #0x0
    b .L_6e0
.L_6dc:
    mov r3, #0x0
.L_6e0:
    ldr r0, [sp, #0x34]
    add r3, r9, r3
    add r0, r1, r0, lsl #0x3
    str r0, [sp]
    ldr r0, _LIT7
    mov r1, #0x4
    bl func_ov006_021cb158
    add r8, r8, #0x1
    add r9, r9, #0x8
    cmp r8, r6
    blt .L_648
.L_70c:
    ldr r0, [sp, #0x28]
    add sl, sl, #0x1
    cmp sl, r0
    blt .L_610
.L_71c:
    ldr r0, [sp, #0x8]
    mov r1, #0x1
    mov r2, r1
    add r0, r0, #0x4
    bl func_02001cd0
    ldr r0, [sp, #0xc]
    ldr r3, [sp, #0x24]
    mov r5, r0, lsl #0x3
    add r0, r5, #0x5
    str r0, [sp]
    ldr r0, [sp, #0x8]
    mov r4, #0xc
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x30]
    add r0, r0, #0x4
    add r3, r3, #0x6
    str r4, [sp, #0x4]
    bl func_02005240
    ldr r0, [sp, #0x8]
    mov r1, #0xf
    add r0, r0, #0x4
    mov r2, #0x1
    bl func_02001cd0
    add r0, r5, #0x4
    str r0, [sp]
    ldr r0, [sp, #0x8]
    ldr r3, [sp, #0x24]
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x30]
    add r0, r0, #0x4
    add r3, r3, #0x5
    str r4, [sp, #0x4]
    bl func_02005240
    b .L_b6c
.L_7a4:
    ldr r0, [sp, #0x28]
    mov r8, #0x0
    cmp r0, #0x0
    ble .L_8f0
    ldr r0, [sp, #0x2c]
    str r8, [sp, #0x1c]
    add r0, r0, #0x1
    rsb r0, r0, #0x100
    str r0, [sp, #0x18]
.L_7c8:
    cmp r6, #0x0
    mov r9, #0x0
    ble .L_8d4
    sub r0, fp, #0x8
    str r0, [sp, #0x48]
    sub r0, r7, #0x8
    str r0, [sp, #0x44]
    ldr r0, [sp, #0x28]
    ldr r5, [sp, #0x18]
    sub r0, r0, #0x1
    sub r4, r6, #0x1
    str r0, [sp, #0x40]
.L_7f8:
    cmp r8, #0x0
    bne .L_81c
    cmp r9, #0x0
    moveq r2, #0x0
    beq .L_85c
    cmp r9, r4
    moveq r2, #0x2
    movne r2, #0x1
    b .L_85c
.L_81c:
    ldr r0, [sp, #0x40]
    cmp r8, r0
    bne .L_844
    cmp r9, #0x0
    moveq r2, #0x6
    beq .L_85c
    cmp r9, r4
    moveq r2, #0x8
    movne r2, #0x7
    b .L_85c
.L_844:
    cmp r9, #0x0
    moveq r2, #0x3
    beq .L_85c
    cmp r9, r4
    moveq r2, #0x5
    movne r2, #0x4
.L_85c:
    ldr r0, [sp, #0x40]
    cmp r8, r0
    bne .L_878
    cmp r7, #0x0
    ldrgt sl, [sp, #0x44]
    movle sl, #0x0
    b .L_87c
.L_878:
    mov sl, #0x0
.L_87c:
    cmp r9, r4
    bne .L_894
    cmp fp, #0x0
    ldrgt r0, [sp, #0x48]
    movle r0, #0x0
    b .L_898
.L_894:
    mov r0, #0x0
.L_898:
    add r3, r5, r0
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x1c]
    ldr lr, [r0, #0x84]
    mov ip, #0x14
    mla r1, lr, ip, r1
    add r1, r1, sl
    str r1, [sp]
    ldr r0, _LIT7
    mov r1, #0x4
    bl func_ov006_021cb158
    add r9, r9, #0x1
    add r5, r5, #0x8
    cmp r9, r6
    blt .L_7f8
.L_8d4:
    ldr r0, [sp, #0x28]
    add r8, r8, #0x1
    cmp r8, r0
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x8
    str r0, [sp, #0x1c]
    blt .L_7c8
.L_8f0:
    ldr r0, [sp, #0x8]
    mov r1, #0x1
    mov r2, r1
    add r0, r0, #0x4
    bl func_02001cd0
    ldr r0, [sp, #0x8]
    mov r5, #0xc
    ldr r1, [r0, #0x84]
    mov r0, #0x14
    mul r0, r1, r0
    add r0, r0, #0x5
    str r0, [sp]
    ldr r0, [sp, #0x2c]
    add r3, r5, #0xfa
    add r4, r0, #0x1
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x30]
    add r0, r0, #0x4
    sub r3, r3, r4
    str r5, [sp, #0x4]
    bl func_02005240
    ldr r0, [sp, #0x8]
    mov r1, #0xf
    add r0, r0, #0x4
    mov r2, #0x1
    bl func_02001cd0
    ldr r0, [sp, #0x2c]
    mov r3, #0x14
    add r4, r0, #0x1
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x14]
    ldr r5, [r0, #0x84]
    ldr r2, [sp, #0x30]
    mul r3, r5, r3
    add r3, r3, #0x4
    str r3, [sp]
    mov r3, #0xc
    str r3, [sp, #0x4]
    add r3, r3, #0xf9
    add r0, r0, #0x4
    sub r3, r3, r4
    bl func_02005240
    b .L_b6c
.L_9a0:
    ldr r0, [sp, #0x28]
    mov r8, #0x0
    cmp r0, #0x0
    ble .L_ad0
    str r8, [sp, #0x20]
.L_9b4:
    cmp r6, #0x0
    mov r9, #0x0
    ble .L_ab4
    sub r0, fp, #0x8
    str r0, [sp, #0x50]
    sub r0, r7, #0x8
    str r0, [sp, #0x4c]
    ldr r0, [sp, #0x28]
    sub r5, r6, #0x1
    sub r4, r0, #0x1
.L_9dc:
    cmp r8, #0x0
    bne .L_a00
    cmp r9, #0x0
    moveq r2, #0x0
    beq .L_a3c
    cmp r9, r5
    moveq r2, #0x2
    movne r2, #0x1
    b .L_a3c
.L_a00:
    cmp r8, r4
    bne .L_a24
    cmp r9, #0x0
    moveq r2, #0x6
    beq .L_a3c
    cmp r9, r5
    moveq r2, #0x8
    movne r2, #0x7
    b .L_a3c
.L_a24:
    cmp r9, #0x0
    moveq r2, #0x3
    beq .L_a3c
    cmp r9, r5
    moveq r2, #0x5
    movne r2, #0x4
.L_a3c:
    cmp r8, r4
    bne .L_a54
    cmp r7, #0x0
    ldrgt sl, [sp, #0x4c]
    movle sl, #0x0
    b .L_a58
.L_a54:
    mov sl, #0x0
.L_a58:
    cmp r9, r5
    bne .L_a70
    cmp fp, #0x0
    ldrgt r3, [sp, #0x50]
    movle r3, #0x0
    b .L_a74
.L_a70:
    mov r3, #0x0
.L_a74:
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x20]
    ldr lr, [r0, #0x84]
    mov ip, #0x14
    mla r1, lr, ip, r1
    add r1, r1, sl
    ldr sl, [sp, #0x10]
    ldr r0, _LIT7
    add sl, sl, r9
    str r1, [sp]
    mov r1, #0x4
    add r3, r3, sl, lsl #0x3
    bl func_ov006_021cb158
    add r9, r9, #0x1
    cmp r9, r6
    blt .L_9dc
.L_ab4:
    ldr r0, [sp, #0x28]
    add r8, r8, #0x1
    cmp r8, r0
    ldr r0, [sp, #0x20]
    add r0, r0, #0x8
    str r0, [sp, #0x20]
    blt .L_9b4
.L_ad0:
    ldr r0, [sp, #0x8]
    mov r1, #0x1
    mov r2, r1
    add r0, r0, #0x4
    bl func_02001cd0
    ldr r0, [sp, #0x8]
    mov r4, #0xc
    ldr r1, [r0, #0x84]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x14]
    mov r5, r0, lsl #0x3
    add r0, r2, #0x5
    str r0, [sp]
    ldr r0, [sp, #0x8]
    ldr r2, [sp, #0x30]
    add r0, r0, #0x4
    add r3, r5, #0x6
    str r4, [sp, #0x4]
    bl func_02005240
    ldr r0, [sp, #0x8]
    mov r1, #0xf
    add r0, r0, #0x4
    mov r2, #0x1
    bl func_02001cd0
    ldr r0, [sp, #0x8]
    add r3, r5, #0x5
    ldr r5, [r0, #0x84]
    mov r4, #0x14
    mul r4, r5, r4
    add r4, r4, #0x4
    str r4, [sp]
    mov r4, #0xc
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x30]
    add r0, r0, #0x4
    str r4, [sp, #0x4]
    bl func_02005240
.L_b6c:
    mov r0, #0x1
    add sp, sp, #0x94
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word data_02104f4c
_LIT2: .word data_ov006_021ce8a8
_LIT3: .word data_ov006_021ce650
_LIT4: .word 0x000003f1
_LIT5: .word data_ov006_021cebfc
_LIT6: .word data_ov006_021cec00
_LIT7: .word data_ov006_0225e138
