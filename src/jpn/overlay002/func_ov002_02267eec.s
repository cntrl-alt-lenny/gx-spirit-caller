; func_ov002_02267eec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c83b4
        .extern data_ov002_022c83c4
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_0202b0ac
        .extern func_0202e1e0
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3a4
        .extern func_ov002_021b30d8
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3fb8
        .extern func_ov002_021b4040
        .extern func_ov002_021b939c
        .extern func_ov002_021b9af4
        .extern func_ov002_021b9c54
        .extern func_ov002_021b9dec
        .extern func_ov002_021baf88
        .extern func_ov002_021bcca0
        .extern func_ov002_021c2418
        .extern func_ov002_021d46ac
        .extern func_ov002_021d9054
        .extern func_ov002_021d90f0
        .extern func_ov002_021de390
        .extern func_ov002_021dea38
        .extern func_ov002_021df53c
        .extern func_ov002_021df5e4
        .extern func_ov002_021df690
        .extern func_ov002_021df848
        .extern func_ov002_021e27c4
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_02244efc
        .extern func_ov002_02253c44
        .extern func_ov002_02253dbc
        .extern func_ov002_022559e0
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_02267d0c
        .extern func_ov002_02267e58
        .extern func_ov002_02267ea8
        .extern func_ov002_02280870
        .extern func_ov002_0229cd4c
        .extern func_ov002_0229ce00
        .global func_ov002_02267eec
        .arm
