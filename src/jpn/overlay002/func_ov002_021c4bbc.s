; func_ov002_021c4bbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0a8
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022cf0c8
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_0202b89c
        .extern func_0202b8cc
        .extern func_0202e748
        .extern func_0202ea74
        .extern func_0202ed3c
        .extern func_0202f478
        .extern func_0202f4ac
        .extern func_0202f578
        .extern func_ov002_021b306c
        .extern func_ov002_021b3234
        .extern func_ov002_021b3414
        .extern func_ov002_021b3538
        .extern func_ov002_021b3dec
        .extern func_ov002_021b8eec
        .extern func_ov002_021b9af4
        .extern func_ov002_021b9d20
        .extern func_ov002_021b9dec
        .extern func_ov002_021babc8
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bb82c
        .extern func_ov002_021bb83c
        .extern func_ov002_021bbae0
        .extern func_ov002_021bbb78
        .extern func_ov002_021bbb88
        .extern func_ov002_021bbc24
        .extern func_ov002_021bbe70
        .extern func_ov002_021bbeb8
        .extern func_ov002_021bbf20
        .extern func_ov002_021bbf9c
        .extern func_ov002_021bbff4
        .extern func_ov002_021bce20
        .extern func_ov002_021bce38
        .extern func_ov002_021bd194
        .extern func_ov002_021bd284
        .extern func_ov002_021bd40c
        .extern func_ov002_021bd514
        .extern func_ov002_021c19f0
        .extern func_ov002_021c1c6c
        .extern func_ov002_021c2e44
        .extern func_ov002_021c2eb0
        .extern func_ov002_021c317c
        .extern func_ov002_021c31f4
        .extern func_ov002_021c3270
        .extern func_ov002_021c3d60
        .extern func_ov002_021c4078
        .extern func_ov002_021c45c8
        .extern func_ov002_021c4bbc
        .extern func_ov002_021c83ac
        .extern func_ov002_021c8400
        .extern func_ov002_021c8860
        .extern func_ov002_021c8870
        .extern func_ov002_021c8d58
        .extern func_ov002_021c921c
        .global func_ov002_021c4bbc
        .arm
