; func_ov002_0225406c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022be060
        .extern data_ov002_022be074
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b9dec
        .extern func_ov002_021c1c48
        .extern func_ov002_021c1d40
        .extern func_ov002_021c8400
        .extern func_ov002_021c8860
        .extern func_ov002_021d6780
        .extern func_ov002_021df590
        .extern func_ov002_021e2ae4
        .extern func_ov002_021e2b6c
        .global func_ov002_0225406c
        .arm
func_ov002_0225406c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x98
    ldr r5, _LIT0
    add r4, sp, #0x70
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    mov r0, #0x0
    str r0, [sp, #0x20]
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldr r6, [sp, #0x20]
    ldmia r5, {r0, r1}
    stmia r4, {r0, r1}
    mov r8, r6
.L_38:
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r8, #0x1
    mla r7, r1, r0, r2
    add r0, sp, #0x70
    ldr r9, _LIT3
    mov r5, r7
    mov r4, #0x0
    add sl, r0, r8, lsl #0x2
.L_5c:
    ldr r3, [r5, #0x40]
    ldrh r0, [r5, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r3, lsr #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_b8
    mov r0, r8
    mov r1, r4
    bl func_ov002_021b9dec
    cmp r0, r9
    bne .L_b8
    ldrh r0, [r5, #0x34]
    ldr r1, [sl, #0x20]
    add r6, r6, #0x1
    cmp r1, r0
    movle r1, r0
    str r1, [sl, #0x20]
.L_b8:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r5, r5, #0x14
    blt .L_5c
    add r0, sp, #0x70
    ldr r5, _LIT4
    add r7, r7, #0x64
    mov sl, #0x5
    add r4, r0, r8, lsl #0x2
    mov fp, #0x0
.L_e0:
    ldr r3, [r7, #0x40]
    ldrh r0, [r7, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r3, lsr #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_150
    mov r9, fp
.L_114:
    mov r0, r8
    mov r1, sl
    bl func_ov002_021b9dec
    ldr r1, [r5, r9, lsl #0x2]
    cmp r1, r0
    bne .L_144
    ldrh r0, [r7, #0x34]
    ldr r1, [r4, r9, lsl #0x3]
    add r6, r6, #0x1
    cmp r1, r0
    movle r1, r0
    str r1, [r4, r9, lsl #0x3]
.L_144:
    add r9, r9, #0x1
    cmp r9, #0x4
    bcc .L_114
.L_150:
    add sl, sl, #0x1
    cmp sl, #0xa
    add r7, r7, #0x14
    blt .L_e0
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_38
    cmp r6, #0x0
    addeq sp, sp, #0x98
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, sp, #0x48
    str r0, [sp, #0x1c]
    mov r9, #0x0
.L_188:
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r9, #0x1
    mla r0, r1, r0, r2
    str r0, [sp, #0x14]
    add r0, r0, #0x30
    str r0, [sp, #0x18]
    ldr r0, _LIT5
    mov sl, #0x0
    sub r0, r0, #0xa2
    str r0, [sp, #0x30]
    ldr r0, _LIT6
    mov r4, sl
    add r0, r0, #0x380
    str r0, [sp, #0x38]
    ldr r0, _LIT5
    sub r0, r0, #0xa2
    str r0, [sp, #0x34]
    mvn r0, #0x0
    str r0, [sp, #0x24]
.L_1d8:
    ldr r0, [sp, #0x18]
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrne r0, [sp, #0x14]
    ldrneh r0, [r0, #0x38]
    cmpne r0, #0x0
    beq .L_40c
    ldr r0, [sp, #0x14]
    ldr r1, [r0, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_40c
    ldr r0, [sp, #0x1c]
    mov r1, #0x0
    str r1, [r0, sl, lsl #0x2]
    mov r0, r1
    ldr r6, [sp, #0x24]
    str r0, [sp, #0xc]
.L_228:
    ldr r1, _LIT4
    ldr r0, [sp, #0xc]
    mov r5, #0x0
    ldr r7, [r1, r0, lsl #0x2]
    add r1, sp, #0x70
    add fp, r1, r0, lsl #0x3
.L_240:
    ldr r8, [fp, r5, lsl #0x2]
    cmp r8, r6
    ble .L_3ec
    ldr r0, [sp, #0x30]
    cmp r7, r0
    mov r0, r4
    bgt .L_28c
    ldr r1, [sp, #0x34]
    cmp r7, r1
    bge .L_398
    ldr r1, _LIT7
    cmp r7, r1
    bgt .L_27c
    beq .L_2d8
    b .L_3dc
.L_27c:
    ldr r1, _LIT6
    cmp r7, r1
    beq .L_2b0
    b .L_3dc
.L_28c:
    ldr r1, _LIT5
    cmp r7, r1
    bgt .L_2a0
    beq .L_318
    b .L_3dc
.L_2a0:
    ldr r1, [sp, #0x38]
    cmp r7, r1
    beq .L_358
    b .L_3dc
.L_2b0:
    cmp r9, r5
    movne r2, #0x1
    moveq r2, r4
    mov r0, r9
    mov r1, sl
    bl func_ov002_021c1d40
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    b .L_3dc
.L_2d8:
    cmp r9, r5
    movne r2, #0x1
    moveq r2, r4
    mov r0, r9
    mov r1, sl
    bl func_ov002_021c1d40
    cmp r0, #0x0
    bne .L_310
    mov r0, r9
    mov r1, sl
    bl func_ov002_021c8860
    cmp r0, #0x1
    moveq r0, #0x1
    beq .L_3dc
.L_310:
    mov r0, #0x0
    b .L_3dc
.L_318:
    cmp r9, r5
    movne r2, #0x1
    moveq r2, r4
    mov r0, r9
    mov r1, sl
    bl func_ov002_021c1c48
    cmp r0, #0x0
    bne .L_350
    mov r0, r9
    mov r1, sl
    bl func_ov002_021c8400
    cmp r0, #0x4
    movge r0, #0x1
    bge .L_3dc
.L_350:
    mov r0, #0x0
    b .L_3dc
.L_358:
    cmp r9, r5
    movne r2, #0x1
    moveq r2, r4
    mov r0, r9
    mov r1, sl
    bl func_ov002_021c1d40
    cmp r0, #0x0
    bne .L_390
    mov r0, r9
    mov r1, sl
    bl func_ov002_021c8400
    cmp r0, #0x3
    movle r0, #0x1
    ble .L_3dc
.L_390:
    mov r0, #0x0
    b .L_3dc
.L_398:
    cmp r9, r5
    movne r2, #0x1
    moveq r2, r4
    mov r0, r9
    mov r1, sl
    bl func_ov002_021c1d40
    cmp r0, #0x0
    bne .L_3d8
    cmp r9, r5
    beq .L_3d8
    mov r0, r9
    mov r1, sl
    bl func_ov002_021c8860
    cmp r0, #0xa
    moveq r0, #0x1
    beq .L_3dc
.L_3d8:
    mov r0, #0x0
.L_3dc:
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    movne r6, r8
    strne r7, [r0, sl, lsl #0x2]
.L_3ec:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_240
    ldr r0, [sp, #0xc]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    cmp r0, #0x5
    bcc .L_228
.L_40c:
    ldr r0, [sp, #0x18]
    add sl, sl, #0x1
    add r0, r0, #0x14
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x14]
    cmp sl, #0x4
    add r0, r0, #0x14
    str r0, [sp, #0x14]
    ble .L_1d8
    ldr r0, [sp, #0x1c]
    add r9, r9, #0x1
    add r0, r0, #0x14
    cmp r9, #0x2
    str r0, [sp, #0x1c]
    blt .L_188
    mov r0, #0x0
    str r0, [sp, #0x10]
.L_450:
    ldr r0, [sp, #0x10]
    add r1, sp, #0x70
    ldr r0, [r1, r0, lsl #0x3]
    cmp r0, #0x0
    bge .L_478
    ldr r0, [sp, #0x10]
    add r0, r1, r0, lsl #0x3
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    blt .L_628
.L_478:
    ldr r0, [sp, #0x10]
    add r1, sp, #0x70
    add r0, r1, r0, lsl #0x3
    str r0, [sp, #0x2c]
    ldr r0, _LIT5
    mov r4, #0x0
    sub r0, r0, #0xa2
    str r0, [sp, #0x40]
    ldr r0, _LIT5
    ldr r2, _LIT4
    sub r0, r0, #0xa2
    str r0, [sp, #0x3c]
    ldr r0, _LIT8
    str r4, [sp, #0x8]
    sub r0, r0, #0x380
    str r0, [sp, #0x44]
    ldr r0, [sp, #0x10]
    ldr r8, [r2, r0, lsl #0x2]
    mvn r0, #0x0
    str r0, [sp, #0x28]
.L_4c8:
    ldr r0, _LIT9
    mov sl, #0x0
    ldr r1, [r0, #0xcec]
    ldr r0, [sp, #0x8]
    eor r9, r1, r0
    ldr r1, _LIT2
    ldr r0, _LIT1
    and r2, r9, #0x1
    mla r6, r2, r1, r0
    mov r1, #0x14
    add r0, sp, #0x48
    mla r7, r9, r1, r0
    add r5, r6, #0x30
    rsb fp, r9, #0x1
.L_500:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r6, #0x38]
    cmpne r0, #0x0
    beq .L_600
    ldr r0, [r7, sl, lsl #0x2]
    cmp r8, r0
    bne .L_600
    ldr r0, [sp, #0x3c]
    cmp r8, r0
    mov r0, #0x0
    bgt .L_564
    ldr r1, [sp, #0x40]
    cmp r8, r1
    bge .L_59c
    ldr r1, _LIT7
    cmp r8, r1
    bgt .L_554
    beq .L_588
    b .L_5a0
.L_554:
    ldr r1, [sp, #0x44]
    cmp r8, r1
    beq .L_59c
    b .L_5a0
.L_564:
    ldr r1, _LIT5
    cmp r8, r1
    bgt .L_578
    beq .L_588
    b .L_5a0
.L_578:
    ldr r1, _LIT8
    cmp r8, r1
    beq .L_59c
    b .L_5a0
.L_588:
    ldrh r0, [r6, #0x36]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    b .L_5a0
.L_59c:
    ldrh r0, [r6, #0x36]
.L_5a0:
    cmp r0, #0x0
    beq .L_600
    cmp r4, #0x0
    add r4, r4, #0x1
    bne .L_5c0
    ldr r0, [sp, #0x28]
    mov r1, r8
    bl func_ov002_021df590
.L_5c0:
    bl func_ov002_021e2ae4
    ldr r0, [sp, #0x2c]
    mov r2, #0x0
    ldr r0, [r0, fp, lsl #0x2]
    mov r1, sl
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    str r8, [sp]
    str r0, [sp, #0x4]
    mov r0, r9
    mov r3, r2
    bl func_ov002_021d6780
    bl func_ov002_021e2b6c
    mov r0, #0x1
    str r0, [sp, #0x20]
.L_600:
    add r5, r5, #0x14
    add r6, r6, #0x14
    add sl, sl, #0x1
    cmp sl, #0x4
    ble .L_500
    ldr r0, [sp, #0x8]
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    cmp r0, #0x2
    blt .L_4c8
.L_628:
    ldr r0, [sp, #0x10]
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    cmp r0, #0x5
    bcc .L_450
    ldr r0, [sp, #0x20]
    add sp, sp, #0x98
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022be074
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word 0x00001704
_LIT4: .word data_ov002_022be060
_LIT5: .word 0x000017a6
_LIT6: .word 0x000015fb
_LIT7: .word 0x000010ef
_LIT8: .word 0x0000197b
_LIT9: .word data_ov002_022d008c
