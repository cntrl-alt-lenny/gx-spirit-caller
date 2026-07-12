; func_ov002_0227c588 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202f1c4
        .extern func_ov002_021ba5ec
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bb82c
        .extern func_ov002_021bb870
        .extern func_ov002_021bbc34
        .extern func_ov002_021bbe70
        .extern func_ov002_021bbf20
        .extern func_ov002_021bbff4
        .extern func_ov002_021bc08c
        .extern func_ov002_021bce38
        .extern func_ov002_021bd228
        .extern func_ov002_021bd284
        .extern func_ov002_021bd5e8
        .extern func_ov002_021c2544
        .extern func_ov002_021c2e44
        .extern func_ov002_021c3a04
        .extern func_ov002_02253600
        .extern func_ov002_02254fd0
        .extern func_ov002_02280870
        .extern func_ov002_02281810
        .extern func_ov002_02281884
        .global func_ov002_0227c588
        .arm
func_ov002_0227c588:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r3, _LIT0
    mov r5, r2
    mov r4, r0
    mov r6, r1
    cmp r5, r3
    bgt .L_94
    bge .L_104
    ldr r2, _LIT1
    cmp r5, r2
    bgt .L_70
    bge .L_104
    sub r1, r2, #0x3cc
    cmp r5, r1
    bgt .L_60
    sub r1, r2, #0x3d0
    subs r1, r5, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_10c
    b .L_ec
    b .L_ec
    b .L_ec
    b .L_ec
    b .L_ec
.L_60:
    ldr r0, _LIT2
    cmp r5, r0
    beq .L_104
    b .L_10c
.L_70:
    add r0, r2, #0x1
    cmp r5, r0
    bgt .L_84
    beq .L_104
    b .L_10c
.L_84:
    sub r0, r3, #0x39
    cmp r5, r0
    beq .L_104
    b .L_10c
.L_94:
    ldr r1, _LIT3
    cmp r5, r1
    bgt .L_c8
    bge .L_104
    add r0, r3, #0x4
    cmp r5, r0
    bgt .L_b8
    beq .L_104
    b .L_10c
.L_b8:
    sub r0, r1, #0x1
    cmp r5, r0
    beq .L_104
    b .L_10c
.L_c8:
    add r0, r1, #0x1a8
    cmp r5, r0
    bgt .L_dc
    beq .L_104
    b .L_10c
.L_dc:
    ldr r0, _LIT4
    cmp r5, r0
    beq .L_104
    b .L_10c
.L_ec:
    sub r1, r3, #0xe0
    bl func_ov002_02281810
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_104:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_10c:
    cmp r6, #0x0
    ble .L_398
    ldr r0, _LIT5
    cmp r5, r0
    bgt .L_20c
    sub r1, r0, #0x1
    cmp r5, r1
    blt .L_138
    cmpne r5, r0
    beq .L_2f4
    b .L_398
.L_138:
    sub r1, r0, #0xb9
    cmp r5, r1
    bgt .L_1a4
    bge .L_2f4
    sub r0, r0, #0x208
    cmp r5, r0
    bgt .L_180
    ldr r0, _LIT6
    cmp r5, r0
    blt .L_170
    addne r0, r0, #0x1
    cmpne r5, r0
    beq .L_2f4
    b .L_398
.L_170:
    sub r0, r0, #0x120
    cmp r5, r0
    beq .L_314
    b .L_398
.L_180:
    ldr r0, _LIT7
    cmp r5, r0
    bgt .L_194
    beq .L_2f4
    b .L_398
.L_194:
    add r0, r0, #0xe2
    cmp r5, r0
    beq .L_314
    b .L_398
.L_1a4:
    sub r1, r0, #0x15
    cmp r5, r1
    bgt .L_1e0
    bge .L_2f4
    sub r1, r0, #0x7e
    cmp r5, r1
    bgt .L_1d0
    sub r0, r0, #0x7e
    cmp r5, r0
    beq .L_2f4
    b .L_398
