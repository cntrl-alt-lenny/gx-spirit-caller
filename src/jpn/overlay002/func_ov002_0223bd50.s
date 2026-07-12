; func_ov002_0223bd50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022cdba8
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce640
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202b89c
        .extern func_02031630
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021b939c
        .extern func_ov002_021b9750
        .extern func_ov002_021b985c
        .extern func_ov002_021b99c8
        .extern func_ov002_021b9a84
        .extern func_ov002_021b9dec
        .extern func_ov002_021c83ac
        .extern func_ov002_021c9310
        .extern func_ov002_021c9424
        .extern func_ov002_021ca4dc
        .extern func_ov002_021d46ac
        .extern func_ov002_021d7a54
        .extern func_ov002_021d7b2c
        .extern func_ov002_021d8094
        .extern func_ov002_021de044
        .extern func_ov002_021de80c
        .extern func_ov002_0223b378
        .extern func_ov002_0223b494
        .extern func_ov002_0223b4dc
        .extern func_ov002_0223b5fc
        .extern func_ov002_0223b938
        .extern func_ov002_0223b970
        .extern func_ov002_0223ba38
        .extern func_ov002_0223bcc8
        .extern func_ov002_02254944
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_0227acc8
        .extern func_ov002_0229acd0
        .extern func_ov002_0229ce00
        .global func_ov002_0223bd50
        .arm
