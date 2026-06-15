; func_ov002_021dcc48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern data_ov002_022d0650
        .extern func_0202e310
        .extern func_0202e328
        .extern func_ov002_021b34f4
        .extern func_ov002_021b3618
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021b43a4
        .extern func_ov002_021b9ecc
        .extern func_ov002_021ba0b0
        .extern func_ov002_021c229c
        .extern func_ov002_021d96ec
        .extern func_ov002_021dd950
        .global func_ov002_021dcc48
        .arm
func_ov002_021dcc48:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    str r3, [sp, #0x8]
    str r0, [sp, #0x4]
    mov r4, r1
    mov r5, r2
    bl func_ov002_021ba0b0
    mov r7, r0
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x8]
    tst r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    tst r1, #0x2
    movne r1, #0x1
    strne r1, [sp, #0x14]
    moveq r1, #0x0
    streq r1, [sp, #0x14]
    ldr r1, [sp, #0x8]
    tst r1, #0x4
    movne r1, #0x1
    strne r1, [sp, #0x10]
    moveq r1, #0x0
    streq r1, [sp, #0x10]
    ldr r1, [sp, #0x8]
    tst r1, #0x1000000
    movne r1, #0x1
    strne r1, [sp, #0xc]
    moveq r1, #0x0
    streq r1, [sp, #0xc]
    ldr r1, _LIT0
    cmp r7, r1
    bgt .L_10ac
    bge .L_128c
    ldr r1, _LIT1
    cmp r7, r1
    bgt .L_103c
    bge .L_1798
    sub r1, r1, #0x1a8
    cmp r7, r1
    bgt .L_fe8
    ldr r1, _LIT1
    sub r1, r1, #0x1a8
    cmp r7, r1
    bge .L_1484
    ldr r1, _LIT1
    sub r1, r1, #0x250
    cmp r7, r1
    bgt .L_fd8
    ldr r1, _LIT1
    sub r1, r1, #0x250
    cmp r7, r1
    beq .L_11b0
    b .L_1b2c
.L_fd8:
    ldr r0, _LIT2
    cmp r7, r0
    beq .L_1490
    b .L_1b2c
.L_fe8:
    ldr r0, _LIT1
    sub r0, r0, #0xa6
    cmp r7, r0
    ldr r0, _LIT1
    bgt .L_1018
    sub r0, r0, #0xa6
    cmp r7, r0
    bge .L_15f0
    ldr r0, _LIT3
    cmp r7, r0
    beq .L_128c
    b .L_1b2c
.L_1018:
    sub r0, r0, #0x77
    sub r0, r7, r0
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1b2c
    b .L_15f0
    b .L_15f0
    b .L_15f0
    b .L_15f0
.L_103c:
    ldr r1, _LIT4
    cmp r7, r1
    bgt .L_107c
    bge .L_128c
    ldr r0, _LIT5
    cmp r7, r0
    bgt .L_106c
    bge .L_1490
    sub r0, r0, #0x3f
    cmp r7, r0
    beq .L_1490
    b .L_1b2c
.L_106c:
    add r0, r0, #0x7d
    cmp r7, r0
    beq .L_128c
    b .L_1b2c
.L_107c:
    add r0, r1, #0x46
    cmp r7, r0
    bgt .L_109c
    bge .L_16d4
    add r0, r1, #0x45
    cmp r7, r0
    beq .L_16d4
    b .L_1b2c
.L_109c:
    add r0, r1, #0x47
    cmp r7, r0
    beq .L_16d4
    b .L_1b2c
.L_10ac:
    ldr r0, _LIT6
    cmp r7, r0
    bgt .L_1124
    bge .L_18a4
    sub r2, r0, #0x1ac
    cmp r7, r2
    bgt .L_10f4
    sub r0, r0, #0x1ac
    cmp r7, r0
    bge .L_1484
    add r0, r1, #0x8
    cmp r7, r0
    bgt .L_10e8
    beq .L_13b0
    b .L_1b2c
.L_10e8:
    cmp r7, #0x1880
    beq .L_1484
    b .L_1b2c
.L_10f4:
    sub r1, r0, #0x2
    cmp r7, r1
    bgt .L_1114
    bge .L_18a4
    sub r0, r0, #0x56
    cmp r7, r0
    beq .L_1484
    b .L_1b2c
.L_1114:
    sub r0, r0, #0x1
    cmp r7, r0
    beq .L_18a4
    b .L_1b2c
.L_1124:
    add r1, r0, #0x51
    cmp r7, r1
    bgt .L_1180
    bge .L_128c
    add r1, r0, #0x15
    cmp r7, r1
    bgt .L_1170
    bge .L_128c
    add r1, r0, #0x9
    cmp r7, r1
    bgt .L_1b2c
    add r1, r0, #0x1
    cmp r7, r1
    blt .L_1b2c
    beq .L_18a4
    add r0, r0, #0x9
    cmp r7, r0
    beq .L_128c
    b .L_1b2c
.L_1170:
    add r0, r0, #0x4f
    cmp r7, r0
    beq .L_192c
    b .L_1b2c
.L_1180:
    add r1, r0, #0x6e
    cmp r7, r1
    bgt .L_11a0
    bge .L_128c
    add r0, r0, #0x68
    cmp r7, r0
    beq .L_1a2c
    b .L_1b2c
.L_11a0:
    add r0, r0, #0x138
    cmp r7, r0
    beq .L_128c
    b .L_1b2c
.L_11b0:
    cmp r0, #0x0
    ldrne r0, [sp, #0x14]
    cmpne r0, #0x0
    beq .L_1b2c
    mov r0, #0x0
    str r0, [sp, #0x24]
    mov r5, r0
    mov r6, #0x1
    mov fp, #0xe
.L_11d4:
    ldr r0, _LIT7
    ldr r1, _LIT8
    ldr r2, [r0, #0xcec]
    ldr r0, [sp, #0x24]
    mov r9, #0x0
    eor r8, r2, r0
    ldr r0, _LIT9
    and r2, r8, #0x1
    mla sl, r2, r1, r0
.L_11f8:
    ldr r1, [sl, #0x40]
    ldrh r2, [sl, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_1264
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b9ecc
    bl func_0202e310
    cmp r0, #0x0
    beq .L_1264
    cmp r8, r4
    movne r0, r6
    moveq r0, r5
    add r3, r0, #0x2
    mov r0, r8
    mov r1, r9
    mov r2, fp
    str r7, [sp]
    bl func_ov002_021dd950
.L_1264:
    add sl, sl, #0x14
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_11f8
    ldr r0, [sp, #0x24]
    add r0, r0, #0x1
    str r0, [sp, #0x24]
    cmp r0, #0x2
    blt .L_11d4
    b .L_1b2c
.L_128c:
    ldr r0, _LIT8
    and r2, r4, #0x1
    mov r1, #0x14
    mul r0, r2, r0
    ldr r2, _LIT9
    mul r1, r5, r1
    add r2, r2, r0
    add r2, r2, r1
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    beq .L_1b2c
    ldr r3, _LIT10
    ldr r2, _LIT11
    add r3, r3, r0
    add r0, r2, r0
    ldr r3, [r1, r3]
    ldrh r2, [r1, r0]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    orr r0, r0, r3, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    beq .L_1b2c
    mov fp, #0x1
    mov r9, #0x0
    mov r6, fp
.L_1308:
    ldr r1, _LIT8
    ldr r0, _LIT9
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    mov sl, #0x0
    add r8, r0, #0x30
.L_1320:
    mov r0, r9
    mov r1, sl
    mov r2, r4
    mov r3, r5
    bl func_ov002_021b34f4
    cmp r0, #0x0
    beq .L_1390
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1390
    str r6, [sp]
    mov r0, r9
    mov r1, sl
    mov r2, r7
    mov r3, r5
    bl func_ov002_021c229c
    cmp r0, #0x0
    beq .L_1390
    cmp r9, r4
    movne r0, fp
    moveq r0, #0x0
    add r3, r0, #0x2
    mov r0, r9
    mov r1, sl
    mov r2, #0xe
    str r7, [sp]
    bl func_ov002_021dd950
.L_1390:
    add r8, r8, #0x14
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_1320
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_1308
    b .L_1b2c
.L_13b0:
    ldr r3, _LIT8
    and r6, r4, #0x1
    mov r0, #0x14
    mul r2, r6, r3
    ldr r6, _LIT9
    mul r0, r5, r0
    add r9, r6, r2
    add r5, r9, r0
    ldr r5, [r5, #0x30]
    mov r5, r5, lsl #0x13
    movs r5, r5, lsr #0x13
    beq .L_1b2c
    ldr r6, _LIT10
    ldr r5, _LIT11
    add r6, r6, r2
    add r2, r5, r2
    ldr r6, [r0, r6]
    ldrh r5, [r0, r2]
    mov r2, r6, lsr #0x6
    mov r0, r6, lsr #0x2
    orr r0, r0, r6, lsr #0x1
    and r2, r2, #0x1
    mvn r2, r2
    and r0, r0, #0x1
    and r2, r5, r2
    mvn r0, r0
    tst r2, r0
    beq .L_1b2c
    mov sl, #0x0
    add r5, r3, #0xf60
    add r6, r1, #0x10
    mov r8, #0xf
    mov fp, #0x2
.L_1434:
    mov r0, r4
    mov r1, sl
    bl func_ov002_021b9ecc
    cmp r0, r6
    cmpne r0, r5
    bne .L_1470
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_1470
    mov r0, r4
    str r7, [sp]
    mov r1, sl
    mov r2, r8
    mov r3, fp
    bl func_ov002_021dd950
.L_1470:
    add sl, sl, #0x1
    cmp sl, #0x5
    add r9, r9, #0x14
    blt .L_1434
    b .L_1b2c
.L_1484:
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    beq .L_1b2c
.L_1490:
    ldr r0, _LIT8
    and r2, r4, #0x1
    mov r1, #0x14
    mul r0, r2, r0
    ldr r2, _LIT9
    mul r1, r5, r1
    add r2, r2, r0
    add r2, r2, r1
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    beq .L_1b2c
    ldr r3, _LIT10
    ldr r2, _LIT11
    add r3, r3, r0
    ldr r6, [r1, r3]
    add r3, r2, r0
    mov r2, r6, lsr #0x6
    mov r0, r6, lsr #0x2
    and r2, r2, #0x1
    orr r0, r0, r6, lsr #0x1
    and r0, r0, #0x1
    ldrh r3, [r1, r3]
    mvn r1, r2
    mvn r0, r0
    and r1, r3, r1
    tst r1, r0
    beq .L_1b2c
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b3618
    ldr r1, _LIT12
    cmp r0, r1
    beq .L_1b2c
    and r6, r0, #0xff
    ldr r1, _LIT8
    and r2, r6, #0x1
    mul r1, r2, r1
    mov r0, r0, asr #0x8
    ldr r2, _LIT9
    and r8, r0, #0xff
    mov r0, #0x14
    smulbb r0, r8, r0
    add r2, r2, r1
    add r2, r2, r0
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    beq .L_1b2c
    ldr r2, _LIT11
    add r1, r2, r1
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    beq .L_1b2c
    ldr r0, _LIT5
    cmp r7, r0
    cmpne r7, #0x1880
    addne r0, r0, #0x25c
    cmpne r7, r0
    bne .L_15a4
    cmp r6, r4
    movne r3, #0x1
    moveq r3, #0x0
    mov r0, r6
    mov r1, r8
    mov r2, #0xf
    str r7, [sp]
    bl func_ov002_021dd950
    b .L_1b2c
.L_15a4:
    mov r3, #0x1
    mov r0, r6
    mov r1, r8
    mov r2, r7
    str r3, [sp]
    mov r3, r5
    bl func_ov002_021c229c
    cmp r0, #0x0
    beq .L_1b2c
    cmp r6, r4
    movne r2, #0x1
    moveq r2, #0x0
    add r3, r2, #0x2
    mov r0, r6
    mov r1, r8
    mov r2, #0xe
    str r7, [sp]
    bl func_ov002_021dd950
    b .L_1b2c
.L_15f0:
    cmp r5, #0x5
    blt .L_1b2c
    ldr r1, _LIT8
    and r2, r4, #0x1
    mov r0, #0x14
    mul r6, r2, r1
    ldr r3, _LIT11
    mul r2, r5, r0
    add r0, r3, r6
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    beq .L_1b2c
    mov r0, r4
    add r1, r1, #0xc00
    bl func_ov002_021d96ec
    cmp r0, #0x0
    beq .L_1b2c
    ldr r0, _LIT9
    mov r9, #0x5
    add r0, r0, r6
    ldr r6, _LIT13
    add r7, r0, #0x94
    add r8, r0, #0x64
    mov fp, #0xe
    add sl, r6, #0x2f
.L_1654:
    cmp r9, r5
    beq .L_16bc
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r1, r0, lsr #0x13
    ldrneh r0, [r8, #0x38]
    cmpne r0, #0x0
    beq .L_16bc
    cmp r1, r6
    bhi .L_1684
    beq .L_16a4
    b .L_16bc
.L_1684:
    sub r0, r1, sl
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_16bc
    b .L_16a4
    b .L_16a4
    b .L_16a4
    b .L_16a4
.L_16a4:
    mov r0, r4
    mov r1, r9
    mov r2, fp
    mov r3, #0x0
    str r6, [sp]
    bl func_ov002_021dd950
.L_16bc:
    add r7, r7, #0x14
    add r8, r8, #0x14
    add r9, r9, #0x1
    cmp r9, #0xa
    blt .L_1654
    b .L_1b2c
.L_16d4:
    cmp r5, #0x5
    blt .L_1b2c
    ldr r0, _LIT8
    and r2, r4, #0x1
    mov r1, #0x14
    mul r6, r2, r0
    ldr r0, _LIT11
    mul r1, r5, r1
    add r0, r0, r6
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_1b2c
    ldr r1, _LIT14
    mov r0, r4
    bl func_ov002_021d96ec
    cmp r0, #0x0
    beq .L_1b2c
    ldr r0, _LIT9
    ldr fp, _LIT14
    add r0, r0, r6
    mov sl, #0x5
    add r8, r0, #0x94
    add r9, r0, #0x64
    sub r6, fp, #0x1
    sub r7, fp, #0x2
.L_1738:
    cmp sl, r5
    beq .L_1780
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r1, r0, lsr #0x13
    ldrneh r0, [r9, #0x38]
    cmpne r0, #0x0
    beq .L_1780
    cmp r1, r7
    cmpne r1, r6
    cmpne r1, fp
    bne .L_1780
    mov r0, r4
    mov r1, sl
    mov r2, #0xe
    mov r3, #0x0
    str fp, [sp]
    bl func_ov002_021dd950
.L_1780:
    add r8, r8, #0x14
    add r9, r9, #0x14
    add sl, sl, #0x1
    cmp sl, #0xa
    blt .L_1738
    b .L_1b2c
.L_1798:
    cmp r5, #0x5
    blt .L_1b2c
    ldr r0, _LIT8
    and r2, r4, #0x1
    mul r6, r2, r0
    mov r1, #0x14
    mul r0, r5, r1
    ldr r3, _LIT10
    ldr r2, _LIT11
    add r1, r3, r6
    ldr r5, [r0, r1]
    add r3, r2, r6
    mov r2, r5, lsr #0x6
    mov r1, r5, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r5, lsr #0x1
    ldrh r3, [r0, r3]
    and r1, r1, #0x1
    mvn r2, r2
    mvn r0, r1
    and r1, r3, r2
    tst r1, r0
    beq .L_1b2c
    mov r0, #0x0
    str r0, [sp, #0x18]
    mov r5, r0
    mov r6, #0x1
    mov fp, #0xb
.L_1808:
    ldr r0, _LIT7
    mov sl, #0x0
    ldr r1, [r0, #0xcec]
    ldr r0, [sp, #0x18]
    eor r9, r1, r0
    ldr r1, _LIT8
    ldr r0, _LIT9
    and r2, r9, #0x1
    mla r7, r2, r1, r0
    add r8, r7, #0x30
.L_1830:
    ldrh r0, [r7, #0x38]
    cmp r0, #0x0
    beq .L_1878
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e328
    cmp r0, #0x0
    beq .L_1878
    ldr r0, _LIT1
    cmp r9, r4
    movne r3, r6
    str r0, [sp]
    moveq r3, r5
    mov r0, r9
    mov r1, sl
    mov r2, fp
    bl func_ov002_021dd950
.L_1878:
    add r7, r7, #0x14
    add r8, r8, #0x14
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_1830
    ldr r0, [sp, #0x18]
    add r0, r0, #0x1
    str r0, [sp, #0x18]
    cmp r0, #0x2
    blt .L_1808
    b .L_1b2c
.L_18a4:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_1b2c
    mov fp, #0x0
    mov r6, fp
    mov r8, #0x1
    mov r5, #0xe
.L_18c4:
    ldr r0, _LIT7
    mov sl, #0x0
    ldr r0, [r0, #0xcec]
    eor r9, r0, fp
.L_18d4:
    mov r0, r9
    mov r1, sl
    mov r2, r7
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1910
    cmp r9, r4
    movne r0, r8
    moveq r0, r6
    add r3, r0, #0x2
    mov r0, r9
    mov r1, sl
    mov r2, r5
    str r7, [sp]
    bl func_ov002_021dd950
.L_1910:
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_18d4
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_18c4
    b .L_1b2c
.L_192c:
    cmp r5, #0x5
    blt .L_1b2c
    ldr r0, _LIT8
    and r2, r4, #0x1
    mov r1, #0x14
    mul r0, r2, r0
    ldr r3, _LIT10
    ldr r2, _LIT11
    mul r8, r5, r1
    add r1, r3, r0
    ldr r5, [r8, r1]
    add r3, r2, r0
    mov r2, r5, lsr #0x6
    mov r1, r5, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r5, lsr #0x1
    and r1, r1, #0x1
    ldrh r3, [r8, r3]
    mvn r2, r2
    mvn r1, r1
    and r2, r3, r2
    tst r2, r1
    beq .L_1b2c
    ldr r2, _LIT9
    mov r1, #0x0
    add r0, r2, r0
    str r1, [sp, #0x1c]
    add r6, r0, #0x30
    mov fp, r1
    mov r5, #0x1
.L_19a4:
    ldr r0, _LIT7
    mov sl, #0x0
    ldr r1, [r0, #0xcec]
    ldr r0, [sp, #0x1c]
    eor r9, r1, r0
.L_19b8:
    mov r0, r9
    mov r1, sl
    mov r2, r7
    ldr ip, [r6, r8]
    mov r3, ip, lsl #0x12
    mov ip, ip, lsl #0x2
    mov ip, ip, lsr #0x18
    mov ip, ip, lsl #0x1
    add r3, ip, r3, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_1a08
    cmp r9, r4
    movne r3, r5
    moveq r3, fp
    mov r0, r9
    mov r1, sl
    mov r2, #0xb
    str r7, [sp]
    bl func_ov002_021dd950
.L_1a08:
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_19b8
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x1
    str r0, [sp, #0x1c]
    cmp r0, #0x2
    blt .L_19a4
    b .L_1b2c
.L_1a2c:
    mov r0, #0x0
    str r0, [sp, #0x20]
.L_1a34:
    ldr r0, _LIT7
    mov sl, #0x0
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x20]
    ldr r2, _LIT9
    eor r9, r3, r0
    ldr r1, _LIT8
    and r0, r9, #0x1
    mla r1, r0, r1, r2
    add r8, r1, #0x30
    mov fp, #0x1
    mov r6, sl
.L_1a64:
    mov r0, r9
    mov r1, sl
    mov r2, r4
    mov r3, r5
    bl func_ov002_021b34f4
    cmp r0, #0x0
    bne .L_1ab4
    ldr r3, [sp, #0x4]
    mov r0, r9
    ldr ip, [r3]
    mov r1, sl
    mov r3, ip, lsl #0x12
    mov ip, ip, lsl #0x2
    mov ip, ip, lsr #0x18
    mov ip, ip, lsl #0x1
    mov r2, r7
    add r3, ip, r3, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_1b08
.L_1ab4:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1b08
    str r6, [sp]
    mov r0, r9
    mov r1, sl
    mov r2, r7
    mov r3, r5
    bl func_ov002_021c229c
    cmp r0, #0x0
    beq .L_1b08
    cmp r9, r4
    movne r0, fp
    moveq r0, #0x0
    add r3, r0, #0x2
    mov r0, r9
    mov r1, sl
    mov r2, #0xe
    str r7, [sp]
    bl func_ov002_021dd950
.L_1b08:
    add r8, r8, #0x14
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_1a64
    ldr r0, [sp, #0x20]
    add r0, r0, #0x1
    str r0, [sp, #0x20]
    cmp r0, #0x2
    blt .L_1a34
.L_1b2c:
    ldr r0, [sp, #0x4]
    ldrh sl, [r0, #0xa]
    cmp sl, #0x0
    addeq sp, sp, #0x28
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x8]
    mov r5, #0x0
    ldr r7, _LIT15
    and r9, r0, #0x400000
    mov r6, #0x2
    mov r4, r5
    mov fp, #0xe
.L_1b5c:
    add r8, r7, sl, lsl #0x3
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0xc]
    mov r0, r8
    bl func_ov002_021b43a4
    cmp r0, #0x0
    ldrh sl, [r8, #0x6]
    beq .L_1bb8
    ldrh r2, [r8]
    cmp r0, #0x1
    moveq r3, r6
    mov r1, r2, asr #0x8
    and r0, r2, #0xff
    ldr r2, [sp, #0x14]
    movne r3, r5
    add r3, r3, r2, lsl #0x14
    ldr r2, [sp, #0x10]
    and r1, r1, #0xff
    add r3, r3, r2, lsl #0x15
    mov r2, fp
    add r3, r9, r3
    str r4, [sp]
    bl func_ov002_021dd950
.L_1bb8:
    cmp sl, #0x0
    bne .L_1b5c
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000017b7
_LIT1: .word 0x0000150e
_LIT2: .word 0x000012d3
_LIT3: .word 0x0000137d
_LIT4: .word 0x00001768
_LIT5: .word 0x00001625
_LIT6: .word 0x00001a2d
_LIT7: .word data_ov002_022d016c
_LIT8: .word 0x00000868
_LIT9: .word data_ov002_022cf16c
_LIT10: .word data_ov002_022cf1ac
_LIT11: .word data_ov002_022cf1a4
_LIT12: .word 0x0000ffff
_LIT13: .word 0x00001468
_LIT14: .word 0x000017af
_LIT15: .word data_ov002_022d0650
