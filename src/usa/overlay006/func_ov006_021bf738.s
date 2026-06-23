; func_ov006_021bf738 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02104e6c
        .extern data_ov006_0224f328
        .extern data_ov006_0225e018
        .extern func_02001d48
        .extern func_02001d78
        .extern func_0200506c
        .extern func_02005538
        .extern func_0202b0ac
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_0202b854
        .extern func_0202b86c
        .extern func_0202b89c
        .extern func_0202b8cc
        .extern func_0202b8fc
        .extern func_0202b92c
        .extern func_0202b95c
        .extern func_0202bacc
        .extern func_0202bb24
        .extern func_0202e1e0
        .extern func_0208dcb4
        .extern func_0208deac
        .extern func_02094410
        .extern func_02094688
        .extern func_020aace8
        .extern func_020b377c
        .extern func_ov006_021b6c1c
        .extern func_ov006_021b6e50
        .extern func_ov006_021c11f0
        .extern func_ov006_021c12b8
        .extern func_ov006_021c1380
        .extern func_ov006_021cafcc
        .extern func_ov006_021cb04c
        .global func_ov006_021bf738
        .arm
func_ov006_021bf738:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xec
    mov r9, r0
    bl func_0208dcb4
    ldr r3, [r9, #0x50]
    add r2, r9, #0xa0
    mov r1, #0x24
    mla r1, r3, r1, r2
    str r0, [sp, #0x9c]
    cmp r3, #0x4
    ldreq r0, [r9, #0x84]
    str r1, [sp, #0x98]
    cmpeq r0, #0x0
    bne .L_50
    ldr r0, [sp, #0x9c]
    mov r2, #0x3000
    add r1, r0, #0x2440
    mov r0, #0x0
    bl func_02094410
    b .L_a0
.L_50:
    ldr r0, [sp, #0x9c]
    mov r4, #0x0
    add r0, r0, #0x44
    mov r5, r4
    add r7, r0, #0x1400
    mov r8, r4
    mov r6, #0x1c
.L_6c:
    mov r0, r8
    mov r2, r6
    add r1, r7, r5
    bl Fill32
    add r4, r4, #0x1
    cmp r4, #0x20
    add r5, r5, #0x20
    blt .L_6c
    ldr r0, [sp, #0x9c]
    mov r2, #0x3c00
    add r1, r0, #0x1840
    mov r0, #0x0
    bl func_02094410
.L_a0:
    mov r0, #0x5
    str r0, [sp, #0x20]
    mov r0, #0x6
    str r0, [sp, #0x1c]
    mov r0, #0x7
    str r0, [sp, #0x18]
    mov r0, #0x8
    mov r4, #0x0
    str r0, [sp, #0x14]
.L_c4:
    ldr r0, [sp, #0x98]
    ldr r0, [r0, #0x20]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_19c
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    cmpeq r4, #0x0
    beq .L_19c
    ldr r0, [sp, #0x20]
    mov r8, #0x0
    mov r3, r0, lsl #0x5
    ldr r0, [sp, #0x1c]
    add sl, r3, #0x2
    mov r2, r0, lsl #0x5
    ldr r0, [sp, #0x18]
    add r5, r2, #0x2
    mov r1, r0, lsl #0x5
    ldr r0, [sp, #0x14]
    add r6, r1, #0x2
    mov r0, r0, lsl #0x5
    add r7, r0, #0x2
.L_11c:
    bl func_0208deac
    orr r1, sl, #0x4000
    add r0, r0, r4, lsl #0x8
    add r0, r0, r8, lsl #0x1
    add r0, r0, #0x100
    strh r1, [r0, #0x40]
    bl func_0208deac
    orr r1, r5, #0x4000
    add r0, r0, r4, lsl #0x8
    add r0, r0, r8, lsl #0x1
    add r0, r0, #0x100
    strh r1, [r0, #0x80]
    bl func_0208deac
    orr r1, r6, #0x1000
    add r0, r0, r4, lsl #0x8
    add r0, r0, r8, lsl #0x1
    add r0, r0, #0x100
    strh r1, [r0, #0xc0]
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, r8, lsl #0x1
    add r0, r0, #0x200
    orr r1, r7, #0x1000
    strh r1, [r0]
    add sl, sl, #0x1
    add r5, r5, #0x1
    add r6, r6, #0x1
    add r7, r7, #0x1
    add r8, r8, #0x1
    cmp r8, #0x1c
    ble .L_11c
    b .L_25c
.L_19c:
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    cmpeq r4, #0x0
    ldreq r0, [r9, #0x84]
    cmpeq r0, #0x0
    beq .L_25c
    ldr r0, [sp, #0x20]
    mov r7, #0x0
    mov r1, r0, lsl #0x5
    ldr r0, [sp, #0x1c]
    add r5, r1, #0x2
    mov r0, r0, lsl #0x5
    add r6, r0, #0x2
    mov sl, r7
    mov fp, r7
.L_1d8:
    cmp r7, #0x3
    movlt r8, #0x4
    movge r8, #0x1
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, r7, lsl #0x1
    orr r1, r5, r8, lsl #0xc
    add r0, r0, #0x100
    cmp r7, #0x3
    movlt r8, #0x4
    strh r1, [r0, #0x40]
    movge r8, #0x1
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, r7, lsl #0x1
    orr r1, r6, r8, lsl #0xc
    add r0, r0, #0x100
    strh r1, [r0, #0x80]
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, r7, lsl #0x1
    add r0, r0, #0x100
    strh sl, [r0, #0xc0]
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, r7, lsl #0x1
    add r0, r0, #0x200
    add r7, r7, #0x1
    strh fp, [r0]
    add r5, r5, #0x1
    add r6, r6, #0x1
    cmp r7, #0x1c
    ble .L_1d8
.L_25c:
    ldr r0, [sp, #0x20]
    add r4, r4, #0x1
    add r0, r0, #0x4
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x1c]
    cmp r4, #0x4
    add r0, r0, #0x4
    str r0, [sp, #0x1c]
    ldr r0, [sp, #0x18]
    add r0, r0, #0x4
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x14]
    add r0, r0, #0x4
    str r0, [sp, #0x14]
    blt .L_c4
    ldr r2, [sp, #0x9c]
    ldr r0, _LIT0
    add r1, r9, #0x4
    add r2, r2, #0x40
    bl func_ov006_021cafcc
    ldr r0, [sp, #0x98]
    ldr r0, [r0, #0x20]
    mov r0, r0, lsl #0x1f
    movs r1, r0, lsr #0x1f
    movne r4, #0xa
    ldr r0, [r9, #0x50]
    moveq r4, #0x1
    cmp r0, #0x4
    moveq r0, #0x3
    streq r0, [sp, #0x8]
    movne r0, #0x4
    strne r0, [sp, #0x8]
    cmp r1, #0x0
    beq .L_468
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    mov r0, #0x0
    str r0, [sp, #0xc]
    ble .L_de8
    mov r0, #0x59
    str r0, [sp, #0x28]
    mov r0, #0x39
    str r0, [sp, #0x24]
.L_308:
    cmp r4, #0x0
    mov sl, #0x0
    ble .L_434
    mov r8, #0xe
.L_318:
    ldr r0, [sp, #0x98]
    ldr r2, [r0, #0x8]
    ldr r1, [r0, #0xc]
    ldr r0, [sp, #0xc]
    add r0, r2, r0
    mla r2, r4, r0, sl
    cmp r2, r1
    bge .L_434
    ldr r3, [sp, #0x98]
    ldr r0, _LIT1
    ldr r3, [r3, #0x20]
    ldr r1, [r9, #0x50]
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6c1c
    mov r5, r0
    bl func_0202b95c
    mov r6, r0
    mov r0, r5
    bl func_0202bb24
    mov r7, r0
    ldr r0, _LIT1
    ldr r1, [r9, #0x50]
    mov r2, r5
    bl func_ov006_021b6e50
    mov fp, r0
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    ldreq r5, [sp, #0x28]
    ldrne r5, [sp, #0x24]
    cmp r6, #0x3
    bge .L_3c0
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    beq .L_3c0
    sub r0, r5, #0xd
    str r0, [sp]
    ldr r0, _LIT0
    mov r2, r6
    mov r1, #0x3
    sub r3, r8, #0xa
    bl func_ov006_021cb04c
.L_3c0:
    cmp r7, #0x0
    ldrne r0, [r9, #0x40]
    cmpne r0, #0x5
    beq .L_3ec
    sub r0, r5, #0xd
    str r0, [sp]
    mov r1, #0x3
    ldr r0, _LIT0
    mov r2, r1
    add r3, r8, #0x2
    bl func_ov006_021cb04c
.L_3ec:
    ldr r0, [r9, #0x50]
    cmp r0, #0x0
    bne .L_424
    ldr r0, [r9, #0x40]
    cmp r0, #0x5
    cmpne r0, #0x6
    beq .L_424
    add r0, r5, #0x6
    str r0, [sp]
    ldr r0, _LIT0
    mov r2, fp
    mov r1, #0x2
    add r3, r8, #0x5
    bl func_ov006_021cb04c
.L_424:
    add r8, r8, #0x17
    add sl, sl, #0x1
    cmp sl, r4
    blt .L_318
.L_434:
    ldr r0, [sp, #0xc]
    add r1, r0, #0x1
    ldr r0, [sp, #0x8]
    str r1, [sp, #0xc]
    cmp r1, r0
    ldr r0, [sp, #0x28]
    add r0, r0, #0x20
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x24]
    add r0, r0, #0x20
    str r0, [sp, #0x24]
    blt .L_308
    b .L_de8
.L_468:
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    mov r0, #0x0
    str r0, [sp, #0x10]
    ble .L_de8
    mov r0, #0x39
    str r0, [sp, #0x38]
    add r0, r0, #0x304
    str r0, [sp, #0x30]
    ldr r0, [sp, #0x38]
    add r0, r0, #0x314
    str r0, [sp, #0x2c]
    mov r0, #0x59
    str r0, [sp, #0x40]
    mov r0, #0x4c
    str r0, [sp, #0x3c]
    mov r0, #0x2c
    str r0, [sp, #0x34]
.L_4c4:
    ldr r0, [sp, #0x98]
    ldr r2, [r0, #0x8]
    ldr r1, [r0, #0xc]
    ldr r0, [sp, #0x10]
    add r2, r2, r0
    cmp r2, r1
    bge .L_de8
    ldr r3, [sp, #0x98]
    ldr r0, _LIT1
    ldr r3, [r3, #0x20]
    ldr r1, [r9, #0x50]
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6c1c
    mov r8, r0
    bl func_0202b95c
    str r0, [sp, #0x80]
    mov r0, r8
    bl func_0202bb24
    str r0, [sp, #0x7c]
    mov r0, r8
    bl func_0202b854
    str r0, [sp, #0x78]
    mov r0, r8
    bl func_0202b89c
    mov r5, r0
    mov r0, r8
    bl func_0202b8cc
    mov r6, r0
    mov r0, r8
    bl func_0202b8fc
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x74]
    mov r0, r8
    bl func_0202b92c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x70]
    mov r0, r8
    bl func_0202b83c
    str r0, [sp, #0x6c]
    mov r0, r8
    bl func_0202b824
    str r0, [sp, #0x68]
    mov r0, r8
    bl func_0202b86c
    str r0, [sp, #0x64]
    ldr r0, [r9, #0x50]
    mov r1, #0xe
    cmp r0, #0x4
    bne .L_5bc
    str r1, [sp, #0x90]
    ldr r1, [sp, #0x40]
    str r1, [sp, #0x8c]
    mov r1, #0x1c
    str r1, [sp, #0x88]
    ldr r1, [sp, #0x3c]
    str r1, [sp, #0x84]
    ldr r1, [sp, #0x10]
    add r4, r1, #0x1
    b .L_5dc
.L_5bc:
    str r1, [sp, #0x90]
    ldr r1, [sp, #0x38]
    ldr r4, [sp, #0x10]
    str r1, [sp, #0x8c]
    mov r1, #0x1c
    str r1, [sp, #0x88]
    ldr r1, [sp, #0x34]
    str r1, [sp, #0x84]
.L_5dc:
    ldr r1, [r9, #0x40]
    cmp r1, #0x0
    bne .L_628
    cmp r0, #0x4
    beq .L_628
    ldr r1, [sp, #0x98]
    ldr r0, [sp, #0x10]
    add r0, r1, r0
    ldrsb r0, [r0, #0x1c]
    cmp r0, #0x0
    ble .L_618
    mov r0, #0x9c
    mov r7, #0x1a
    str r0, [sp, #0x94]
    b .L_634
.L_618:
    mov r0, #0xb4
    mov r7, #0x1e
    str r0, [sp, #0x94]
    b .L_634
.L_628:
    mov r0, #0xc0
    mov r7, #0x20
    str r0, [sp, #0x94]
.L_634:
    mov r0, r8
    bl func_0202b0ac
    mov sl, r0
    ldr r1, _LIT2
    ldr r1, [r1, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1d
    bne .L_6bc
    bl func_020aace8
    cmp r0, r7
    ble .L_690
    sub r7, r7, #0x2
    mov r0, sl
    add r1, sp, #0xc8
    mov r2, r7
    bl func_02094688
    add sl, sp, #0xc8
    mov r0, #0x2e
    strb r0, [sl, r7]
    add r1, sl, r7
    strb r0, [r1, #0x1]
    mov r0, #0x0
    strb r0, [r1, #0x2]
.L_690:
    ldr r0, [sp, #0x84]
    ldr r2, [sp, #0x9c]
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r3, [sp, #0x88]
    mov r1, sl
    add r0, r9, #0x4
    add r2, r2, #0x40
    bl func_0200506c
    b .L_7a0
.L_6bc:
    bl func_020aace8
    mov r7, r0
    mov r0, sl
    mov r1, #0xc
    mov r2, #0x5
    bl func_02005538
    ldr r1, [sp, #0x94]
    cmp r0, r1
    bgt .L_6f0
    cmp r7, #0x0
    ble .L_760
    cmp r0, #0x0
    bgt .L_760
.L_6f0:
    cmp r7, #0x22
    movge r7, #0x22
    add r0, sp, #0xc8
    add fp, r0, r7
    ldr r0, [sp, #0x94]
    sub r0, r0, #0xc
    str r0, [sp, #0xa0]
.L_70c:
    sub r7, r7, #0x1
    mov r0, sl
    add r1, sp, #0xc8
    mov r2, r7
    bl func_02094688
    mov r0, #0x0
    strb r0, [fp, #-1]!
    add r0, sp, #0xc8
    mov r1, #0xc
    mov r2, #0x5
    bl func_02005538
    ldr r1, [sp, #0xa0]
    cmp r0, r1
    bgt .L_70c
    add sl, sp, #0xc8
    mov r0, #0x2e
    strb r0, [sl, r7]
    add r1, sl, r7
    strb r0, [r1, #0x1]
    mov r0, #0x0
    strb r0, [r1, #0x2]
.L_760:
    add r0, r9, #0x4
    mov r1, #0x5
    bl func_02001d78
    ldr r0, [sp, #0x84]
    ldr r2, [sp, #0x9c]
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r3, [sp, #0x88]
    mov r1, sl
    add r0, r9, #0x4
    add r2, r2, #0x40
    bl func_0200506c
    add r0, r9, #0x4
    mvn r1, #0x0
    bl func_02001d78
.L_7a0:
    ldr r0, [sp, #0x80]
    cmp r0, #0x3
    bge .L_7dc
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    beq .L_7dc
    ldr r0, [sp, #0x8c]
    ldr r3, [sp, #0x90]
    sub r0, r0, #0xd
    str r0, [sp]
    ldr r2, [sp, #0x80]
    ldr r0, _LIT0
    mov r1, #0x3
    sub r3, r3, #0xa
    bl func_ov006_021cb04c
.L_7dc:
    ldr r0, [sp, #0x7c]
    cmp r0, #0x0
    ldrne r0, [r9, #0x40]
    cmpne r0, #0x5
    beq .L_814
    ldr r0, [sp, #0x8c]
    mov r1, #0x3
    sub r0, r0, #0xd
    str r0, [sp]
    ldr r0, [sp, #0x90]
    mov r2, r1
    add r3, r0, #0x2
    ldr r0, _LIT0
    bl func_ov006_021cb04c
.L_814:
    mov r0, r8
    bl func_0202bacc
    cmp r0, #0x0
    ldreq r0, [r9, #0x40]
    cmpeq r0, #0x6
    beq .L_d88
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_8b0
    b .L_8b0
    b .L_884
    b .L_858
    b .L_8b0
    b .L_884
    b .L_8ec
    b .L_8ec
.L_858:
    bl func_0208deac
    ldr r1, _LIT3
    add r0, r0, r4, lsl #0x8
    add r0, r0, #0x200
    strh r1, [r0, #0xa]
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, #0x200
    ldr r1, _LIT4
    strh r1, [r0, #0xe]
    b .L_8ec
.L_884:
    bl func_0208deac
    ldr r1, _LIT5
    add r0, r0, r4, lsl #0x8
    add r0, r0, #0x200
    strh r1, [r0, #0xa]
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, #0x200
    ldr r1, _LIT6
    strh r1, [r0, #0xe]
    b .L_8ec
.L_8b0:
    bl func_0208deac
    ldr r1, _LIT3
    add r0, r0, r4, lsl #0x8
    add r0, r0, #0x200
    strh r1, [r0, #0x6]
    bl func_0208deac
    ldr r1, _LIT5
    add r0, r0, r4, lsl #0x8
    add r0, r0, #0x200
    strh r1, [r0, #0xa]
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, #0x200
    ldr r1, _LIT6
    strh r1, [r0, #0xe]
.L_8ec:
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_938
    bl func_0208deac
    ldr r1, _LIT7
    add r0, r0, r4, lsl #0x8
    add r0, r0, #0x200
    strh r1, [r0, #0x1e]
    bl func_0208deac
    ldr r1, _LIT8
    add r0, r0, r4, lsl #0x8
    add r0, r0, #0x200
    strh r1, [r0, #0x24]
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, #0x200
    ldr r1, _LIT9
    strh r1, [r0, #0x30]
.L_938:
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_a40
    b .L_a40
    b .L_9c8
    b .L_964
    b .L_a40
    b .L_9c8
    b .L_ae4
    b .L_ae4
.L_964:
    ldr r0, _LIT1
    mov r1, #0x0
    mov r2, r8
    bl func_ov006_021b6e50
    mov r7, r0
    bl func_0208deac
    add r1, r7, #0x29
    add r1, r1, #0x300
    add r0, r0, r4, lsl #0x8
    orr r1, r1, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0xc]
    ldr r0, _LIT1
    mov r1, #0x1
    mov r2, r8
    bl func_ov006_021b6e50
    mov r7, r0
    bl func_0208deac
    add r1, r7, #0x29
    add r1, r1, #0x300
    add r0, r0, r4, lsl #0x8
    orr r1, r1, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0x10]
    b .L_ae4
.L_9c8:
    ldr r0, _LIT1
    mov r1, #0x1
    mov r2, r8
    bl func_ov006_021b6e50
    mov r7, r0
    ldr r0, _LIT1
    mov r1, #0x3
    mov r2, r8
    bl func_ov006_021b6e50
    add r7, r7, r0
    bl func_0208deac
    add r1, r7, #0x29
    add r1, r1, #0x300
    add r0, r0, r4, lsl #0x8
    orr r1, r1, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0xc]
    ldr r0, _LIT1
    mov r1, #0x2
    mov r2, r8
    bl func_ov006_021b6e50
    mov r7, r0
    bl func_0208deac
    add r1, r7, #0x29
    add r1, r1, #0x300
    add r0, r0, r4, lsl #0x8
    orr r1, r1, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0x10]
    b .L_ae4
.L_a40:
    ldr r0, _LIT1
    mov r1, #0x0
    mov r2, r8
    bl func_ov006_021b6e50
    mov r7, r0
    bl func_0208deac
    add r1, r7, #0x29
    add r1, r1, #0x300
    add r0, r0, r4, lsl #0x8
    orr r1, r1, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0x8]
    ldr r0, _LIT1
    mov r1, #0x1
    mov r2, r8
    bl func_ov006_021b6e50
    mov r7, r0
    ldr r0, _LIT1
    mov r1, #0x3
    mov r2, r8
    bl func_ov006_021b6e50
    add r7, r7, r0
    bl func_0208deac
    add r1, r7, #0x29
    add r1, r1, #0x300
    add r0, r0, r4, lsl #0x8
    orr r1, r1, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0xc]
    ldr r0, _LIT1
    mov r1, #0x2
    mov r2, r8
    bl func_ov006_021b6e50
    mov r7, r0
    bl func_0208deac
    add r1, r7, #0x29
    add r1, r1, #0x300
    add r0, r0, r4, lsl #0x8
    orr r1, r1, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0x10]
.L_ae4:
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_c5c
    bl func_0208deac
    ldr r1, [sp, #0x74]
    add r0, r0, r4, lsl #0x8
    cmp r1, #0x0
    ldr r1, [sp, #0x78]
    add r0, r0, #0x200
    add r1, r1, #0x29
    add r1, r1, #0x300
    orr r1, r1, #0x3000
    strh r1, [r0, #0x20]
    bge .L_b38
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, #0x200
    ldr r1, _LIT10
    strh r1, [r0, #0x2c]
    b .L_bb8
.L_b38:
    mov r7, #0x3e8
    mov sl, #0x0
.L_b40:
    cmp r5, r7
    bge .L_b54
    cmp r5, #0x0
    cmpeq r7, #0x1
    bne .L_b7c
.L_b54:
    mov r1, #0xa
    mul r1, r7, r1
    mov r0, r5
    bl func_020b377c
    mov r0, r1
    mov r1, r7
    bl func_020b377c
    add r0, r0, #0x29
    add fp, r0, #0x300
    b .L_b80
.L_b7c:
    mov fp, #0x0
.L_b80:
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, sl, lsl #0x1
    orr r1, fp, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0x26]
    add sl, sl, #0x1
    ldr r0, _LIT11
    mov r2, r7
    smull r1, r7, r0, r2
    mov r0, r2, lsr #0x1f
    add r7, r0, r7, asr #0x2
    cmp sl, #0x4
    blt .L_b40
.L_bb8:
    ldr r0, [sp, #0x70]
    cmp r0, #0x0
    bge .L_bdc
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, #0x200
    ldr r1, _LIT10
    strh r1, [r0, #0x38]
    b .L_c5c
.L_bdc:
    mov r7, #0x3e8
    mov r5, #0x0
    mov fp, #0xa
.L_be8:
    cmp r6, r7
    bge .L_bfc
    cmp r6, #0x0
    cmpeq r7, #0x1
    bne .L_c20
.L_bfc:
    mov r0, r6
    mul r1, r7, fp
    bl func_020b377c
    mov r0, r1
    mov r1, r7
    bl func_020b377c
    add r0, r0, #0x29
    add sl, r0, #0x300
    b .L_c24
.L_c20:
    mov sl, #0x0
.L_c24:
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r0, r0, r5, lsl #0x1
    orr r1, sl, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0x32]
    add r5, r5, #0x1
    ldr r0, _LIT11
    mov r2, r7
    smull r1, r7, r0, r2
    mov r0, r2, lsr #0x1f
    add r7, r0, r7, asr #0x2
    cmp r5, #0x4
    blt .L_be8
.L_c5c:
    ldr r1, [sp, #0x6c]
    ldr r2, [sp, #0x10]
    mov r0, r9
    bl func_ov006_021c11f0
    ldr r0, [sp, #0x10]
    add r5, r0, #0x5
    bl func_0208deac
    ldr r1, [sp, #0x30]
    add r0, r0, r4, lsl #0x8
    orr r1, r1, r5, lsl #0xc
    add r0, r0, #0x100
    strh r1, [r0, #0xd4]
    bl func_0208deac
    ldr r1, [sp, #0x30]
    add r0, r0, r4, lsl #0x8
    add r1, r1, #0x1
    orr r1, r1, r5, lsl #0xc
    add r0, r0, #0x100
    strh r1, [r0, #0xd6]
    bl func_0208deac
    ldr r1, [sp, #0x30]
    add r0, r0, r4, lsl #0x8
    add r1, r1, #0x2
    orr r1, r1, r5, lsl #0xc
    add r0, r0, #0x200
    strh r1, [r0, #0x14]
    bl func_0208deac
    ldr r1, [sp, #0x30]
    add r0, r0, r4, lsl #0x8
    add r1, r1, #0x3
    orr r1, r1, r5, lsl #0xc
    add r0, r0, #0x200
    strh r1, [r0, #0x16]
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_d04
    ldr r1, [sp, #0x68]
    ldr r2, [sp, #0x10]
    mov r0, r9
    bl func_ov006_021c12b8
    b .L_d14
.L_d04:
    ldr r1, [sp, #0x64]
    ldr r2, [sp, #0x10]
    mov r0, r9
    bl func_ov006_021c1380
.L_d14:
    ldr r0, [sp, #0x10]
    add r5, r0, #0x9
    bl func_0208deac
    ldr r1, [sp, #0x2c]
    add r0, r0, r4, lsl #0x8
    orr r1, r1, r5, lsl #0xc
    add r0, r0, #0x100
    strh r1, [r0, #0xd8]
    bl func_0208deac
    ldr r1, [sp, #0x2c]
    add r0, r0, r4, lsl #0x8
    add r1, r1, #0x1
    orr r1, r1, r5, lsl #0xc
    add r0, r0, #0x100
    strh r1, [r0, #0xda]
    bl func_0208deac
    ldr r1, [sp, #0x2c]
    add r0, r0, r4, lsl #0x8
    add r1, r1, #0x2
    orr r1, r1, r5, lsl #0xc
    add r0, r0, #0x200
    strh r1, [r0, #0x18]
    bl func_0208deac
    add r0, r0, r4, lsl #0x8
    add r1, r0, #0x200
    ldr r0, [sp, #0x2c]
    add r0, r0, #0x3
    orr r0, r0, r5, lsl #0xc
    strh r0, [r1, #0x1a]
.L_d88:
    ldr r0, [sp, #0x10]
    add r1, r0, #0x1
    ldr r0, [sp, #0x8]
    str r1, [sp, #0x10]
    cmp r1, r0
    ldr r0, [sp, #0x40]
    add r0, r0, #0x20
    str r0, [sp, #0x40]
    ldr r0, [sp, #0x3c]
    add r0, r0, #0x20
    str r0, [sp, #0x3c]
    ldr r0, [sp, #0x38]
    add r0, r0, #0x20
    str r0, [sp, #0x38]
    ldr r0, [sp, #0x34]
    add r0, r0, #0x20
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x30]
    add r0, r0, #0x4
    str r0, [sp, #0x30]
    ldr r0, [sp, #0x2c]
    add r0, r0, #0x4
    str r0, [sp, #0x2c]
    blt .L_4c4
.L_de8:
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    bne .L_13a4
    ldr r0, [r9, #0x84]
    cmp r0, #0x0
    beq .L_13a4
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r8, [r9, #0x60]
    mov r0, r8
    bl func_0202b95c
    str r0, [sp, #0x60]
    mov r0, r8
    bl func_0202bb24
    str r0, [sp, #0x5c]
    mov r0, r8
    bl func_0202b854
    str r0, [sp, #0x58]
    mov r0, r8
    bl func_0202b89c
    mov r5, r0
    mov r0, r8
    bl func_0202b8cc
    mov r6, r0
    mov r0, r8
    bl func_0202b8fc
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x54]
    mov r0, r8
    bl func_0202b92c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x50]
    mov r0, r8
    bl func_0202b83c
    str r0, [sp, #0x4c]
    mov r0, r8
    bl func_0202b824
    str r0, [sp, #0x48]
    mov r0, r8
    bl func_0202b86c
    str r0, [sp, #0x44]
    mov r0, r8
    bl func_0202b0ac
    ldr r1, _LIT2
    mov r4, r0
    ldr r1, [r1, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1d
    bne .L_f20
    bl func_020aace8
    cmp r0, #0x20
    ble .L_ef4
    mov r0, r4
    add r1, sp, #0xa4
    mov r2, #0x1e
    bl func_02094688
    mov r0, #0x2e
    strb r0, [sp, #0xc2]
    strb r0, [sp, #0xc3]
    mov r0, #0x0
    strb r0, [sp, #0xc4]
    add r4, sp, #0xa4
.L_ef4:
    ldr r0, [sp, #0x9c]
    mov r1, r4
    add r2, r0, #0x40
    mov r0, #0x2c
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r0, r9, #0x4
    mov r3, #0x1c
    bl func_0200506c
    b .L_ff4
.L_f20:
    bl func_020aace8
    mov sl, r0
    mov r0, r4
    mov r1, #0xc
    mov r2, #0x5
    bl func_02005538
    cmp r0, #0xc0
    bgt .L_f50
    cmp sl, #0x0
    ble .L_fb4
    cmp r0, #0x0
    bgt .L_fb4
.L_f50:
    cmp sl, #0x22
    movge sl, #0x22
    add fp, sp, #0xa4
    add r7, fp, sl
.L_f60:
    sub sl, sl, #0x1
    mov r0, r4
    mov r1, fp
    mov r2, sl
    bl func_02094688
    mov r0, #0x0
    strb r0, [r7, #-1]!
    mov r0, fp
    mov r1, #0xc
    mov r2, #0x5
    bl func_02005538
    cmp r0, #0xb4
    bgt .L_f60
    mov r1, #0x2e
    add r4, sp, #0xa4
    add r0, sp, #0xa5
    strb r1, [r4, sl]
    strb r1, [r0, sl]
    mov r1, #0x0
    add r0, sp, #0xa6
    strb r1, [r0, sl]
.L_fb4:
    add r0, r9, #0x4
    mov r1, #0x5
    bl func_02001d78
    ldr r0, [sp, #0x9c]
    mov r1, r4
    add r2, r0, #0x40
    mov r0, #0x2c
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r0, r9, #0x4
    mov r3, #0x1c
    bl func_0200506c
    add r0, r9, #0x4
    mvn r1, #0x0
    bl func_02001d78
.L_ff4:
    ldr r0, [sp, #0x60]
    cmp r0, #0x3
    bge .L_101c
    mov r2, r0
    mov r0, #0x2c
    str r0, [sp]
    ldr r0, _LIT0
    mov r1, #0x3
    mov r3, #0x4
    bl func_ov006_021cb04c
.L_101c:
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    beq .L_1044
    mov r0, #0x2c
    mov r1, #0x3
    str r0, [sp]
    ldr r0, _LIT0
    mov r2, r1
    mov r3, #0x10
    bl func_ov006_021cb04c
.L_1044:
    bl func_0208deac
    ldr r1, _LIT3
    add r0, r0, #0x200
    strh r1, [r0, #0x6]
    bl func_0208deac
    ldr r1, _LIT5
    add r0, r0, #0x200
    strh r1, [r0, #0xa]
    bl func_0208deac
    ldr r1, _LIT6
    add r0, r0, #0x200
    strh r1, [r0, #0xe]
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_10b4
    bl func_0208deac
    ldr r1, _LIT7
    add r0, r0, #0x200
    strh r1, [r0, #0x1e]
    bl func_0208deac
    ldr r1, _LIT8
    add r0, r0, #0x200
    strh r1, [r0, #0x24]
    bl func_0208deac
    add r0, r0, #0x200
    ldr r1, _LIT9
    strh r1, [r0, #0x30]
.L_10b4:
    ldr r0, _LIT1
    mov r2, r8
    mov r1, #0x0
    bl func_ov006_021b6e50
    mov r4, r0
    bl func_0208deac
    add r1, r4, #0x29
    add r1, r1, #0x300
    orr r1, r1, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0x8]
    ldr r0, _LIT1
    mov r1, #0x1
    mov r2, r8
    bl func_ov006_021b6e50
    mov r4, r0
    ldr r0, _LIT1
    mov r1, #0x3
    mov r2, r8
    bl func_ov006_021b6e50
    add r4, r4, r0
    bl func_0208deac
    add r1, r4, #0x29
    add r1, r1, #0x300
    orr r1, r1, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0xc]
    ldr r0, _LIT1
    mov r1, #0x2
    mov r2, r8
    bl func_ov006_021b6e50
    mov r4, r0
    bl func_0208deac
    add r1, r4, #0x29
    add r1, r1, #0x300
    orr r1, r1, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0x10]
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_12e0
    bl func_0208deac
    ldr r1, [sp, #0x58]
    add r0, r0, #0x200
    add r1, r1, #0x29
    add r1, r1, #0x300
    orr r1, r1, #0x3000
    strh r1, [r0, #0x20]
    ldr r0, [sp, #0x54]
    cmp r0, #0x0
    bge .L_1198
    bl func_0208deac
    ldr r1, _LIT10
    add r0, r0, #0x200
    strh r1, [r0, #0x2c]
    b .L_1214
.L_1198:
    mov r4, #0x3e8
    mov r7, #0x0
    mov fp, #0xa
.L_11a4:
    cmp r5, r4
    bge .L_11b8
    cmp r5, #0x0
    cmpeq r4, #0x1
    bne .L_11dc
.L_11b8:
    mul r1, r4, fp
    mov r0, r5
    bl func_020b377c
    mov r0, r1
    mov r1, r4
    bl func_020b377c
    add r0, r0, #0x29
    add sl, r0, #0x300
    b .L_11e0
.L_11dc:
    mov sl, #0x0
.L_11e0:
    bl func_0208deac
    add r0, r0, r7, lsl #0x1
    orr r1, sl, #0x3000
    add r0, r0, #0x200
    strh r1, [r0, #0x26]
    add r7, r7, #0x1
    ldr r0, _LIT11
    mov r2, r4
    smull r1, r4, r0, r2
    mov r0, r2, lsr #0x1f
    add r4, r0, r4, asr #0x2
    cmp r7, #0x4
    blt .L_11a4
.L_1214:
    ldr r0, [sp, #0x50]
    cmp r0, #0x0
    bge .L_1264
    bl func_0208deac
    ldr r1, _LIT10
    add r0, r0, #0x200
    strh r1, [r0, #0x38]
    b .L_12e0
_LIT0: .word data_ov006_0225e018
_LIT1: .word data_ov006_0224f328
_LIT2: .word data_02104e6c
_LIT3: .word 0x00002325
_LIT4: .word 0x00002328
_LIT5: .word 0x00002326
_LIT6: .word 0x00002327
_LIT7: .word 0x00002324
_LIT8: .word 0x00002322
_LIT9: .word 0x00002323
_LIT10: .word 0x00003336
_LIT11: .word 0x66666667
.L_1264:
    ldr fp, _LIT11
    mov r7, #0x3e8
    mov r5, #0x0
    mov r4, #0xa
.L_1274:
    cmp r6, r7
    bge .L_1288
    cmp r6, #0x0
    cmpeq r7, #0x1
    bne .L_12ac
.L_1288:
    mul r1, r7, r4
    mov r0, r6
    bl func_020b377c
    mov r0, r1
    mov r1, r7
    bl func_020b377c
    add r0, r0, #0x29
    add sl, r0, #0x300
    b .L_12b0
.L_12ac:
    mov sl, #0x0
.L_12b0:
    bl func_0208deac
    mov r1, r7
    orr r2, sl, #0x3000
    add r0, r0, r5, lsl #0x1
    add r0, r0, #0x200
    strh r2, [r0, #0x32]
    add r5, r5, #0x1
    smull r0, r7, fp, r1
    mov r0, r1, lsr #0x1f
    add r7, r0, r7, asr #0x2
    cmp r5, #0x4
    blt .L_1274
.L_12e0:
    ldr r1, [sp, #0x4c]
    mov r0, r9
    mov r2, #0x3
    bl func_ov006_021c11f0
    bl func_0208deac
    ldr r1, _LIT12
    add r0, r0, #0x100
    strh r1, [r0, #0xd4]
    bl func_0208deac
    ldr r1, _LIT13
    add r0, r0, #0x100
    strh r1, [r0, #0xd6]
    bl func_0208deac
    ldr r1, _LIT14
    add r0, r0, #0x200
    strh r1, [r0, #0x14]
    bl func_0208deac
    add r1, r0, #0x200
    ldr r2, _LIT15
    mov r0, r8
    strh r2, [r1, #0x16]
    bl func_0202e1e0
    cmp r0, #0x0
    mov r0, r9
    mov r2, #0x3
    beq .L_1354
    ldr r1, [sp, #0x48]
    bl func_ov006_021c12b8
    b .L_135c
.L_1354:
    ldr r1, [sp, #0x44]
    bl func_ov006_021c1380
.L_135c:
    bl func_0208deac
    ldr r1, _LIT16
    add r0, r0, #0x100
    strh r1, [r0, #0xd8]
    bl func_0208deac
    ldr r1, _LIT17
    add r0, r0, #0x100
    strh r1, [r0, #0xda]
    bl func_0208deac
    ldr r1, _LIT18
    add r0, r0, #0x200
    strh r1, [r0, #0x18]
    bl func_0208deac
    ldr r1, _LIT19
    add r0, r0, #0x200
    strh r1, [r0, #0x1a]
    mov r0, #0x0
    str r0, [r9, #0x84]
.L_13a4:
    mov r0, #0x1
    add sp, sp, #0xec
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT12: .word 0x00008349
_LIT13: .word 0x0000834a
_LIT14: .word 0x0000834b
_LIT15: .word 0x0000834c
_LIT16: .word 0x0000c359
_LIT17: .word 0x0000c35a
_LIT18: .word 0x0000c35b
_LIT19: .word 0x0000c35c