.L_1d0:
    sub r0, r0, #0x41
    cmp r5, r0
    beq .L_2f4
    b .L_398
.L_1e0:
    sub r1, r0, #0x13
    cmp r5, r1
    bgt .L_1fc
    sub r0, r0, #0x13
    cmp r5, r0
    beq .L_2f4
    b .L_398
.L_1fc:
    sub r0, r0, #0x3
    cmp r5, r0
    beq .L_2f4
    b .L_398
.L_20c:
    add r1, r0, #0x198
    cmp r5, r1
    bgt .L_284
    bge .L_36c
    add r1, r0, #0x23
    cmp r5, r1
    bgt .L_258
    bge .L_2f4
    add r1, r0, #0x18
    cmp r5, r1
    bgt .L_248
    add r0, r0, #0x18
    cmp r5, r0
    beq .L_2f4
    b .L_398
.L_248:
    add r0, r0, #0x1c
    cmp r5, r0
    beq .L_2f4
    b .L_398
.L_258:
    add r1, r0, #0x32
    cmp r5, r1
    bgt .L_274
    add r0, r0, #0x32
    cmp r5, r0
    beq .L_2fc
    b .L_398
.L_274:
    ldr r0, _LIT8
    cmp r5, r0
    beq .L_2f4
    b .L_398
.L_284:
    ldr r1, _LIT9
    cmp r5, r1
    bgt .L_2d0
    bge .L_2f4
    sub r0, r1, #0x58
    cmp r5, r0
    bgt .L_2a8
    beq .L_36c
    b .L_398
.L_2a8:
    sub r0, r1, #0x56
    cmp r5, r0
    bgt .L_398
    sub r0, r1, #0x57
    cmp r5, r0
    blt .L_398
    subne r0, r1, #0x56
    cmpne r5, r0
    beq .L_36c
    b .L_398
.L_2d0:
    ldr r0, _LIT10
    cmp r5, r0
    bgt .L_2e4
    beq .L_324
    b .L_398
.L_2e4:
    add r0, r0, #0x16c
    cmp r5, r0
    beq .L_33c
    b .L_398
.L_2f4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2fc:
    mov r0, r4
    bl func_ov002_02280870
    cmp r0, #0x0
    ble .L_398
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_314:
    cmp r6, #0x1
    bne .L_398
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_324:
    ldr r0, _LIT11
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x5
    bne .L_398
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_33c:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021ba5ec
    cmp r0, #0x0
    bne .L_398
    ldr r1, _LIT12
    mov r0, r4
    bl func_ov002_021bbc34
    cmp r0, #0x0
    beq .L_398
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_36c:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021ba5ec
    cmp r0, #0x0
    bne .L_398
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c3a04
    cmp r0, #0x1
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
.L_398:
    cmp r6, #0x1
    ble .L_b74
    ldr r2, _LIT13
    cmp r5, r2
    bgt .L_514
    bge .L_820
    sub r0, r2, #0x328
    cmp r5, r0
    bgt .L_468
    bge .L_75c
    sub r0, r2, #0x3f4
    cmp r5, r0
    bgt .L_410
    bge .L_794
    ldr r0, _LIT14
    cmp r5, r0
    bgt .L_3f0
    bge .L_70c
    sub r0, r0, #0x18
    cmp r5, r0
    beq .L_808
    b .L_b74
.L_3f0:
    cmp r5, #0xfe0
    bgt .L_400
    beq .L_680
    b .L_b74
.L_400:
    add r0, r0, #0x3e
    cmp r5, r0
    beq .L_778
    b .L_b74
.L_410:
    ldr r1, _LIT15
    cmp r5, r1
    bgt .L_430
    bge .L_7f0
    sub r0, r1, #0x79
    cmp r5, r0
    beq .L_794
    b .L_b74
