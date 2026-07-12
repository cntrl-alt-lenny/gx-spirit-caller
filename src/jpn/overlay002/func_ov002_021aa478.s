; func_ov002_021aa478 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022cd444
        .extern data_ov002_022cd65c
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022cf0c8
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_0202ea74
        .extern func_0202ed3c
        .extern func_0202f418
        .extern func_ov002_021aa3c0
        .extern func_ov002_021b0afc
        .extern func_ov002_021b2f34
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b306c
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b4190
        .extern func_ov002_021b9dc4
        .extern func_ov002_021b9f54
        .extern func_ov002_021babc8
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bb184
        .extern func_ov002_021bbe70
        .extern func_ov002_021c19f0
        .extern func_ov002_021c2488
        .extern func_ov002_021c398c
        .extern func_ov002_021c4bbc
        .extern func_ov002_021df53c
        .extern func_ov002_0225a890
        .global func_ov002_021aa478
        .arm
func_ov002_021aa478:
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
.L_10c:
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
    beq .L_17c
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
    b .L_198
.L_17c:
    mov r0, r9
    mov r1, sl
    mov r2, r6
    bl func_ov002_021c4bbc
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b9f54
.L_198:
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
    blt .L_10c
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_25c
    ldr r0, [sp, #0x34]
    mov r1, #0x0
    str r1, [r0, #0x10]
    str r1, [r0, #0x1c]
    str r1, [r0, #0x20]
.L_25c:
    ldr r0, _LIT0
    mov r4, #0x0
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT5
    mov r0, r8
    mov r6, r4
    bl func_ov002_021b2f34
    rsb r1, r8, #0x1
    str r1, [sp, #0xc]
    mov r7, r0
    ldr r1, _LIT6
    ldr r0, [sp, #0xc]
    mvn r2, #0x0
    bl func_ov002_021bad9c
    ldr r2, _LIT0
    mov r5, r0
    ldr r1, _LIT6
    ldr r2, [r2, #0x1c]
    mov r0, r8
    bl func_ov002_021bad9c
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
    beq .L_2f4
    ldr r0, [sp, #0x10]
    add r1, sp, #0x70
    ldr r0, [r1, r0]
    tst r0, #0x10
    ldreq r2, [sp, #0x20]
.L_2f4:
    cmp r2, #0x0
    beq .L_310
    ldr r0, _LIT7
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x20]
.L_310:
    mov r0, r8
    ldr r1, _LIT0
    ldr r2, _LIT8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_33c
    ldr r0, [sp, #0xc]
    bl func_ov002_021bbe70
    cmp r0, #0x2
    subeq r5, r5, #0x1
.L_33c:
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
    beq .L_598
    ldr r1, [sp, #0x38]
    ldr sl, _LIT11
    ldr r2, [r1, #0x10]
    cmp r2, sl
    bgt .L_3e8
    bge .L_43c
    ldr r9, _LIT12
    cmp r2, r9
    bgt .L_3d8
    sub r1, r9, #0x3
    cmp r2, r1
    blt .L_55c
    beq .L_418
    cmp r2, r9
    beq .L_460
    b .L_55c
.L_3d8:
    sub r1, sl, #0xb
    cmp r2, r1
    beq .L_490
    b .L_55c
.L_3e8:
    ldr r1, _LIT13
    cmp r2, r1
    bgt .L_408
    bge .L_4f4
    add r1, sl, #0x16c
    cmp r2, r1
    beq .L_4cc
    b .L_55c
.L_408:
    ldr r0, _LIT14
    cmp r2, r0
    beq .L_528
    b .L_55c
.L_418:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_55c
    ldr r0, _LIT4
    ldr r0, [r0, r7]
    cmp r0, #0x7d0
    addgt r0, r4, #0x3b8
    addgt r4, r0, #0x800
    b .L_55c
.L_43c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_55c
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021c398c
    mov r1, #0x3e8
    mla r4, r0, r1, r4
    b .L_55c
.L_460:
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_55c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_55c
    ldr r0, [sp, #0x34]
    ldr r0, [r0, #0x24]
    cmp r0, #0xf
    addeq r4, r4, #0x7d0
    addeq r6, r6, #0x7d0
    b .L_55c
.L_490:
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_55c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrne r0, [sp, #0x34]
    ldrne r1, [r0, #0x24]
    cmpne r1, #0x0
    beq .L_55c
    ldr r0, _LIT15
    add r0, r0, r7
    ldr r0, [r3, r0]
    cmp r1, r0
    addeq r4, r4, #0x3e8
    b .L_55c
.L_4cc:
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_55c
    ldr r0, [sp, #0xc]
    mov r1, #0x2c
    mul r1, r0, r1
    add r0, sp, #0x80
    ldr r0, [r0, r1]
    add r4, r4, r0
    b .L_55c
.L_4f4:
    ldr r0, [sp, #0x38]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_55c
    ldr r0, [sp, #0x10]
    add r2, sp, #0x78
    ldr r0, [r2, r0]
    add r5, r5, #0x1
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    ldr r0, [sp, #0x10]
    str r1, [r2, r0]
    b .L_55c
.L_528:
    mov r0, r8
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_55c
    ldr r0, [sp, #0x10]
    add r2, sp, #0x78
    ldr r0, [r2, r0]
    add r5, r5, #0x1
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    ldr r0, [sp, #0x10]
    str r1, [r2, r0]
.L_55c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_598
    ldr r0, _LIT16
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    bne .L_598
    ldr r0, [sp, #0x38]
    mov r1, #0x1
    ldr r0, [r0, #0x10]
    bl func_ov002_0225a890
    mvn r1, #0x0
    cmp r0, r1
    cmpne r0, #0x0
    addne r4, r4, r0
.L_598:
    mov r0, r8
    mov r1, #0xb
    ldr r2, _LIT17
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_5cc
    mov r0, r8
    ldr r1, _LIT0
    ldr r2, _LIT17
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b306c
    ldr r1, _LIT18
    mla r4, r0, r1, r4
.L_5cc:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_61c
    ldr r0, [sp, #0x34]
    ldr r0, [r0, #0x10]
    bl func_0202f418
    cmp r0, #0x0
    beq .L_61c
    mov r0, r8
    ldr r1, _LIT0
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b9dc4
    mov r9, r0
    bl func_ov002_021c2488
    mul r1, r9, r0
    mov r0, #0x12c
    mul r0, r1, r0
    sub r4, r4, r0
    sub r6, r6, r0
.L_61c:
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
    beq .L_728
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
.L_670:
    mov r0, fp, lsl #0x3
    ldrh r7, [r9, r0]
    add sl, r9, fp, lsl #0x3
    ldrh fp, [sl, #0x6]
    cmp r7, lr
    bgt .L_6b8
    cmp r7, r3
    blt .L_6a8
    cmp r7, r2
    beq .L_6fc
    cmp r7, lr
    addeq r4, r4, #0x7d0
    addeq r6, r6, #0x7d0
    b .L_720
.L_6a8:
    ldr r0, _LIT20
    cmp r7, r0
    beq .L_6d8
    b .L_720
.L_6b8:
    ldr r0, _LIT22
    cmp r7, r0
    bgt .L_6cc
    addeq r4, r4, #0x3e8
    b .L_720
.L_6cc:
    cmp r7, r1
    beq .L_710
    b .L_720
.L_6d8:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    bne .L_720
    mov r0, #0x0
    str r0, [ip, #0x14]
    mov r4, r0
    b .L_720
.L_6fc:
    ldrh r0, [sl, #0x4]
    cmp r0, #0x1
    addeq r0, r4, #0x3b8
    addeq r4, r0, #0x800
    b .L_720
.L_710:
    mov r0, #0x960
    str r0, [ip, #0x14]
    mov r0, #0x1
    str r0, [sp, #0x20]
.L_720:
    cmp fp, #0x0
    bne .L_670
.L_728:
    ldr r2, _LIT23
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    rsb r7, r5, #0x0
    rsbne r4, r4, #0x0
    rsbne r6, r6, #0x0
    mov r0, #0x0
    cmp r7, #0x0
    ble .L_764
.L_754:
    mov r4, r4, lsl #0x1
    add r0, r0, #0x1
    cmp r0, r7
    blt .L_754
.L_764:
    cmp r5, #0x0
    mov r1, #0x0
    ble .L_784
.L_770:
    add r0, r4, #0x1
    mov r4, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, r5
    blt .L_770
.L_784:
    ldr r0, [sp, #0x24]
    mov r1, #0x0
    cmp r0, #0x0
    ble .L_7ac
.L_794:
    add r0, r6, #0x1
    mov r6, r0, asr #0x1
    ldr r0, [sp, #0x24]
    add r1, r1, #0x1
    cmp r1, r0
    blt .L_794
.L_7ac:
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
    bne .L_1284
    mov r4, #0x0
    ldr r2, _LIT23
    mov r0, r4
    mov r1, #0xb
    mov sl, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    mvnne r0, #0x0
    ldr r1, _LIT0
    strne r0, [sp, #0x8]
    moveq r0, #0x1
    streq r0, [sp, #0x8]
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT5
    ldr r1, [r1, #0x20]
    bl func_ov002_021b2f34
    str r0, [sp, #0x40]
    ldr r0, [sp, #0x3c]
    ldr r1, _LIT6
    rsb r0, r0, #0x1
    mvn r2, #0x0
    str r0, [sp, #0x1c]
    bl func_ov002_021bad9c
    ldr r2, _LIT0
    mov r6, r0
    ldr r0, [sp, #0x3c]
    ldr r1, _LIT6
    ldr r2, [r2, #0x20]
    bl func_ov002_021bad9c
    add fp, r6, r0
    ldr r0, [sp, #0x40]
    add r1, sp, #0x68
    add r6, r0, fp
    ldr r0, [sp, #0x10]
    ldr r1, [r1, r0]
    mov r0, #0x0
    str r0, [sp, #0x28]
    cmp r1, #0x4
    beq .L_8a8
    ldr r0, [sp, #0x10]
    add r1, sp, #0x70
    ldr r0, [r1, r0]
    tst r0, #0x10
    beq .L_8bc
.L_8a8:
    ldr r0, _LIT7
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x28]
.L_8bc:
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT8
    ldr r1, [r1, #0x20]
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_8e8
    ldr r0, [sp, #0x1c]
    bl func_ov002_021bbe70
    cmp r0, #0x2
    subeq r6, r6, #0x1
.L_8e8:
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
    beq .L_b34
    ldr r2, [sp, #0x34]
    ldr ip, _LIT22
    ldr r2, [r2, #0x10]
    cmp r2, ip
    bgt .L_990
    bge .L_a28
    ldr r3, _LIT12
    cmp r2, r3
    bgt .L_aa4
    sub ip, r3, #0x3
    cmp r2, ip
    blt .L_aa4
    beq .L_9b4
    cmp r2, r3
    beq .L_9f0
    b .L_aa4
.L_990:
    ldr r0, _LIT24
    cmp r2, r0
    bgt .L_9a4
    beq .L_a6c
    b .L_aa4
.L_9a4:
    ldr r0, _LIT25
    cmp r2, r0
    beq .L_a90
    b .L_aa4
.L_9b4:
    ldr r3, [sp, #0x4]
    cmp r3, #0x0
    beq .L_9d0
    ldr r3, _LIT4
    ldr r0, [r3, r0]
    cmp r0, #0x7d0
    bgt .L_9e4
.L_9d0:
    ldr r0, [sp, #0x3c]
    mov r3, #0x1
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_aa4
.L_9e4:
    add r0, r4, #0x3b8
    add r4, r0, #0x800
    b .L_aa4
.L_9f0:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_a0c
    ldr r0, [sp, #0x38]
    ldr r0, [r0, #0x24]
    cmp r0, #0xf
    beq .L_a1c
.L_a0c:
    ldr r0, [sp, #0x3c]
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_aa4
.L_a1c:
    add r4, r4, #0x7d0
    add sl, sl, #0x7d0
    b .L_aa4
.L_a28:
    ldr ip, [sp, #0x4]
    cmp ip, #0x0
    ldrne ip, [sp, #0x38]
    ldrne lr, [ip, #0x24]
    cmpne lr, #0x0
    beq .L_a54
    ldr ip, _LIT15
    add r0, ip, r0
    ldr r0, [r3, r0]
    cmp lr, r0
    beq .L_a64
.L_a54:
    ldr r0, [sp, #0x3c]
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_aa4
.L_a64:
    add r4, r4, #0x3e8
    b .L_aa4
.L_a6c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_aa4
    ldr r0, [sp, #0x10]
    add r1, sp, #0x80
    ldr r0, [r1, r0]
    add r4, r4, r0
    b .L_aa4
.L_a90:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrne r0, [sp, #0x34]
    movne r1, #0x1
    strne r1, [r0, #0x8]
.L_aa4:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_b34
    ldr r0, _LIT16
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    bne .L_b34
    ldr r0, [sp, #0x34]
    mov r1, #0x0
    ldr r0, [r0, #0x10]
    bl func_ov002_0225a890
    mvn r1, #0x0
    cmp r0, r1
    cmpne r0, #0x0
    beq .L_b34
    ldr r1, [sp, #0x34]
    ldr r2, [r1, #0x10]
    ldr r1, _LIT26
    cmp r2, r1
    beq .L_b04
    ldr r1, _LIT27
    cmp r2, r1
    beq .L_b0c
    b .L_b30
.L_b04:
    add fp, fp, #0x1
    b .L_b34
.L_b0c:
    add r0, sp, #0x78
    ldr r1, [r0, r9]
    add r0, sp, #0x80
    ldr r0, [r0, r9]
    rsb r0, r0, #0xc8
    add r1, r1, r0
    add r0, sp, #0x78
    str r1, [r0, r9]
    b .L_b34
.L_b30:
    add r4, r4, r0
.L_b34:
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT28
    ldr r1, [r1, #0x20]
    bl func_ov002_021b4190
    add r4, r4, r0
    ldr r0, [sp, #0x38]
    ldr r0, [r0, #0x10]
    bl func_0202f418
    cmp r0, #0x0
    beq .L_b90
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9dc4
    str r0, [sp, #0x48]
    bl func_ov002_021c2488
    ldr r1, [sp, #0x48]
    mul r2, r1, r0
    mov r0, #0x12c
    mul r0, r2, r0
    sub r4, r4, r0
    sub sl, sl, r0
.L_b90:
    rsb r0, r6, #0x0
    mov r1, #0x0
    str r0, [sp, #0x18]
    cmp r0, #0x0
    ble .L_bb8
.L_ba4:
    ldr r0, [sp, #0x18]
    add r1, r1, #0x1
    mov r4, r4, lsl #0x1
    cmp r1, r0
    blt .L_ba4
.L_bb8:
    cmp r6, #0x0
    mov r1, #0x0
    ble .L_bd8
.L_bc4:
    add r0, r4, #0x1
    mov r4, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, r6
    blt .L_bc4
.L_bd8:
    cmp fp, #0x0
    mov r1, #0x0
    ble .L_bf8
.L_be4:
    add r0, sl, #0x1
    mov sl, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, fp
    blt .L_be4
.L_bf8:
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
    bl func_ov002_021b306c
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, _LIT30
    ldr r1, [r1, #0x1c]
    mov r0, r8
    bl func_ov002_021babc8
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
    ble .L_cc4
.L_cb4:
    mov r1, r1, lsl #0x1
    add r2, r2, #0x1
    cmp r2, r7
    blt .L_cb4
.L_cc4:
    cmp r5, #0x0
    mov r2, #0x0
    ble .L_ce4
.L_cd0:
    add r0, r1, #0x1
    mov r1, r0, asr #0x1
    add r2, r2, #0x1
    cmp r2, r5
    blt .L_cd0
.L_ce4:
    ldr r0, [sp]
    cmp r0, #0x1
    add r0, sp, #0x78
    ldr r0, [r0, r9]
    add r1, r0, r1
    add r0, sp, #0x78
    str r1, [r0, r9]
    ble .L_dc0
    ldr r1, _LIT0
    mov r0, #0x14
    ldr r1, [r1, #0x1c]
    mul r2, r1, r0
    ldr r0, [sp, #0x14]
    ldrh sl, [r0, r2]
    cmp sl, #0x0
    beq .L_dc0
    ldr r0, _LIT29
    sub r0, r0, #0x9d0
    str r0, [sp, #0x60]
.L_d30:
    ldr r0, _LIT21
    add r1, r0, sl, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh sl, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xa
    bne .L_db8
    ldrh r0, [r1]
    ldr r2, _LIT29
    and r4, r0, #0xff
    mov r0, r0, asr #0x8
    and fp, r0, #0xff
    mov r0, r4
    mov r1, fp
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_db8
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
    bl func_ov002_021df53c
.L_db8:
    cmp sl, #0x0
    bne .L_d30
.L_dc0:
    ldr r0, [sp, #0x38]
    ldr r0, [r0, #0x10]
    bl func_0202ea74
    cmp r0, #0x0
    beq .L_e00
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c19f0
    mov r2, r0
    ldr r0, _LIT31
    mov r1, r8
    bl func_ov002_021bb184
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x2c]
.L_e00:
    ldr r0, [sp, #0x38]
    ldr r0, [r0, #0x10]
    bl func_0202ed3c
    cmp r0, #0x0
    beq .L_e40
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c19f0
    mov r2, r0
    ldr r0, _LIT32
    mov r1, r8
    bl func_ov002_021bb184
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x2c]
.L_e40:
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    beq .L_ec8
    add r0, sp, #0x78
    ldr r2, [r0, r9]
    mov r1, r0
    ldr r0, [sp, #0x4c]
    ldr r0, [r1, r0]
    cmp r2, r0
    bge .L_ec8
    cmp r7, #0x0
    mov r2, #0x3e8
    mov r0, #0x0
    ble .L_e88
.L_e78:
    mov r2, r2, lsl #0x1
    add r0, r0, #0x1
    cmp r0, r7
    blt .L_e78
.L_e88:
    cmp r5, #0x0
    mov r1, #0x0
    ble .L_ea8
.L_e94:
    add r0, r2, #0x1
    mov r2, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, r5
    blt .L_e94
.L_ea8:
    add r0, sp, #0x78
    ldr r1, [r0, r9]
    mov r0, #0x0
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x8]
    mla r1, r0, r2, r1
    add r0, sp, #0x78
    str r1, [r0, r9]
.L_ec8:
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT33
    ldr r1, [r1, #0x20]
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    beq .L_10e4
    ldr r1, [sp, #0x4c]
    add r2, sp, #0x78
    ldr r1, [r2, r1]
    cmp r1, #0x3e8
    ble .L_fac
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_10e4
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT33
    ldr r1, [r1, #0x20]
    mov r3, #0x1
    bl func_ov002_021aa3c0
    b .L_10e4
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cd340
_LIT2: .word data_ov002_022cd444
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf08c
_LIT5: .word 0x00001381
_LIT6: .word 0x00001905
_LIT7: .word 0x00001951
_LIT8: .word 0x00001955
_LIT9: .word data_ov002_022cf0cc
_LIT10: .word data_ov002_022cf0c4
_LIT11: .word 0x000014d7
_LIT12: .word 0x000013aa
_LIT13: .word 0x00001956
_LIT14: .word 0x00001aaf
_LIT15: .word data_ov002_022cf0c8
_LIT16: .word data_ov002_022d008c
_LIT17: .word 0x00001846
_LIT18: .word 0x000005dc
_LIT19: .word data_ov002_022cf0c6
_LIT20: .word 0x00001119
_LIT21: .word data_ov002_022d0570
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
.L_fac:
    ldr r1, [sp, #0x38]
    ldr r1, [r1, #0x8]
    cmp r1, #0x0
    addne r1, sp, #0x7c
    moveq r1, r2
    ldr r2, [r1, r9]
    ldr r1, _LIT34
    cmp r2, r1
    blt .L_10e4
    cmp r0, #0x1
    ble .L_ffc
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_ffc
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT33
    ldr r1, [r1, #0x20]
    mov r3, #0x0
    bl func_ov002_021aa3c0
.L_ffc:
    ldr r1, _LIT0
    ldr r0, [sp, #0x3c]
    ldr r2, _LIT33
    ldr r1, [r1, #0x20]
    bl func_ov002_021b306c
    cmp r0, #0x0
    beq .L_10e4
    ldr r0, [sp, #0x18]
    mov r2, #0x0
    cmp r0, #0x0
    ldr r0, _LIT34
    ble .L_1040
.L_102c:
    ldr r1, [sp, #0x18]
    add r2, r2, #0x1
    mov r0, r0, lsl #0x1
    cmp r2, r1
    blt .L_102c
.L_1040:
    cmp r6, #0x0
    mov r1, #0x0
    ble .L_1060
.L_104c:
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, r6
    blt .L_104c
.L_1060:
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
    ble .L_10ac
.L_109c:
    mov r2, r2, lsl #0x1
    add r0, r0, #0x1
    cmp r0, r7
    blt .L_109c
.L_10ac:
    cmp r5, #0x0
    mov r1, #0x0
    ble .L_10cc
.L_10b8:
    add r0, r2, #0x1
    mov r2, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, r5
    blt .L_10b8
.L_10cc:
    add r0, sp, #0x78
    ldr r1, [r0, r9]
    ldr r0, [sp, #0x8]
    mla r1, r0, r2, r1
    add r0, sp, #0x78
    str r1, [r0, r9]
.L_10e4:
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    beq .L_1164
    add r0, sp, #0x78
    ldr r2, [r0, r9]
    mov r1, r0
    ldr r0, [sp, #0x4c]
    ldr r0, [r1, r0]
    cmp r2, r0
    bge .L_1164
    cmp r7, #0x0
    mov r2, #0x3e8
    mov r0, #0x0
    ble .L_112c
.L_111c:
    mov r2, r2, lsl #0x1
    add r0, r0, #0x1
    cmp r0, r7
    blt .L_111c
.L_112c:
    cmp r5, #0x0
    mov r1, #0x0
    ble .L_114c
.L_1138:
    add r0, r2, #0x1
    mov r2, r0, asr #0x1
    add r1, r1, #0x1
    cmp r1, r5
    blt .L_1138
.L_114c:
    add r0, sp, #0x78
    ldr r1, [r0, r9]
    ldr r0, [sp, #0x8]
    mla r1, r0, r2, r1
    add r0, sp, #0x78
    str r1, [r0, r9]
.L_1164:
    mov r0, r8
    ldr r1, _LIT0
    ldr r2, _LIT33
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    beq .L_1284
    add r1, sp, #0x78
    ldr r1, [r1, r9]
    cmp r1, #0x3e8
    ble .L_11b8
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_1284
    ldr r0, _LIT0
    ldr r2, _LIT33
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, #0x1
    bl func_ov002_021aa3c0
    b .L_1284
.L_11b8:
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
    blt .L_1284
    cmp r0, #0x1
    ble .L_1210
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_1210
    ldr r0, _LIT0
    ldr r2, _LIT33
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, #0x0
    bl func_ov002_021aa3c0
.L_1210:
    ldr r0, _LIT0
    ldr r2, _LIT33
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b306c
    cmp r0, #0x0
    beq .L_1284
    cmp r7, #0x0
    ldr r2, _LIT34
    mov r0, #0x0
    ble .L_124c
.L_123c:
    add r0, r0, #0x1
    cmp r0, r7
    mov r2, r2, lsl #0x1
    blt .L_123c
.L_124c:
    cmp r5, #0x0
    mov r1, #0x0
    ble .L_126c
.L_1258:
    add r0, r2, #0x1
    add r1, r1, #0x1
    cmp r1, r5
    mov r2, r0, asr #0x1
    blt .L_1258
.L_126c:
    add r0, sp, #0x78
    ldr r1, [r0, r9]
    ldr r0, [sp, #0x8]
    mla r1, r0, r2, r1
    add r0, sp, #0x78
    str r1, [r0, r9]
.L_1284:
    add r0, sp, #0x78
    ldr r1, [r0, r9]
    ldr r0, _LIT35
    cmp r1, r0
    blt .L_12bc
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_12bc
    ldr r0, _LIT0
    ldr r2, _LIT36
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, #0x1
    bl func_ov002_021aa3c0
.L_12bc:
    ldr r2, _LIT0
    ldr r0, [r2, #0x8]
    cmp r0, #0x0
    bne .L_130c
    ldr r0, [sp, #0xc]
    mov r1, #0x2c
    mul r4, r0, r1
    add r3, sp, #0x78
    rsb r0, r1, #0x540
    ldr r1, [r3, r4]
    cmp r1, r0
    blt .L_130c
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_130c
    ldr r1, [r2, #0x20]
    ldr r2, _LIT36
    ldr r0, [sp, #0x3c]
    mov r3, #0x1
    bl func_ov002_021aa3c0
.L_130c:
    mov sl, #0x0
    ldr r9, _LIT0
    ldr r4, _LIT37
    add r8, sp, #0x64
    mov r7, sl
    mov r6, sl
    mov r5, sl
    mov fp, sl
.L_132c:
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
    beq .L_139c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldreq r1, [r4, #0x4]
    ldreq r0, [r9, #0x2c]
    cmpeq r1, r0
    bne .L_139c
    ldr r1, [r8, #0x14]
    mov r0, #0x0
    bl func_ov002_021b0afc
.L_139c:
    add sl, sl, #0x1
    cmp sl, #0x2
    add r8, r8, #0x2c
    add r9, r9, #0x38
    blt .L_132c
    add sp, sp, #0xbc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT35: .word 0x00000514
_LIT36: .word 0x0000150a
_LIT37: .word data_ov002_022cd65c
