; func_ov002_021dbea8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_0202b824
        .extern func_0202e2bc
        .extern func_0202e2d4
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b3414
        .extern func_ov002_021b3538
        .extern func_ov002_021b38e4
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b42c4
        .extern func_ov002_021b9dec
        .extern func_ov002_021c1c48
        .extern func_ov002_021c1d40
        .extern func_ov002_021c21bc
        .extern func_ov002_021d93bc
        .extern func_ov002_021d95fc
        .extern func_ov002_021dbea8
        .global func_ov002_021dbea8
        .arm
func_ov002_021dbea8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r8, r2
    and r2, r8, #0x2
    mov r5, r0
    cmp r2, #0x0
    movgt r0, #0x1
    mov r4, r1
    strgt r0, [sp, #0x4]
    movle r0, #0x0
    strle r0, [sp, #0x4]
    mov r6, r3
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9dec
    mov r7, r0
    mov r0, r6
    bl func_0202b824
    cmp r0, #0x16
    bne .L_70
    ldr r2, [sp, #0x30]
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c1c48
    cmp r0, #0x0
    beq .L_9c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_70:
    mov r0, r6
    bl func_0202b824
    cmp r0, #0x17
    bne .L_9c
    ldr r2, [sp, #0x30]
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c1d40
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9c:
    cmp r4, #0x4
    bgt .L_104
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_104
    ldr r2, _LIT0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    beq .L_104
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021b38e4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    mov r3, #0x0
    and r0, r0, #0xff
    and r1, r1, #0xff
    mov r2, #0x2
    str r3, [sp]
    bl func_ov002_021dbea8
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_104:
    cmp r4, #0x5
    blt .L_150
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    cmpne r6, #0x0
    beq .L_150
    ldr r2, _LIT1
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_150
    ldr r3, _LIT1
    mov r0, r5
    mov r1, r4
    mvn r2, #0x0
    bl func_ov002_021d93bc
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_150:
    cmp r7, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    add r2, r4, r5, lsl #0x4
    ldr r1, [r0, #0xd4]
    mov r3, #0x1
    tst r1, r3, lsl r2
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    orr r1, r1, r3, lsl r2
    ldr r2, _LIT3
    str r1, [r0, #0xd4]
    cmp r7, r2
    bgt .L_2a4
    bge .L_7a8
    ldr r0, _LIT4
    cmp r7, r0
    bgt .L_240
    bge .L_870
    sub r0, r0, #0x1a8
    cmp r7, r0
    ldr r0, _LIT4
    bgt .L_1f0
    sub r0, r0, #0x1a8
    cmp r7, r0
    bge .L_574
    ldr r0, _LIT4
    sub r0, r0, #0x250
    cmp r7, r0
    bgt .L_1e0
    ldr r0, _LIT4
    sub r0, r0, #0x250
    cmp r7, r0
    beq .L_3a8
    b .L_bc4
.L_1e0:
    ldr r0, _LIT5
    cmp r7, r0
    beq .L_580
    b .L_bc4
.L_1f0:
    sub r0, r0, #0xa6
    cmp r7, r0
    ldr r0, _LIT4
    bgt .L_21c
    sub r0, r0, #0xa6
    cmp r7, r0
    bge .L_6c4
    ldr r0, _LIT6
    cmp r7, r0
    beq .L_46c
    b .L_bc4
.L_21c:
    sub r0, r0, #0x77
    sub r0, r7, r0
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_bc4
    b .L_6c4
    b .L_6c4
    b .L_6c4
    b .L_6c4
.L_240:
    ldr r1, _LIT7
    cmp r7, r1
    bgt .L_274
    bge .L_46c
    sub r0, r1, #0xbc
    cmp r7, r0
    bgt .L_264
    beq .L_580
    b .L_bc4
.L_264:
    sub r0, r1, #0x7d
    cmp r7, r0
    beq .L_580
    b .L_bc4
.L_274:
    ldr r0, _LIT8
    cmp r7, r0
    bgt .L_294
    bge .L_7a8
    sub r0, r0, #0x45
    cmp r7, r0
    beq .L_46c
    b .L_bc4
.L_294:
    add r0, r0, #0x1
    cmp r7, r0
    beq .L_7a8
    b .L_bc4
.L_2a4:
    ldr r0, _LIT9
    cmp r7, r0
    bgt .L_31c
    bge .L_95c
    sub r1, r0, #0x1ac
    cmp r7, r1
    bgt .L_2ec
    sub r0, r0, #0x1ac
    cmp r7, r0
    bge .L_574
    add r0, r2, #0x8
    cmp r7, r0
    bgt .L_2e0
    beq .L_46c
    b .L_bc4
.L_2e0:
    cmp r7, #0x1880
    beq .L_574
    b .L_bc4
.L_2ec:
    sub r1, r0, #0x2
    cmp r7, r1
    bgt .L_30c
    bge .L_95c
    sub r0, r0, #0x56
    cmp r7, r0
    beq .L_574
    b .L_bc4
.L_30c:
    sub r0, r0, #0x1
    cmp r7, r0
    beq .L_95c
    b .L_bc4
.L_31c:
    add r1, r0, #0x51
    cmp r7, r1
    bgt .L_378
    bge .L_46c
    add r1, r0, #0x15
    cmp r7, r1
    bgt .L_368
    bge .L_46c
    add r1, r0, #0x9
    cmp r7, r1
    bgt .L_bc4
    add r1, r0, #0x1
    cmp r7, r1
    blt .L_bc4
    beq .L_95c
    add r0, r0, #0x9
    cmp r7, r0
    beq .L_46c
    b .L_bc4
.L_368:
    add r0, r0, #0x4f
    cmp r7, r0
    beq .L_a30
    b .L_bc4
.L_378:
    add r1, r0, #0x6e
    cmp r7, r1
    bgt .L_398
    bge .L_46c
    add r0, r0, #0x68
    cmp r7, r0
    beq .L_b14
    b .L_bc4
.L_398:
    add r0, r0, #0x138
    cmp r7, r0
    beq .L_46c
    b .L_bc4
.L_3a8:
    tst r8, #0x8
    bne .L_bc4
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_bc4
    mov r8, #0x0
    mov r6, r8
    mov r7, r3
    mov fp, #0x2
.L_3cc:
    ldr r1, _LIT10
    ldr r0, _LIT11
    and r2, r8, #0x1
    mla sl, r2, r1, r0
    mov r9, #0x0
.L_3e0:
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
    beq .L_44c
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b9dec
    bl func_0202e2bc
    cmp r0, #0x0
    beq .L_44c
    cmp r8, r5
    movne r1, r7
    moveq r1, r6
    str r1, [sp]
    mov r0, r8
    mov r1, r9
    mov r2, fp
    mov r3, #0x0
    bl func_ov002_021dbea8
.L_44c:
    add r9, r9, #0x1
    cmp r9, #0x5
    add sl, sl, #0x14
    blt .L_3e0
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_3cc
    b .L_bc4
.L_46c:
    ldr r0, _LIT10
    and r2, r5, #0x1
    mul r8, r2, r0
    mov r1, #0x14
    mul r0, r4, r1
    ldr r3, _LIT12
    ldr r2, _LIT13
    add r1, r3, r8
    ldr r6, [r0, r1]
    add r3, r2, r8
    mov r2, r6, lsr #0x6
    mov r1, r6, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r6, lsr #0x1
    ldrh r3, [r0, r3]
    and r1, r1, #0x1
    mvn r2, r2
    mvn r0, r1
    and r1, r3, r2
    tst r1, r0
    beq .L_bc4
    mov fp, #0x1
    mov r9, #0x0
    mov r6, fp
.L_4cc:
    ldr r1, _LIT10
    ldr r0, _LIT11
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    mov sl, #0x0
    add r8, r0, #0x30
.L_4e4:
    mov r0, r9
    mov r1, sl
    mov r2, r5
    mov r3, r4
    bl func_ov002_021b3414
    cmp r0, #0x0
    beq .L_554
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_554
    str r6, [sp]
    mov r0, r9
    mov r1, sl
    mov r2, r7
    mov r3, r4
    bl func_ov002_021c21bc
    cmp r0, #0x0
    beq .L_554
    cmp r9, r5
    movne r0, fp
    moveq r0, #0x0
    str r0, [sp]
    mov r0, r9
    mov r1, sl
    mov r2, #0x2
    mov r3, r7
    bl func_ov002_021dbea8
.L_554:
    add r8, r8, #0x14
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_4e4
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_4cc
    b .L_bc4
.L_574:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_bc4
.L_580:
    ldr r1, _LIT10
    and r2, r5, #0x1
    mov r0, #0x14
    mul r3, r2, r1
    ldr r2, _LIT12
    ldr r1, _LIT13
    mul r0, r4, r0
    add r2, r2, r3
    ldr r6, [r0, r2]
    add r3, r1, r3
    mov r2, r6, lsr #0x6
    mov r1, r6, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r6, lsr #0x1
    and r1, r1, #0x1
    ldrh r3, [r0, r3]
    mvn r2, r2
    mvn r0, r1
    and r1, r3, r2
    tst r1, r0
    beq .L_bc4
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b3538
    ldr r1, _LIT14
    cmp r0, r1
    beq .L_bc4
    and r6, r0, #0xff
    ldr r1, _LIT10
    and r2, r6, #0x1
    mul r1, r2, r1
    mov r0, r0, asr #0x8
    ldr r2, _LIT11
    and r8, r0, #0xff
    mov r0, #0x14
    smulbb r0, r8, r0
    add r2, r2, r1
    add r2, r2, r0
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    beq .L_bc4
    ldr r2, _LIT13
    add r1, r2, r1
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    beq .L_bc4
    ldr r0, _LIT15
    cmp r7, r0
    cmpne r7, #0x1880
    addne r0, r0, #0x25c
    cmpne r7, r0
    bne .L_67c
    cmp r6, r5
    movne r9, #0x1
    moveq r9, #0x0
    mov r0, r6
    mov r1, r8
    mov r3, r7
    mov r2, #0x0
    str r9, [sp]
    bl func_ov002_021dbea8
    b .L_bc4
.L_67c:
    mov r9, #0x1
    mov r0, r6
    mov r1, r8
    mov r2, r7
    mov r3, r4
    str r9, [sp]
    bl func_ov002_021c21bc
    cmp r0, #0x0
    beq .L_bc4
    cmp r6, r5
    moveq r9, #0x0
    mov r0, r6
    mov r1, r8
    mov r3, r7
    mov r2, #0x2
    str r9, [sp]
    bl func_ov002_021dbea8
    b .L_bc4
.L_6c4:
    cmp r4, #0x5
    blt .L_bc4
    ldr r1, _LIT10
    and r2, r5, #0x1
    mov r0, #0x14
    mul r6, r2, r1
    ldr r3, _LIT13
    mul r2, r4, r0
    add r0, r3, r6
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    beq .L_bc4
    mov r0, r5
    add r1, r1, #0xc00
    bl func_ov002_021d95fc
    cmp r0, #0x0
    beq .L_bc4
    ldr r0, _LIT11
    mov r9, #0x5
    add r0, r0, r6
    ldr r6, _LIT16
    add r7, r0, #0x94
    add r8, r0, #0x64
    mov fp, #0x0
    add sl, r6, #0x2f
.L_728:
    cmp r9, r4
    beq .L_790
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r1, r0, lsr #0x13
    ldrneh r0, [r8, #0x38]
    cmpne r0, #0x0
    beq .L_790
    cmp r1, r6
    bhi .L_758
    beq .L_778
    b .L_790
.L_758:
    sub r0, r1, sl
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_790
    b .L_778
    b .L_778
    b .L_778
    b .L_778
.L_778:
    mov r0, r5
    mov r1, r9
    mov r2, fp
    mov r3, r6
    str fp, [sp]
    bl func_ov002_021dbea8
.L_790:
    add r9, r9, #0x1
    cmp r9, #0xa
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_728
    b .L_bc4
.L_7a8:
    cmp r4, #0x5
    blt .L_bc4
    ldr r0, _LIT10
    and r2, r5, #0x1
    mov r1, #0x14
    mul r6, r2, r0
    ldr r0, _LIT13
    mul r1, r4, r1
    add r0, r0, r6
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_bc4
    ldr r1, _LIT3
    mov r0, r5
    bl func_ov002_021d95fc
    cmp r0, #0x0
    beq .L_bc4
    ldr r0, _LIT11
    ldr fp, _LIT3
    add r0, r0, r6
    mov sl, #0x5
    add r8, r0, #0x94
    add r9, r0, #0x64
    sub r6, fp, #0x1
    sub r7, fp, #0x2
.L_80c:
    cmp sl, r4
    beq .L_858
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r1, r0, lsr #0x13
    ldrneh r0, [r9, #0x38]
    cmpne r0, #0x0
    beq .L_858
    cmp r1, r7
    cmpne r1, r6
    cmpne r1, fp
    bne .L_858
    mov r2, #0x0
    mov ip, r2
    mov r0, r5
    mov r1, sl
    mov r3, fp
    str ip, [sp]
    bl func_ov002_021dbea8
.L_858:
    add sl, sl, #0x1
    cmp sl, #0xa
    add r8, r8, #0x14
    add r9, r9, #0x14
    blt .L_80c
    b .L_bc4
.L_870:
    cmp r4, #0x5
    blt .L_bc4
    ldr r0, _LIT10
    and r2, r5, #0x1
    mul r7, r2, r0
    mov r1, #0x14
    mul r0, r4, r1
    ldr r3, _LIT12
    ldr r2, _LIT13
    add r1, r3, r7
    ldr r6, [r0, r1]
    add r3, r2, r7
    mov r2, r6, lsr #0x6
    mov r1, r6, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r6, lsr #0x1
    ldrh r3, [r0, r3]
    and r1, r1, #0x1
    mvn r2, r2
    mvn r0, r1
    and r1, r3, r2
    tst r1, r0
    beq .L_bc4
    mov r9, #0x0
    mov fp, r9
    mov r6, #0x1
.L_8d8:
    ldr r1, _LIT10
    ldr r0, _LIT11
    and r2, r9, #0x1
    mla r7, r2, r1, r0
    mov sl, #0x0
    add r8, r7, #0x30
.L_8f0:
    ldrh r0, [r7, #0x38]
    cmp r0, #0x0
    beq .L_938
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2d4
    cmp r0, #0x0
    beq .L_938
    cmp r9, r5
    movne r0, r6
    moveq r0, fp
    str r0, [sp]
    ldr r3, _LIT4
    mov r0, r9
    mov r1, sl
    mov r2, #0x0
    bl func_ov002_021dbea8
.L_938:
    add r7, r7, #0x14
    add r8, r8, #0x14
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_8f0
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_8d8
    b .L_bc4
.L_95c:
    mov r0, #0x14
    mul r1, r4, r0
    ldr r2, _LIT13
    ldr r0, _LIT10
    and r3, r5, #0x1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_bc4
    mov r9, #0x0
    mov fp, #0x1
    mov r6, r9
.L_98c:
    ldr r1, _LIT10
    ldr r0, _LIT11
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    mov sl, #0x0
    add r8, r0, #0x30
.L_9a4:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_a10
    mov r0, r9
    mov r1, sl
    mov r2, r7
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_a10
    str r6, [sp]
    mov r0, r9
    mov r1, sl
    mov r2, r7
    mov r3, r4
    bl func_ov002_021c21bc
    cmp r0, #0x0
    beq .L_a10
    cmp r9, r5
    movne r0, fp
    moveq r0, #0x0
    str r0, [sp]
    mov r0, r9
    mov r1, sl
    mov r2, #0x2
    mov r3, r7
    bl func_ov002_021dbea8
.L_a10:
    add r8, r8, #0x14
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_9a4
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_98c
    b .L_bc4
.L_a30:
    cmp r4, #0x5
    blt .L_bc4
    ldr r0, _LIT10
    and r2, r5, #0x1
    mov r1, #0x14
    mul r0, r2, r0
    ldr r3, _LIT12
    ldr r2, _LIT13
    mul r8, r4, r1
    add r1, r3, r0
    ldr r6, [r8, r1]
    add r3, r2, r0
    mov r2, r6, lsr #0x6
    mov r1, r6, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r6, lsr #0x1
    and r1, r1, #0x1
    ldrh r3, [r8, r3]
    mvn r2, r2
    mvn r1, r1
    and r2, r3, r2
    tst r2, r1
    beq .L_bc4
    ldr r1, _LIT11
    mov r9, #0x0
    add r0, r1, r0
    add r6, r0, #0x30
    mov fp, #0x1
.L_aa0:
    mov sl, #0x0
.L_aa4:
    ldr ip, [r6, r8]
    mov r0, r9
    mov r1, sl
    mov r2, r7
    mov r3, ip, lsl #0x12
    mov ip, ip, lsl #0x2
    mov ip, ip, lsr #0x18
    mov ip, ip, lsl #0x1
    add r3, ip, r3, lsr #0x1f
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_af8
    cmp r9, r5
    movne r1, fp
    moveq r1, #0x0
    str r1, [sp]
    mov r0, r9
    mov r1, sl
    mov r2, #0x0
    mov r3, r7
    bl func_ov002_021dbea8
.L_af8:
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_aa4
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_aa0
    b .L_bc4
.L_b14:
    mov r9, #0x0
    mov fp, r3
    mov r6, r9
.L_b20:
    ldr r1, _LIT10
    ldr r0, _LIT11
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    mov sl, #0x0
    add r8, r0, #0x30
.L_b38:
    mov r0, r9
    mov r1, sl
    mov r2, r5
    mov r3, r4
    bl func_ov002_021b3414
    cmp r0, #0x0
    beq .L_ba8
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_ba8
    str r6, [sp]
    mov r0, r9
    mov r1, sl
    mov r2, r7
    mov r3, r4
    bl func_ov002_021c21bc
    cmp r0, #0x0
    beq .L_ba8
    cmp r9, r5
    movne r0, fp
    moveq r0, #0x0
    str r0, [sp]
    mov r0, r9
    mov r1, sl
    mov r2, #0x2
    mov r3, r7
    bl func_ov002_021dbea8
.L_ba8:
    add r8, r8, #0x14
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_b38
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_b20
.L_bc4:
    ldr r0, _LIT10
    mov r1, #0x14
    ldr r2, _LIT17
    and r3, r5, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldrh sl, [r1, r0]
    cmp sl, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r4, #0x0
    ldr r8, _LIT18
    mov r6, #0x2
    mov fp, #0x1
    mov r7, r4
.L_c00:
    add r9, r8, sl, lsl #0x3
    ldr r1, [sp, #0x4]
    mov r0, r9
    mov r2, r7
    bl func_ov002_021b42c4
    cmp r0, #0x0
    ldrh sl, [r9, #0x6]
    beq .L_c54
    ldrh r2, [r9]
    cmp r0, #0x1
    mov r1, r2, asr #0x8
    and r0, r2, #0xff
    moveq r2, r6
    movne r2, r4
    cmp r0, r5
    movne r3, fp
    moveq r3, #0x0
    str r3, [sp]
    and r1, r1, #0xff
    mov r3, #0x0
    bl func_ov002_021dbea8
.L_c54:
    cmp sl, #0x0
    bne .L_c00
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001825
_LIT1: .word 0x00001513
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x000017af
_LIT4: .word 0x0000150e
_LIT5: .word 0x000012d3
_LIT6: .word 0x0000137d
_LIT7: .word 0x000016a2
_LIT8: .word 0x000017ad
_LIT9: .word 0x00001a2d
_LIT10: .word 0x00000868
_LIT11: .word data_ov002_022cf08c
_LIT12: .word data_ov002_022cf0cc
_LIT13: .word data_ov002_022cf0c4
_LIT14: .word 0x0000ffff
_LIT15: .word 0x00001625
_LIT16: .word 0x00001468
_LIT17: .word data_ov002_022cf0c6
_LIT18: .word data_ov002_022d0570
