; func_ov002_022651c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c8354
        .extern data_ov002_022c8390
        .extern data_ov002_022c841c
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf288
        .extern data_ov002_022d016c
        .extern func_0202b100
        .extern func_02030ea4
        .extern func_ov002_021ae484
        .extern func_ov002_021b3618
        .extern func_ov002_021b9bd4
        .extern func_ov002_021b9d34
        .extern func_ov002_021b9dd4
        .extern func_ov002_021b9ea4
        .extern func_ov002_021b9ecc
        .extern func_ov002_021c1e20
        .extern func_ov002_021c229c
        .extern func_ov002_021d479c
        .extern func_ov002_021d9144
        .extern func_ov002_021d94ac
        .extern func_ov002_021de480
        .extern func_ov002_021de940
        .extern func_ov002_021df62c
        .extern func_ov002_02244fe4
        .extern func_ov002_02264ce4
        .extern func_ov002_0226ad5c
        .extern func_ov002_0229ce5c
        .global func_ov002_022651c4
        .arm
func_ov002_022651c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x118
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r4, [r0, #0xcec]
    ldr r2, [r0, #0xd20]
    and r0, r4, #0x1
    mul r1, r0, r1
    str r1, [sp, #0x8]
    str r0, [sp, #0x4]
    ldr r1, _LIT2
    ldr r0, [sp, #0x8]
    cmp r2, #0x0
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x18
    and r0, r0, #0x1
    str r0, [sp, #0x10]
    beq .L_210
    mov r0, r4
    bl func_ov002_02264ce4
    cmp r0, #0x0
    addeq sp, sp, #0x118
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_210:
    ldr r5, _LIT0
    ldr r1, [r5, #0xd20]
    cmp r1, #0x14
    addls pc, pc, r1, lsl #0x2
    b .L_b74
    b .L_278
    b .L_2d0
    b .L_310
    b .L_348
    b .L_618
    b .L_73c
    b .L_8f8
    b .L_9f0
    b .L_b74
    b .L_b74
    b .L_a20
    b .L_a3c
    b .L_aac
    b .L_b74
    b .L_b74
    b .L_b74
    b .L_b74
    b .L_b74
    b .L_b74
    b .L_b74
    b .L_b08
.L_278:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_2ac
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    mov r1, #0x0
    orr r0, r0, #0x11
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
.L_2ac:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd20]
    add sp, sp, #0x118
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    str r0, [r1, #0xd24]
    str r0, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2d0:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_2f4
    mov r0, #0x5
    mov r1, #0x0
    bl func_ov002_02244fe4
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0, #0x488]
.L_2f4:
    ldr r1, _LIT0
    add sp, sp, #0x118
    ldr r2, [r1, #0xd20]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_310:
    ldr r0, _LIT3
    ldr r0, [r0, #0x488]
    cmp r0, #0x0
    beq .L_334
    sub r0, r1, #0x1
    str r0, [r5, #0xd20]
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_334:
    add r0, r1, #0x1
    str r0, [r5, #0xd20]
    mov r0, #0x0
    str r0, [r5, #0xd24]
    str r0, [r5, #0xd28]
.L_348:
    ldr r7, _LIT0
    ldr r9, [r7, #0xd28]
    cmp r9, #0xa
    bcs .L_600
    ldr fp, _LIT4
    ldr r1, _LIT5
    ldr r0, [sp, #0x8]
    add r5, fp, #0x520
    add r8, r1, r0
    mov r6, #0x14
.L_370:
    mov r0, r4
    mov r1, r9
    bl func_ov002_021b9ecc
    cmp r0, #0x0
    mlane r2, r9, r6, r8
    ldrneh r1, [r2, #0x38]
    cmpne r1, #0x0
    beq .L_5ec
    cmp r0, fp
    beq .L_3b0
    cmp r0, r5
    beq .L_40c
    ldr r1, _LIT6
    cmp r0, r1
    beq .L_548
    b .L_5ec
.L_3b0:
    ldr r0, [r7, #0xd28]
    cmp r0, #0x5
    bcc .L_5ec
    ldr r0, [r2, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_5ec
    mov r0, r4
    mov r1, r9
    bl func_ov002_021b9d34
    cmp r0, #0x0
    beq .L_5ec
    mov r0, r4
    mov r1, r9
    mov r2, #0x1
    bl func_ov002_021d9144
    ldr r1, _LIT0
    add sp, sp, #0x118
    ldr r2, [r1, #0xd28]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_40c:
    ldr r1, [r7, #0xd28]
    cmp r1, #0x5
    bcc .L_5ec
    ldr r2, _LIT0
    ldr r3, [r2, #0xd24]
    cmp r3, #0x0
    beq .L_43c
    cmp r3, #0x1
    beq .L_48c
    cmp r3, #0x2
    beq .L_4f4
    b .L_53c
.L_43c:
    ldr r5, _LIT5
    ldr r2, _LIT1
    ldr r0, [sp, #0x4]
    mov r3, #0x14
    mla r2, r0, r2, r5
    mul r0, r1, r3
    add r2, r2, #0x30
    ldr r3, [r2, r0]
    mov r0, r4
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    ldr r0, _LIT0
    ldr r1, [r0, #0xd24]
    add r1, r1, #0x1
    str r1, [r0, #0xd24]
    b .L_53c
.L_48c:
    ldr r3, _LIT7
    ldr r1, [sp, #0x8]
    ldr r1, [r3, r1]
    cmp r1, #0x0
    beq .L_4d8
    ldr r1, _LIT8
    ldr r1, [r1, r4, lsl #0x2]
    cmp r1, #0x1
    moveq r0, #0x1
    streq r0, [r2, #0xd44]
    beq .L_4e0
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x18
    mov r1, #0xee
    bl func_ov002_0229ce5c
    add r0, sp, #0x18
    bl func_ov002_021ae484
    b .L_4e0
.L_4d8:
    mov r0, #0x0
    str r0, [r2, #0xd44]
.L_4e0:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd24]
    add r1, r1, #0x1
    str r1, [r0, #0xd24]
    b .L_53c
.L_4f4:
    ldr r0, [r2, #0xd44]
    mov r2, #0x0
    cmp r0, #0x0
    mov r0, r4
    beq .L_518
    mov r3, r2
    mov r1, #0x1
    bl func_ov002_0226ad5c
    b .L_524
.L_518:
    mov r1, r9
    mov r3, r2
    bl func_ov002_021de480
.L_524:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd24]
    ldr r1, [r0, #0xd28]
    add r1, r1, #0x1
    str r1, [r0, #0xd28]
.L_53c:
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_548:
    ldr r0, [r7, #0xd28]
    cmp r0, #0x5
    bcc .L_5ec
    ldr r0, [r2, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_5ec
    mov r1, r9
    mov r0, r4
    bl func_ov002_021b3618
    ldr r1, _LIT9
    cmp r0, r1
    beq .L_5ec
    mov r1, r0, asr #0x8
    and r9, r1, #0xff
    and sl, r0, #0xff
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b9ea4
    cmp r0, #0x0
    beq .L_5ec
    cmp sl, r4
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c1e20
    cmp r0, #0x0
    bne .L_5ec
    ldr r3, _LIT10
    mov r0, sl
    mov r1, r9
    mvn r2, #0x0
    bl func_ov002_021d94ac
    ldr r1, _LIT0
    add sp, sp, #0x118
    ldr r2, [r1, #0xd28]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5ec:
    ldr r0, [r7, #0xd28]
    add r9, r0, #0x1
    str r9, [r7, #0xd28]
    cmp r9, #0xa
    bcc .L_370
.L_600:
    ldr r0, _LIT0
    mov r1, #0x5
    ldr r2, [r0, #0xd20]
    add r2, r2, #0x1
    str r2, [r0, #0xd20]
    str r1, [r0, #0xd28]
.L_618:
    ldr r8, _LIT0
    ldr r5, [r8, #0xd28]
    cmp r5, #0xa
    bcs .L_720
    rsb r6, r4, #0x1
    ldr r2, _LIT5
    ldr r0, _LIT1
    and r1, r6, #0x1
    mla r4, r1, r0, r2
    ldr fp, _LIT11
    add r9, r4, #0x30
    mov r7, #0x14
.L_648:
    mul sl, r5, r7
    ldr r0, [r9, sl]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addne r0, r4, sl
    ldrneh r0, [r0, #0x38]
    cmpne r0, #0x0
    beq .L_70c
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9d34
    cmp r0, #0x0
    beq .L_70c
    ldr r0, [r9, sl]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    cmp sl, fp
    cmpne sl, #0x1400
    ldrne r0, _LIT12
    cmpne sl, r0
    bne .L_70c
    mov r0, r6
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_021d9144
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_6f0
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9bd4
    mov r4, r0
    mov r0, sl
    bl func_02030ea4
    add r1, r4, #0x1
    cmp r1, r0
    bne .L_6f0
    mov r2, #0x0
    mov r0, r6
    mov r1, r5
    mov r3, r2
    bl func_ov002_021de480
.L_6f0:
    ldr r1, _LIT0
    add sp, sp, #0x118
    ldr r2, [r1, #0xd28]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_70c:
    ldr r0, [r8, #0xd28]
    add r5, r0, #0x1
    str r5, [r8, #0xd28]
    cmp r5, #0xa
    bcc .L_648
.L_720:
    ldr r1, _LIT0
    add sp, sp, #0x118
    ldr r2, [r1, #0xd20]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_73c:
    mov r0, #0x0
    str r0, [sp, #0x14]
.L_744:
    ldr r0, [sp, #0x14]
    mov fp, #0x2000
    eor r5, r4, r0
    ldr r2, _LIT5
    ldr r0, _LIT1
    and r1, r5, #0x1
    mla r0, r1, r0, r2
    add r9, r0, #0x94
    add sl, r0, #0x64
    mov r6, #0x5
    rsb fp, fp, #0x0
.L_770:
    ldr r0, [r9]
    mov r1, r0, lsl #0x13
    ldr r0, _LIT13
    cmp r0, r1, lsr #0x13
    bne .L_8b8
    ldrh r0, [sl, #0x38]
    cmp r0, #0x0
    beq .L_8b8
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9d34
    cmp r0, #0x0
    beq .L_8b8
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b3618
    and r7, r0, #0xff
    mov r0, r0, asr #0x8
    and r8, r0, #0xff
    cmp r7, r4
    bne .L_8b8
    mov r0, r5
    mov r1, r6
    mov r2, #0x1
    bl func_ov002_021d9144
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_8b8
    ldr r0, [sl, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_8b8
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9bd4
    add r0, r0, #0x1
    cmp r0, #0x2
    bne .L_8b8
    ldr r3, [r9]
    mov r0, #0x0
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    str r0, [sp, #0xc]
    mov r0, r5
    mov r1, r6
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    ldr r1, [r9]
    ldr r2, _LIT13
    and r1, r1, fp
    str r1, [r9]
    mov r1, #0x1
    str r1, [sp]
    mov r0, r7
    mov r1, r8
    mov r3, r6
    bl func_ov002_021c229c
    cmp r0, #0x0
    beq .L_884
    cmp r5, r7
    movne r2, #0x1
    ldr r3, _LIT13
    moveq r2, #0x0
    mov r0, r7
    mov r1, r8
    bl func_ov002_021de480
    str r0, [sp, #0xc]
.L_884:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    ldr r0, [r9]
    and r1, r0, fp
    orr r0, r1, #0x9d
    orr r0, r0, #0x1400
    str r0, [r9]
    beq .L_8b8
    mov r2, #0x0
    mov r0, r5
    mov r1, r6
    mov r3, r2
    bl func_ov002_021de940
.L_8b8:
    add r9, r9, #0x14
    add sl, sl, #0x14
    add r6, r6, #0x1
    cmp r6, #0xa
    blt .L_770
    ldr r0, [sp, #0x14]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    cmp r0, #0x2
    blt .L_744
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0, #0xd20]
    add r2, r2, #0x1
    str r2, [r0, #0xd20]
    str r1, [r0, #0xd28]
.L_8f8:
    ldr r6, _LIT0
    ldr sl, [r6, #0xd28]
    cmp sl, #0x5
    bcs .L_9d8
    ldr r1, _LIT5
    ldr r0, [sp, #0x8]
    mov fp, #0x0
    add r9, r1, r0
    mov r7, #0x8000
    mov r5, #0x14
.L_920:
    mla r0, sl, r5, r9
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_9c4
    mov r0, r4
    mov r1, sl
    bl func_ov002_021b9dd4
    mov r8, r0
    cmp r8, #0x0
    ble .L_9c4
    cmp r4, #0x0
    movne r0, r7
    moveq r0, fp
    orr r0, r0, #0x47
    sub r2, r8, #0x1
    mov r0, r0, lsl #0x10
    mov r1, sl, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, #0x0
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d479c
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_9c4
    subs r0, r8, #0x1
    bne .L_9c4
    mov r0, r4
    mov r1, sl
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021de480
    ldr r1, _LIT0
    add sp, sp, #0x118
    ldr r2, [r1, #0xd28]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9c4:
    ldr r0, [r6, #0xd28]
    add sl, r0, #0x1
    str sl, [r6, #0xd28]
    cmp sl, #0x5
    bcc .L_920
.L_9d8:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0, #0xd20]
    add r2, r2, #0x1
    str r2, [r0, #0xd20]
    str r1, [r0, #0xd28]
.L_9f0:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_a14
    ldr r0, _LIT0
    mov r1, #0x14
    str r1, [r0, #0xd20]
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a14:
    ldr r0, _LIT0
    mov r1, #0xa
    str r1, [r0, #0xd20]
.L_a20:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0, #0xd20]
    add r2, r2, #0x1
    str r2, [r0, #0xd20]
    str r1, [r0, #0xd24]
    str r1, [r0, #0xd28]
.L_a3c:
    ldr r5, _LIT0
    ldr r0, [r5, #0xd24]
    cmp r0, #0x2a
    bcs .L_a88
    ldr r7, _LIT14
    mov r6, #0x0
.L_a54:
    ldr r1, [r7, r0, lsl #0x2]
    mov r0, r4
    blx r1
    cmp r0, #0x0
    addeq sp, sp, #0x118
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    str r6, [r5, #0xd28]
    ldr r0, [r5, #0xd24]
    add r0, r0, #0x1
    str r0, [r5, #0xd24]
    cmp r0, #0x2a
    bcc .L_a54
.L_a88:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd20]
    add sp, sp, #0x118
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    str r0, [r1, #0xd24]
    str r0, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_aac:
    mov r8, #0x0
    ldr r7, _LIT15
    str r8, [r5, #0xd28]
    mov r6, r8
.L_abc:
    ldr r1, [r7, r8, lsl #0x2]
    mov r0, r4
    blx r1
    cmp r0, #0x0
    addeq sp, sp, #0x118
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r8, r8, #0x1
    str r6, [r5, #0xd28]
    cmp r8, #0x23
    bcc .L_abc
    ldr r1, _LIT0
    mov r0, #0x14
    str r0, [r1, #0xd20]
    str r6, [r1, #0xd24]
    add sp, sp, #0x118
    mov r0, r6
    str r6, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b08:
    ldr r0, [r5, #0xd24]
    cmp r0, #0x5
    bcs .L_b50
    ldr r7, _LIT16
    mov r6, #0x0
.L_b1c:
    ldr r1, [r7, r0, lsl #0x2]
    mov r0, r4
    blx r1
    cmp r0, #0x0
    addeq sp, sp, #0x118
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    str r6, [r5, #0xd28]
    ldr r0, [r5, #0xd24]
    add r0, r0, #0x1
    str r0, [r5, #0xd24]
    cmp r0, #0x5
    bcc .L_b1c
.L_b50:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd20]
    add sp, sp, #0x118
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    str r0, [r1, #0xd24]
    str r0, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b74:
    mov r0, #0x1
    add sp, sp, #0x118
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf288
_LIT3: .word data_ov002_022ce288
_LIT4: .word 0x00000fee
_LIT5: .word data_ov002_022cf16c
_LIT6: .word 0x00001a9c
_LIT7: .word data_ov002_022cf178
_LIT8: .word data_ov002_022cd744
_LIT9: .word 0x0000ffff
_LIT10: .word 0x00001a90
_LIT11: .word 0x00001102
_LIT12: .word 0x00001aa3
_LIT13: .word 0x0000149d
_LIT14: .word data_ov002_022c841c
_LIT15: .word data_ov002_022c8390
_LIT16: .word data_ov002_022c8354