func_ov002_0223bd50:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x100
    mov r6, r0
    ldrh r4, [r6, #0x2]
    ldr r9, _LIT0
    mov r3, r4, lsl #0x11
    ldr r2, [r9, #0x5a8]
    mov r4, r4, lsl #0x1f
    mov r3, r3, lsr #0x1f
    cmp r2, #0x7c
    eor r4, r3, r4, lsr #0x1f
    bgt .L_58
    cmp r2, #0x7c
    bge .L_1e4
    cmp r2, #0x64
    bgt .L_8a8
    cmp r2, #0x63
    blt .L_8a8
    beq .L_814
    cmp r2, #0x64
    beq .L_3dc
    b .L_8a8
.L_58:
    sub r2, r2, #0x7d
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_8a8
    b .L_1d0
    b .L_cc
    b .L_ac
    b .L_78
.L_78:
    bl func_ov002_0223bcc8
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r6, #0x2]
    mov r1, #0x5b
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    add sp, sp, #0x100
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_ac:
    ldrh r2, [r6]
    mov r0, r4
    mov r1, #0x6
    mov r3, #0x0
    bl func_ov002_021af8f0
    add sp, sp, #0x100
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_cc:
    bl func_ov002_021afa94
    ldr r1, [r0]
    mov r0, r9
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    str r1, [r0, #0x69c]
    bl func_ov002_021afa94
    mov r5, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldr r1, [r5]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    mov r0, r9
    add r1, r1, r2, lsr #0x1f
    str r1, [r0, #0x6a0]
    ldr r1, [r0, #0x69c]
    mov r0, r4
    bl func_ov002_0223ba38
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r9
    ldr r0, [r0, #0x69c]
    bl func_ov002_0223b378
    mov r1, r9
    str r0, [r1, #0x6a4]
    ldr r0, [r1, #0x69c]
    bl func_02031630
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT0
    movne r1, #0x0
    str r1, [r0, #0x6b0]
    mov r2, #0x0
    ldr r1, _LIT1
    str r2, [r0, #0x6ac]
    ldr r0, [r1, r4, lsl #0x2]
    cmp r0, #0x1
    addeq sp, sp, #0x100
    moveq r0, #0x64
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_ov002_0223b494
    ldr r1, _LIT0
    ldr r0, _LIT2
    ldr r2, [r1, #0x69c]
    cmp r2, r0
    bne .L_1a8
    mov r0, r4
    mov r1, #0x5c
    bl func_ov002_021ae320
    b .L_1c4
.L_1a8:
    ldr r2, [r1, #0x6a4]
    add r0, sp, #0x0
    mov r1, #0xc
    bl func_ov002_0229ce00
    add r1, sp, #0x0
    mov r0, r4
    bl func_ov002_021ae320
.L_1c4:
    add sp, sp, #0x100
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1d0:
    ldr r0, _LIT3
    bl func_ov002_02259204
    add sp, sp, #0x100
    mov r0, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1e4:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_384
    ldr r2, _LIT4
    ldr r1, [r2, #0xd74]
    cmp r1, #0x4
    bhi .L_214
    ldr r3, [r2, #0xd78]
    ldr r0, [r2, #0xd70]
    add r1, r1, r3
    bl func_ov002_021b9dec
    b .L_220
.L_214:
    ldr r0, [r2, #0xd70]
    ldr r2, [r2, #0xd78]
    bl func_ov002_021c9424
.L_220:
    ldr r2, _LIT4
    mov r6, r0
    ldr r0, [r2, #0xd70]
    ldr r1, [r2, #0xd74]
    ldr r2, [r2, #0xd78]
    bl func_ov002_021c9310
    ldr r2, _LIT4
    mov r5, r0
    ldr r0, [r2, #0xd70]
    ldr r1, [r2, #0xd74]
    ldr r2, [r2, #0xd78]
    bl func_ov002_021c9310
    ldr r0, [r0]
    ldr r1, [r5]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r5, r0, r1, lsr #0x1f
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b99c8
    cmp r0, #0x0
    blt .L_290
    mov r0, r6
    mov r1, #0x1
    bl func_ov002_0223b4dc
    b .L_2ac
.L_290:
    ldr r1, _LIT4
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r1, [r1, #0xd78]
    mov r2, #0x1
    add r1, r3, r1
    bl func_ov002_0223b5fc
.L_2ac:
    ldr r1, _LIT0
    ldr r2, _LIT5
    ldr r6, [r1, #0x494]
    ldr r3, [r1, #0x6ac]
    mov r0, r5
    add r3, r6, r3
    mov r3, r3, lsl #0x19
    mov r3, r3, lsr #0x18
    strh r5, [r2, r3]
    ldr r6, [r1, #0x6ac]
    bl func_ov002_021b9a84
    ldr r3, [r0]
    ldr r7, _LIT6
    mov r0, r6, lsl #0x10
    mov r1, r0, lsr #0x10
    str r3, [r7, r6, lsl #0x2]
    ldr r2, _LIT4
    mov r3, r1, lsl #0x10
    mov r0, r5, lsl #0x10
    ldr r1, [r2, #0xd70]
    orr r3, r3, r0, lsr #0x10
    ldr r2, [r2, #0xd74]
    mov r0, #0x2b
    bl func_ov002_0229acd0
    ldr r1, _LIT0
    ldr r0, [r1, #0x6ac]
    add r2, r0, #0x1
    str r2, [r1, #0x6ac]
    ldr r0, [r1, #0x6a4]
    cmp r2, r0
    addcc sp, sp, #0x100
    movcc r0, #0x7d
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r2, [r1, #0x69c]
    ldr r0, _LIT2
    cmp r2, r0
    bne .L_36c
    mov r2, #0x7
    mov r0, r4
    str r2, [r1, #0x6b8]
    bl func_ov002_0223b970
    cmp r0, #0x0
    addne sp, sp, #0x100
    movne r0, #0x7d
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x6ac]
    str r1, [r0, #0x6a4]
.L_36c:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x6ac]
    add sp, sp, #0x100
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_384:
    mov r1, r9
    ldr r0, _LIT2
    ldr r2, [r1, #0x69c]
    cmp r2, r0
    bne .L_3bc
    ldr r0, [r1, #0x6ac]
    cmp r0, #0x2
    bcc .L_3bc
    str r0, [r1, #0x6a4]
    mov r0, #0x0
    str r0, [r1, #0x6ac]
    add sp, sp, #0x100
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_3bc:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x2c
    bl func_ov002_0229acd0
    add sp, sp, #0x100
    mov r0, #0x80
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_3dc:
    ldr r0, [r9, #0x6ac]
    cmp r0, #0x0
    bne .L_59c
    ldr r0, [r9, #0x6a4]
    mov r5, #0x0
    mov sl, r5
    cmp r0, #0x0
    ble .L_47c
    mov r7, r5
    mov r8, #0x8000
.L_404:
    ldr r0, [r9, #0x494]
    add r0, r0, sl
    mov r0, r0, lsl #0x19
    add r0, r9, r0, lsr #0x18
    add r0, r0, #0x400
    ldrh r0, [r0, #0x98]
    bl func_ov002_021b939c
    ldr r2, [r9, #0x494]
    cmp r4, #0x0
    add r2, r2, sl
    mov r2, r2, lsl #0x19
    movne r1, r8
    add r2, r9, r2, lsr #0x18
    add r3, r2, #0x400
    moveq r1, r7
    mov r0, r0, lsl #0x10
    orr r2, r1, #0x4b
    mov r1, r0, lsr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, asr #0x8
    mov r2, sl, lsl #0x10
    ldrh r3, [r3, #0x98]
    mov r0, r0, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_ov002_021d46ac
    ldr r0, [r9, #0x6a4]
    add sl, sl, #0x1
    cmp sl, r0
    blt .L_404
.L_47c:
    ldr r1, _LIT0
    mov r3, #0x0
    ldr r2, _LIT7
    str r3, [r1, #0x6a8]
.L_48c:
    add r0, r1, r3, lsl #0x2
    add r3, r3, #0x1
    str r2, [r0, #0x6b4]
    cmp r3, #0x5
    blt .L_48c
    ldr r9, _LIT0
    mov sl, #0x0
    ldr r0, [r9, #0x6a4]
    cmp r0, #0x0
    ble .L_530
    ldr r7, _LIT8
    mov r8, #0x1
.L_4bc:
    ldr r0, [r9, #0x494]
    add r0, r0, sl
    mov r0, r0, lsl #0x19
    add r0, r9, r0, lsr #0x18
    add r0, r0, #0x400
    ldrh r0, [r0, #0x98]
    bl func_ov002_021b9750
    cmp r0, #0x0
    blt .L_520
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r1, r0, #0xff
    add r0, r9, r1, lsl #0x2
    str sl, [r0, #0x6b4]
    ldr r0, [r9, #0x69c]
    add r2, r1, r4, lsl #0x4
    cmp r0, r7
    orr r5, r5, r8, lsl r2
    bne .L_520
    mov r0, r4
    bl func_ov002_021c83ac
    ldr r1, [r9, #0x6a8]
    add r0, r1, r0
    str r0, [r9, #0x6a8]
.L_520:
    ldr r0, [r9, #0x6a4]
    add sl, sl, #0x1
    cmp sl, r0
    blt .L_4bc
.L_530:
    ldrh r2, [r6]
    ldr r1, _LIT9
    cmp r2, r1
    bgt .L_568
    sub r0, r1, #0x1
    cmp r2, r0
    blt .L_558
    cmpne r2, r1
    beq .L_574
    b .L_588
.L_558:
    ldr r0, _LIT10
    cmp r2, r0
    beq .L_574
    b .L_588
.L_568:
    ldr r0, _LIT11
    cmp r2, r0
    bne .L_588
.L_574:
    mov r0, r6
    mov r1, r5
    mov r2, #0x20
    bl func_ov002_021de80c
    b .L_59c
.L_588:
    mov r0, r6
    mov r1, r5
    mov r2, #0xe
    mov r3, #0x20
    bl func_ov002_021de044
.L_59c:
    ldr r8, _LIT0
    ldr r1, [r8, #0x6ac]
    ldr r0, [r8, #0x6a4]
    cmp r1, r0
    bcs .L_808
    mov r5, #0x0
    mov r7, r5
.L_5b8:
    ldr r0, _LIT0
    ldr r0, [r0, #0x494]
    add r0, r0, r1
    mov r0, r0, lsl #0x19
    add r0, r8, r0, lsr #0x18
    add r0, r0, #0x400
    ldrh r9, [r0, #0x98]
    mov r0, r9
    bl func_ov002_021b939c
    ldr r1, _LIT0
    mov r3, r7
    ldr r1, [r1, #0x6ac]
.L_5e8:
    add r2, r8, r3, lsl #0x2
    ldr r2, [r2, #0x6b4]
    add r3, r3, #0x1
    cmp r1, r2
    moveq r0, r5
    cmp r3, #0x5
    blt .L_5e8
    mov r2, r0, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x8
    and r2, r2, #0xff
    cmp r2, #0xb
    bne .L_72c
    mov r0, r0, lsr #0x10
    mov r1, r0, lsl #0x10
    mov r0, r9
    mov r5, r1, lsr #0x10
    bl func_ov002_021ca4dc
    cmp r0, #0x0
    movne r7, #0x20
    moveq r7, #0x10
    cmp r4, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r3, r9, lsl #0x10
    ldr r0, _LIT0
    orr r2, r1, #0x4c
    ldr r1, [r0, #0x6ac]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r1, #0xb
    bl func_ov002_021d46ac
    mov r0, r4
    bl func_ov002_02254944
    ldrh r1, [r6]
    ldr r0, _LIT10
    cmp r1, r0
    ldr r0, _LIT12
    bne .L_6b8
    ldr r2, _LIT13
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r0, r0, #0x120
    add r5, r0, r5, lsl #0x2
    mov r0, r4
    mov r1, r5
    mov r2, r7
    bl func_ov002_021d7a54
    b .L_6dc
.L_6b8:
    ldr r2, _LIT13
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r0, r0, #0x120
    add r5, r0, r5, lsl #0x2
    mov r0, r4
    mov r1, r5
    mov r2, r7
    bl func_ov002_021d7b2c
.L_6dc:
    ldr r1, _LIT0
    ldr r0, _LIT8
    ldr r1, [r1, #0x69c]
    cmp r1, r0
    bne .L_710
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b89c
    ldr r1, _LIT0
    ldr r2, [r1, #0x6a8]
    add r0, r2, r0
    str r0, [r1, #0x6a8]
.L_710:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x6ac]
    mov r0, #0x64
    add r2, r2, #0x1
    str r2, [r1, #0x6ac]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_72c:
    cmp r2, #0xe
    bne .L_7ec
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    cmp r4, #0x0
    mov r5, r0, lsr #0x10
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x4c
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r3, r9, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r1, #0xe
    bl func_ov002_021d46ac
    ldr r2, _LIT13
    ldr r0, _LIT12
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r0, r0, #0x18
    add r0, r0, #0x400
    add r5, r0, r5, lsl #0x2
    mov r0, r4
    mov r1, r5
    mov r2, #0x10
    bl func_ov002_021d8094
    ldr r1, _LIT0
    ldr r0, _LIT8
    ldr r1, [r1, #0x69c]
    cmp r1, r0
    bne .L_7d0
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b89c
    ldr r1, _LIT0
    ldr r2, [r1, #0x6a8]
    add r0, r2, r0
    str r0, [r1, #0x6a8]
.L_7d0:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x6ac]
    mov r0, #0x64
    add r2, r2, #0x1
    str r2, [r1, #0x6ac]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_7ec:
    ldr r0, _LIT0
    ldr r1, [r0, #0x6ac]
    add r1, r1, #0x1
    str r1, [r0, #0x6ac]
    ldr r0, [r0, #0x6a4]
    cmp r1, r0
    bcc .L_5b8
.L_808:
    add sp, sp, #0x100
    mov r0, #0x63
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_814:
    ldr r0, _LIT0
    cmp r4, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    orr r5, r1, #0x4d
    ldr r1, [r0, #0x69c]
    ldr r2, [r0, #0x6a0]
    ldr r3, [r0, #0x6a4]
    mov r0, r5, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x6a0]
    bl func_ov002_021b985c
    ldrh r1, [r6]
    mov r5, r0
    ldr r3, _LIT13
    mov r2, r1, lsl #0x10
    ldr r0, _LIT12
    and r1, r4, #0x1
    mla r0, r1, r0, r3
    add r1, r0, #0x3a0
    orr r3, r2, #0x1
    mov r0, r4
    add r1, r1, r5, lsl #0x2
    mov r2, #0x1
    bl func_ov002_0227acc8
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_8a8:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word 0x00001a4e
_LIT3: .word func_ov002_0223b938
_LIT4: .word data_ov002_022d008c
_LIT5: .word data_ov002_022ce640
_LIT6: .word data_ov002_022cdba8
_LIT7: .word 0x0000ffff
_LIT8: .word 0x000018fb
_LIT9: .word 0x00001921
_LIT10: .word 0x0000149c
_LIT11: .word 0x00001a7f
_LIT12: .word 0x00000868
_LIT13: .word data_ov002_022cf08c