.L_430:
    add r0, r1, #0xb
    cmp r5, r0
    bgt .L_458
    add r0, r1, #0xa
    cmp r5, r0
    blt .L_b74
    addne r0, r1, #0xb
    cmpne r5, r0
    beq .L_7f0
    b .L_b74
.L_458:
    add r0, r1, #0x23
    cmp r5, r0
    beq .L_7f0
    b .L_b74
.L_468:
    ldr r1, _LIT16
    cmp r5, r1
    bgt .L_4bc
    bge .L_7f0
    sub r0, r1, #0x93
    cmp r5, r0
    bgt .L_498
    bge .L_7f0
    sub r0, r1, #0x97
    cmp r5, r0
    beq .L_900
    b .L_b74
.L_498:
    sub r0, r1, #0x34
    cmp r5, r0
    bgt .L_4ac
    beq .L_6bc
    b .L_b74
.L_4ac:
    sub r0, r1, #0x31
    cmp r5, r0
    beq .L_794
    b .L_b74
.L_4bc:
    add r0, r1, #0x9a
    cmp r5, r0
    bgt .L_4f0
    bge .L_69c
    add r0, r1, #0x77
    cmp r5, r0
    bgt .L_4e0
    beq .L_91c
    b .L_b74
.L_4e0:
    add r0, r1, #0x87
    cmp r5, r0
    beq .L_7ac
    b .L_b74
.L_4f0:
    sub r0, r2, #0xd6
    cmp r5, r0
    bgt .L_504
    beq .L_9bc
    b .L_b74
.L_504:
    add r0, r1, #0x1ac
    cmp r5, r0
    beq .L_7ac
    b .L_b74
.L_514:
    ldr r1, _LIT17
    cmp r5, r1
    bgt .L_5bc
    bge .L_9d4
    sub r0, r1, #0x27c
    cmp r5, r0
    bgt .L_578
    bge .L_86c
    add r0, r2, #0x8b
    cmp r5, r0
    bgt .L_554
    bge .L_854
    sub r0, r1, #0x33c
    cmp r5, r0
    beq .L_83c
    b .L_b74
.L_554:
    add r0, r2, #0xac
    cmp r5, r0
    bgt .L_568
    beq .L_a30
    b .L_b74
.L_568:
    sub r0, r1, #0x28c
    cmp r5, r0
    beq .L_69c
    b .L_b74
.L_578:
    sub r0, r1, #0xfe
    cmp r5, r0
    bgt .L_598
    bge .L_7ac
    add r0, r2, #0x28c
    cmp r5, r0
    beq .L_7ac
    b .L_b74
.L_598:
    sub r0, r1, #0xba
    cmp r5, r0
    bgt .L_5ac
    beq .L_83c
    b .L_b74
.L_5ac:
    sub r0, r1, #0x6d
    cmp r5, r0
    beq .L_8cc
    b .L_b74
.L_5bc:
    ldr r2, _LIT18
    cmp r5, r2
    bgt .L_610
    bge .L_a80
    sub r0, r2, #0xb5
    cmp r5, r0
    bgt .L_5ec
    bge .L_888
    sub r0, r2, #0xb7
    cmp r5, r0
    beq .L_8e8
    b .L_b74
.L_5ec:
    sub r0, r2, #0x1e
    cmp r5, r0
    bgt .L_600
    beq .L_ab4
    b .L_b74
.L_600:
    sub r0, r2, #0x1d
    cmp r5, r0
    beq .L_a64
    b .L_b74
.L_610:
    ldr r1, _LIT19
    cmp r5, r1
    bgt .L_644
    bge .L_b28
    add r0, r2, #0x4
    cmp r5, r0
    bgt .L_634
    beq .L_a14
    b .L_b74
.L_634:
    sub r0, r1, #0x62
    cmp r5, r0
    beq .L_acc
    b .L_b74