func_ov002_021c4bbc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xb0
    mov r4, #0x0
    mov r9, r2
    str r4, [r9, #0x4]
    str r4, [r9, #0x8]
    str r4, [r9, #0x10]
    str r4, [r9, #0x1c]
    str r4, [r9, #0x14]
    str r4, [r9, #0x20]
    str r4, [r9, #0x18]
    str r4, [r9, #0x24]
    mov sl, r0
    str r1, [sp, #0x4]
    mov r5, r4
    mov r6, r4
    str r4, [sp, #0x58]
    mov r7, r4
    str r4, [sp, #0x54]
    str r4, [sp, #0x44]
    str r4, [r9, #0x28]
    bl func_ov002_021b9dec
    cmp r0, #0x0
    addeq sp, sp, #0xb0
    str r0, [r9]
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x4]
    cmp r0, #0x5
    addge sp, sp, #0xb0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021c8860
    str r0, [r9, #0x4]
    ldr r1, [sp, #0x4]
    add r2, sp, #0x80
    mov r0, sl
    bl func_ov002_021c8d58
    str r0, [r9, #0x8]
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021c8400
    str r0, [r9, #0x10]
    ldr r0, [r9, #0x8]
    mov r2, #0x1
    mov r0, r2, lsl r0
    str r0, [r9, #0xc]
    ldr r0, [sp, #0x4]
    mov r1, #0x14
    mul r1, r0, r1
    str r1, [sp, #0x18]
    ldr r0, _LIT0
    and r2, sl, #0x1
    mul r0, r2, r0
    ldr r1, _LIT1
    str r0, [sp, #0x1c]
    add r8, r1, r0
    ldr r0, [sp, #0x18]
    ldr r3, _LIT2
    ldr r1, [r8, r0]
    ldr r0, [sp, #0x1c]
    mov r2, r1, lsr #0x6
    add r0, r3, r0
    str r0, [sp, #0x5c]
    and r0, r2, #0x1
    ldr r3, [sp, #0x5c]
    ldr r2, [sp, #0x18]
    mvn r0, r0
    ldrh r3, [r3, r2]
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r2, r3, r0
    and r0, r1, #0x1
    mvn r0, r0
    and fp, r2, r0
    ldr r0, [sp, #0x80]
    cmp r0, #0x0
    bne .L_160
    ldr r1, [r9]
    ldr r0, _LIT3
    cmp r1, r0
    addne r0, r0, #0x128
    cmpne r1, r0
    bne .L_160
    cmp fp, #0x0
    ldrne r0, [r9, #0xc]
    orrne r0, r0, #0x78
    strne r0, [r9, #0xc]
.L_160:
    ldr r1, [sp, #0x4]
    mov r0, sl
    mov r2, r9
    bl func_ov002_021c45c8
    ldr r0, [r9, #0x1c]
    ldr r1, [sp, #0x5c]
    str r0, [r9, #0x14]
    ldr r0, [r9, #0x20]
    str r0, [r9, #0x18]
    ldr r0, [sp, #0x18]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    addeq sp, sp, #0xb0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021c19f0
    str r0, [r9, #0x24]
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021c1c6c
    str r0, [r9, #0x28]
    ldr r2, _LIT4
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp fp, #0x0
    str r0, [sp, #0x48]
    beq .L_1380
    ldr r0, [r9]
    ldr r3, _LIT5
    cmp r0, r3
    bgt .L_46c
    bge .L_c5c
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_354
    bge .L_a84
    ldr r1, _LIT7
    cmp r0, r1
    bgt .L_29c
    bge .L_820
    sub r3, r1, #0xba
    cmp r0, r3
    bgt .L_250
    bge .L_750
    sub r3, r2, #0x3a4
    cmp r0, r3
    bgt .L_240
    sub r2, r2, #0x3a4
    cmp r0, r2
    bge .L_728
    ldr r2, _LIT8
    cmp r0, r2
    beq .L_714
    b .L_1380
.L_240:
    sub r1, r2, #0x31c
    cmp r0, r1
    beq .L_764
    b .L_1380
.L_250:
    sub r2, r1, #0x93
    cmp r0, r2
    bgt .L_270
    bge .L_7b4
    sub r2, r1, #0xa8
    cmp r0, r2
    beq .L_790
    b .L_1380
.L_270:
    sub r2, r1, #0x3d
    cmp r0, r2
    bgt .L_28c
    sub r1, r1, #0x3d
    cmp r0, r1
    beq .L_7e0
    b .L_1380
.L_28c:
    sub r1, r1, #0x26
    cmp r0, r1
    beq .L_7f8
    b .L_1380
.L_29c:
    sub r3, r2, #0x70
    cmp r0, r3
    bgt .L_300
    bge .L_9b0
    add r3, r1, #0xeb
    cmp r0, r3
    bgt .L_2f0
    mov r2, r3
    cmp r0, r2
    bge .L_8e0
    add r2, r1, #0xd0
    cmp r0, r2
    bgt .L_1380
    add r2, r1, #0xce
    cmp r0, r2
    blt .L_1380
    beq .L_838
    add r1, r1, #0xd0
    cmp r0, r1
    beq .L_8b4
    b .L_1380
.L_2f0:
    sub r1, r2, #0x77
    cmp r0, r1
    beq .L_988
    b .L_1380
.L_300:
    sub r3, r2, #0x26
    cmp r0, r3
    bgt .L_328
    mov r1, r3
    cmp r0, r1
    bge .L_9c4
    sub r1, r2, #0x36
    cmp r0, r1
    beq .L_91c
    b .L_1380
.L_328:
    add r3, r1, #0x1b8
    cmp r0, r3
    bgt .L_344
    add r1, r1, #0x1b8
    cmp r0, r1
    beq .L_9e4
    b .L_1380
.L_344:
    sub r1, r2, #0x4
    cmp r0, r1
    beq .L_a5c
    b .L_1380
.L_354:
    add r1, r2, #0x1d0
    cmp r0, r1
    bgt .L_3e8
    bge .L_bb0
    add r1, r2, #0xd9
    cmp r0, r1
    bgt .L_3a4
    bge .L_b10
    add r1, r2, #0x8a
    cmp r0, r1
    bgt .L_394
    bge .L_ac4
    add r1, r2, #0x3b
    cmp r0, r1
    beq .L_aac
    b .L_1380
.L_394:
    add r1, r2, #0xd7
    cmp r0, r1
    beq .L_af4
    b .L_1380
.L_3a4:
    sub r1, r3, #0x1b0
    cmp r0, r1
    bgt .L_3c4
    bge .L_b48
    sub r1, r3, #0x1c0
    cmp r0, r1
    beq .L_b30
    b .L_1380
.L_3c4:
    ldr r1, _LIT9
    cmp r0, r1
    bgt .L_3d8
    beq .L_838
    b .L_1380
.L_3d8:
    add r1, r1, #0x26
    cmp r0, r1
    beq .L_b98
    b .L_1380
.L_3e8:
    add r1, r2, #0x268
    cmp r0, r1
    bgt .L_428
    bge .L_bfc
    add r1, r2, #0x260
    cmp r0, r1
    bgt .L_418
    bge .L_bcc
    sub r1, r3, #0xb0
    cmp r0, r1
    beq .L_94c
    b .L_1380
.L_418:
    sub r1, r3, #0x9d
    cmp r0, r1
    beq .L_be4
    b .L_1380
.L_428:
    add r1, r2, #0x2a4
    cmp r0, r1
    bgt .L_448
    bge .L_c2c
    sub r1, r3, #0x95
    cmp r0, r1
    beq .L_c14
    b .L_1380
.L_448:
    sub r1, r3, #0x58
    cmp r0, r1
    bgt .L_45c
    beq .L_c40
    b .L_1380
.L_45c:
    sub r1, r3, #0x24
    cmp r0, r1
    beq .L_c40
    b .L_1380
.L_46c:
    add r1, r3, #0x2a0
    cmp r0, r1
    bgt .L_5a4
    bge .L_f7c
    ldr r1, _LIT10
    cmp r0, r1
    bgt .L_518
    bge .L_df8
    sub r2, r1, #0x96
    cmp r0, r2
    bgt .L_4cc
    bge .L_d24
    add r2, r3, #0x1e
    cmp r0, r2
    bgt .L_4bc
    bge .L_ca4
    sub r1, r1, #0x128
    cmp r0, r1
    beq .L_c8c
    b .L_1380
.L_4bc:
    sub r2, r1, #0xa9
    cmp r0, r2
    beq .L_cd0
    b .L_1380
.L_4cc:
    sub r2, r1, #0x29
    cmp r0, r2
    bgt .L_4ec
    bge .L_e90
    sub r1, r1, #0x62
    cmp r0, r1
    beq .L_d5c
    b .L_1380
.L_4ec:
    sub r2, r1, #0xa
    cmp r0, r2
    bgt .L_508
    sub r1, r1, #0xa
    cmp r0, r1
    beq .L_d94
    b .L_1380
.L_508:
    sub r1, r1, #0x8
    cmp r0, r1
    beq .L_dc8
    b .L_1380
.L_518:
    add r2, r1, #0x75
    cmp r0, r2
    bgt .L_558
    bge .L_dc8
    add r2, r1, #0x2c
    cmp r0, r2
    bgt .L_548
    bge .L_e78
    add r1, r1, #0x1e
    cmp r0, r1
    beq .L_e20
    b .L_1380
.L_548:
    add r1, r1, #0x3c
    cmp r0, r1
    beq .L_dc8
    b .L_1380
.L_558:
    add r2, r1, #0xd8
    cmp r0, r2
    bgt .L_578
    bge .L_ea8
    add r1, r1, #0xa9
    cmp r0, r1
    beq .L_e90
    b .L_1380
.L_578:
    add r2, r1, #0x124
    cmp r0, r2
    bgt .L_594
    add r1, r1, #0x124
    cmp r0, r1
    beq .L_f4c
    b .L_1380
.L_594:
    add r1, r1, #0x158
    cmp r0, r1
    beq .L_f64
    b .L_1380
.L_5a4:
    ldr r1, _LIT11
    cmp r0, r1
    bgt .L_650
    bge .L_11a0
    sub r2, r1, #0x31
    cmp r0, r2
    bgt .L_5f4
    bge .L_100c
    sub r2, r1, #0x52
    cmp r0, r2
    bgt .L_5e4
    bge .L_fc0
    sub r1, r1, #0x72
    cmp r0, r1
    beq .L_fa8
    b .L_1380
.L_5e4:
    sub r1, r1, #0x37
    cmp r0, r1
    beq .L_fd8
    b .L_1380
.L_5f4:
    sub r2, r1, #0x24
    cmp r0, r2
    bgt .L_614
    bge .L_1050
    sub r2, r1, #0x29
    cmp r0, r2
    beq .L_1038
    b .L_1380
.L_614:
    sub r2, r1, #0x1f
    cmp r0, r2
    bgt .L_640
    sub r2, r1, #0x22
    cmp r0, r2
    blt .L_1380
    beq .L_1068
    sub r2, r1, #0x1f
    cmp r0, r2
    beq .L_10f8
    b .L_1380
.L_640:
    sub r1, r1, #0x6
    cmp r0, r1
    beq .L_1110
    b .L_1380
.L_650:
    add r2, r1, #0x80
    cmp r0, r2
    bgt .L_6d0
    bge .L_1300
    cmp r0, #0x1a00
    bgt .L_6a4
    bge .L_f64
    add r2, r1, #0x3
    cmp r0, r2
    bgt .L_1380
    add r2, r1, #0x1
    cmp r0, r2
    blt .L_1380
    beq .L_11bc
    add r2, r1, #0x2
    cmp r0, r2
    beq .L_11e8
    add r1, r1, #0x3
    cmp r0, r1
    beq .L_1214
    b .L_1380
.L_6a4:
    add r2, r1, #0x10
    cmp r0, r2
    bgt .L_6c0
    add r1, r1, #0x10
    cmp r0, r1
    beq .L_1240
    b .L_1380
.L_6c0:
    add r1, r1, #0x7a
    cmp r0, r1
    beq .L_12dc
    b .L_1380
.L_6d0:
    ldr r2, _LIT12
    cmp r0, r2
    bgt .L_6f0
    bge .L_1328
    sub r1, r2, #0x65
    cmp r0, r1
    beq .L_1314
    b .L_1380
.L_6f0:
    add r1, r2, #0x37
    cmp r0, r1
    bgt .L_704
    beq .L_1340
    b .L_1380
.L_704:
    add r1, r2, #0x68
    cmp r0, r1
    beq .L_136c
    b .L_1380
.L_714:
    mov r0, sl
    bl func_ov002_021bb82c
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_1380
.L_728:
    ldr r0, [sp, #0x18]
    ldr r0, [r8, r0]
    mov r0, r0, lsr #0x5
    tst r0, #0x1
    beq .L_1380
    ldr r0, [sp, #0x58]
    add r6, r6, #0x64
    add r0, r0, #0x64
    str r0, [sp, #0x58]
    b .L_1380
.L_750:
    mov r0, sl
    bl func_ov002_021c317c
    mov r1, #0x64
    mla r6, r0, r1, r6
    b .L_1380
.L_764:
    mov r0, #0x0
    mov r1, #0xd
    bl func_ov002_021bbb78
    mov r1, #0x64
    mla r6, r0, r1, r6
    mov r0, #0x1
    mov r1, #0xd
    bl func_ov002_021bbb78
    mov r1, #0x64
    mla r6, r0, r1, r6
    b .L_1380
.L_790:
    sub r0, r1, #0x1ec
    bl func_ov002_021bb83c
    mov r1, #0x12c
    mul r1, r0, r1
    ldr r0, [sp, #0x58]
    add r6, r6, r1
    add r0, r0, r1
    str r0, [sp, #0x58]
    b .L_1380
.L_7b4:
    mov r0, #0x0
    mov r1, #0x7
    bl func_ov002_021bbb78
    mov r1, #0x64
    mla r6, r0, r1, r6
    mov r0, #0x1
    mov r1, #0x7
    bl func_ov002_021bbb78
    mov r1, #0x64
    mla r6, r0, r1, r6
    b .L_1380
.L_7e0:
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021b3234
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_1380
.L_7f8:
    ldr r2, _LIT13
    ldr r0, [sp, #0x1c]
    mov r1, #0x12c
    ldr r0, [r2, r0]
    mul r1, r0, r1
    ldr r0, [sp, #0x58]
    add r6, r6, r1
    add r0, r0, r1
    str r0, [sp, #0x58]
    b .L_1380
.L_820:
    ldr r1, _LIT8
    mov r0, sl
    bl func_ov002_021bb82c
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_1380
.L_838:
    ldr r0, _LIT14
    ldr ip, _LIT15
    sub r2, r0, #0xa10
    ldr r1, _LIT16
    mov lr, #0x0
    str r2, [sp, #0x70]
.L_850:
    ldr r8, [sp, #0x70]
    ldr r2, _LIT17
    and fp, lr, #0x1
    mla r8, fp, r8, r2
    ldr r2, [r8, #0x14]
    mov r3, #0x0
    cmp r2, #0x0
    bls .L_8a4
    add r8, r8, #0x18
    add r8, r8, #0x400
.L_878:
    ldr fp, [r8]
    add r3, r3, #0x1
    mov fp, fp, lsl #0x13
    mov fp, fp, lsr #0x13
    cmp fp, r1
    cmpne fp, r0
    cmpne fp, ip
    addeq r6, r6, #0x12c
    add r8, r8, #0x4
    cmp r3, r2
    bcc .L_878
.L_8a4:
    add lr, lr, #0x1
    cmp lr, #0x2
    blt .L_850
    b .L_1380
.L_8b4:
    mov r0, #0x0
    mov r1, #0xa
    bl func_ov002_021bbb78
    mov r1, #0xc8
    mla r6, r0, r1, r6
    mov r0, #0x1
    mov r1, #0xa
    bl func_ov002_021bbb78
    mov r1, #0xc8
    mla r6, r0, r1, r6
    b .L_1380
.L_8e0:
    ldr r1, _LIT18
    ldr r0, [sp, #0x1c]
    add r1, r1, r0
    ldr r0, [sp, #0x18]
    ldr r0, [r1, r0]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r9, #0x14]
    ldr r0, [sp, #0x18]
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r9, #0x18]
    b .L_1380
.L_91c:
    rsb r8, sl, #0x1
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021bd284
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021bbb78
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_1380
.L_94c:
    mov r8, #0x0
    mov fp, #0x1f4
.L_954:
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021bd284
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021bbb78
    add r8, r8, #0x1
    mla r6, r0, fp, r6
    cmp r8, #0x2
    blt .L_954
    b .L_1380
.L_988:
    ldr r2, _LIT13
    ldr r0, [sp, #0x1c]
    mov r1, #0x190
    ldr r0, [r2, r0]
    mul r1, r0, r1
    ldr r0, [sp, #0x58]
    sub r6, r6, r1
    sub r0, r0, r1
    str r0, [sp, #0x58]
    b .L_1380
.L_9b0:
    rsb r0, sl, #0x1
    bl func_ov002_021bbeb8
    cmp r0, #0x0
    subgt r6, r6, #0x3e8
    b .L_1380
.L_9c4:
    ldr r2, _LIT13
    ldr r0, [sp, #0x1c]
    mov r1, #0x3e8
    ldr r0, [r2, r0]
    mul r1, r0, r1
    str r1, [r9, #0x18]
    str r1, [r9, #0x14]
    b .L_1380
.L_9e4:
    ldr r0, [sp, #0x18]
    ldr r0, [r8, r0]
    mov r0, r0, lsr #0x4
    tst r0, #0x1
    beq .L_a20
    ldr r1, _LIT18
    ldr r0, [sp, #0x1c]
    add r1, r1, r0
    ldr r0, [sp, #0x18]
    ldr r1, [r0, r1]
    ldr r0, [sp, #0x58]
    add r6, r6, r1
    add r0, r0, r1
    str r0, [sp, #0x58]
    b .L_1380
.L_a20:
    ldr r1, _LIT18
    ldr r0, [sp, #0x1c]
    add r1, r1, r0
    ldr r0, [sp, #0x18]
    ldr r0, [r1, r0]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r9, #0x14]
    ldr r0, [sp, #0x18]
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r9, #0x18]
    b .L_1380
.L_a5c:
    ldr r2, [sp, #0x4]
    mov r0, sl
    mov r1, #0xa
    bl func_ov002_021bbae0
    cmp r0, #0x0
    bne .L_1380
    mov r0, #0x3e8
    str r0, [r9, #0x14]
    str r0, [r9, #0x18]
    b .L_1380
.L_a84:
    ldr r0, [sp, #0x18]
    ldr r0, [r8, r0]
    mov r0, r0, lsr #0x5
    tst r0, #0x1
    beq .L_1380
    ldr r0, [sp, #0x58]
    add r6, r6, #0x1f4
    add r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_1380
.L_aac:
    rsb r0, sl, #0x1
    bl func_ov002_021bbeb8
    mov r1, #0xc8
    mul r1, r0, r1
    sub r6, r6, r1
    b .L_1380
.L_ac4:
    mov r0, #0x0
    bl func_ov002_021bd194
    cmp r0, #0x0
    bne .L_ae4
    mov r0, #0x1
    bl func_ov002_021bd194
    cmp r0, #0x0
    beq .L_1380
.L_ae4:
    ldr r0, _LIT19
    str r0, [r9, #0x14]
    str r0, [r9, #0x18]
    b .L_1380
.L_af4:
    ldr r0, _LIT20
    ldr r1, [r0, #0xcec]
    cmp sl, r1
    ldreq r0, [r0, #0xcf8]
    cmpeq r0, #0x3
    addeq r6, r6, #0x12c
    b .L_1380
.L_b10:
    ldr r0, _LIT20
    ldr r1, [r0, #0xcec]
    cmp sl, r1
    beq .L_1380
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x3
    addeq r6, r6, #0x12c
    b .L_1380
.L_b30:
    mov r0, sl
    mov r1, #0x11
    bl func_ov002_021bd284
    mov r1, #0xc8
    mla r6, r0, r1, r6
    b .L_1380
.L_b48:
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021b3538
    ldr r1, _LIT21
    cmp r0, r1
    beq .L_1380
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    add r2, sp, #0x84
    bl func_ov002_021c4bbc
    ldr r1, [sp, #0x98]
    mov r0, #0x1
    str r1, [r9, #0x14]
    str r0, [sp, #0x44]
    ldr r0, [sp, #0x9c]
    str r0, [r9, #0x18]
    b .L_1380
.L_b98:
    ldr r1, _LIT13
    ldr r0, [sp, #0x1c]
    ldr r0, [r1, r0]
    cmp r0, #0x1
    addls r6, r6, #0x190
    b .L_1380
.L_bb0:
    ldr r2, [sp, #0x4]
    mov r0, sl
    mov r1, #0x1
    bl func_ov002_021bbae0
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_1380
.L_bcc:
    ldr r1, _LIT22
    mov r0, sl
    bl func_ov002_021bbf20
    mov r1, #0x64
    mla r6, r0, r1, r6
    b .L_1380
.L_be4:
    ldr r1, _LIT22
    mov r0, sl
    bl func_ov002_021bbf20
    mov r1, #0x190
    mla r6, r0, r1, r6
    b .L_1380
.L_bfc:
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021b9d20
    mov r1, #0xc8
    mla r6, r0, r1, r6
    b .L_1380
.L_c14:
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021b9d20
    mov r1, #0x12c
    mla r6, r0, r1, r6
    b .L_1380
.L_c2c:
    rsb r0, sl, #0x1
    bl func_ov002_021bbeb8
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_1380
.L_c40:
    ldr r1, _LIT18
    ldr r0, [sp, #0x1c]
    add r1, r1, r0
    ldr r0, [sp, #0x18]
    ldr r0, [r0, r1]
    str r0, [r9, #0x14]
    b .L_1380
.L_c5c:
    ldr r2, [sp, #0x4]
    mov r0, sl
    mov r1, #0x7
    bl func_ov002_021bbae0
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    rsb r0, sl, #0x1
    mov r1, #0x7
    bl func_ov002_021bbb78
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_1380
.L_c8c:
    mov r0, sl
    bl func_ov002_021c317c
    mov r1, #0x12c
    mul r1, r0, r1
    str r1, [r9, #0x14]
    b .L_1380
.L_ca4:
    ldr r3, _LIT23
    ldr r0, [sp, #0x1c]
    mov r1, #0x190
    ldr r0, [r3, r0]
    mul r2, r0, r1
    ldr r0, [sp, #0x1c]
    str r2, [r9, #0x14]
    ldr r0, [r3, r0]
    mul r1, r0, r1
    str r1, [r9, #0x18]
    b .L_1380
.L_cd0:
    sub r2, r1, #0x8d
    ldr r1, _LIT17
    ldr r0, [sp, #0x1c]
    add r3, r1, r0
    ldr r0, [r3, #0xf8]
    mov r0, r0, lsl #0x13
    cmp r2, r0, lsr #0x13
    bne .L_1380
    rsb r2, sl, #0x1
    ldr r0, [r3]
    and r3, r2, #0x1
    ldr r2, _LIT0
    mul r2, r3, r2
    ldr r1, [r1, r2]
    subs r1, r0, r1
    movmi r1, #0x0
    ldr r0, [sp, #0x58]
    add r6, r6, r1
    add r0, r0, r1
    str r0, [sp, #0x58]
    b .L_1380
.L_d24:
    rsb r0, sl, #0x1
    mov r1, #0x3
    bl func_ov002_021bbb78
    mov r8, r0
    ldr r2, [sp, #0x4]
    mov r0, sl
    mov r1, #0x3
    bl func_ov002_021bbae0
    mov r1, #0x3e8
    mul r2, r0, r1
    mla r0, r8, r1, r2
    str r0, [r9, #0x14]
    str r0, [r9, #0x18]
    b .L_1380
.L_d5c:
    ldr r1, _LIT13
    ldr r0, [sp, #0x1c]
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bne .L_1380
    mov r1, #0x0
    mov r0, sl
    mov r2, r1
    mov r3, r1
    bl func_ov002_021bce38
    cmp r0, #0x0
    addeq r0, r6, #0x1dc
    addeq r6, r0, #0x400
    b .L_1380
.L_d94:
    rsb r0, sl, #0x1
    mov r1, #0x4
    bl func_ov002_021bbc24
    mov r8, r0
    ldr r2, [sp, #0x4]
    mov r0, sl
    mov r1, #0x4
    bl func_ov002_021bbb88
    mov r1, #0x3e8
    mul r2, r0, r1
    mla r0, r8, r1, r2
    add r6, r6, r0
    b .L_1380
.L_dc8:
    mov r0, sl
    mov r1, #0x4
    bl func_ov002_021bbc24
    cmp r0, #0x0
    bne .L_df0
    rsb r0, sl, #0x1
    mov r1, #0x4
    bl func_ov002_021bbc24
    cmp r0, #0x0
    beq .L_1380
.L_df0:
    add r6, r6, #0x1f4
    b .L_1380
.L_df8:
    ldr r2, _LIT13
    ldr r0, [sp, #0x1c]
    mov r1, #0x190
    ldr r0, [r2, r0]
    mul r1, r0, r1
    ldr r0, [sp, #0x58]
    add r6, r6, r1
    add r0, r0, r1
    str r0, [sp, #0x58]
    b .L_1380
.L_e20:
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021b8eec
    cmp r0, #0x0
    beq .L_1380
    ldr r1, _LIT24
    mov r0, sl
    bl func_ov002_021bb82c
    cmp r0, #0x0
    beq .L_1380
    ldr r1, _LIT25
    mov r0, sl
    bl func_ov002_021bb82c
    cmp r0, #0x0
    beq .L_1380
    ldr r1, _LIT26
    mov r0, sl
    bl func_ov002_021bb82c
    cmp r0, #0x0
    ldrne r0, _LIT19
    strne r0, [r9, #0x14]
    b .L_1380
.L_e78:
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021b9d20
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_1380
.L_e90:
    mov r0, sl
    mov r1, #0x1
    bl func_ov002_021bd284
    mov r1, #0x12c
    mla r6, r0, r1, r6
    b .L_1380
.L_ea8:
    mov fp, #0x0
    add r0, sp, #0x78
    str fp, [r0]
    str fp, [r0, #0x4]
    ldr r2, _LIT17
    ldr r0, [sp, #0x1c]
    add r8, r2, r0
    add r0, r1, #0xd8
    str r0, [sp, #0x74]
.L_ecc:
    mov r0, sl
    mov r1, fp
    bl func_ov002_021b9dec
    ldr r1, [sp, #0x74]
    cmp r0, r1
    bne .L_f08
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_f08
    ldrh r0, [r8, #0x36]
    add r1, sp, #0x78
    ldr r1, [r1, r0, lsl #0x2]
    add r2, r1, #0x1
    add r1, sp, #0x78
    str r2, [r1, r0, lsl #0x2]
.L_f08:
    add r8, r8, #0x14
    add fp, fp, #0x1
    cmp fp, #0x4
    ble .L_ecc
    ldr r0, [sp, #0x7c]
    cmp r0, #0x0
    ldreq r2, [sp, #0x78]
    moveq r1, #0x3e8
    mlaeq r6, r2, r1, r6
    ldr r1, [sp, #0x78]
    cmp r1, #0x0
    bne .L_1380
    ldr r1, [sp, #0x58]
    mov r2, #0x3e8
    mla r1, r0, r2, r1
    str r1, [sp, #0x58]
    b .L_1380
.L_f4c:
    ldr r1, _LIT13
    ldr r0, [sp, #0x1c]
    ldr r0, [r1, r0]
    cmp r0, #0x0
    addeq r6, r6, #0x3e8
    b .L_1380
.L_f64:
    ldr r1, _LIT27
    mov r0, sl
    bl func_ov002_021c31f4
    mov r1, #0x12c
    mla r6, r0, r1, r6
    b .L_1380
.L_f7c:
    rsb r0, sl, #0x1
    bl func_ov002_021bbe70
    mov r1, #0xc8
    mla r6, r0, r1, r6
    mov r0, sl
    bl func_ov002_021bbe70
    sub r1, r0, #0x1
    mov r0, #0x1f4
    mul r0, r1, r0
    sub r6, r6, r0
    b .L_1380
.L_fa8:
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021b9d20
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_1380
.L_fc0:
    mov r0, sl
    mov r1, #0x4
    bl func_ov002_021bd40c
    mov r1, #0x3e8
    mla r6, r0, r1, r6
    b .L_1380
.L_fd8:
    rsb r0, sl, #0x1
    mov r1, #0x7
    bl func_ov002_021bbb78
    mov r6, r0
    ldr r2, [sp, #0x4]
    mov r0, sl
    mov r1, #0x7
    bl func_ov002_021bbae0
    add r1, r0, r6
    mov r0, #0x64
    mul r6, r1, r0
    str r6, [sp, #0x58]
    b .L_1380
.L_100c:
    mov r0, #0x1
    bl func_ov002_021bbf9c
    mov r8, r0
    mov r0, #0x0
    bl func_ov002_021bbf9c
    add r1, r0, r8
    mov r0, #0x1f4
    mul r0, r1, r0
    str r0, [r9, #0x18]
    str r0, [r9, #0x14]
    b .L_1380
.L_1038:
    sub r1, r1, #0xdc
    mov r0, sl
    bl func_ov002_021c2e44
    mov r1, #0x12c
    mla r6, r0, r1, r6
    b .L_1380
.L_1050:
    mov r1, r0
    mov r0, sl
    bl func_ov002_021c2e44
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_1380
.L_1068:
    ldr r1, _LIT18
    ldr r0, [sp, #0x1c]
    add r1, r1, r0
    ldr r0, [sp, #0x18]
    ldr r0, [r0, r1]
    tst r0, #0x1
    addne r6, r6, #0x3e8
    b .L_1380
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0cc
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x000018c7
_LIT4: .word 0x00001257
_LIT5: .word 0x000016ac
_LIT6: .word 0x000013ad
_LIT7: .word 0x000011d0
_LIT8: .word 0x00000fb2
_LIT9: .word 0x0000154a
_LIT10: .word 0x000017eb
_LIT11: .word 0x000019f5
_LIT12: .word 0x00001b16
_LIT13: .word data_ov002_022cf098
_LIT14: .word 0x00001278
_LIT15: .word 0x0000142d
_LIT16: .word 0x00000fc9
_LIT17: .word data_ov002_022cf08c
_LIT18: .word data_ov002_022cf0c8
_LIT19: .word 0x00000bb8
_LIT20: .word data_ov002_022d008c
_LIT21: .word 0x0000ffff
_LIT22: .word func_0202e748
_LIT23: .word data_ov002_022cf0a8
_LIT24: .word 0x00001807
_LIT25: .word 0x0000180b
_LIT26: .word 0x0000180c
_LIT27: .word func_0202ea74
.L_10f8:
    sub r1, r1, #0x2a
    mov r0, sl
    bl func_ov002_021c2e44
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_1380
.L_1110:
    rsb r0, sl, #0x1
    str r0, [sp, #0x2c]
    mov r0, #0x0
    str r0, [sp, #0x40]
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x2c]
    ldr r2, _LIT17
    and r1, r0, #0x1
    ldr r0, _LIT0
    mla r8, r1, r0, r2
    add fp, r8, #0x30
.L_113c:
    ldr r0, [fp]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r8, #0x38]
    cmpne r0, #0x0
    beq .L_1174
    ldr r0, [sp, #0x2c]
    ldr r1, [sp, #0xc]
    bl func_ov002_021c921c
    ldr r1, [r9, #0xc]
    tst r1, r0
    ldrne r0, [sp, #0x40]
    addne r0, r0, #0x1
    strne r0, [sp, #0x40]
.L_1174:
    ldr r0, [sp, #0xc]
    add fp, fp, #0x14
    add r0, r0, #0x1
    add r8, r8, #0x14
    str r0, [sp, #0xc]
    cmp r0, #0x4
    ble .L_113c
    ldr r0, [sp, #0x40]
    mov r1, #0x12c
    mla r6, r0, r1, r6
    b .L_1380
.L_11a0:
    ldr r2, _LIT23
    ldr r0, [sp, #0x1c]
    mov r1, #0x12c
    ldr r0, [r2, r0]
    mul r6, r0, r1
    str r6, [sp, #0x58]
    b .L_1380
.L_11bc:
    mov r0, #0x1
    bl func_ov002_021c3270
    mov r8, r0
    mov r0, #0x0
    bl func_ov002_021c3270
    add r1, r0, r8
    mov r0, #0x64
    mul r0, r1, r0
    str r0, [r9, #0x18]
    str r0, [r9, #0x14]
    b .L_1380
.L_11e8:
    mov r0, #0x1
    bl func_ov002_021c3270
    mov r8, r0
    mov r0, #0x0
    bl func_ov002_021c3270
    add r1, r0, r8
    mov r0, #0xc8
    mul r0, r1, r0
    str r0, [r9, #0x18]
    str r0, [r9, #0x14]
    b .L_1380
.L_1214:
    mov r0, #0x1
    bl func_ov002_021c3270
    mov r8, r0
    mov r0, #0x0
    bl func_ov002_021c3270
    add r1, r0, r8
    mov r0, #0x12c
    mul r0, r1, r0
    str r0, [r9, #0x18]
    str r0, [r9, #0x14]
    b .L_1380
.L_1240:
    ldr r1, _LIT17
    ldr r0, [sp, #0x1c]
    mov r8, #0x0
    add fp, r1, r0
    add r0, fp, #0x30
    str r8, [r9, #0x14]
    str r0, [sp, #0x30]
.L_125c:
    ldr r0, [sp, #0x4]
    cmp r8, r0
    beq .L_12b4
    ldr r0, [sp, #0x30]
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [fp, #0x38]
    cmpne r0, #0x0
    beq .L_12b4
    mov r0, sl
    mov r1, r8
    bl func_ov002_021b9dec
    bl func_0202ed3c
    cmp r0, #0x0
    beq .L_12b4
    mov r0, sl
    mov r1, r8
    bl func_ov002_021c83ac
    ldr r1, [r9, #0x14]
    add r0, r1, r0
    str r0, [r9, #0x14]
.L_12b4:
    ldr r0, [sp, #0x30]
    add r8, r8, #0x1
    add r0, r0, #0x14
    str r0, [sp, #0x30]
    add fp, fp, #0x14
    cmp r8, #0x4
    ble .L_125c
    ldr r0, [r9, #0x14]
    str r0, [r9, #0x18]
    b .L_1380
.L_12dc:
    mov r0, #0x0
    bl func_ov002_021bce20
    mov r6, r0
    mov r0, #0x1
    bl func_ov002_021bce20
    add r1, r6, r0
    mov r0, #0x190
    mul r6, r1, r0
    b .L_1380
.L_1300:
    rsb r0, sl, #0x1
    bl func_ov002_021bce20
    mov r1, #0x190
    mul r6, r0, r1
    b .L_1380
.L_1314:
    mov r0, sl
    bl func_ov002_021c317c
    mov r1, #0x64
    mul r6, r0, r1
    b .L_1380
.L_1328:
    ldr r1, _LIT28
    mov r0, sl
    bl func_ov002_021bbf20
    cmp r0, #0x0
    movne r6, #0x7d0
    b .L_1380
.L_1340:
    rsb r0, sl, #0x1
    and r2, r0, #0x1
    ldr r8, _LIT17
    ldr r0, [sp, #0x1c]
    ldr r1, _LIT0
    ldr r3, [r8, r0]
    mul r0, r2, r1
    ldr r0, [r8, r0]
    cmp r0, r3
    subgt r6, r0, r3
    b .L_1380
.L_136c:
    mov r0, sl
    mov r1, #0x6
    bl func_ov002_021bbc24
    mov r1, #0x1f4
    mul r6, r0, r1
.L_1380:
    ldr r1, [r9]
    ldr fp, _LIT29
    cmp r1, fp
    beq .L_13a4
    ldr r0, _LIT30
    cmp r1, r0
    moveq r0, #0x1
    streq r0, [sp, #0x44]
    b .L_13f8
.L_13a4:
    ldr r0, [r9, #0x24]
    and r0, r0, #0x1
    cmp r0, #0x0
    bgt .L_13f8
    mov r8, #0x5
.L_13b8:
    mov r0, sl
    mov r1, r8
    add r2, fp, #0xc1
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_13ec
    mov r0, sl
    mov r1, r8
    add r2, fp, #0xc1
    bl func_ov002_021b3dec
    cmp r0, #0x0
    ldrne r0, _LIT19
    strne r0, [r9, #0x14]
.L_13ec:
    add r8, r8, #0x1
    cmp r8, #0xa
    ble .L_13b8
.L_13f8:
    mov r0, #0x0
    str r0, [sp, #0x10]
.L_1400:
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x10]
    ldr r2, _LIT17
    and r1, r0, #0x1
    ldr r0, _LIT0
    mla r8, r1, r0, r2
    add fp, r8, #0x30
.L_1420:
    ldr r0, [fp]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_14a8
    ldr r1, [r8, #0x40]
    ldrh r0, [r8, #0x38]
    mov r2, r1, lsr #0x6
    and r2, r2, #0x1
    mvn r2, r2
    and r0, r0, r2
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_14a8
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x10]
    str r0, [sp]
    ldr r2, [sp, #0x8]
    mov r0, r9
    mov r3, sl
    bl func_ov002_021c4078
    mov r1, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    add r7, r7, r1, asr #0x10
    mov r1, r0, lsl #0x10
    ldr r0, [sp, #0x54]
    add r0, r0, r1, asr #0x10
    str r0, [sp, #0x54]
.L_14a8:
    ldr r0, [sp, #0x8]
    add fp, fp, #0x14
    add r0, r0, #0x1
    add r8, r8, #0x14
    str r0, [sp, #0x8]
    cmp r0, #0xa
    blt .L_1420
    ldr r0, [sp, #0x10]
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    cmp r0, #0x2
    blt .L_1400
    ldr r0, [r9]
    bl func_0202f478
    cmp r0, #0x0
    beq .L_14fc
    ldr r1, _LIT31
    mov r0, sl
    bl func_ov002_021c2eb0
    mov r1, #0x12c
    mla r7, r0, r1, r7
.L_14fc:
    ldr r0, [r9]
    bl func_0202f4ac
    cmp r0, #0x0
    beq .L_1534
    ldr r1, _LIT32
    mov r0, #0x0
    bl func_ov002_021c2eb0
    mov r1, #0x12c
    mla r7, r0, r1, r7
    mov r0, #0x1
    ldr r1, _LIT32
    bl func_ov002_021c2eb0
    mov r1, #0x12c
    mla r7, r0, r1, r7
.L_1534:
    mov r0, #0x0
    ldr fp, _LIT17
    str r0, [sp, #0x4c]
    str r0, [sp, #0x50]
    mov r8, r0
.L_1548:
    ldr r0, _LIT0
    and r1, r8, #0x1
    mla r0, r1, r0, fp
    ldr r1, [r0, #0xf8]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_1648
    ldr r1, [r0, #0x108]
    add r0, r0, #0x100
    ldrh r0, [r0]
    mov r2, r1, lsr #0x6
    and r2, r2, #0x1
    mvn r2, r2
    and r0, r0, r2
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_1648
    cmp sl, r8
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x24]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_1648
    ldr r0, [sp, #0x4]
    mov r1, r8
    str r0, [sp]
    mov r0, r9
    mov r2, #0xa
    mov r3, sl
    bl func_ov002_021c3d60
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r1, lsl #0x10
    ldr r1, [sp, #0x50]
    mov r0, r0, lsr #0x10
    add r1, r1, r2, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r1, [sp, #0x50]
    mov r1, r0, lsl #0x10
    ldr r0, [sp, #0x4c]
    mov r2, r8
    add r0, r0, r1, asr #0x10
    str r0, [sp, #0x4c]
    ldr r1, [sp, #0x4]
    mov r0, sl
    mov r3, #0xa
    bl func_ov002_021b3414
    cmp r0, #0x0
    bne .L_1648
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x54]
    add r7, r7, r0
    ldr r0, [sp, #0x4c]
    add r0, r1, r0
    str r0, [sp, #0x54]
    mov r0, #0x0
    str r0, [sp, #0x4c]
    str r0, [sp, #0x50]
.L_1648:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_1548
    ldr r1, _LIT33
    ldr r0, [sp, #0x1c]
    add r1, r1, r0
    ldr r0, [sp, #0x18]
    ldrh r0, [r0, r1]
    str r0, [sp, #0x14]
    cmp r0, #0x0
    beq .L_30b8
.L_1674:
    ldr r0, [sp, #0x14]
    ldr r3, _LIT34
    mov r0, r0, lsl #0x3
    ldrh r2, [r3, r0]
    ldr r0, [sp, #0x14]
    add r0, r3, r0, lsl #0x3
    str r0, [sp, #0x3c]
    ldrh r1, [r0, #0x2]
    ldrh r0, [r0, #0x4]
    and fp, r2, #0xff
    str r0, [sp, #0x28]
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1c
    str r0, [sp, #0x38]
    cmp r0, #0xd
    mov r0, r2, asr #0x8
    and r0, r0, #0xff
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x3c]
    ldrh r0, [r0, #0x6]
    str r0, [sp, #0x14]
    bhi .L_30ac
    ldr r0, [sp, #0x38]
    add pc, pc, r0, lsl #0x2
    nop
    b .L_30ac
    b .L_1710
    b .L_1710
    b .L_1710
    b .L_1710
    b .L_2370
    b .L_238c
    b .L_238c
    b .L_238c
    b .L_238c
    b .L_26f0
    b .L_26f0
    b .L_3050
    b .L_2eb4
.L_1710:
    ldr r1, _LIT35
    cmp r2, r1
    bgt .L_1b08
    bge .L_1eec
    ldr r0, _LIT36
    cmp r2, r0
    bgt .L_1928
    bge .L_1f0c
    sub r3, r1, #0x360
    cmp r2, r3
    bgt .L_1820
    mov r0, r3
    cmp r2, r0
    bge .L_1f3c
    sub r0, r1, #0x3e4
    cmp r2, r0
    bgt .L_17b0
    bge .L_1eec
    ldr r1, _LIT37
    cmp r2, r1
    bgt .L_178c
    bge .L_2080
    sub r0, r1, #0xbd
    cmp r2, r0
    bgt .L_177c
    beq .L_1f64
    b .L_30ac
.L_177c:
    sub r0, r1, #0x1a
    cmp r2, r0
    beq .L_1edc
    b .L_30ac
.L_178c:
    add r0, r1, #0x8d
    cmp r2, r0
    bgt .L_17a0
    beq .L_20c4
    b .L_30ac
.L_17a0:
    add r0, r1, #0xbe
    cmp r2, r0
    beq .L_1eec
    b .L_30ac
.L_17b0:
    ldr r1, _LIT38
    cmp r2, r1
    bgt .L_17fc
    bge .L_1f1c
    sub r0, r1, #0x22
    cmp r2, r0
    bgt .L_17ec
    sub r0, r1, #0x23
    cmp r2, r0
    blt .L_30ac
    beq .L_1f4c
    sub r0, r1, #0x22
    cmp r2, r0
    beq .L_1fc8
    b .L_30ac
.L_17ec:
    sub r0, r1, #0x1
    cmp r2, r0
    beq .L_1ed4
    b .L_30ac
.L_17fc:
    add r0, r1, #0x37
    cmp r2, r0
    bgt .L_1810
    beq .L_1edc
    b .L_30ac
.L_1810:
    add r0, r1, #0x38
    cmp r2, r0
    beq .L_1f2c
    b .L_30ac
.L_1820:
    sub r1, r0, #0xb2
    cmp r2, r1
    bgt .L_18c0
    bge .L_1f14
    sub r1, r0, #0xe6
    cmp r2, r1
    bgt .L_186c
    sub r0, r0, #0xe6
    cmp r2, r0
    bge .L_1ed4
    ldr r0, _LIT39
    cmp r2, r0
    bgt .L_185c
    beq .L_2118
    b .L_30ac
.L_185c:
    add r0, r0, #0x5a
    cmp r2, r0
    beq .L_2134
    b .L_30ac
.L_186c:
    sub r1, r0, #0xd0
    cmp r2, r1
    bgt .L_1888
    sub r0, r0, #0xd0
    cmp r2, r0
    beq .L_2204
    b .L_30ac
.L_1888:
    sub r1, r0, #0xc9
    cmp r2, r1
    bgt .L_30ac
    sub r1, r0, #0xcd
    cmp r2, r1
    blt .L_30ac
    beq .L_2204
    sub r1, r0, #0xcb
    cmp r2, r1
    beq .L_2224
    sub r0, r0, #0xc9
    cmp r2, r0
    beq .L_2204
    b .L_30ac
.L_18c0:
    sub r1, r0, #0x38
    cmp r2, r1
    bgt .L_18fc
    bge .L_2174
    sub r1, r0, #0x8f
    cmp r2, r1
    bgt .L_18ec
    sub r0, r0, #0x8f
    cmp r2, r0
    beq .L_1f00
    b .L_30ac
.L_18ec:
    sub r0, r0, #0x74
    cmp r2, r0
    beq .L_2174
    b .L_30ac
.L_18fc:
    sub r1, r0, #0x37
    cmp r2, r1
    bgt .L_1918
    sub r0, r0, #0x37
    cmp r2, r0
    beq .L_1f00
    b .L_30ac
.L_1918:
    sub r0, r0, #0x3
    cmp r2, r0
    beq .L_1ed4
    b .L_30ac
.L_1928:
    add r3, r0, #0xaa
    cmp r2, r3
    bgt .L_1a20
    mov r1, r3
    cmp r2, r1
    bge .L_1f78
    add r1, r0, #0x41
    cmp r2, r1
    bgt .L_19b8
    bge .L_1fc8
    add r1, r0, #0x29
    cmp r2, r1
    bgt .L_198c
    bge .L_1f00
    add r1, r0, #0x5
    cmp r2, r1
    bgt .L_197c
    add r0, r0, #0x5
    cmp r2, r0
    beq .L_1ec0
    b .L_30ac
.L_197c:
    add r0, r0, #0x15
    cmp r2, r0
    beq .L_1ec0
    b .L_30ac
.L_198c:
    add r1, r0, #0x2a
    cmp r2, r1
    bgt .L_19a8
    add r0, r0, #0x2a
    cmp r2, r0
    beq .L_1ee4
    b .L_30ac
.L_19a8:
    add r0, r0, #0x3c
    cmp r2, r0
    beq .L_1fa0
    b .L_30ac
.L_19b8:
    add r1, r0, #0x8a
    cmp r2, r1
    bgt .L_19f4
    bge .L_1eec
    add r1, r0, #0x5a
    cmp r2, r1
    bgt .L_19e4
    add r0, r0, #0x5a
    cmp r2, r0
    beq .L_1fb4
    b .L_30ac
.L_19e4:
    add r0, r0, #0x6e
    cmp r2, r0
    beq .L_21a0
    b .L_30ac
.L_19f4:
    add r1, r0, #0x8b
    cmp r2, r1
    bgt .L_1a10
    add r0, r0, #0x8b
    cmp r2, r0
    beq .L_1eec
    b .L_30ac
.L_1a10:
    add r0, r0, #0xa3
    cmp r2, r0
    beq .L_1ec0
    b .L_30ac
.L_1a20:
    sub r3, r1, #0x98
    cmp r2, r3
    bgt .L_1aa0
    bge .L_21c0
    add r3, r0, #0xd0
    cmp r2, r3
    bgt .L_1a74
    mov r1, r3
    cmp r2, r1
    bge .L_1edc
    add r1, r0, #0xc0
    cmp r2, r1
    bgt .L_1a64
    add r0, r0, #0xc0
    cmp r2, r0
    beq .L_2234
    b .L_30ac
.L_1a64:
    add r0, r0, #0xcf
    cmp r2, r0
    subeq r6, r6, #0x190
    b .L_30ac
.L_1a74:
    add r3, r0, #0xfe
    cmp r2, r3
    bgt .L_1a90
    add r0, r0, #0xfe
    cmp r2, r0
    subeq r6, r6, #0x320
    b .L_30ac
.L_1a90:
    sub r0, r1, #0xea
    cmp r2, r0
    beq .L_1fe0
    b .L_30ac
.L_1aa0:
    add r3, r0, #0x1c8
    cmp r2, r3
    bgt .L_1adc
    add r0, r0, #0x1c8
    cmp r2, r0
    bge .L_1ed4
    sub r0, r1, #0x82
    cmp r2, r0
    bgt .L_1acc
    beq .L_1f14
    b .L_30ac
.L_1acc:
    sub r0, r1, #0x4c
    cmp r2, r0
    beq .L_1f14
    b .L_30ac
.L_1adc:
    add r3, r0, #0x1d0
    cmp r2, r3
    bgt .L_1af8
    add r0, r0, #0x1d0
    cmp r2, r0
    beq .L_1eec
    b .L_30ac
.L_1af8:
    sub r0, r1, #0x15
    cmp r2, r0
    beq .L_1ff4
    b .L_30ac
.L_1b08:
    ldr r0, _LIT40
    cmp r2, r0
    bgt .L_1ce0
    bge .L_1ed4
    sub r3, r0, #0xe5
    cmp r2, r3
    bgt .L_1c04
    bge .L_1ef4
    add r3, r1, #0xa7
    cmp r2, r3
    bgt .L_1b98
    bge .L_1ec0
    add r3, r1, #0x53
    cmp r2, r3
    bgt .L_1b74
    bge .L_1f4c
    add r3, r1, #0x34
    cmp r2, r3
    bgt .L_1b64
    mov r0, r3
    cmp r2, r0
    beq .L_1ec0
    b .L_30ac
.L_1b64:
    sub r0, r0, #0x1e0
    cmp r2, r0
    beq .L_1ec0
    b .L_30ac
.L_1b74:
    add r0, r1, #0x74
    cmp r2, r0
    bgt .L_1b88
    beq .L_1ed4
    b .L_30ac
.L_1b88:
    add r0, r1, #0x9b
    cmp r2, r0
    beq .L_1edc
    b .L_30ac
.L_1b98:
    add r3, r1, #0x11c
    cmp r2, r3
    bgt .L_1bd4
    mov r0, r3
    cmp r2, r0
    bge .L_22a0
    add r0, r1, #0xd3
    cmp r2, r0
    bgt .L_1bc4
    beq .L_1ff4
    b .L_30ac
.L_1bc4:
    ldr r0, _LIT41
    cmp r2, r0
    beq .L_2264
    b .L_30ac
.L_1bd4:
    sub r1, r0, #0xfb
    cmp r2, r1
    bgt .L_1bf4
    sub r0, r0, #0xfb
    cmp r2, r0
    moveq r0, #0x0
    streq r0, [r9, #0x18]
    b .L_30ac
.L_1bf4:
    sub r0, r0, #0xf2
    cmp r2, r0
    beq .L_1ec0
    b .L_30ac
.L_1c04:
    sub r1, r0, #0x4c
    cmp r2, r1
    bgt .L_1c78
    bge .L_1ed4
    sub r1, r0, #0x81
    cmp r2, r1
    bgt .L_1c50
    bge .L_1eec
    sub r1, r0, #0xc1
    cmp r2, r1
    bgt .L_1c40
    sub r0, r0, #0xc1
    cmp r2, r0
    beq .L_1eec
    b .L_30ac
.L_1c40:
    sub r0, r0, #0x95
    cmp r2, r0
    beq .L_2010
    b .L_30ac
.L_1c50:
    sub r1, r0, #0x79
    cmp r2, r1
    bgt .L_1c6c
    sub r0, r0, #0x79
    cmp r2, r0
    beq .L_1ec0
    b .L_30ac
.L_1c6c:
    cmp r2, #0x1840
    beq .L_202c
    b .L_30ac
.L_1c78:
    sub r1, r0, #0x2c
    cmp r2, r1
    bgt .L_1cb4
    bge .L_1ec0
    sub r1, r0, #0x4b
    cmp r2, r1
    bgt .L_1ca4
    sub r0, r0, #0x4b
    cmp r2, r0
    beq .L_1ff4
    b .L_30ac
.L_1ca4:
    sub r0, r0, #0x39
    cmp r2, r0
    beq .L_1ed4
    b .L_30ac
.L_1cb4:
    sub r1, r0, #0x1f
    cmp r2, r1
    bgt .L_1cd0
    sub r0, r0, #0x1f
    cmp r2, r0
    beq .L_1ed4
    b .L_30ac
.L_1cd0:
    sub r0, r0, #0x1e
    cmp r2, r0
    beq .L_2324
    b .L_30ac
.L_1ce0:
    add r8, r1, #0x324
    cmp r2, r8
    bgt .L_1ddc
    add r1, r1, #0x324
    cmp r2, r1
    bge .L_1f00
    add r1, r0, #0x93
    cmp r2, r1
    bgt .L_1d74
    bge .L_1ed4
    add r1, r0, #0x50
    cmp r2, r1
    bgt .L_1d44
    bge .L_2358
    add r1, r0, #0x1c
    cmp r2, r1
    bgt .L_1d34
    add r0, r0, #0x1c
    cmp r2, r0
    beq .L_1ec0
    b .L_30ac
.L_1d34:
    add r0, r0, #0x44
    cmp r2, r0
    beq .L_2348
    b .L_30ac
.L_1d44:
    add r1, r0, #0x60
    cmp r2, r1
    bgt .L_1d60
    add r0, r0, #0x60
    cmp r2, r0
    beq .L_203c
    b .L_30ac
.L_1d60:
    add r0, r0, #0x7f
    cmp r2, r0
    addeq r0, r6, #0x1dc
    addeq r6, r0, #0x400
    b .L_30ac
.L_1d74:
    add r1, r0, #0xe8
    cmp r2, r1
    bgt .L_1db0
    bge .L_1ec0
    add r1, r0, #0x97
    cmp r2, r1
    bgt .L_1da0
    add r0, r0, #0x97
    cmp r2, r0
    beq .L_1ec0
    b .L_30ac
.L_1da0:
    add r0, r0, #0xa4
    cmp r2, r0
    beq .L_1ed4
    b .L_30ac
.L_1db0:
    add r1, r0, #0xf7
    cmp r2, r1
    bgt .L_1dcc
    add r0, r0, #0xf7
    cmp r2, r0
    beq .L_1ec0
    b .L_30ac
.L_1dcc:
    add r0, r0, #0xfd
    cmp r2, r0
    beq .L_21e0
    b .L_30ac
.L_1ddc:
    ldr r0, _LIT42
    cmp r2, r0
    bgt .L_1e54
    bge .L_21e0
    sub r1, r0, #0x22
    cmp r2, r1
    bgt .L_1e28
    bge .L_1ed4
    sub r1, r0, #0x3a
    cmp r2, r1
    bgt .L_1e18
    sub r0, r0, #0x3a
    cmp r2, r0
    beq .L_1f78
    b .L_30ac
.L_1e18:
    sub r0, r0, #0x39
    cmp r2, r0
    beq .L_1f8c
    b .L_30ac
.L_1e28:
    sub r1, r0, #0x15
    cmp r2, r1
    bgt .L_1e44
    sub r0, r0, #0x15
    cmp r2, r0
    beq .L_1ecc
    b .L_30ac
.L_1e44:
    sub r0, r0, #0x14
    cmp r2, r0
    beq .L_1eec
    b .L_30ac
.L_1e54:
    add r1, r0, #0x30
    cmp r2, r1
    bgt .L_1e90
    bge .L_1eec
    add r1, r0, #0x1
    cmp r2, r1
    bgt .L_1e80
    add r0, r0, #0x1
    cmp r2, r0
    beq .L_1ecc
    b .L_30ac
.L_1e80:
    add r0, r0, #0x2f
    cmp r2, r0
    beq .L_1ee4
    b .L_30ac
.L_1e90:
    add r1, r0, #0x99
    cmp r2, r1
    bgt .L_1eb0
    bge .L_2054
    add r0, r0, #0x49
    cmp r2, r0
    beq .L_1ec0
    b .L_30ac
.L_1eb0:
    add r0, r0, #0xbe
    cmp r2, r0
    beq .L_1ed4
    b .L_30ac
.L_1ec0:
    ldr r0, [sp, #0x28]
    add r6, r6, r0
    b .L_30ac
.L_1ecc:
    add r6, r6, #0x190
    b .L_30ac
.L_1ed4:
    add r6, r6, #0x1f4
    b .L_30ac
.L_1edc:
    add r6, r6, #0x2bc
    b .L_30ac
.L_1ee4:
    add r6, r6, #0x320
    b .L_30ac
.L_1eec:
    add r6, r6, #0x3e8
    b .L_30ac
.L_1ef4:
    add r0, r6, #0x3b8
    add r6, r0, #0x800
    b .L_30ac
.L_1f00:
    ldr r0, [sp, #0x28]
    sub r6, r6, r0
    b .L_30ac
.L_1f0c:
    sub r6, r6, #0xc8
    b .L_30ac
.L_1f14:
    sub r6, r6, #0x1f4
    b .L_30ac
.L_1f1c:
    ldr r0, [sp, #0x58]
    add r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_30ac
.L_1f2c:
    ldr r0, [sp, #0x58]
    add r0, r0, #0x2bc
    str r0, [sp, #0x58]
    b .L_30ac
.L_1f3c:
    ldr r0, [sp, #0x58]
    sub r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_30ac
.L_1f4c:
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x58]
    add r6, r6, r0
    add r0, r1, r0
    str r0, [sp, #0x58]
    b .L_30ac
.L_1f64:
    ldr r0, [sp, #0x58]
    add r6, r6, #0x64
    add r0, r0, #0x64
    str r0, [sp, #0x58]
    b .L_30ac
.L_1f78:
    ldr r0, [sp, #0x58]
    add r6, r6, #0x12c
    add r0, r0, #0x12c
    str r0, [sp, #0x58]
    b .L_30ac
.L_1f8c:
    ldr r0, [sp, #0x58]
    add r6, r6, #0x1f4
    add r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_30ac
.L_1fa0:
    ldr r0, [sp, #0x58]
    add r6, r6, #0x2bc
    add r0, r0, #0x2bc
    str r0, [sp, #0x58]
    b .L_30ac
.L_1fb4:
    ldr r0, [sp, #0x58]
    add r6, r6, #0x3e8
    add r0, r0, #0x3e8
    str r0, [sp, #0x58]
    b .L_30ac
.L_1fc8:
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x58]
    sub r6, r6, r0
    sub r0, r1, r0
    str r0, [sp, #0x58]
    b .L_30ac
.L_1fe0:
    ldr r0, [sp, #0x58]
    sub r6, r6, #0x1f4
    sub r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_30ac
.L_1ff4:
    ldr r0, [sp, #0x28]
    mov r5, #0x0
    str r0, [r9, #0x18]
    mov r0, r5
    str r5, [sp, #0x54]
    str r0, [sp, #0x58]
    b .L_30ac
.L_2010:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_30ac
    ldr r0, _LIT43
    mov r6, #0x0
    str r0, [r9, #0x14]
    b .L_30ac
.L_202c:
    ldr r0, _LIT44
    mov r6, #0x0
    str r0, [r9, #0x14]
    b .L_30ac
.L_203c:
    mov r7, #0x0
    mov r0, #0x7d0
    mov r4, r7
    str r0, [r9, #0x14]
    mov r6, r7
    b .L_30ac
.L_2054:
    ldr r0, [sp, #0x28]
    mov r6, #0x0
    str r0, [r9, #0x14]
    ldr r0, [sp, #0x3c]
    ldrh r0, [r0, #0x6]
    add r1, r3, r0, lsl #0x3
    ldrh r0, [r1, #0x4]
    str r0, [r9, #0x18]
    ldrh r0, [r1, #0x6]
    str r0, [sp, #0x14]
    b .L_30ac
.L_2080:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_30ac
    ldr r1, [r9, #0x18]
    ldr r0, [sp, #0x58]
    add r0, r1, r0
    add r1, r5, r0
    ldr r0, [sp, #0x54]
    mov r5, #0x0
    add r0, r0, r1
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r9, #0x18]
    mov r0, r5
    str r5, [sp, #0x54]
    str r0, [sp, #0x58]
    b .L_30ac
.L_20c4:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_30ac
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldr r0, [r9, #0x14]
    add r0, r0, r6
    beq .L_20f4
    add r0, r4, r0
    add r0, r7, r0
    mov r0, r0, lsl #0x1
    b .L_2104
.L_20f4:
    add r0, r4, r0
    add r0, r7, r0
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
.L_2104:
    mov r7, #0x0
    str r0, [r9, #0x14]
    mov r4, r7
    mov r6, r7
    b .L_30ac
.L_2118:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_30ac
    ldr r0, [r9, #0x1c]
    mov r0, r0, lsl #0x1
    str r0, [r9, #0x14]
    b .L_30ac
.L_2134:
    ldr r0, [sp, #0x28]
    tst r0, #0x1
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    mov r0, #0xa
    mul r2, r1, r0
    addne r6, r6, r2
    bne .L_30ac
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_30ac
    mov r7, #0x0
    mov r4, r7
    str r2, [r9, #0x14]
    mov r6, r7
    b .L_30ac
.L_2174:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_30ac
    ldr r0, [sp, #0x28]
    mov r1, #0xa
    mul r1, r0, r1
    mov r7, #0x0
    mov r4, r7
    str r1, [r9, #0x14]
    mov r6, r7
    b .L_30ac
.L_21a0:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_30ac
    ldr r0, [r9, #0x1c]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r9, #0x14]
    b .L_30ac
.L_21c0:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_30ac
    ldr r0, [r9, #0x1c]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r9, #0x14]
    b .L_30ac
.L_21e0:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_30ac
    ldr r0, [sp, #0x28]
    mov r7, #0x0
    mov r4, r7
    str r0, [r9, #0x14]
    mov r6, r7
    b .L_30ac
.L_2204:
    ldr r0, [sp, #0x38]
    cmp r0, #0x3
    bne .L_30ac
    ldr r0, [sp, #0x58]
    sub r6, r6, #0x1f4
    sub r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_30ac
.L_2224:
    ldr r0, [sp, #0x38]
    cmp r0, #0x3
    addeq r6, r6, #0x3e8
    b .L_30ac
.L_2234:
    ldr r0, [sp, #0x28]
    cmp r0, #0x1
    beq .L_224c
    cmp r0, #0x2
    beq .L_2254
    b .L_30ac
.L_224c:
    add r6, r6, #0xc8
    b .L_30ac
.L_2254:
    ldr r0, [sp, #0x58]
    add r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_30ac
.L_2264:
    ldr r0, [sp, #0x48]
    mov r1, #0x3e8
    cmp r0, #0x0
    ldr r0, [sp, #0x48]
    rsbne r1, r1, #0x0
    cmp r0, #0x0
    ldr r0, [r9, #0x14]
    add r0, r0, r1
    str r0, [r9, #0x14]
    mov r1, #0x3e8
    ldr r0, [r9, #0x18]
    rsbne r1, r1, #0x0
    add r0, r0, r1
    str r0, [r9, #0x18]
    b .L_30ac
.L_22a0:
    ldr r0, [sp, #0x48]
    cmp r0, #0x0
    rsbne r1, r1, #0xec0
    ldr r0, [sp, #0x48]
    moveq r1, #0x7d0
    cmp r0, #0x0
    ldr r0, [r9, #0x14]
    add r0, r0, r1
    str r0, [r9, #0x14]
    mov r1, #0x7d0
    ldr r0, [r9, #0x18]
    rsbne r1, r1, #0x0
    add r0, r0, r1
    str r0, [r9, #0x18]
    b .L_30ac
_LIT28: .word func_0202f578
_LIT29: .word 0x00001782
_LIT30: .word 0x000019ed
_LIT31: .word 0x00001aaa
_LIT32: .word 0x00001b2a
_LIT33: .word data_ov002_022cf0c6
_LIT34: .word data_ov002_022d0570
_LIT35: .word 0x00001690
_LIT36: .word 0x0000147d
_LIT37: .word 0x000010c6
_LIT38: .word 0x000012f2
_LIT39: .word 0x00001337
_LIT40: .word 0x000018ae
_LIT41: .word 0x000017ab
_LIT42: .word 0x00001a31
_LIT43: .word 0x00000bb8
_LIT44: .word 0x00000a8c
_LIT45: .word data_ov002_022d008c
.L_2324:
    ldr r0, [sp, #0x28]
    cmp r0, #0x1
    beq .L_30ac
    ldr r0, _LIT45
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x3
    ldreq r0, [sp, #0x28]
    addeq r6, r6, r0
    b .L_30ac
.L_2348:
    ldr r0, [sp, #0x28]
    mov r0, r0, lsl #0x10
    add r6, r6, r0, asr #0x10
    b .L_30ac
.L_2358:
    ldr r0, [r9, #0x24]
    and r0, r0, #0x1
    cmp r0, #0x0
    ldrle r0, [r9, #0x1c]
    addle r6, r6, r0
    b .L_30ac
.L_2370:
    ldr r0, _LIT46
    cmp r2, r0
    bne .L_30ac
    mov r0, #0x3e8
    str r0, [r9, #0x14]
    str r0, [r9, #0x18]
    b .L_30ac
.L_238c:
    ldr r0, [sp, #0x34]
    mov r1, #0x14
    mul r1, r0, r1
    str r1, [sp, #0x60]
    ldr r0, _LIT47
    ldr r1, _LIT48
    and r2, fp, #0x1
    mla r8, r2, r0, r1
    add r1, r8, #0x30
    ldr r0, [sp, #0x60]
    str r1, [sp, #0x64]
    ldr r0, [r1, r0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_30ac
    ldr r0, [sp, #0x60]
    add r0, r8, r0
    ldr r0, [r0, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_30ac
    ldr r1, [sp, #0x34]
    mov r0, fp
    bl func_ov002_021b9dec
    ldr r1, _LIT49
    cmp r0, r1
    bgt .L_2440
    bge .L_2564
    ldr r1, _LIT50
    cmp r0, r1
    bgt .L_241c
    bge .L_24ac
    ldr r1, _LIT51
    cmp r0, r1
    beq .L_248c
    b .L_26a8
.L_241c:
    ldr r1, _LIT52
    cmp r0, r1
    bgt .L_2430
    beq .L_24c0
    b .L_26a8
.L_2430:
    add r2, r1, #0x364
    cmp r0, r2
    beq .L_24e4
    b .L_26a8
.L_2440:
    add r2, r1, #0x3c
    cmp r0, r2
    bgt .L_2460
    bge .L_25d4
    add r1, r1, #0x34
    cmp r0, r1
    beq .L_25a0
    b .L_26a8
.L_2460:
    add r2, r1, #0xc4
    cmp r0, r2
    bgt .L_247c
    add r1, r1, #0xc4
    cmp r0, r1
    beq .L_25f8
    b .L_26a8
.L_247c:
    ldr r1, _LIT53
    cmp r0, r1
    beq .L_2670
    b .L_26a8
.L_248c:
    ldr r0, [r9, #0x4]
    cmp r0, #0x2
    bne .L_26a8
    ldr r0, [sp, #0x54]
    add r7, r7, #0xc8
    add r0, r0, #0xc8
    str r0, [sp, #0x54]
    b .L_26a8
.L_24ac:
    ldr r0, [r9, #0x28]
    and r0, r0, #0x2
    cmp r0, #0x0
    suble r7, r7, #0x2bc
    b .L_26a8
.L_24c0:
    ldr r0, [r9, #0x28]
    and r0, r0, #0x2
    cmp r0, #0x0
    bgt .L_26a8
    mov r7, #0x0
    str r7, [r9, #0x14]
    mov r4, r7
    mov r6, r7
    b .L_26a8
.L_24e4:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_26a8
    ldr r0, [r9, #0x24]
    and r0, r0, #0x1
    cmp r0, #0x0
    bgt .L_26a8
    ldr r0, [sp, #0x3c]
    add r3, r1, #0x364
    ldrh r2, [r0, #0x6]
    ldr r0, _LIT34
    mov r8, r2, lsl #0x3
    add r2, r0, r2, lsl #0x3
    ldrh r8, [r0, r8]
    ldrh fp, [r2, #0x6]
    cmp r8, r3
    add r3, r0, fp, lsl #0x3
    addeq r0, r1, #0x364
    ldreqh r1, [r3]
    cmpeq r1, r0
    bne .L_26a8
    ldrh r0, [r2, #0x4]
    mov r7, #0x0
    mov r4, r7
    str r0, [r9, #0x14]
    ldrh r0, [r3, #0x4]
    mov r6, r7
    str r7, [sp, #0x54]
    str r0, [r9, #0x18]
    mov r5, r7
    str r7, [sp, #0x58]
    b .L_26a8
.L_2564:
    cmp sl, fp
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x28]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_26a8
    ldr r1, [sp, #0x34]
    mov r0, fp
    bl func_ov002_021b9af4
    mov r1, #0x1f4
    mul r1, r0, r1
    sub r7, r7, r1
    b .L_26a8
.L_25a0:
    cmp sl, fp
    bne .L_26a8
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x24]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_26a8
    ldr r0, _LIT43
    mov r6, #0x0
    str r0, [r9, #0x14]
    b .L_26a8
.L_25d4:
    cmp sl, fp
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x28]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    addle r7, r7, #0x1f4
    b .L_26a8
.L_25f8:
    ldr r0, [r9, #0x24]
    and r0, r0, #0x1
    cmp r0, #0x0
    bgt .L_26a8
    mov r1, #0x0
    mov r2, #0x1
    mov r0, r1
    add r3, r8, #0x30
    mov ip, r1
.L_261c:
    ldr fp, [r3]
    mov fp, fp, lsl #0x13
    movs fp, fp, lsr #0x13
    beq .L_263c
    ldrh fp, [r8, #0x36]
    add r1, r1, #0x1
    cmp fp, #0x0
    moveq r2, ip
.L_263c:
    add r3, r3, #0x14
    add r8, r8, #0x14
    add r0, r0, #0x1
    cmp r0, #0x4
    ble .L_261c
    cmp r1, #0x2
    blt .L_26a8
    cmp r2, #0x0
    beq .L_26a8
    ldr r0, [sp, #0x54]
    add r0, r0, #0x2bc
    str r0, [sp, #0x54]
    b .L_26a8
.L_2670:
    cmp sl, fp
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x24]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_26a8
    ldr r0, [sp, #0x3c]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1c
    ldrne r0, [sp, #0x28]
    addne r7, r7, r0
.L_26a8:
    ldr r1, [sp, #0x64]
    ldr r0, [sp, #0x60]
    ldr r0, [r1, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b86c
    cmp r0, #0x2
    bne .L_30ac
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x54]
    add r7, r7, r0
    ldr r0, [sp, #0x4c]
    add r0, r1, r0
    str r0, [sp, #0x54]
    mov r0, #0x0
    str r0, [sp, #0x4c]
    str r0, [sp, #0x50]
    b .L_30ac
.L_26f0:
    ldr r0, [sp, #0x34]
    mov r1, #0x14
    mul r1, r0, r1
    str r1, [sp, #0x68]
    ldr r2, _LIT48
    ldr r0, _LIT47
    and r1, fp, #0x1
    mla r0, r1, r0, r2
    add r1, r0, #0x30
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x68]
    str r1, [sp, #0x6c]
    ldr r0, [r1, r0]
    mov r0, r0, lsl #0x13
    movs r8, r0, lsr #0x13
    beq .L_2e74
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x68]
    add r0, r1, r0
    str r0, [sp, #0x20]
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_2e74
    ldr r0, [sp, #0x20]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_2e74
    mov r0, r8
    bl func_0202b824
    cmp r0, #0x17
    bne .L_2794
    cmp sl, fp
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x28]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_30ac
    b .L_27b4
.L_2794:
    cmp sl, fp
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x24]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_30ac
.L_27b4:
    ldr r0, _LIT54
    cmp r8, r0
    bgt .L_2a18
    bge .L_2e08
    ldr r0, _LIT55
    cmp r8, r0
    bgt .L_2930
    bge .L_2d40
    sub r1, r0, #0xd8
    cmp r8, r1
    bgt .L_28bc
    bge .L_2c08
    sub r1, r0, #0xe6
    cmp r8, r1
    bgt .L_2890
    bge .L_2c08
    sub r0, r0, #0x22c
    cmp r8, r0
    bgt .L_2880
    ldr r0, _LIT56
    subs r0, r8, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_2e74
    b .L_2c38
    b .L_2c6c
    b .L_2c38
    b .L_2c18
    b .L_2c38
    b .L_2c08
    b .L_2c6c
    b .L_2c38
    b .L_2c6c
    b .L_2c38
    b .L_2c00
    b .L_2c38
    b .L_2c30
    b .L_2c44
    b .L_2c38
    b .L_2c38
    b .L_2c00
    b .L_2e74
    b .L_2c38
    b .L_2e74
    b .L_2c08
    b .L_2c38
    b .L_2c38
    b .L_2c6c
    b .L_2c38
    b .L_2c38
    b .L_2c38
    b .L_2c38
.L_2880:
    ldr r0, _LIT57
    cmp r8, r0
    beq .L_2c00
    b .L_2e74
.L_2890:
    sub r1, r0, #0xe3
    cmp r8, r1
    bgt .L_28ac
    sub r0, r0, #0xe3
    cmp r8, r0
    beq .L_2c84
    b .L_2e74
.L_28ac:
    sub r0, r0, #0xe2
    cmp r8, r0
    beq .L_2c38
    b .L_2e74
.L_28bc:
    sub r1, r0, #0x2b
    cmp r8, r1
    bgt .L_28f8
    bge .L_2c6c
    sub r1, r0, #0x54
    cmp r8, r1
    bgt .L_28e8
    sub r0, r0, #0x54
    cmp r8, r0
    beq .L_2ce8
    b .L_2e74
.L_28e8:
    sub r0, r0, #0x2c
    cmp r8, r0
    beq .L_2c6c
    b .L_2e74
.L_28f8:
    sub r1, r0, #0xd
    cmp r8, r1
    bgt .L_291c
    bge .L_2d18
    sub r0, r0, #0x11
    cmp r8, r0
    addeq r4, r4, #0x1f4
    addeq r5, r5, #0x1f4
    b .L_2e74
.L_291c:
    sub r0, r0, #0x2
    cmp r8, r0
    subeq r4, r4, #0x1f4
    subeq r5, r5, #0x1f4
    b .L_2e74
.L_2930:
    ldr r0, _LIT58
    cmp r8, r0
    bgt .L_29ac
    bge .L_2d94
    sub r1, r0, #0x69
    cmp r8, r1
    bgt .L_297c
    bge .L_2c78
    sub r1, r0, #0xcb
    cmp r8, r1
    bgt .L_296c
    sub r0, r0, #0xcb
    cmp r8, r0
    beq .L_2c08
    b .L_2e74
.L_296c:
    sub r0, r0, #0x7a
    cmp r8, r0
    beq .L_2c64
    b .L_2e74
.L_297c:
    sub r1, r0, #0x21
    cmp r8, r1
    bgt .L_299c
    bge .L_2c20
    sub r0, r0, #0x67
    cmp r8, r0
    beq .L_2c10
    b .L_2e74
.L_299c:
    sub r0, r0, #0x1
    cmp r8, r0
    beq .L_2d60
    b .L_2e74
.L_29ac:
    add r1, r0, #0x42
    cmp r8, r1
    bgt .L_29e8
    bge .L_2db8
    add r1, r0, #0xa
    cmp r8, r1
    bgt .L_29d8
    add r0, r0, #0xa
    cmp r8, r0
    beq .L_2c08
    b .L_2e74
.L_29d8:
    add r0, r0, #0x39
    cmp r8, r0
    beq .L_2bf8
    b .L_2e74
.L_29e8:
    add r1, r0, #0xaf
    cmp r8, r1
    bgt .L_2a08
    bge .L_2c10
    add r0, r0, #0x90
    cmp r8, r0
    beq .L_2c00
    b .L_2e74
.L_2a08:
    add r0, r0, #0xb7
    cmp r8, r0
    beq .L_2c00
    b .L_2e74
.L_2a18:
    add r1, r0, #0x1f0
    cmp r8, r1
    bgt .L_2b10
    bge .L_2ddc
    add r1, r0, #0xac
    cmp r8, r1
    bgt .L_2aa4
    bge .L_2bf8
    add r1, r0, #0x1f
    cmp r8, r1
    bgt .L_2a74
    bge .L_2e30
    add r1, r0, #0x3
    cmp r8, r1
    bgt .L_2a64
    add r0, r0, #0x3
    cmp r8, r0
    beq .L_2e1c
    b .L_2e74
.L_2a64:
    add r0, r0, #0x1e
    cmp r8, r0
    beq .L_2e08
    b .L_2e74
.L_2a74:
    add r1, r0, #0x70
    cmp r8, r1
    bgt .L_2a94
    bge .L_2e58
    add r0, r0, #0x21
    cmp r8, r0
    beq .L_2e44
    b .L_2e74
.L_2a94:
    add r0, r0, #0x75
    cmp r8, r0
    addeq r4, r4, #0x190
    b .L_2e74
.L_2aa4:
    add r1, r0, #0xaf
    cmp r8, r1
    bgt .L_2ae0
    bge .L_2c00
    add r1, r0, #0xad
    cmp r8, r1
    bgt .L_2ad0
    add r0, r0, #0xad
    cmp r8, r0
    subeq r4, r4, #0x3e8
    b .L_2e74
.L_2ad0:
    add r0, r0, #0xae
    cmp r8, r0
    beq .L_2c00
    b .L_2e74
.L_2ae0:
    add r1, r0, #0xb1
    cmp r8, r1
    bgt .L_2b00
    bge .L_2c64
    add r0, r0, #0xb0
    cmp r8, r0
    addeq r5, r5, #0x1f4
    b .L_2e74
.L_2b00:
    add r0, r0, #0x11c
    cmp r8, r0
    beq .L_2c08
    b .L_2e74
.L_2b10:
    ldr r0, _LIT59
    cmp r8, r0
    bgt .L_2b8c
    bge .L_2e08
    ldr r2, _LIT60
    cmp r8, r2
    bgt .L_2b54
    bge .L_2e44
    sub r0, r2, #0x2b
    cmp r8, r0
    bgt .L_2b44
    beq .L_2c50
    b .L_2e74
.L_2b44:
    sub r0, r2, #0x2a
    cmp r8, r0
    beq .L_2c50
    b .L_2e74
.L_2b54:
    add r1, r2, #0xf2
    cmp r8, r1
    bgt .L_2b7c
    mov r0, r1
    cmp r8, r0
    bge .L_2e64
    add r0, r2, #0x1d
    cmp r8, r0
    subeq r4, r4, #0x12c
    b .L_2e74
.L_2b7c:
    sub r0, r0, #0x11
    cmp r8, r0
    beq .L_2bf8
    b .L_2e74
.L_2b8c:
    add r1, r0, #0x65
    cmp r8, r1
    bgt .L_2bc8
    bge .L_2c00
    add r1, r0, #0xe
    cmp r8, r1
    bgt .L_2bb8
    add r0, r0, #0xe
    cmp r8, r0
    beq .L_2df0
    b .L_2e74
.L_2bb8:
    add r0, r0, #0x3e
    cmp r8, r0
    beq .L_2c10
    b .L_2e74
.L_2bc8:
    ldr r0, _LIT61
    cmp r8, r0
    bgt .L_2be8
    bge .L_2c00
    sub r0, r0, #0x91
    cmp r8, r0
    beq .L_2c10
    b .L_2e74
.L_2be8:
    add r0, r0, #0x51
    cmp r8, r0
    addeq r4, r4, #0x258
    b .L_2e74
.L_2bf8:
    add r4, r4, #0x12c
    b .L_2e74
.L_2c00:
    add r4, r4, #0x1f4
    b .L_2e74
.L_2c08:
    add r4, r4, #0x2bc
    b .L_2e74
.L_2c10:
    add r4, r4, #0x320
    b .L_2e74
.L_2c18:
    add r4, r4, #0x3e8
    b .L_2e74
.L_2c20:
    ldr r0, [sp, #0x20]
    ldr r0, [r0, #0x3c]
    add r4, r4, r0
    b .L_2e74
.L_2c30:
    add r5, r5, #0x320
    b .L_2e74
.L_2c38:
    add r4, r4, #0x12c
    add r5, r5, #0x12c
    b .L_2e74
.L_2c44:
    add r4, r4, #0x2bc
    add r5, r5, #0x2bc
    b .L_2e74
.L_2c50:
    add r0, r4, #0x1dc
    add r4, r0, #0x400
    add r0, r5, #0x1dc
    add r5, r0, #0x400
    b .L_2e74
.L_2c64:
    sub r4, r4, #0x1f4
    b .L_2e74
.L_2c6c:
    add r4, r4, #0x190
    sub r5, r5, #0xc8
    b .L_2e74
.L_2c78:
    add r4, r4, #0x3e8
    sub r5, r5, #0x3e8
    b .L_2e74
.L_2c84:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_2e74
    rsb r0, fp, #0x1
    and r8, r0, #0x1
    ldr r0, [sp, #0x24]
    ldr r2, _LIT47
    ldr r3, [r0]
    mul r0, r8, r2
    ldr r1, _LIT48
    ldr r2, [r1, r0]
    cmp r3, r2
    ldrlt r2, [r9, #0x1c]
    movlt r2, r2, lsl #0x1
    strlt r2, [r9, #0x14]
    ldr r1, [r1, r0]
    ldr r0, [sp, #0x24]
    ldr r0, [r0]
    cmp r0, r1
    ble .L_2e74
    ldr r0, [r9, #0x1c]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r9, #0x14]
    b .L_2e74
.L_2ce8:
    ldr r0, [r9, #0x4]
    cmp r0, #0x7
    bne .L_2e74
    ldr r0, [sp, #0x20]
    ldr r0, [r0, #0x3c]
    cmp r0, #0x1
    beq .L_2d10
    cmp r0, #0x2
    addeq r5, r5, #0x2bc
    b .L_2e74
.L_2d10:
    add r4, r4, #0x2bc
    b .L_2e74
.L_2d18:
    ldr r0, [r9, #0x4]
    cmp r0, #0x7
    beq .L_2e74
    ldr r1, [sp, #0x34]
    mov r0, fp
    bl func_ov002_021b9af4
    mov r1, #0x12c
    mul r1, r0, r1
    sub r4, r4, r1
    b .L_2e74
.L_2d40:
    ldr r1, [sp, #0x34]
    mov r0, fp
    bl func_ov002_021b9af4
    mov r1, #0xc8
    mul r1, r0, r1
    rsb r0, r1, #0x2bc
    add r4, r4, r0
    b .L_2e74
.L_2d60:
    mov r0, fp
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021bbff4
    mov r1, #0x320
    mla r4, r0, r1, r4
    mov r0, fp
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021bbff4
    mov r1, #0x320
    mla r5, r0, r1, r5
    b .L_2e74
.L_2d94:
    mov r0, fp
    bl func_ov002_021bce20
    mov r1, #0x1f4
    mla r4, r0, r1, r4
    mov r0, fp
    bl func_ov002_021bce20
    mov r1, #0x1f4
    mla r5, r0, r1, r5
    b .L_2e74
.L_2db8:
    ldr r0, [sp, #0x20]
    ldr r1, [sp, #0x4]
    ldrh r2, [r0, #0x34]
    mov r0, sl
    bl func_ov002_021c8870
    cmp r0, #0xf
    addeq r4, r4, #0x1f4
    addeq r5, r5, #0x1f4
    b .L_2e74
.L_2ddc:
    ldr r0, [sp, #0x20]
    ldr r1, [r0, #0x3c]
    mov r0, #0x3e8
    mla r4, r1, r0, r4
    b .L_2e74
.L_2df0:
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021bd514
    mov r1, #0x320
    mla r4, r0, r1, r4
    b .L_2e74
.L_2e08:
    ldr r0, [sp, #0x38]
    cmp r0, #0xb
    addeq r4, r4, #0x190
    addeq r5, r5, #0x190
    b .L_2e74
.L_2e1c:
    ldr r0, [sp, #0x38]
    cmp r0, #0xb
    addeq r4, r4, #0x258
    addeq r5, r5, #0x258
    b .L_2e74
.L_2e30:
    ldr r0, [sp, #0x38]
    cmp r0, #0xb
    addeq r4, r4, #0x384
    addeq r5, r5, #0x384
    b .L_2e74
.L_2e44:
    ldr r0, [sp, #0x38]
    cmp r0, #0xb
    addeq r4, r4, #0x1f4
    addeq r5, r5, #0x1f4
    b .L_2e74
.L_2e58:
    add r0, r4, #0x3b8
    add r4, r0, #0x800
    b .L_2e74
.L_2e64:
    ldr r0, [sp, #0x38]
    cmp r0, #0xb
    addeq r0, r4, #0x1c4
    addeq r4, r0, #0x800
.L_2e74:
    ldr r0, [r9]
    ldr r2, _LIT62
    cmp r0, r2
    bne .L_30ac
    ldr r1, [sp, #0x6c]
    ldr r0, [sp, #0x68]
    ldr r1, [r1, r0]
    sub r0, r2, #0xce
    mov r1, r1, lsl #0x13
    cmp r0, r1, lsr #0x13
    bne .L_30ac
    mov r0, #0x0
    str r0, [r9, #0x14]
    mov r0, #0x7d0
    str r0, [r9, #0x18]
    b .L_30ac
.L_2eb4:
    ldr r1, [r9]
    ldr r0, _LIT63
    cmp r1, r0
    bgt .L_2eec
    bge .L_301c
    ldr r2, _LIT64
    cmp r1, r2
    bgt .L_30ac
    sub r0, r2, #0x3
    cmp r1, r0
    blt .L_30ac
    cmpne r1, r2
    beq .L_2f1c
    b .L_30ac
.L_2eec:
    add r2, r0, #0x3
    cmp r1, r2
    bgt .L_30ac
    add r2, r0, #0x1
    cmp r1, r2
    blt .L_30ac
    addne r2, r0, #0x2
    cmpne r1, r2
    addne r0, r0, #0x3
    cmpne r1, r0
    beq .L_301c
    b .L_30ac
.L_2f1c:
    ldr r3, _LIT48
    ldr r2, _LIT47
    and r0, fp, #0x1
    mla r3, r0, r2, r3
    ldr r0, [sp, #0x34]
    mov r1, #0x14
    mla r1, r0, r1, r3
    ldrh r0, [r1, #0x38]
    cmp r0, #0x0
    beq .L_3004
    ldr r0, [r1, #0x30]
    ldr r1, _LIT65
    mov r0, r0, lsl #0x13
    cmp r1, r0, lsr #0x13
    mov r6, r0, lsr #0x13
    blt .L_2f74
    cmp r6, r1
    bge .L_2fac
    sub r0, r1, #0x1c4
    cmp r6, r0
    beq .L_2f98
    b .L_2fe8
.L_2f74:
    add r0, r1, #0xf9
    cmp r6, r0
    bgt .L_2f88
    beq .L_2fc0
    b .L_2fe8
.L_2f88:
    ldr r0, _LIT66
    cmp r6, r0
    beq .L_2fd4
    b .L_2fe8
.L_2f98:
    mov r0, #0x640
    str r0, [r9, #0x14]
    add r0, r0, #0xc8
    str r0, [r9, #0x18]
    b .L_3010
.L_2fac:
    mov r0, #0x0
    str r0, [r9, #0x14]
    add r0, r2, #0x350
    str r0, [r9, #0x18]
    b .L_3010
.L_2fc0:
    sub r0, r2, #0x160
    str r0, [r9, #0x14]
    mov r0, #0x1f4
    str r0, [r9, #0x18]
    b .L_3010
.L_2fd4:
    mov r0, #0x0
    str r0, [r9, #0x14]
    mov r0, #0x7d0
    str r0, [r9, #0x18]
    b .L_3010
.L_2fe8:
    mov r0, r6
    bl func_0202b89c
    str r0, [r9, #0x14]
    mov r0, r6
    bl func_0202b8cc
    str r0, [r9, #0x18]
    b .L_3010
.L_3004:
    mov r0, #0x0
    str r0, [r9, #0x14]
    str r0, [r9, #0x18]
.L_3010:
    mov r6, #0x0
    str r6, [sp, #0x58]
    b .L_30ac
.L_301c:
    ldr r0, _LIT47
    ldr r2, _LIT48
    and r3, fp, #0x1
    mla r2, r3, r0, r2
    ldr r0, [sp, #0x34]
    mov r1, #0x14
    mla r1, r0, r1, r2
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b89c
    add r4, r4, r0
    b .L_30ac
.L_3050:
    ldr r3, _LIT48
    ldr r0, _LIT47
    and r2, fp, #0x1
    mla r3, r2, r0, r3
    ldr r0, [sp, #0x34]
    mov r1, #0x14
    mla r1, r0, r1, r3
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_30ac
    ldr r0, [r1, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_30ac
    cmp sl, fp
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x24]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    addle r4, r4, #0xc8
.L_30ac:
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    bne .L_1674
.L_30b8:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_3220
    ldr r0, [sp, #0x48]
    ldr r1, [r9, #0x14]
    cmp r0, #0x0
    add r0, r6, r4
    beq .L_3100
    add r0, r7, r0
    sub r0, r1, r0
    str r0, [r9, #0x14]
    ldr r0, [sp, #0x58]
    ldr r2, [r9, #0x18]
    add r1, r0, r5
    ldr r0, [sp, #0x54]
    add r0, r0, r1
    sub r0, r2, r0
    b .L_3124
.L_3100:
    add r0, r7, r0
    add r0, r1, r0
    str r0, [r9, #0x14]
    ldr r0, [sp, #0x58]
    ldr r2, [r9, #0x18]
    add r1, r0, r5
    ldr r0, [sp, #0x54]
    add r0, r0, r1
    add r0, r2, r0
.L_3124:
    str r0, [r9, #0x18]
    ldr r0, _LIT67
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_3158
    ldr r0, [r9, #0x4]
    cmp r0, #0x4
    beq .L_3150
    ldr r0, [r9, #0xc]
    tst r0, #0x10
    beq .L_3158
.L_3150:
    mov r0, #0x0
    str r0, [r9, #0x14]
.L_3158:
    ldr r2, _LIT68
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_3188
    rsb r0, sl, #0x1
    bl func_ov002_021bbeb8
    cmp r0, #0x2
    ldreq r0, [r9, #0x14]
    moveq r0, r0, lsl #0x1
    streq r0, [r9, #0x14]
.L_3188:
    ldr r2, _LIT69
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021b306c
    cmp r0, #0x0
    mov r2, #0x0
    ble .L_31c0
.L_31a4:
    ldr r1, [r9, #0x14]
    add r2, r2, #0x1
    add r1, r1, #0x1
    mov r1, r1, asr #0x1
    str r1, [r9, #0x14]
    cmp r2, r0
    blt .L_31a4
.L_31c0:
    ldr r1, _LIT70
    rsb r0, sl, #0x1
    mvn r2, #0x0
    bl func_ov002_021bad9c
    mov r4, r0
    ldr r1, _LIT70
    ldr r2, [sp, #0x4]
    mov r0, sl
    bl func_ov002_021bad9c
    add r2, r4, r0
    cmp r2, #0x0
    mov r1, #0x0
    ble .L_3220
.L_31f4:
    ldr r0, [r9, #0x14]
    add r1, r1, #0x1
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r9, #0x14]
    ldr r0, [r9, #0x18]
    cmp r1, r2
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r9, #0x18]
    blt .L_31f4
.L_3220:
    ldr r0, [r9, #0x14]
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [r9, #0x14]
    ldr r0, [r9, #0x18]
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [r9, #0x18]
    add sp, sp, #0xb0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT46: .word 0x000013a6
_LIT47: .word 0x00000868
_LIT48: .word data_ov002_022cf08c
_LIT49: .word 0x0000180f
_LIT50: .word 0x00001243
_LIT51: .word 0x00000ff9
_LIT52: .word 0x000013f9
_LIT53: .word 0x00001a7c
_LIT54: .word 0x000015b0
_LIT55: .word 0x0000131a
_LIT56: .word 0x000010d3
_LIT57: .word 0x00001231
_LIT58: .word 0x0000145d
_LIT59: .word 0x0000194b
_LIT60: .word 0x00001825
_LIT61: .word 0x00001a69
_LIT62: .word 0x000010bc
_LIT63: .word 0x00001aae
_LIT64: .word 0x00001284
_LIT65: .word 0x00001636
_LIT66: .word 0x00001809
_LIT67: .word 0x00001951
_LIT68: .word 0x00001955
_LIT69: .word 0x00001381
_LIT70: .word 0x00001905
