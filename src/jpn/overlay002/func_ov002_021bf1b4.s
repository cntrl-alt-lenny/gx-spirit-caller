; func_ov002_021bf1b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c8
        .extern data_ov002_022cf0cc
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_0202e2bc
        .extern func_0202e3d8
        .extern func_0202e748
        .extern func_0202f184
        .extern func_0202f1c4
        .extern func_0202f548
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b306c
        .extern func_ov002_021b30d8
        .extern func_ov002_021b3160
        .extern func_ov002_021b3414
        .extern func_ov002_021b34bc
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b4040
        .extern func_ov002_021b8fc8
        .extern func_ov002_021b9dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021bb82c
        .extern func_ov002_021bbae0
        .extern func_ov002_021bbb78
        .extern func_ov002_021bbb88
        .extern func_ov002_021bbe70
        .extern func_ov002_021bc08c
        .extern func_ov002_021bd0b8
        .extern func_ov002_021bd5e8
        .extern func_ov002_021c19f0
        .extern func_ov002_021c1c6c
        .extern func_ov002_021c8390
        .extern func_ov002_021c8400
        .extern func_ov002_021c8860
        .global func_ov002_021bf1b4
        .arm
func_ov002_021bf1b4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    mov sl, r2
    mov r9, r3
    str r0, [sp]
    str r1, [sp, #0x4]
    bl func_ov002_021b9dec
    mov fp, r0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b9dec
    mov r4, r0
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021c19f0
    mov r5, r0
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021c1c6c
    cmp r4, #0x0
    mov r6, r0
    addeq sp, sp, #0x28
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT0
    ldr r0, [sp]
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_eb4
    ldr r0, [sp]
    ldr r2, _LIT0
    rsb r0, r0, #0x1
    mov r1, #0xb
    bl func_ov002_021b4040
    cmp r0, #0x0
    addeq sp, sp, #0x28
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT0
    mov r0, sl
    mov r1, r9
    mov r3, #0x0
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_eb4:
    ldr r0, [sp]
    ldr r2, _LIT1
    and r3, r0, #0x1
    mul r0, r3, r2
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x4]
    mov r1, #0x14
    mul r1, r0, r1
    ldr r3, _LIT2
    ldr r0, [sp, #0xc]
    str r1, [sp, #0x10]
    add r1, r3, r0
    ldr r0, [sp, #0x10]
    ldr r2, _LIT3
    ldr r3, [r0, r1]
    ldr r0, [sp, #0xc]
    mov r1, r3, lsr #0x6
    add r0, r2, r0
    str r0, [sp, #0x20]
    mov r0, r3, lsr #0x2
    orr r0, r0, r3, lsr #0x1
    and r3, r1, #0x1
    and r2, r0, #0x1
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x10]
    ldrh r7, [r1, r0]
    mvn r1, r3
    mvn r0, r2
    and r1, r7, r1
    tst r1, r0
    beq .L_106c
    ldr r0, _LIT4
    cmp fp, r0
    bgt .L_f64
    bge .L_fa0
    ldr r0, _LIT5
    cmp fp, r0
    bgt .L_f54
    beq .L_f94
    b .L_106c
.L_f54:
    add r0, r0, #0x7
    cmp fp, r0
    beq .L_fa0
    b .L_106c
.L_f64:
    ldr r0, _LIT6
    cmp fp, r0
    bgt .L_f84
    bge .L_fe8
    sub r0, r0, #0xf6
    cmp fp, r0
    beq .L_fa0
    b .L_106c
.L_f84:
    add r0, r0, #0x2b
    cmp fp, r0
    beq .L_100c
    b .L_106c
.L_f94:
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fa0:
    ldr r2, _LIT7
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021b4040
    cmp r0, #0x0
    addeq sp, sp, #0x28
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, [sp]
    ldr r3, [sp, #0x4]
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3414
    cmp r0, #0x0
    beq .L_106c
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fe8:
    ldr r2, _LIT7
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021b4040
    cmp r0, #0x0
    bne .L_106c
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_100c:
    ldr r1, _LIT8
    ldr r0, [sp, #0xc]
    add r1, r1, r0
    ldr r0, [sp, #0x10]
    ldr r0, [r0, r1]
    cmp r0, #0x0
    beq .L_106c
    ldr r2, _LIT7
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021b4040
    cmp r0, #0x0
    addeq sp, sp, #0x28
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, [sp]
    ldr r3, [sp, #0x4]
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3414
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_106c:
    ldr r2, _LIT9
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021b306c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT10
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021b306c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT11
    ldr r0, [sp]
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_10dc
    ldr r2, _LIT11
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3dec
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10dc:
    and r0, r5, #0x2
    str r0, [sp, #0x18]
    cmp r0, #0x0
    bgt .L_1118
    ldr r1, _LIT12
    mov r0, sl
    bl func_ov002_021b34bc
    cmp r0, #0x0
    ble .L_1118
    ldr r2, _LIT12
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b2fcc
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1118:
    and r0, r6, #0x2
    str r0, [sp, #0x1c]
    cmp r0, #0x0
    bgt .L_11c0
    ldr r2, _LIT13
    ldr r0, _LIT1
    and r1, sl, #0x1
    mla r0, r1, r0, r2
    mov r6, #0x0
    ldr r8, _LIT14
    mov r5, r6
    add r7, r0, #0x30
.L_1148:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1180
    mov r0, sl
    mov r1, r5
    mov r2, r8
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_1180
    cmp r5, r9
    moveq r6, #0x0
    beq .L_1190
    add r6, r6, #0x1
.L_1180:
    add r7, r7, #0x14
    add r5, r5, #0x1
    cmp r5, #0x4
    ble .L_1148
.L_1190:
    cmp r6, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT15
    ldr r0, [sp]
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11c0:
    ldr r0, _LIT1
    and r1, sl, #0x1
    mul r0, r1, r0
    ldr r1, _LIT13
    ldr r8, _LIT16
    add r7, r1, r0
    str r0, [sp, #0x14]
    mov r6, #0x0
    add r5, r7, #0x30
.L_11e4:
    cmp r6, r9
    beq .L_1220
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1220
    mov r0, sl
    mov r1, r6
    mov r2, r8
    mov r3, sl
    bl func_ov002_021b30d8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1220:
    add r5, r5, #0x14
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_11e4
    mov r0, #0x14
    mul r0, r9, r0
    str r0, [sp, #0x8]
    ldr r1, _LIT2
    ldr r0, [sp, #0x14]
    ldr r2, _LIT3
    add r1, r1, r0
    ldr r0, [sp, #0x8]
    ldr r0, [r0, r1]
    ldr r1, [sp, #0x14]
    add r2, r2, r1
    ldr r1, [sp, #0x8]
    str r2, [sp, #0x24]
    ldrh r2, [r2, r1]
    mov r1, r0, lsr #0x6
    and r1, r1, #0x1
    mvn r1, r1
    and r2, r2, r1
    mov r1, r0, lsr #0x2
    orr r0, r1, r0, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r2, r0
    beq .L_13f4
    ldr r1, _LIT17
    cmp r4, r1
    bgt .L_12e8
    bge .L_1358
    sub r0, r1, #0x59
    cmp r4, r0
    bgt .L_12b4
    beq .L_132c
    b .L_13f4
.L_12b4:
    sub r0, r1, #0x47
    cmp r4, r0
    bgt .L_13f4
    sub r0, r1, #0x4a
    cmp r4, r0
    blt .L_13f4
    beq .L_130c
    sub r0, r1, #0x48
    cmp r4, r0
    subne r0, r1, #0x47
    cmpne r4, r0
    beq .L_132c
    b .L_13f4
.L_12e8:
    add r0, r1, #0xc6
    cmp r4, r0
    bgt .L_12fc
    beq .L_132c
    b .L_13f4
.L_12fc:
    ldr r0, _LIT18
    cmp r4, r0
    beq .L_13cc
    b .L_13f4
.L_130c:
    mov r0, sl
    mov r1, #0xd
    bl func_ov002_021bbb78
    cmp r0, #0x0
    beq .L_13f4
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_132c:
    mov r0, r4
    bl func_0202b824
    mov r1, r0
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bbae0
    cmp r0, #0x0
    beq .L_13f4
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1358:
    ldr r1, _LIT13
    ldr r0, [sp, #0x14]
    mov r8, #0x0
    add r6, r1, r0
    add r5, r6, #0x30
.L_136c:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r6, #0x38]
    cmpne r0, #0x0
    beq .L_13b4
    mov r0, sl
    mov r1, r8
    bl func_ov002_021b8fc8
    cmp r0, #0x0
    beq .L_13b4
    mov r0, sl
    mov r1, r8
    bl func_ov002_021c8400
    cmp r0, #0x3
    addle sp, sp, #0x28
    movle r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13b4:
    add r5, r5, #0x14
    add r6, r6, #0x14
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_136c
    b .L_13f4
.L_13cc:
    mov r0, r4
    bl func_0202b83c
    mov r1, r0
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bbb88
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13f4:
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_1554
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c8860
    cmp r0, #0xa
    bne .L_143c
    ldr r1, _LIT19
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_143c:
    mov r0, r4
    bl func_0202e748
    cmp r0, #0x0
    ldrne r1, _LIT20
    cmpne r4, r1
    beq .L_1470
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1470:
    mov r0, r4
    bl func_0202e3d8
    cmp r0, #0x0
    ldrne r1, _LIT21
    cmpne r4, r1
    beq .L_14a4
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_14a4:
    mov r0, r4
    bl func_0202f184
    cmp r0, #0x0
    ldrne r1, _LIT22
    cmpne r4, r1
    beq .L_14d8
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_14d8:
    ldr r3, [sp]
    mov r0, sl
    mov r1, r9
    mov r2, #0x1980
    rsb r3, r3, #0x1
    bl func_ov002_021b3160
    cmp r0, #0x0
    beq .L_1524
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    bgt .L_1524
    ldr r1, [sp, #0x4]
    ldr r0, [sp]
    bl func_ov002_021c8390
    ldr r1, _LIT23
    cmp r0, r1
    addge sp, sp, #0x28
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1524:
    mov r0, r4
    bl func_0202f548
    cmp r0, #0x0
    beq .L_1554
    ldr r1, _LIT24
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1554:
    ldr r0, [sp, #0x50]
    cmp r0, #0x0
    beq .L_19b0
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x10]
    ldr r2, _LIT2
    ldrh r1, [r1, r0]
    ldr r0, [sp, #0xc]
    add r2, r2, r0
    ldr r0, [sp, #0x10]
    ldr r2, [r0, r2]
    mov r0, r2, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r1, r1, r0
    mov r0, r2, lsr #0x2
    orr r0, r0, r2, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r1, r0
    beq .L_1644
    ldr r1, _LIT25
    cmp fp, r1
    bgt .L_15e8
    bge .L_15f4
    sub r0, r1, #0x26
    cmp fp, r0
    bgt .L_1644
    sub r0, r1, #0x28
    cmp fp, r0
    blt .L_1644
    subne r0, r1, #0x27
    cmpne fp, r0
    subne r0, r1, #0x26
    cmpne fp, r0
    beq .L_15f4
    b .L_1644
.L_15e8:
    ldr r0, _LIT26
    cmp fp, r0
    bne .L_1644
.L_15f4:
    mov r0, sl
    bl func_ov002_021bd0b8
    cmp r0, #0x0
    beq .L_1644
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_1638
    ldr r0, [sp, #0x8]
    add r0, r7, r0
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2bc
    cmp r0, #0x0
    bne .L_1644
.L_1638:
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1644:
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldr r3, _LIT2
    ldrh r2, [r1, r0]
    ldr r0, [sp, #0x14]
    add r1, r3, r0
    ldr r0, [sp, #0x8]
    ldr r3, [r0, r1]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    orr r0, r0, r3, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    beq .L_1734
    ldr r0, _LIT27
    cmp r4, r0
    bgt .L_16ac
    bge .L_16ec
    sub r0, r0, #0x34
    cmp r4, r0
    beq .L_16d0
    b .L_1734
.L_16ac:
    ldr r0, _LIT28
    cmp r4, r0
    bgt .L_16c0
    beq .L_1708
    b .L_1734
.L_16c0:
    add r0, r0, #0x268
    cmp r4, r0
    beq .L_1714
    b .L_1734
.L_16d0:
    mov r0, sl
    bl func_ov002_021bbe70
    cmp r0, #0x1
    ble .L_1734
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_16ec:
    ldr r0, _LIT29
    bl func_ov002_021bd5e8
    cmp r0, #0x0
    beq .L_1734
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1708:
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1714:
    mov r0, sl
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_021bc08c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1734:
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_1844
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c8860
    cmp r0, #0xf
    beq .L_1794
    cmp r0, #0x12
    beq .L_1770
    cmp r0, #0x13
    beq .L_17b8
    b .L_17e0
.L_1770:
    ldr r1, _LIT30
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_17e0
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1794:
    ldr r1, _LIT31
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_17e0
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_17b8:
    ldr r1, _LIT32
    cmp r4, r1
    beq .L_17e0
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bad9c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_17e0:
    ldr r0, _LIT33
    cmp r4, r0
    beq .L_181c
    mov r0, r4
    bl func_0202f1c4
    cmp r0, #0x0
    beq .L_181c
    ldr r1, _LIT33
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bad9c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_181c:
    ldr r1, _LIT34
    cmp r4, r1
    beq .L_1844
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bad9c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1844:
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    bgt .L_18ac
    ldr r1, _LIT35
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_18ac
    ldr r1, _LIT36
    mov r0, sl
    bl func_ov002_021bb82c
    cmp r0, #0x0
    beq .L_18ac
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    addeq sp, sp, #0x28
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT36
    cmp r4, r0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18ac:
    ldr r1, _LIT37
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_18fc
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    bne .L_18fc
    ldr r1, _LIT38
    ldr r0, [sp, #0x14]
    add r1, r1, r0
    ldr r0, [sp, #0x8]
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18fc:
    ldr r5, _LIT39
    mov r4, #0x0
.L_1904:
    cmp r4, r9
    beq .L_1960
    mov r0, sl
    mov r1, r4
    bl func_ov002_021b9dec
    cmp r0, r5
    bne .L_1960
    ldr r3, [r7, #0x40]
    ldrh r2, [r7, #0x38]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    ldrneh r0, [r7, #0x36]
    cmpne r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1960:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r7, r7, #0x14
    blt .L_1904
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    bgt .L_19b0
    ldr r2, _LIT40
    ldr r0, [sp]
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_19b0
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    addeq sp, sp, #0x28
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19b0:
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000015ff
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0cc
_LIT3: .word data_ov002_022cf0c4
_LIT4: .word 0x00001644
_LIT5: .word 0x000014fe
_LIT6: .word 0x00001a4e
_LIT7: .word 0x00001505
_LIT8: .word data_ov002_022cf0c8
_LIT9: .word 0x00001561
_LIT10: .word 0x00001852
_LIT11: .word 0x00001669
_LIT12: .word 0x00001318
_LIT13: .word data_ov002_022cf08c
_LIT14: .word 0x000017fc
_LIT15: .word 0x000017fd
_LIT16: .word 0x000015ea
_LIT17: .word 0x0000179d
_LIT18: .word 0x00001b7e
_LIT19: .word 0x00001703
_LIT20: .word 0x0000160f
_LIT21: .word 0x0000168c
_LIT22: .word 0x000018a0
_LIT23: .word 0x0000076c
_LIT24: .word 0x00001aeb
_LIT25: .word 0x000012a5
_LIT26: .word 0x0000154a
_LIT27: .word 0x000013cd
_LIT28: .word 0x0000164e
_LIT29: .word 0x000010f4
_LIT30: .word 0x000016ed
_LIT31: .word 0x000014c6
_LIT32: .word 0x00001a2f
_LIT33: .word 0x00001a1e
_LIT34: .word 0x00001a56
_LIT35: .word 0x00001777
_LIT36: .word 0x00001770
_LIT37: .word 0x000018b1
_LIT38: .word data_ov002_022cf0c2
_LIT39: .word 0x000019a4
_LIT40: .word 0x000014d4