.L_644:
    add r0, r1, #0x90
    cmp r5, r0
    bgt .L_658
    beq .L_b44
    b .L_b74
.L_658:
    add r0, r1, #0x92
    cmp r5, r0
    bgt .L_b74
    add r0, r1, #0x91
    cmp r5, r0
    blt .L_b74
    addne r0, r1, #0x92
    cmpne r5, r0
    beq .L_b44
    b .L_b74
.L_680:
    ldr r1, _LIT20
    mov r0, r4
    bl func_ov002_02281884
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_69c:
    rsb r0, r4, #0x1
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021bbff4
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_6bc:
    rsb r6, r4, #0x1
    mov r5, #0x0
    mov r0, r6
    sub r1, r2, #0x378
    sub r2, r5, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_704
    ldr r1, _LIT7
    mov r0, r6
    bl func_ov002_021c3a04
    mov r4, r0
    ldr r1, _LIT7
    mov r0, r6
    bl func_ov002_021c2e44
    add r0, r4, r0
    cmp r0, #0x0
    movgt r5, #0x1
.L_704:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_70c:
    rsb r6, r4, #0x1
    mov r5, #0x0
    ldr r1, _LIT21
    mov r0, r6
    sub r2, r5, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_754
    ldr r1, _LIT21
    mov r0, r6
    bl func_ov002_021c3a04
    mov r4, r0
    ldr r1, _LIT21
    mov r0, r6
    bl func_ov002_021c2e44
    add r0, r4, r0
    cmp r0, #0x0
    movgt r5, #0x1
.L_754:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_75c:
    mov r0, r4
    mov r1, #0x16
    bl func_ov002_021bd284
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_778:
    mov r0, r4
    mov r1, #0x17
    bl func_ov002_021bd284
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_794:
    rsb r0, r4, #0x1
    bl func_ov002_021bd228
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_7ac:
    ldr r0, _LIT22
    bl func_ov002_021bd5e8
    cmp r0, #0x0
    bne .L_7e8
    ldr r1, _LIT22
    mov r0, r4
    bl func_ov002_021c3a04
    mov r5, r0
    ldr r1, _LIT22
    mov r0, r4
    bl func_ov002_021c2e44
    add r0, r5, r0
    cmp r0, #0x0
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
.L_7e8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_7f0:
    ldr r0, _LIT23
    bl func_ov002_021baf88
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_808:
    mov r0, r4
    bl func_ov002_02280870
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_820:
    mov r0, r4
    sub r1, r2, #0xb
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_83c:
    rsb r0, r4, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_854:
    rsb r0, r4, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_86c:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021bbc34
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_888:
    rsb r5, r4, #0x1
    mov r4, #0x0
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021bc08c
    cmp r0, #0x0
    bne .L_8c4
    mov r2, #0x1
    mov r0, r5
    mov r3, r2
    mov r1, r4
    bl func_ov002_021bce38
    cmp r0, #0x0
    moveq r4, #0x1
.L_8c4:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_8cc:
    mov r0, r4
    sub r1, r1, #0x6d
    bl func_ov002_021c2e44
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_8e8:
    mov r0, r4
    bl func_ov002_021bbe70
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_900:
    mov r0, r4
    sub r1, r2, #0x50
    bl func_ov002_02281884
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_91c:
    rsb r5, r4, #0x1
    ldr r2, _LIT24
    ldr r0, _LIT25
    and r1, r5, #0x1
    mla r0, r1, r0, r2
    add r7, r0, #0x94
    mov r6, #0x5
.L_938:
    ldr r1, [r7]
    mov r0, r5
    mov r2, r1, lsl #0x13
    mov r1, r6
    mov r2, r2, lsr #0x13
    bl func_ov002_021c2544
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r6, r6, #0x1
    cmp r6, #0xa
    add r7, r7, #0x14
    blt .L_938
    ldr r2, _LIT24
    ldr r0, _LIT25
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r5, r0, #0x94
    mov r6, #0x5