func_ov002_02267eec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x490
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r7, [r0, #0xcec]
    ldr r2, _LIT2
    and r0, r7, #0x1
    mul r1, r0, r1
    str r0, [sp]
    ldr r0, [r2, r1]
    str r1, [sp, #0x4]
    mov r0, r0, lsr #0x18
    mov r5, #0x1
    ands r6, r0, #0x1
    bne .L_54
    ldr r2, _LIT3
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b3fb8
    cmp r0, #0x0
    moveq r5, #0x0
.L_54:
    ldr r4, _LIT0
    ldr r1, [r4, #0xd20]
    cmp r1, #0x78
    bhi .L_cc
    bcs .L_b14
    cmp r1, #0x65
    bhi .L_9c
    bcs .L_2fc
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_90
    b .L_12c
    b .L_1ac
    b .L_244
    b .L_274
.L_90:
    cmp r1, #0x64
    beq .L_2e0
    b .L_1544
.L_9c:
    cmp r1, #0x66
    bhi .L_ac
    beq .L_6c4
    b .L_1544
.L_ac:
    cmp r1, #0x6f
    bhi .L_1544
    cmp r1, #0x6e
    bcc .L_1544
    beq .L_948
    cmp r1, #0x6f
    beq .L_ab0
    b .L_1544
.L_cc:
    cmp r1, #0x82
    bhi .L_f4
    bcs .L_c3c
    cmp r1, #0x79
    bhi .L_e8
    beq .L_b80
    b .L_1544
.L_e8:
    cmp r1, #0x7a
    beq .L_be0
    b .L_1544
.L_f4:
    cmp r1, #0x96
    bhi .L_120
    bcs .L_d70
    cmp r1, #0x84
    bhi .L_1544
    cmp r1, #0x83
    bcc .L_1544
    beq .L_cac
    cmp r1, #0x84
    beq .L_d10
    b .L_1544
.L_120:
    cmp r1, #0xc8
    beq .L_d84
    b .L_1544
.L_12c:
    cmp r5, #0x0
    beq .L_160
    cmp r6, #0x0
    bne .L_148
    mov r0, r7
    mov r1, #0x134
    bl func_ov002_021ae320
.L_148:
    ldr r0, _LIT0
    mov r1, #0xc8
    str r1, [r0, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_160:
    cmp r7, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    mov r1, #0x0
    orr r0, r0, #0xd
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd20]
    add sp, sp, #0x490
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    str r0, [r1, #0xd24]
    str r0, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1ac:
    ldr r4, _LIT4
    mov r5, #0x0
.L_1b4:
    ldr r1, [r4, r5, lsl #0x2]
    mov r0, r7
    blx r1
    cmp r0, #0x0
    addeq sp, sp, #0x490
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r5, r5, #0x1
    cmp r5, #0x4
    bcc .L_1b4
    ldr r4, _LIT0
    ldr r0, [r4, #0xd24]
    cmp r0, #0x43
    bcs .L_228
    ldr r6, _LIT5
    mov r5, #0x0
.L_1f4:
    ldr r1, [r6, r0, lsl #0x2]
    mov r0, r7
    blx r1
    cmp r0, #0x0
    addeq sp, sp, #0x490
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    str r5, [r4, #0xd28]
    ldr r0, [r4, #0xd24]
    add r0, r0, #0x1
    str r0, [r4, #0xd24]
    cmp r0, #0x43
    bcc .L_1f4
.L_228:
    ldr r1, _LIT0
    add sp, sp, #0x490
    ldr r2, [r1, #0xd20]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_244:
    mov r0, #0x2
    mov r1, #0x0
    bl func_ov002_02244efc
    ldr r2, _LIT6
    mov r0, #0x0
    mov r1, r4
    str r0, [r2, #0x488]
    ldr r2, [r1, #0xd20]
    add sp, sp, #0x490
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_274:
    ldr r0, _LIT6
    ldr r0, [r0, #0x488]
    cmp r0, #0x0
    beq .L_298
    sub r0, r1, #0x1
    str r0, [r4, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_298:
    ldr r4, _LIT4
    mov r5, #0x0
.L_2a0:
    ldr r1, [r4, r5, lsl #0x2]
    mov r0, r7
    blx r1
    cmp r0, #0x0
    addeq sp, sp, #0x490
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r5, r5, #0x1
    cmp r5, #0x4
    bcc .L_2a0
    ldr r0, _LIT0
    mov r1, #0x64
    str r1, [r0, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2e0:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd24]
    str r1, [r0, #0xd28]
    ldr r1, [r0, #0xd20]
    add r1, r1, #0x1
    str r1, [r0, #0xd20]
.L_2fc:
    and r0, r7, #0xff
    str r0, [sp, #0x8]
    ldr r1, _LIT7
    ldr r0, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0xc]
    b .L_69c
.L_318:
    ldr r0, _LIT0
    ldr r8, [r0, #0xd28]
    cmp r8, #0xa
    bcs .L_684
    ldr r0, [sp, #0xc]
    add r4, r0, #0x30
    ldr r0, _LIT8
    sub r0, r0, #0xf2
    str r0, [sp, #0x34]
    ldr r0, _LIT8
    sub r0, r0, #0x56
    str r0, [sp, #0x2c]
    ldr r0, _LIT8
    sub r0, r0, #0xf2
    str r0, [sp, #0x30]
    ldr r0, _LIT8
    sub r0, r0, #0xea
    str r0, [sp, #0x3c]
    ldr r0, _LIT8
    add r0, r0, #0xd0
    str r0, [sp, #0x4c]
    ldr r0, _LIT8
    sub r0, r0, #0x51
    str r0, [sp, #0x50]
    ldr r0, _LIT9
    sub r0, r0, #0x240
    str r0, [sp, #0x54]
    ldr r0, _LIT9
    sub r0, r0, #0x2b8
    str r0, [sp, #0x44]
    ldr r0, _LIT8
    sub r0, r0, #0xea
    str r0, [sp, #0x40]
    ldr r0, _LIT8
    sub r0, r0, #0x100
    str r0, [sp, #0x38]
    ldr r0, _LIT8
    sub r0, r0, #0x56
    str r0, [sp, #0x28]
    ldr r0, _LIT8
    add r0, r0, #0xd0
    str r0, [sp, #0x48]
    ldr r0, _LIT9
    sub r0, r0, #0x1e
    str r0, [sp, #0x58]
    ldr r0, _LIT9
    sub r0, r0, #0x1e
    str r0, [sp, #0x5c]
.L_3d8:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd24]
    mov r0, #0x14
    eor sl, r7, r1
    mul r9, r8, r0
    ldr r1, _LIT1
    ldr r0, _LIT7
    and r2, sl, #0x1
    mla fp, r2, r1, r0
    add r1, fp, r9
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r1, #0x38]
    cmpne r0, #0x0
    beq .L_668
    mov r0, sl
    mov r1, r8
    bl func_ov002_021b9dec
    mov r5, r0
    mov r6, #0x0
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_444
    cmp r8, #0x5
    bge .L_668
    b .L_44c
.L_444:
    cmp r8, #0x5
    blt .L_668
.L_44c:
    ldr r0, [sp, #0x28]
    cmp r5, r0
    bgt .L_4b8
    ldr r0, [sp, #0x2c]
    cmp r5, r0
    bge .L_598
    ldr r0, [sp, #0x30]
    cmp r5, r0
    bgt .L_48c
    ldr r0, [sp, #0x34]
    cmp r5, r0
    bge .L_528
    ldr r0, [sp, #0x38]
    cmp r5, r0
    beq .L_598
    b .L_64c
.L_48c:
    ldr r0, [sp, #0x3c]
    cmp r5, r0
    bgt .L_4a8
    ldr r0, [sp, #0x40]
    cmp r5, r0
    beq .L_598
    b .L_64c
.L_4a8:
    ldr r0, [sp, #0x44]
    cmp r5, r0
    beq .L_598
    b .L_64c
.L_4b8:
    ldr r0, [sp, #0x48]
    cmp r5, r0
    bgt .L_4fc
    ldr r0, [sp, #0x4c]
    cmp r5, r0
    bge .L_598
    ldr r0, [sp, #0x50]
    cmp r5, r0
    bgt .L_4ec
    ldr r0, [sp, #0x54]
    cmp r5, r0
    beq .L_598
    b .L_64c
.L_4ec:
    ldr r0, _LIT8
    cmp r5, r0
    beq .L_528
    b .L_64c
.L_4fc:
    ldr r0, [sp, #0x58]
    cmp r5, r0
    bgt .L_518
    ldr r0, [sp, #0x5c]
    cmp r5, r0
    beq .L_5f8
    b .L_64c
.L_518:
    ldr r0, _LIT9
    cmp r5, r0
    beq .L_598
    b .L_64c
.L_528:
    cmp sl, r7
    bne .L_64c
    ldr r2, [r4, r9]
    mov r0, r7
    mov r3, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    mov r1, r8
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    ldr r1, [sp, #0x8]
    and r2, r8, #0xff
    orr r1, r1, r2, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r0, r7
    mov r1, r1, lsr #0x10
    bl func_ov002_021bcca0
    cmp r0, #0x0
    ble .L_590
    ldr r0, _LIT0
    mov r1, #0x78
    str r1, [r0, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_590:
    mov r6, #0x1
    b .L_64c
.L_598:
    cmp sl, r7
    bne .L_64c
    ldr r2, [r4, r9]
    mov r0, r7
    mov r3, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    mov r1, r8
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, r5
    bl func_ov002_02267d0c
    ldr r1, [sp, #0xc]
    ldr r1, [r1]
    cmp r1, r0
    movle r6, #0x1
    ble .L_64c
    ldr r0, _LIT0
    mov r1, #0x6e
    str r1, [r0, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5f8:
    add r0, fp, #0x30
    ldr r2, [r0, r9]
    mov r0, sl
    mov r3, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    mov r1, r8
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, sl
    bl func_ov002_021c2418
    cmp r0, #0x0
    moveq r6, #0x1
    beq .L_64c
    ldr r0, _LIT0
    mov r1, #0x82
    str r1, [r0, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_64c:
    cmp r6, #0x0
    beq .L_668
    mov r2, #0x0
    mov r0, sl
    mov r1, r8
    mov r3, r2
    bl func_ov002_021de390
.L_668:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd28]
    add r8, r0, #0x1
    ldr r0, _LIT0
    cmp r8, #0xa
    str r8, [r0, #0xd28]
    bcc .L_3d8
.L_684:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd28]
    ldr r1, [r0, #0xd24]
    add r1, r1, #0x1
    str r1, [r0, #0xd24]
.L_69c:
    ldr r1, _LIT0
    ldr r0, [r1, #0xd24]
    cmp r0, #0x2
    bcc .L_318
    ldr r2, [r1, #0xd20]
    add sp, sp, #0x490
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6c4:
    ldr r9, [r4, #0xd28]
    cmp r9, #0xa
    bcs .L_930
    rsb r0, r7, #0x1
    ldr r1, _LIT1
    and r2, r0, #0x1
    str r0, [sp, #0x10]
    mul r0, r2, r1
    str r0, [sp, #0x1c]
    ldr r1, _LIT7
    ldr r0, [sp, #0x4]
    add r6, r1, r0
    ldr r0, _LIT10
    add fp, r6, #0x30
    sub r0, r0, #0x3
    str r0, [sp, #0x20]
    ldr r0, _LIT10
    sub r0, r0, #0x10
    str r0, [sp, #0x60]
    ldr r0, _LIT11
    sub r0, r0, #0x470
    str r0, [sp, #0x64]
.L_71c:
    mov r0, #0x14
    mul r8, r9, r0
    add r1, r6, r8
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r1, #0x38]
    cmpne r0, #0x0
    beq .L_91c
    mov r0, r7
    mov r1, r9
    bl func_ov002_021b9dec
    mov r5, r0
    mov sl, #0x0
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_76c
    cmp r9, #0x5
    bge .L_91c
    b .L_774
.L_76c:
    cmp r9, #0x5
    blt .L_91c
.L_774:
    ldr r0, [sp, #0x60]
    cmp r5, r0
    bgt .L_7ac
    ldr r0, [sp, #0x64]
    subs r0, r5, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_8e4
    b .L_7bc
    b .L_7bc
    b .L_7bc
    b .L_7bc
    b .L_7bc
    b .L_7bc
    b .L_7bc
.L_7ac:
    ldr r0, _LIT11
    cmp r5, r0
    beq .L_894
    b .L_8e4
.L_7bc:
    ldr r0, [sp, #0x20]
    bl func_ov002_021baf88
    cmp r0, #0x0
    bne .L_8e4
    ldr r3, [fp, r8]
    mov r0, r7
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r9
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, r5
    bl func_ov002_02267d0c
    ldr r1, [r6]
    cmp r1, r0
    movlt sl, #0x1
    blt .L_8e4
    mov r0, r5
    bl func_ov002_02267d0c
    mov r5, r0
    mov r0, r7
    mov r1, r5
    bl func_ov002_021df690
    ldr r1, [r4, #0xd28]
    ldr r2, _LIT10
    mov r0, r7
    mov r3, r7
    bl func_ov002_021b30d8
    cmp r0, #0x0
    beq .L_85c
    ldr r1, _LIT7
    ldr r0, [sp, #0x1c]
    ldr r0, [r1, r0]
    cmp r0, r5
    blt .L_85c
    ldr r0, [sp, #0x10]
    mov r1, r5
    bl func_ov002_021df690
.L_85c:
    ldr r1, [r4, #0xd28]
    ldr r2, _LIT10
    ldr r3, [sp, #0x10]
    mov r0, r7
    bl func_ov002_021b30d8
    cmp r0, #0x0
    beq .L_8e4
    ldr r0, [r6]
    cmp r0, r5, lsl #0x1
    blt .L_8e4
    mov r1, r5
    mov r0, r7
    bl func_ov002_021df690
    b .L_8e4
.L_894:
    ldr r3, [fp, r8]
    mov r0, r7
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r9
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, r5
    bl func_ov002_02267d0c
    ldr r1, [r6]
    cmp r1, r0
    movlt sl, #0x1
    blt .L_8e4
    mov r0, r5
    bl func_ov002_02267d0c
    mov r1, r0
    mov r0, r7
    bl func_ov002_021df690
.L_8e4:
    cmp sl, #0x0
    beq .L_91c
    mov r2, #0x0
    mov r0, r7
    mov r1, r9
    mov r3, r2
    bl func_ov002_021de390
    ldr r1, _LIT0
    add sp, sp, #0x490
    ldr r2, [r1, #0xd28]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_91c:
    ldr r0, [r4, #0xd28]
    add r9, r0, #0x1
    str r9, [r4, #0xd28]
    cmp r9, #0xa
    bcc .L_71c
.L_930:
    ldr r0, _LIT0
    mov r1, #0x96
    str r1, [r0, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_948:
    ldr r1, [r4, #0xd28]
    mov r0, r7
    bl func_ov002_021b9dec
    ldr r1, _LIT12
    mov r4, r0
    ldr r1, [r1, r7, lsl #0x2]
    cmp r1, #0x1
    bne .L_a60
    ldr r1, _LIT13
    ldr r0, _LIT0
    mov r3, #0x1
    str r3, [r0, #0xd44]
    cmp r4, r1
    beq .L_9c0
    add r0, r1, #0x21
    cmp r4, r0
    beq .L_99c
    ldr r0, _LIT9
    cmp r4, r0
    beq .L_9e0
    b .L_9fc
.L_99c:
    ldr r2, _LIT7
    ldr r0, [sp, #0x4]
    add r1, r1, #0x410
    ldr r0, [r2, r0]
    cmp r0, r1
    ldr r0, _LIT0
    movle r3, #0x0
    str r3, [r0, #0xd44]
    b .L_9fc
.L_9c0:
    mov r0, r7
    bl func_ov002_02280870
    cmp r0, #0x0
    movle r1, #0x1
    ldr r0, _LIT0
    movgt r1, #0x0
    str r1, [r0, #0xd44]
    b .L_9fc
.L_9e0:
    mov r0, r7
    bl func_ov002_02280870
    cmp r0, #0x0
    movlt r1, #0x1
    ldr r0, _LIT0
    movge r1, #0x0
    str r1, [r0, #0xd44]
.L_9fc:
    ldr r3, _LIT0
    ldr r2, _LIT1
    ldr r0, [sp]
    ldr r4, [r3, #0xd28]
    mul r5, r0, r2
    mov r1, #0x14
    mul r6, r4, r1
    ldr r2, _LIT14
    ldr r0, _LIT15
    add r1, r2, r5
    ldr r4, [r6, r1]
    add r2, r0, r5
    mov r1, r4, lsr #0x6
    mov r0, r4, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r4, lsr #0x1
    and r0, r0, #0x1
    ldrh r2, [r6, r2]
    mvn r1, r1
    mvn r0, r0
    and r1, r2, r1
    tst r1, r0
    moveq r0, #0x0
    streq r0, [r3, #0xd44]
    b .L_a94
.L_a60:
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x290
    mov r1, #0xe8
    bl func_ov002_0229cd4c
    mov r0, r4
    bl func_ov002_02267d0c
    mov r2, r0
    add r0, sp, #0x390
    add r1, sp, #0x290
    bl func_ov002_0229ce00
    add r0, sp, #0x390
    bl func_ov002_021ae3a4
.L_a94:
    ldr r1, _LIT0
    add sp, sp, #0x490
    ldr r2, [r1, #0xd20]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ab0:
    ldr r0, [r4, #0xd44]
    cmp r0, #0x0
    beq .L_adc
    ldr r1, [r4, #0xd28]
    mov r0, r7
    bl func_ov002_021b9dec
    bl func_ov002_02267d0c
    mov r1, r0
    mov r0, r7
    bl func_ov002_021df690
    b .L_af0
.L_adc:
    mov r2, #0x0
    ldr r1, [r4, #0xd28]
    mov r0, r7
    mov r3, r2
    bl func_ov002_021de390
.L_af0:
    ldr r1, _LIT0
    mov r2, #0x65
    ldr r3, [r1, #0xd28]
    add sp, sp, #0x490
    add r3, r3, #0x1
    str r3, [r1, #0xd28]
    str r2, [r1, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b14:
    ldr r0, _LIT12
    ldr r0, [r0, r7, lsl #0x2]
    cmp r0, #0x1
    bne .L_b3c
    mov r0, #0x0
    str r0, [r4, #0xd44]
    add r1, r1, #0x1
    add sp, sp, #0x490
    str r1, [r4, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b3c:
    ldr r1, [r4, #0xd28]
    mov r0, r7
    bl func_ov002_021b9dec
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x190
    mov r1, #0xe9
    bl func_ov002_0229cd4c
    add r0, sp, #0x190
    bl func_ov002_021ae3a4
    mov r1, r4
    ldr r2, [r1, #0xd20]
    add sp, sp, #0x490
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b80:
    ldr r0, [r4, #0xd44]
    cmp r0, #0x0
    beq .L_ba8
    ldr r0, _LIT16
    add r1, r1, #0x1
    str r1, [r4, #0xd20]
    bl func_ov002_02259204
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ba8:
    mov r2, #0x0
    ldr r1, [r4, #0xd28]
    mov r0, r7
    mov r3, r2
    bl func_ov002_021de390
    mov r1, r4
    ldr r3, [r1, #0xd28]
    mov r2, #0x65
    add r3, r3, #0x1
    str r3, [r1, #0xd28]
    str r2, [r1, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_be0:
    bl func_ov002_0225930c
    cmp r0, #0x0
    mov r0, r4
    beq .L_c28
    ldr r2, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r0, [r0, #0xd70]
    add r1, r2, r1
    bl func_ov002_021dea38
    mov r1, r4
    ldr r3, [r1, #0xd28]
    mov r2, #0x65
    add r3, r3, #0x1
    str r3, [r1, #0xd28]
    str r2, [r1, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c28:
    mov r1, #0x78
    str r1, [r0, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c3c:
    ldr r0, [r4, #0xd24]
    ldr r2, _LIT12
    eor r0, r7, r0
    ldr r2, [r2, r0, lsl #0x2]
    cmp r2, #0x1
    bne .L_c6c
    mov r0, #0x0
    str r0, [r4, #0xd44]
    add r1, r1, #0x1
    add sp, sp, #0x490
    str r1, [r4, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c6c:
    ldr r1, [r4, #0xd28]
    bl func_ov002_021b9dec
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x90
    mov r1, #0xdb
    bl func_ov002_0229cd4c
    add r0, sp, #0x90
    bl func_ov002_021ae3a4
    mov r1, r4
    ldr r2, [r1, #0xd20]
    add sp, sp, #0x490
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cac:
    ldr r0, [r4, #0xd44]
    cmp r0, #0x0
    beq .L_cd4
    ldr r0, _LIT17
    add r1, r1, #0x1
    str r1, [r4, #0xd20]
    bl func_ov002_02259204
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cd4:
    ldr r0, [r4, #0xd24]
    mov r2, #0x0
    ldr r1, [r4, #0xd28]
    mov r3, r2
    eor r0, r7, r0
    bl func_ov002_021de390
    mov r1, r4
    ldr r3, [r1, #0xd28]
    mov r2, #0x65
    add r3, r3, #0x1
    str r3, [r1, #0xd28]
    str r2, [r1, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d10:
    bl func_ov002_0225930c
    cmp r0, #0x0
    mov r0, r4
    beq .L_d5c
    ldr r3, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r0, [r0, #0xd70]
    mvn r2, #0x0
    add r1, r3, r1
    bl func_ov002_021d90f0
    mov r1, r4
    ldr r3, [r1, #0xd28]
    mov r2, #0x65
    add r3, r3, #0x1
    str r3, [r1, #0xd28]
    str r2, [r1, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d5c:
    mov r1, #0x82
    str r1, [r0, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d70:
    mov r0, #0xc8
    str r0, [r4, #0xd20]
    add sp, sp, #0x490
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d84:
    ldr r2, _LIT7
    ldr r1, _LIT1
    ldr r0, [sp]
    ldr sl, _LIT18
    mla r6, r0, r1, r2
    ldr r9, _LIT19
    mov r8, #0x0
    add r4, r6, #0x30
.L_da4:
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    movs r1, r0, lsr #0x13
    ldrneh r0, [r6, #0x38]
    cmpne r0, #0x0
    beq .L_df4
    cmp r1, sl
    beq .L_dd0
    cmp r1, r9
    beq .L_de4
    b .L_df4
.L_dd0:
    mov r0, r7
    mov r1, r8
    mov r2, r5
    bl func_ov002_02253c44
    b .L_df4
.L_de4:
    mov r0, r7
    mov r1, r8
    mov r2, r5
    bl func_ov002_022559e0
.L_df4:
    add r8, r8, #0x1
    cmp r8, #0x5
    add r4, r4, #0x14
    add r6, r6, #0x14
    blt .L_da4
    mov r0, r7
    mov r1, r5
    bl func_ov002_02253dbc
    ldr r0, [sp]
    ldr r1, _LIT1
    ldr r2, _LIT7
    orr fp, r0, #0x16
    mla r1, r0, r1, r2
    mov r0, r1
    add r6, r0, #0x64
    rsb r0, r7, #0x1
    ldr r9, _LIT20
    str r0, [sp, #0x14]
    sub r0, r9, #0x4
    str r0, [sp, #0x24]
    ldr r0, _LIT21
    str r1, [sp, #0x18]
    sub r0, r0, #0xd
    str r0, [sp, #0x70]
    sub r0, r9, #0x4
    str r0, [sp, #0x78]
    ldr r0, _LIT21
    add r4, r1, #0x94
    add r0, r0, #0x2d4
    str r0, [sp, #0x7c]
    ldr r0, _LIT22
    mov r8, #0x5
    sub r0, r0, #0x6e
    str r0, [sp, #0x6c]
    ldr r0, _LIT22
    add r0, r0, #0x6d
    str r0, [sp, #0x84]
    ldr r0, _LIT23
    sub r0, r0, #0x308
    str r0, [sp, #0x68]
    ldr r0, _LIT22
    add r0, r0, #0x6d
    str r0, [sp, #0x80]
    ldr r0, _LIT23
    sub r0, r0, #0x2b
    str r0, [sp, #0x88]
    ldr r0, _LIT23
    sub r0, r0, #0x2b
    str r0, [sp, #0x8c]
    sub r0, r9, #0x4
    str r0, [sp, #0x74]
.L_ec0:
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r6, #0x38]
    cmpne r0, #0x0
    beq .L_12a4
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9c54
    cmp r0, #0x0
    beq .L_12a4
    ldr r0, [r4]
    mov r1, r0, lsl #0x13
    ldr r0, [sp, #0x68]
    cmp r0, r1, lsr #0x13
    mov r0, r1, lsr #0x13
    bcc .L_f6c
    ldr r1, [sp, #0x6c]
    cmp r0, r1
    bcs .L_11ac
    ldr r1, _LIT21
    cmp r0, r1
    bhi .L_f30
    bcs .L_1020
    ldr r1, [sp, #0x70]
    cmp r0, r1
    beq .L_1020
    b .L_12a4
.L_f30:
    cmp r0, r9
    bhi .L_f5c
    ldr r1, [sp, #0x74]
    cmp r0, r1
    bcc .L_12a4
    ldr r1, [sp, #0x78]
    cmp r0, r1
    beq .L_1034
    cmp r0, r9
    beq .L_1100
    b .L_12a4
.L_f5c:
    ldr r1, [sp, #0x7c]
    cmp r0, r1
    beq .L_1198
    b .L_12a4
.L_f6c:
    ldr r1, [sp, #0x80]
    cmp r0, r1
    bhi .L_f94
    ldr r1, [sp, #0x84]
    cmp r0, r1
    bcs .L_11ac
    ldr r1, _LIT22
    cmp r0, r1
    beq .L_1020
    b .L_12a4
.L_f94:
    ldr r1, [sp, #0x88]
    cmp r0, r1
    bhi .L_fb0
    ldr r1, [sp, #0x8c]
    cmp r0, r1
    beq .L_128c
    b .L_12a4
.L_fb0:
    ldr r1, _LIT23
    cmp r0, r1
    beq .L_1218
    b .L_12a4
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a8
_LIT3: .word 0x0000137e
_LIT4: .word data_ov002_022c83b4
_LIT5: .word data_ov002_022c83c4
_LIT6: .word data_ov002_022ce1a8
_LIT7: .word data_ov002_022cf08c
_LIT8: .word 0x0000144a
_LIT9: .word 0x00001639
_LIT10: .word 0x000016a2
_LIT11: .word 0x00001afc
_LIT12: .word data_ov002_022cd664
_LIT13: .word 0x00001360
_LIT14: .word data_ov002_022cf0cc
_LIT15: .word data_ov002_022cf0c4
_LIT16: .word func_ov002_02267e58
_LIT17: .word func_ov002_02267ea8
_LIT18: .word 0x00000ff9
_LIT19: .word 0x000014ac
_LIT20: .word 0x000015a0
_LIT21: .word 0x0000131a
_LIT22: .word 0x0000180f
_LIT23: .word 0x00001aa9
.L_1020:
    mov r0, r7
    mov r1, r8
    mov r2, #0x1
    bl func_ov002_021d9054
    b .L_12a4
.L_1034:
    mov r0, r7
    mov r1, r8
    mov r2, #0x1
    bl func_ov002_021d9054
    cmp r5, #0x0
    bne .L_12a4
    ldr r0, [r6, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_12a4
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9af4
    add r0, r0, #0x1
    cmp r0, #0x2
    bne .L_12a4
    ldr r2, [sp, #0x24]
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b4040
    ldr r3, [r4]
    mov sl, r0
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r0, r7
    mov r1, r8
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    mov r2, #0x0
    mov r0, r7
    mov r1, r8
    mov r3, r2
    bl func_ov002_021de390
    and r1, sl, #0x1
    orr r2, r1, #0x1e
    mov r1, sl, lsl #0x16
    orr r1, r2, r1, lsr #0x10
    ldr r2, [sp, #0x18]
    mov r1, r1, lsl #0x10
    ldr r2, [r2, #0xc]
    mov r0, #0x3f
    mov r2, r2, lsl #0x16
    orr r2, fp, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, #0x0
    mov r2, r2, lsr #0x10
    bl func_ov002_021d46ac
    b .L_12a4
.L_1100:
    mov r0, r7
    mov r1, r8
    mov r2, #0x1
    bl func_ov002_021d9054
    cmp r5, #0x0
    bne .L_12a4
    ldr r0, [r6, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_12a4
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9af4
    ldr r3, [r4]
    mov sl, r0
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r0, r7
    mov r1, r8
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    bl func_ov002_021e2a4c
    mov r0, #0xc8
    mov sl, r0, lsl sl
    mov r0, r7
    mov r1, sl
    mov r2, #0x0
    mov r3, r9
    bl func_ov002_021df848
    ldr r0, [sp, #0x14]
    mov r1, sl
    mov r2, #0x1
    mov r3, r9
    bl func_ov002_021df848
    bl func_ov002_021e2b6c
    b .L_12a4
.L_1198:
    mov r0, r7
    mov r1, r8
    mov r2, #0x1
    bl func_ov002_021d9054
    b .L_12a4
.L_11ac:
    mov r0, r7
    mov r1, r8
    mov r2, #0x1
    bl func_ov002_021d9054
    cmp r5, #0x0
    bne .L_12a4
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9af4
    add r0, r0, #0x1
    cmp r0, #0x2
    bne .L_12a4
    ldr r3, [r4]
    mov r0, r7
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r8
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    mov r2, #0x0
    mov r0, r7
    mov r1, r8
    mov r3, r2
    bl func_ov002_021de390
    b .L_12a4
.L_1218:
    mov r0, r7
    mov r1, r8
    mov r2, #0x1
    bl func_ov002_021d9054
    cmp r5, #0x0
    bne .L_12a4
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9af4
    add r0, r0, #0x1
    cmp r0, #0x3
    bne .L_12a4
    ldr r3, [r4]
    mov r0, r7
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r8
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    ldr r3, [r4]
    mov r0, r7
    mov r3, r3, lsl #0x13
    mov r1, r8
    mov r2, #0x0
    mov r3, r3, lsr #0x13
    bl func_ov002_021de390
    b .L_12a4
.L_128c:
    cmp r5, #0x0
    beq .L_12a4
    mov r0, r7
    mov r1, r8
    mov r2, #0x1
    bl func_ov002_021d9054
.L_12a4:
    add r4, r4, #0x14
    add r6, r6, #0x14
    add r8, r8, #0x1
    cmp r8, #0xa
    blt .L_ec0
    ldr r2, _LIT24
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_13ec
    ldr r1, _LIT25
    ldr r0, [sp, #0x4]
    ldrh r8, [r1, r0]
    cmp r8, #0x0
    beq .L_13ec
    ldr r0, [sp]
    ldr r1, _LIT7
    orr sl, r0, #0x16
    ldr r0, [sp, #0x4]
    ldr r6, _LIT24
    add fp, r1, r0
.L_12fc:
    ldr r0, _LIT26
    add r4, r0, r8, lsl #0x3
    ldrh r1, [r4, #0x2]
    ldrh r8, [r4, #0x6]
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    ldreqh r0, [r4]
    cmpeq r0, r6
    bne .L_13e4
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x1d
    rsb r1, r0, #0x4
    cmp r7, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x3b
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, r6
    mov r2, #0x1
    bl func_ov002_021d46ac
    cmp r5, #0x0
    bne .L_13e4
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1c
    bne .L_13e4
    ldrh r9, [r4, #0x4]
    mov r0, r9
    bl func_ov002_021b939c
    mov r4, r0
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xf
    bne .L_13e4
    mov r0, r7
    mov r1, r6
    bl func_ov002_021df5e4
    and r0, r4, #0xff
    ldr r2, [fp, #0xc]
    and r0, r0, #0x1
    orr r1, r0, #0x1e
    mov r0, r9, lsl #0x16
    mov r2, r2, lsl #0x16
    orr r0, r1, r0, lsr #0x10
    orr r2, sl, r2, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x3f
    mov r3, #0x0
    mov r2, r2, lsr #0x10
    bl func_ov002_021d46ac
.L_13e4:
    cmp r8, #0x0
    bne .L_12fc
.L_13ec:
    ldr r2, _LIT27
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_1528
    ldr r1, _LIT25
    ldr r0, [sp, #0x4]
    ldrh r8, [r1, r0]
    cmp r8, #0x0
    beq .L_1528
    ldr r0, [sp]
    ldr r1, _LIT7
    orr sl, r0, #0x16
    ldr r0, [sp, #0x4]
    ldr r6, _LIT27
    add fp, r1, r0
.L_1430:
    ldr r0, _LIT26
    add r4, r0, r8, lsl #0x3
    ldrh r1, [r4, #0x2]
    ldrh r8, [r4, #0x6]
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    ldreqh r0, [r4]
    cmpeq r0, r6
    bne .L_1520
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x1d
    rsb r1, r0, #0x2
    cmp r7, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x3b
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, r6
    mov r2, #0x1
    bl func_ov002_021d46ac
    cmp r5, #0x0
    bne .L_1520
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1c
    bne .L_1520
    ldrh r9, [r4, #0x4]
    mov r0, r9
    bl func_ov002_021b939c
    mov r4, r0
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xf
    bne .L_1520
    mov r0, r7
    mov r1, r6
    bl func_ov002_021df5e4
    and r0, r4, #0xff
    ldr r2, [fp, #0xc]
    and r0, r0, #0x1
    orr r1, r0, #0x1e
    mov r0, r9, lsl #0x16
    mov r2, r2, lsl #0x16
    orr r0, r1, r0, lsr #0x10
    orr r2, sl, r2, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x3f
    mov r3, #0x0
    mov r2, r2, lsr #0x10
    bl func_ov002_021d46ac
    mov r0, r7
    bl func_ov002_021e27c4
.L_1520:
    cmp r8, #0x0
    bne .L_1430
.L_1528:
    ldr r1, _LIT0
    add sp, sp, #0x490
    ldr r2, [r1, #0xd20]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1544:
    mov r0, #0x1
    add sp, sp, #0x490
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT24: .word 0x000012c8
_LIT25: .word data_ov002_022cf1a2
_LIT26: .word data_ov002_022d0570
_LIT27: .word 0x00001811
