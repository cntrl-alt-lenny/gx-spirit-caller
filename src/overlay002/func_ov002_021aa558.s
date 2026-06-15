; func_ov002_021aa558 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd420
        .extern data_ov002_022cd524
        .extern data_ov002_022cd73c
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a6
        .extern data_ov002_022cf1a8
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern data_ov002_022d0650
        .extern func_0202eac8
        .extern func_0202ed90
        .extern func_0202f46c
        .extern func_ov002_021aa4a0
        .extern func_ov002_021b0bdc
        .extern func_ov002_021b3014
        .extern func_ov002_021b30ac
        .extern func_ov002_021b314c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021b4270
        .extern func_ov002_021b9ea4
        .extern func_ov002_021ba034
        .extern func_ov002_021baca8
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021bb264
        .extern func_ov002_021bbf50
        .extern func_ov002_021c1ad0
        .extern func_ov002_021c2568
        .extern func_ov002_021c3a6c
        .extern func_ov002_021c4c9c
        .extern func_ov002_021df62c
        .extern func_ov002_0225a978
        .global func_ov002_021aa558
        .arm
func_ov002_021aa558:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xbc
    ldr r7, _LIT0
    ldr r5, _LIT1
    ldr r8, [r7]
    mov r3, #0x38
    mla r2, r8, r3, r5
    rsb r4, r8, #0x1
    str r2, [sp, #0x38]
    mla r2, r4, r3, r5
    str r2, [sp, #0x34]
    ldr r2, [r7, #0x4]
    add r6, sp, #0x64
    str r2, [sp, #0x3c]
    str r0, [sp]
    str r1, [sp, #0x4]
    mov r4, #0x0
    str r7, [sp, #0x54]
    str r7, [sp, #0x50]
    str r7, [sp, #0x5c]
    str r7, [sp, #0x58]
.L_54:
    cmp r4, r8
    ldreq r0, [sp, #0x50]
    ldreq r9, [r0]
    ldrne r0, [sp, #0x54]
    ldrne r9, [r0, #0x4]
    cmp r4, r8
    ldreq r0, [sp, #0x58]
    ldreq sl, [r0, #0x1c]
    ldrne r0, [sp, #0x5c]
    ldrne sl, [r0, #0x20]
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_c4
    ldr r0, _LIT2
    mov r1, #0xdc
    mla r1, r9, r1, r0
    mov r0, #0x2c
    mla r0, sl, r0, r1
    add ip, r0, #0x14
    mov fp, r6
    ldmia ip!, {r0, r1, r2, r3}
    stmia fp!, {r0, r1, r2, r3}
    ldmia ip!, {r0, r1, r2, r3}
    stmia fp!, {r0, r1, r2, r3}
    ldmia ip, {r0, r1, r2}
    stmia fp, {r0, r1, r2}
    ldr r0, [r6]
    b .L_e0
.L_c4:
    mov r0, r9
    mov r1, sl
    mov r2, r6
    bl func_ov002_021c4c9c
    mov r0, r9
    mov r1, sl
    bl func_ov002_021ba034
.L_e0:
    ldr r2, _LIT3
    ldr r1, _LIT4
    str r9, [r5]
    and r3, r9, #0x1
    mla r9, r3, r2, r1
    mov r1, #0x14
    mul r3, sl, r1
    add r1, r9, r3
    ldrh r2, [r1, #0x36]
    add r1, r9, #0x30
    str sl, [r5, #0x4]
    ldr r1, [r1, r3]
    str r2, [r5, #0x8]
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    str r1, [r5, #0xc]
    str r0, [r5, #0x10]
    mov r0, #0x0
    str r0, [r5, #0x14]
    str r0, [r5, #0x18]
    str r0, [r5, #0x1c]
    str r0, [r5, #0x20]
    ldr r0, [r6, #0x4]
    add r4, r4, #0x1
    str r0, [r5, #0x24]
    ldr r0, [r6, #0x10]
    cmp r4, #0x2
    str r0, [r5, #0x28]
    mov r0, #0x0
    str r0, [r5, #0x2c]
    str r0, [r5, #0x30]
    str r0, [r5, #0x34]
    str r0, [r7, #0x9c]
    add r6, r6, #0x2c
    add r5, r5, #0x38
    add r7, r7, #0x14
    blt .L_54
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_1a4
    ldr r0, [sp, #0x34]
    mov r1, #0x0
    str r1, [r0, #0x10]
    str r1, [r0, #0x1c]
    str r1, [r0, #0x20]
.L_1a4:
    ldr r0, _LIT0
    mov r4, #0x0
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT5
    mov r0, r8
    mov r6, r4
    bl func_ov002_021b3014
    rsb r1, r8, #0x1
    str r1, [sp, #0xc]
    mov r7, r0
    ldr r1, _LIT6
    ldr r0, [sp, #0xc]
    mvn r2, #0x0
    bl func_ov002_021bae7c
    ldr r2, _LIT0
    mov r5, r0
    ldr r1, _LIT6
    ldr r2, [r2, #0x1c]
    mov r0, r8
    bl func_ov002_021bae7c
    add r0, r5, r0
    str r0, [sp, #0x24]
    add r5, r7, r0
    mov r0, r4
    str r0, [sp, #0x20]
    mov r0, #0x2c
    mul r0, r8, r0
    add r1, sp, #0x68
    str r0, [sp, #0x10]
    ldr r0, [r1, r0]
    mov r2, #0x1
    cmp r0, #0x4
    beq .L_23c
    ldr r0, [sp, #0x10]
    add r1, sp, #0x70
    ldr r0, [r1, r0]
    tst r0, #0x10
    ldreq r2, [sp, #0x20]
.L_23c:
    cmp r2, #0x0
    beq .L_258
    ldr r0, _LIT7
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x20]
.L_258:
    mov r0, r8
    ldr r1, _LIT0
    ldr r2, _LIT8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_284
    ldr r0, [sp, #0xc]
    bl func_ov002_021bbf50
    cmp r0, #0x2
    subeq r5, r5, #0x1
.L_284:
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, [r0, #0x1c]
    and r9, r8, #0x1
    mul r3, r2, r1
    ldr r1, _LIT3
    ldr r2, _LIT9
    mul r7, r9, r1
    add r1, r2, r7
    ldr r1, [r3, r1]
    ldr r9, _LIT10
    mov r2, r1, lsr #0x6
    add r9, r9, r7
    ldrh r9, [r3, r9]
    and r2, r2, #0x1
    mvn r2, r2
    and r9, r9, r2
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r9, r1
    beq .L_4e0
    ldr r1, [sp, #0x38]
    ldr sl, _LIT11
    ldr r2, [r1, #0x10]
    cmp r2, sl
    bgt .L_330
    bge .L_384
    ldr r9, _LIT12
    cmp r2, r9
    bgt .L_320
    sub r1, r9, #0x3
    cmp r2, r1
    blt .L_4a4
    beq .L_360
    cmp r2, r9
    beq .L_3a8
    b .L_4a4
.L_320:
    sub r1, sl, #0xb
    cmp r2, r1
    beq .L_3d8
    b .L_4a4
.L_330:
    ldr r1, _LIT13
    cmp r2, r1
    bgt .L_350
    bge .L_43c
    add r1, sl, #0x16c
    cmp r2, r1
    beq .L_414
    b .L_4a4
.L_350:
    ldr r0, _LIT14
    cmp r2, r0
    beq .L_470
    b .L_4a4
.L_360:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_4a4
    ldr r0, _LIT4
    ldr r0, [r0, r7]
    cmp r0, #0x7d0
    addgt r0, r4, #0x3b8
    addgt r4, r0, #0x800
    b .L_4a4
.L_384:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_4a4
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021c3a6c
    mov r1, #0x3e8
    mla r4, r0, r1, r4
    b .L_4a4
.L_3a8:
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_4a4
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_4a4
    ldr r0, [sp, #0x34]
    ldr r0, [r0, #0x24]
    cmp r0, #0xf
    addeq r4, r4, #0x7d0
    addeq r6, r6, #0x7d0
    b .L_4a4
.L_3d8:
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_4a4
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrne r0, [sp, #0x34]
    ldrne r1, [r0, #0x24]
    cmpne r1, #0x0
    beq .L_4a4
    ldr r0, _LIT15
    add r0, r0, r7
    ldr r0, [r3, r0]
    cmp r1, r0
    addeq r4, r4, #0x3e8
    b .L_4a4
.L_414:
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_4a4
    ldr r0, [sp, #0xc]
    mov r1, #0x2c
    mul r1, r0, r1
    add r0, sp, #0x80
    ldr r0, [r0, r1]
    add r4, r4, r0
    b .L_4a4
.L_43c:
    ldr r0, [sp, #0x38]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_4a4
    ldr r0, [sp, #0x10]
    add r2, sp, #0x78
    ldr r0, [r2, r0]
    add r5, r5, #0x1
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    ldr r0, [sp, #0x10]
    str r1, [r2, r0]
    b .L_4a4
.L_470:
    mov r0, r8
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_4a4
    ldr r0, [sp, #0x10]
    add r2, sp, #0x78
    ldr r0, [r2, r0]
    add r5, r5, #0x1
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    ldr r0, [sp, #0x10]
    str r1, [r2, r0]
.L_4a4:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_4e0
    ldr r0, _LIT16
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    bne .L_4e0
    ldr r0, [sp, #0x38]
    mov r1, #0x1
    ldr r0, [r0, #0x10]
    bl func_ov002_0225a978
    mvn r1, #0x0
    cmp r0, r1
    cmpne r0, #0x0
    addne r4, r4, r0
.L_4e0:
    mov r0, r8
    mov r1, #0xb
    ldr r2, _LIT17
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_514
    mov r0, r8
    ldr r1, _LIT0
    ldr r2, _LIT17
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b314c
    ldr r1, _LIT18
    mla r4, r0, r1, r4
.L_514:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_564
    ldr r0, [sp, #0x34]
    ldr r0, [r0, #0x10]
    bl func_0202f46c
    cmp r0, #0x0
    beq .L_564
    mov r0, r8
    ldr r1, _LIT0
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b9ea4
    mov r9, r0
    bl func_ov002_021c2568
    mul r1, r9, r0
    mov r0, #0x12c
    mul r0, r1, r0
    sub r4, r4, r0
    sub r6, r6, r0
.L_564:
    ldr r0, _LIT19
    ldr r1, _LIT0
    add r0, r0, r7
    str r0, [sp, #0x14]
    ldr r1, [r1, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, [sp, #0x14]
    ldrh fp, [r0, r2]
    cmp fp, #0x0
    beq .L_670
    ldr r0, [sp, #0x10]
    add r1, sp, #0x64
    add ip, r1, r0
    ldr r0, _LIT20
    ldr r9, _LIT21
    rsb r3, r0, #0x24c0
    ldr r0, _LIT22
    ldr lr, _LIT12
    mov r2, r3
    add r1, r0, #0x61
.L_5b8:
    mov r0, fp, lsl #0x3
    ldrh r7, [r9, r0]
    add sl, r9, fp, lsl #0x3
    ldrh fp, [sl, #0x6]
    cmp r7, lr
    bgt .L_600
    cmp r7, r3
    blt .L_5f0
    cmp r7, r2
    beq .L_644
    cmp r7, lr
    addeq r4, r4, #0x7d0
    addeq r6, r6, #0x7d0
    b .L_668
.L_5f0:
    ldr r0, _LIT20
    cmp r7, r0
    beq .L_620
    b .L_668
.L_600:
    ldr r0, _LIT22
    cmp r7, r0
    bgt .L_614
    addeq r4, r4, #0x3e8
    b .L_668
.L_614:
    cmp r7, r1
    beq .L_658
    b .L_668
.L_620:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    bne .L_668
    mov r0, #0x0
    str r0, [ip, #0x14]
    mov r4, r0
    b .L_668
.L_644:
    ldrh r0, [sl, #0x4]
    cmp r0, #0x1
    addeq r0, r4, #0x3b8
    addeq r4, r0, #0x800
    b .L_668
.L_658:
    mov r0, #0x960
    str r0, [ip, #0x14]
    mov r0, #0x1
    str r0, [sp, #0x20]
.L_668:
    cmp fp, #0x0
    bne .L_5b8
.L_670:
    ldr r2, _LIT23
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    rsb r7, r5, #0x0
    rsbne r4, r4, #0x0
    rsbne r6, r6, #0x0
    mov r0, #0x0
    cmp r7, #0x0
    ble .L_6ac
.L_69c:
    mov r4, r4, lsl #0x1
    add r0, r0, #0x1
    cmp r0, r7
    blt .L_69c
.L_6ac:
    cmp r5, #0x0
    mov r1, #0x0
    ble .L_6cc
.L_6b8:
    add r0, r4, #0x1
    mov r4, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, r5
    blt .L_6b8
.L_6cc:
    ldr r0, [sp, #0x24]
    mov r1, #0x0
    cmp r0, #0x0
    ble .L_6f4
.L_6dc:
    add r0, r6, #0x1
    mov r6, r0, asr #0x1
    ldr r0, [sp, #0x24]
    add r1, r1, #0x1
    cmp r1, r0
    blt .L_6dc
.L_6f4:
    ldr r0, [sp, #0x20]
    ldr r1, _LIT0
    cmp r0, #0x0
    mov r0, #0x2c
    mul r9, r8, r0
    add r0, sp, #0x78
    ldr r0, [r0, r9]
    movne r4, #0x0
    add r2, r0, r4
    add r0, sp, #0x78
    str r2, [r0, r9]
    add r0, sp, #0x7c
    ldr r1, [r1, #0x8]
    ldr r0, [r0, r9]
    cmp r1, #0x0
    add r1, r0, r6
    add r0, sp, #0x7c
    str r1, [r0, r9]
    bne .L_11cc
    mov r4, #0x0
    ldr r2, _LIT23
    mov r0, r4
    mov r1, #0xb
    mov sl, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    mvnne r0, #0x0
    ldr r1, _LIT0
    strne r0, [sp, #0x8]
    moveq r0, #0x1
    streq r0, [sp, #0x8]
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT5
    ldr r1, [r1, #0x20]
    bl func_ov002_021b3014
    str r0, [sp, #0x40]
    ldr r0, [sp, #0x3c]
    ldr r1, _LIT6
    rsb r0, r0, #0x1
    mvn r2, #0x0
    str r0, [sp, #0x1c]
    bl func_ov002_021bae7c
    ldr r2, _LIT0
    mov r6, r0
    ldr r0, [sp, #0x3c]
    ldr r1, _LIT6
    ldr r2, [r2, #0x20]
    bl func_ov002_021bae7c
    add fp, r6, r0
    ldr r0, [sp, #0x40]
    add r1, sp, #0x68
    add r6, r0, fp
    ldr r0, [sp, #0x10]
    ldr r1, [r1, r0]
    mov r0, #0x0
    str r0, [sp, #0x28]
    cmp r1, #0x4
    beq .L_7f0
    ldr r0, [sp, #0x10]
    add r1, sp, #0x70
    ldr r0, [r1, r0]
    tst r0, #0x10
    beq .L_804
.L_7f0:
    ldr r0, _LIT7
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x28]
.L_804:
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT8
    ldr r1, [r1, #0x20]
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_830
    ldr r0, [sp, #0x1c]
    bl func_ov002_021bbf50
    cmp r0, #0x2
    subeq r6, r6, #0x1
.L_830:
    ldr r0, _LIT0
    mov r2, #0x14
    ldr r1, [r0, #0x20]
    ldr r0, [sp, #0x3c]
    mul r3, r1, r2
    and ip, r0, #0x1
    ldr r0, _LIT3
    ldr r2, _LIT9
    mul r0, ip, r0
    add r2, r2, r0
    ldr ip, _LIT10
    ldr r2, [r3, r2]
    add ip, ip, r0
    str r2, [sp, #0x44]
    mov r2, r2, lsr #0x6
    and r2, r2, #0x1
    ldrh ip, [r3, ip]
    mvn r2, r2
    and lr, ip, r2
    ldr r2, [sp, #0x44]
    mov ip, r2, lsr #0x2
    orr r2, ip, r2, lsr #0x1
    and r2, r2, #0x1
    mvn r2, r2
    tst lr, r2
    beq .L_a7c
    ldr r2, [sp, #0x34]
    ldr ip, _LIT22
    ldr r2, [r2, #0x10]
    cmp r2, ip
    bgt .L_8d8
    bge .L_970
    ldr r3, _LIT12
    cmp r2, r3
    bgt .L_9ec
    sub ip, r3, #0x3
    cmp r2, ip
    blt .L_9ec
    beq .L_8fc
    cmp r2, r3
    beq .L_938
    b .L_9ec
.L_8d8:
    ldr r0, _LIT24
    cmp r2, r0
    bgt .L_8ec
    beq .L_9b4
    b .L_9ec
.L_8ec:
    ldr r0, _LIT25
    cmp r2, r0
    beq .L_9d8
    b .L_9ec
.L_8fc:
    ldr r3, [sp, #0x4]
    cmp r3, #0x0
    beq .L_918
    ldr r3, _LIT4
    ldr r0, [r3, r0]
    cmp r0, #0x7d0
    bgt .L_92c
.L_918:
    ldr r0, [sp, #0x3c]
    mov r3, #0x1
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_9ec
.L_92c:
    add r0, r4, #0x3b8
    add r4, r0, #0x800
    b .L_9ec
.L_938:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_954
    ldr r0, [sp, #0x38]
    ldr r0, [r0, #0x24]
    cmp r0, #0xf
    beq .L_964
.L_954:
    ldr r0, [sp, #0x3c]
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_9ec
.L_964:
    add r4, r4, #0x7d0
    add sl, sl, #0x7d0
    b .L_9ec
.L_970:
    ldr ip, [sp, #0x4]
    cmp ip, #0x0
    ldrne ip, [sp, #0x38]
    ldrne lr, [ip, #0x24]
    cmpne lr, #0x0
    beq .L_99c
    ldr ip, _LIT15
    add r0, ip, r0
    ldr r0, [r3, r0]
    cmp lr, r0
    beq .L_9ac
.L_99c:
    ldr r0, [sp, #0x3c]
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_9ec
.L_9ac:
    add r4, r4, #0x3e8
    b .L_9ec
.L_9b4:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_9ec
    ldr r0, [sp, #0x10]
    add r1, sp, #0x80
    ldr r0, [r1, r0]
    add r4, r4, r0
    b .L_9ec
.L_9d8:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrne r0, [sp, #0x34]
    movne r1, #0x1
    strne r1, [r0, #0x8]
.L_9ec:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_a7c
    ldr r0, _LIT16
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    bne .L_a7c
    ldr r0, [sp, #0x34]
    mov r1, #0x0
    ldr r0, [r0, #0x10]
    bl func_ov002_0225a978
    mvn r1, #0x0
    cmp r0, r1
    cmpne r0, #0x0
    beq .L_a7c
    ldr r1, [sp, #0x34]
    ldr r2, [r1, #0x10]
    ldr r1, _LIT26
    cmp r2, r1
    beq .L_a4c
    ldr r1, _LIT27
    cmp r2, r1
    beq .L_a54
    b .L_a78
.L_a4c:
    add fp, fp, #0x1
    b .L_a7c
.L_a54:
    add r0, sp, #0x78
    ldr r1, [r0, r9]
    add r0, sp, #0x80
    ldr r0, [r0, r9]
    rsb r0, r0, #0xc8
    add r1, r1, r0
    add r0, sp, #0x78
    str r1, [r0, r9]
    b .L_a7c
.L_a78:
    add r4, r4, r0
.L_a7c:
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT28
    ldr r1, [r1, #0x20]
    bl func_ov002_021b4270
    add r4, r4, r0
    ldr r0, [sp, #0x38]
    ldr r0, [r0, #0x10]
    bl func_0202f46c
    cmp r0, #0x0
    beq .L_ad8
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9ea4
    str r0, [sp, #0x48]
    bl func_ov002_021c2568
    ldr r1, [sp, #0x48]
    mul r2, r1, r0
    mov r0, #0x12c
    mul r0, r2, r0
    sub r4, r4, r0
    sub sl, sl, r0
.L_ad8:
    rsb r0, r6, #0x0
    mov r1, #0x0
    str r0, [sp, #0x18]
    cmp r0, #0x0
    ble .L_b00
.L_aec:
    ldr r0, [sp, #0x18]
    add r1, r1, #0x1
    mov r4, r4, lsl #0x1
    cmp r1, r0
    blt .L_aec
.L_b00:
    cmp r6, #0x0
    mov r1, #0x0
    ble .L_b20
.L_b0c:
    add r0, r4, #0x1
    mov r4, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, r6
    blt .L_b0c
.L_b20:
    cmp fp, #0x0
    mov r1, #0x0
    ble .L_b40
.L_b2c:
    add r0, sl, #0x1
    mov sl, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, fp
    blt .L_b2c
.L_b40:
    ldr r0, [sp, #0x28]
    mov r1, #0x2c
    cmp r0, #0x0
    ldr r0, [sp, #0xc]
    movne r4, #0x0
    mul r1, r0, r1
    str r1, [sp, #0x4c]
    ldr r0, [sp, #0x4c]
    add r1, sp, #0x78
    ldr r2, [r1, r0]
    ldr r1, [sp, #0x8]
    mov r0, r8
    mla r3, r1, r4, r2
    ldr r1, [sp, #0x4c]
    add r2, sp, #0x78
    str r3, [r2, r1]
    add r2, sp, #0x7c
    ldr r2, [r2, r1]
    ldr r1, [sp, #0x8]
    ldr r3, _LIT0
    mla r4, r1, sl, r2
    ldr r1, [sp, #0x4c]
    add r2, sp, #0x7c
    str r4, [r2, r1]
    ldr r1, [r3, #0x1c]
    ldr r2, _LIT29
    bl func_ov002_021b314c
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, _LIT30
    ldr r1, [r1, #0x1c]
    mov r0, r8
    bl func_ov002_021baca8
    add r0, r4, r0
    str r0, [sp, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x4c]
    add r1, sp, #0x78
    ldr r0, [r1, r0]
    cmp r7, #0x0
    add r0, r0, #0x1
    mov r1, r0, asr #0x1
    ldr r0, [sp, #0x30]
    ldr r2, [sp, #0x2c]
    mul r1, r0, r1
    ble .L_c0c
.L_bfc:
    mov r1, r1, lsl #0x1
    add r2, r2, #0x1
    cmp r2, r7
    blt .L_bfc
.L_c0c:
    cmp r5, #0x0
    mov r2, #0x0
    ble .L_c2c
.L_c18:
    add r0, r1, #0x1
    mov r1, r0, asr #0x1
    add r2, r2, #0x1
    cmp r2, r5
    blt .L_c18
.L_c2c:
    ldr r0, [sp]
    cmp r0, #0x1
    add r0, sp, #0x78
    ldr r0, [r0, r9]
    add r1, r0, r1
    add r0, sp, #0x78
    str r1, [r0, r9]
    ble .L_d08
    ldr r1, _LIT0
    mov r0, #0x14
    ldr r1, [r1, #0x1c]
    mul r2, r1, r0
    ldr r0, [sp, #0x14]
    ldrh sl, [r0, r2]
    cmp sl, #0x0
    beq .L_d08
    ldr r0, _LIT29
    sub r0, r0, #0x9d0
    str r0, [sp, #0x60]
.L_c78:
    ldr r0, _LIT21
    add r1, r0, sl, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh sl, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xa
    bne .L_d00
    ldrh r0, [r1]
    ldr r2, _LIT29
    and r4, r0, #0xff
    mov r0, r0, asr #0x8
    and fp, r0, #0xff
    mov r0, r4
    mov r1, fp
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_d00
    ldr r1, [sp, #0x60]
    ldr r0, _LIT4
    and r2, r4, #0x1
    mla r0, r2, r1, r0
    mov r1, #0x14
    add r2, r0, #0x30
    mul r1, fp, r1
    ldr r2, [r2, r1]
    mov r0, r4
    mov r3, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    mov r1, fp
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
.L_d00:
    cmp sl, #0x0
    bne .L_c78
.L_d08:
    ldr r0, [sp, #0x38]
    ldr r0, [r0, #0x10]
    bl func_0202eac8
    cmp r0, #0x0
    beq .L_d48
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c1ad0
    mov r2, r0
    ldr r0, _LIT31
    mov r1, r8
    bl func_ov002_021bb264
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x2c]
.L_d48:
    ldr r0, [sp, #0x38]
    ldr r0, [r0, #0x10]
    bl func_0202ed90
    cmp r0, #0x0
    beq .L_d88
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c1ad0
    mov r2, r0
    ldr r0, _LIT32
    mov r1, r8
    bl func_ov002_021bb264
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x2c]
.L_d88:
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    beq .L_e10
    add r0, sp, #0x78
    ldr r2, [r0, r9]
    mov r1, r0
    ldr r0, [sp, #0x4c]
    ldr r0, [r1, r0]
    cmp r2, r0
    bge .L_e10
    cmp r7, #0x0
    mov r2, #0x3e8
    mov r0, #0x0
    ble .L_dd0
.L_dc0:
    mov r2, r2, lsl #0x1
    add r0, r0, #0x1
    cmp r0, r7
    blt .L_dc0
.L_dd0:
    cmp r5, #0x0
    mov r1, #0x0
    ble .L_df0
.L_ddc:
    add r0, r2, #0x1
    mov r2, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, r5
    blt .L_ddc
.L_df0:
    add r0, sp, #0x78
    ldr r1, [r0, r9]
    mov r0, #0x0
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x8]
    mla r1, r0, r2, r1
    add r0, sp, #0x78
    str r1, [r0, r9]
.L_e10:
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT33
    ldr r1, [r1, #0x20]
    bl func_ov002_021b30ac
    cmp r0, #0x0
    beq .L_102c
    ldr r1, [sp, #0x4c]
    add r2, sp, #0x78
    ldr r1, [r2, r1]
    cmp r1, #0x3e8
    ble .L_ef4
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_102c
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT33
    ldr r1, [r1, #0x20]
    mov r3, #0x1
    bl func_ov002_021aa4a0
    b .L_102c
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word data_ov002_022cd420
_LIT2: .word data_ov002_022cd524
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf16c
_LIT5: .word 0x00001381
_LIT6: .word 0x00001905
_LIT7: .word 0x00001951
_LIT8: .word 0x00001955
_LIT9: .word data_ov002_022cf1ac
_LIT10: .word data_ov002_022cf1a4
_LIT11: .word 0x000014d7
_LIT12: .word 0x000013aa
_LIT13: .word 0x00001956
_LIT14: .word 0x00001aaf
_LIT15: .word data_ov002_022cf1a8
_LIT16: .word data_ov002_022d016c
_LIT17: .word 0x00001846
_LIT18: .word 0x000005dc
_LIT19: .word data_ov002_022cf1a6
_LIT20: .word 0x00001119
_LIT21: .word data_ov002_022d0650
_LIT22: .word 0x000014cc
_LIT23: .word 0x00001257
_LIT24: .word 0x00001643
_LIT25: .word 0x00001a78
_LIT26: .word 0x000010c6
_LIT27: .word 0x00001621
_LIT28: .word 0x00001853
_LIT29: .word 0x00001238
_LIT30: .word 0x00001ac8
_LIT31: .word 0x000018ff
_LIT32: .word 0x00001a66
_LIT33: .word 0x0000159e
_LIT34: .word 0x000009c4
.L_ef4:
    ldr r1, [sp, #0x38]
    ldr r1, [r1, #0x8]
    cmp r1, #0x0
    addne r1, sp, #0x7c
    moveq r1, r2
    ldr r2, [r1, r9]
    ldr r1, _LIT34
    cmp r2, r1
    blt .L_102c
    cmp r0, #0x1
    ble .L_f44
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_f44
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT33
    ldr r1, [r1, #0x20]
    mov r3, #0x0
    bl func_ov002_021aa4a0
.L_f44:
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT33
    ldr r1, [r1, #0x20]
    bl func_ov002_021b314c
    cmp r0, #0x0
    beq .L_102c
    ldr r0, [sp, #0x18]
    mov r2, #0x0
    cmp r0, #0x0
    ldr r0, _LIT34
    ble .L_f88
.L_f74:
    ldr r1, [sp, #0x18]
    add r2, r2, #0x1
    mov r0, r0, lsl #0x1
    cmp r2, r1
    blt .L_f74
.L_f88:
    cmp r6, #0x0
    mov r1, #0x0
    ble .L_fa8
.L_f94:
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, r6
    blt .L_f94
.L_fa8:
    ldr r1, [sp, #0x4c]
    add r2, sp, #0x78
    ldr r3, [r2, r1]
    ldr r1, [sp, #0x8]
    add r2, r0, #0x1
    mla r3, r1, r0, r3
    ldr r0, [sp, #0x4c]
    add r1, sp, #0x78
    str r3, [r1, r0]
    ldr r0, [sp, #0x30]
    mov r1, r2, asr #0x1
    mul r2, r1, r0
    cmp r7, #0x0
    mov r0, #0x0
    ble .L_ff4
.L_fe4:
    mov r2, r2, lsl #0x1
    add r0, r0, #0x1
    cmp r0, r7
    blt .L_fe4
.L_ff4:
    cmp r5, #0x0
    mov r1, #0x0
    ble .L_1014
.L_1000:
    add r0, r2, #0x1
    mov r2, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, r5
    blt .L_1000
.L_1014:
    add r0, sp, #0x78
    ldr r1, [r0, r9]
    ldr r0, [sp, #0x8]
    mla r1, r0, r2, r1
    add r0, sp, #0x78
    str r1, [r0, r9]
.L_102c:
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    beq .L_10ac
    add r0, sp, #0x78
    ldr r2, [r0, r9]
    mov r1, r0
    ldr r0, [sp, #0x4c]
    ldr r0, [r1, r0]
    cmp r2, r0
    bge .L_10ac
    cmp r7, #0x0
    mov r2, #0x3e8
    mov r0, #0x0
    ble .L_1074
.L_1064:
    mov r2, r2, lsl #0x1
    add r0, r0, #0x1
    cmp r0, r7
    blt .L_1064
.L_1074:
    cmp r5, #0x0
    mov r1, #0x0
    ble .L_1094
.L_1080:
    add r0, r2, #0x1
    mov r2, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, r5
    blt .L_1080
.L_1094:
    add r0, sp, #0x78
    ldr r1, [r0, r9]
    ldr r0, [sp, #0x8]
    mla r1, r0, r2, r1
    add r0, sp, #0x78
    str r1, [r0, r9]
.L_10ac:
    mov r0, r8
    ldr r1, _LIT0
    ldr r2, _LIT33
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b30ac
    cmp r0, #0x0
    beq .L_11cc
    add r1, sp, #0x78
    ldr r1, [r1, r9]
    cmp r1, #0x3e8
    ble .L_1100
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_11cc
    ldr r0, _LIT0
    ldr r2, _LIT33
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, #0x1
    bl func_ov002_021aa4a0
    b .L_11cc
.L_1100:
    ldr r1, [sp, #0x34]
    ldr r1, [r1, #0x8]
    cmp r1, #0x0
    ldrne r1, [sp, #0x4c]
    addne r2, sp, #0x7c
    ldreq r1, [sp, #0x4c]
    addeq r2, sp, #0x78
    ldr r2, [r2, r1]
    ldr r1, _LIT34
    cmp r2, r1
    blt .L_11cc
    cmp r0, #0x1
    ble .L_1158
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_1158
    ldr r0, _LIT0
    ldr r2, _LIT33
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, #0x0
    bl func_ov002_021aa4a0
.L_1158:
    ldr r0, _LIT0
    ldr r2, _LIT33
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b314c
    cmp r0, #0x0
    beq .L_11cc
    cmp r7, #0x0
    ldr r2, _LIT34
    mov r0, #0x0
    ble .L_1194
.L_1184:
    add r0, r0, #0x1
    cmp r0, r7
    mov r2, r2, lsl #0x1
    blt .L_1184
.L_1194:
    cmp r5, #0x0
    mov r1, #0x0
    ble .L_11b4
.L_11a0:
    add r0, r2, #0x1
    add r1, r1, #0x1
    cmp r1, r5
    mov r2, r0, asr #0x1
    blt .L_11a0
.L_11b4:
    add r0, sp, #0x78
    ldr r1, [r0, r9]
    ldr r0, [sp, #0x8]
    mla r1, r0, r2, r1
    add r0, sp, #0x78
    str r1, [r0, r9]
.L_11cc:
    add r0, sp, #0x78
    ldr r1, [r0, r9]
    ldr r0, _LIT35
    cmp r1, r0
    blt .L_1204
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_1204
    ldr r0, _LIT0
    ldr r2, _LIT36
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, #0x1
    bl func_ov002_021aa4a0
.L_1204:
    ldr r2, _LIT0
    ldr r0, [r2, #0x8]
    cmp r0, #0x0
    bne .L_1254
    ldr r0, [sp, #0xc]
    mov r1, #0x2c
    mul r4, r0, r1
    add r3, sp, #0x78
    rsb r0, r1, #0x540
    ldr r1, [r3, r4]
    cmp r1, r0
    blt .L_1254
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_1254
    ldr r1, [r2, #0x20]
    ldr r2, _LIT36
    ldr r0, [sp, #0x3c]
    mov r3, #0x1
    bl func_ov002_021aa4a0
.L_1254:
    mov sl, #0x0
    ldr r9, _LIT0
    ldr r4, _LIT37
    add r8, sp, #0x64
    mov r7, sl
    mov r6, sl
    mov r5, sl
    mov fp, sl
.L_1274:
    ldr r0, [r8, #0x1c]
    cmp r0, #0x0
    movlt r0, r7
    str r0, [r9, #0x40]
    ldr r0, [r8, #0x20]
    cmp r0, #0x0
    movlt r0, r6
    str r0, [r9, #0x44]
    ldr r0, [r8, #0x14]
    cmp r0, #0x0
    movlt r0, r5
    str r0, [r9, #0x48]
    ldr r0, [r8, #0x18]
    cmp r0, #0x0
    movlt r0, fp
    str r0, [r9, #0x4c]
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_12e4
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldreq r1, [r4, #0x4]
    ldreq r0, [r9, #0x2c]
    cmpeq r1, r0
    bne .L_12e4
    ldr r1, [r8, #0x14]
    mov r0, #0x0
    bl func_ov002_021b0bdc
.L_12e4:
    add sl, sl, #0x1
    cmp sl, #0x2
    add r8, r8, #0x2c
    add r9, r9, #0x38
    blt .L_1274
    add sp, sp, #0xbc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT35: .word 0x00000514
_LIT36: .word 0x0000150a
_LIT37: .word data_ov002_022cd73c