.L_984:
    ldr r1, [r5]
    mov r0, r4
    mov r2, r1, lsl #0x13
    mov r1, r6
    mov r2, r2, lsr #0x13
    bl func_ov002_021c2544
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r6, r6, #0x1
    cmp r6, #0xa
    add r5, r5, #0x14
    blt .L_984
    b .L_b74
.L_9bc:
    mov r0, r4
    bl func_ov002_02254fd0
    cmp r0, #0x0
    beq .L_b74
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_9d4:
    mov r0, r4
    bl func_ov002_021bbc34
    cmp r0, #0x0
    beq .L_b74
    ldr r1, _LIT26
    mov r0, r4
    bl func_ov002_021c3a04
    cmp r0, #0x0
    bne .L_a0c
    ldr r1, _LIT27
    mov r0, r4
    bl func_ov002_021c3a04
    cmp r0, #0x0
    beq .L_b74
.L_a0c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a14:
    mov r0, r4
    add r1, r2, #0x5
    bl func_ov002_021c2e44
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a30:
    rsb r0, r4, #0x1
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021bbff4
    cmp r0, #0x2
    bge .L_a5c
    mov r0, r4
    bl func_ov002_02280870
    cmp r0, #0x0
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
.L_a5c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a64:
    ldr r1, _LIT28
    mov r0, r4
    bl func_ov002_021c2e44
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a80:
    sub r1, r2, #0x190
    mov r0, #0x0
    bl func_ov002_021bb870
    cmp r0, #0x0
    bne .L_aac
    ldr r1, _LIT29
    mov r0, #0x1
    bl func_ov002_021bb870
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_aac:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_ab4:
    mov r0, r4
    bl func_ov002_021bbe70
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_acc:
    mov r0, r4
    sub r1, r1, #0x128
    bl func_ov002_021c3a04
    cmp r0, #0x0
    bne .L_b20
    ldr r1, _LIT30
    mov r0, r4
    bl func_ov002_021bbc34
    cmp r0, #0x0
    bne .L_b20
    ldr r1, _LIT31
    mov r0, r4
    bl func_ov002_02281884
    cmp r0, #0x0
    bne .L_b20
    ldr r1, _LIT32
    mov r0, r4
    bl func_ov002_021bbc34
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_b20:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_b28:
    ldr r1, _LIT33
    mov r0, r4
    bl func_ov002_021bbf20
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_b44:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c3a04
    cmp r0, #0x1
    bgt .L_b74
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_02253600
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_b74:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00001725
_LIT1: .word 0x00001387
_LIT2: .word 0x00001386
_LIT3: .word 0x00001986
_LIT4: .word 0x00001b2f
_LIT5: .word 0x000012ff
_LIT6: .word 0x000010f6
_LIT7: .word 0x00001102
_LIT8: .word 0x00001468
_LIT9: .word 0x000014f0
_LIT10: .word 0x0000179a
_LIT11: .word data_ov002_022d008c
_LIT12: .word 0x00001907
_LIT13: .word 0x0000147a
_LIT14: .word 0x00000fce
_LIT15: .word 0x00001129
_LIT16: .word 0x00001221
_LIT17: .word 0x00001807
_LIT18: .word 0x00001914
_LIT19: .word 0x00001a1e
_LIT20: .word 0x000012c5
_LIT21: .word 0x000010ef
_LIT22: .word 0x000010f4
_LIT23: .word 0x0000140e
_LIT24: .word data_ov002_022cf08c
_LIT25: .word 0x00000868
_LIT26: .word 0x0000180b
_LIT27: .word 0x0000180c
_LIT28: .word 0x000012e5
_LIT29: .word 0x00001784
_LIT30: .word 0x000018f6
_LIT31: .word 0x000019b5
_LIT32: .word 0x00001870
_LIT33: .word func_0202f1c4
