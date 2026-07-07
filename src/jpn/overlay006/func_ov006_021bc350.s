; func_ov006_021bc350 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021b1c4c
        .extern data_ov006_021cca68
        .extern data_ov006_021ccf68
        .extern data_ov006_021cd1e8
        .extern data_ov006_021cd468
        .extern data_ov006_021cd6e8
        .extern data_ov006_021cd968
        .extern data_ov006_0224f328
        .extern data_ov006_0225dd50
        .extern func_0202160c
        .extern func_0202165c
        .extern func_0202bb88
        .extern func_020b377c
        .extern func_ov006_021b6c1c
        .extern func_ov006_021b7be0
        .extern func_ov006_021c6ad0
        .global func_ov006_021bc350
        .arm
func_ov006_021bc350:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x38
    mov r9, r0
    ldr r6, [r9, #0x50]
    add r5, r9, #0xa0
    mov r0, #0x24
    ldr r4, [r9, #0x40]
    mla r7, r6, r0, r5
    ldr r0, [sp, #0x60]
    cmp r4, #0x0
    str r0, [sp, #0x60]
    movne r0, #0x0
    strne r0, [sp, #0x60]
    cmp r6, #0x4
    moveq r0, #0x3
    streq r0, [sp, #0xc]
    movne r0, #0x4
    strne r0, [sp, #0xc]
    ldr r0, _LIT0
    ldr fp, _LIT1
    str r0, [sp, #0x28]
    ldr r0, _LIT2
    str r1, [sp]
    str r0, [sp, #0x24]
    ldr r0, _LIT3
    str r2, [sp, #0x4]
    str r0, [sp, #0x20]
    ldr r0, _LIT4
    str r3, [sp, #0x8]
    str r0, [sp, #0x1c]
    ldr r0, _LIT5
    mov r8, #0x0
    str r0, [sp, #0x18]
    ldr r0, _LIT6
    str r0, [sp, #0x14]
    ldr r0, _LIT7
    str r0, [sp, #0x10]
    ldr r0, _LIT8
    orr r0, r0, #0x2
    str r0, [sp, #0x34]
.L_430:
    cmp r8, #0x0
    blt .L_494
    cmp r8, #0xd
    bgt .L_494
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_a30
    ldr r0, [r9, #0x40]
    cmp r0, #0x0
    beq .L_578
    cmp r0, #0x2
    beq .L_46c
    cmp r0, #0x3
    beq .L_578
    b .L_478
.L_46c:
    cmp r8, #0x1
    beq .L_a30
    b .L_578
.L_478:
    cmp r8, #0x1
    beq .L_a30
    cmp r8, #0x6
    blt .L_578
    cmp r8, #0xd
    ble .L_a30
    b .L_578
.L_494:
    cmp r8, #0xe
    blt .L_510
    cmp r8, #0x11
    bgt .L_510
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_a30
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_504
    b .L_578
    b .L_4dc
    b .L_4f0
    b .L_578
    b .L_504
    b .L_578
    b .L_a30
.L_4dc:
    cmp r8, #0xe
    beq .L_a30
    cmp r8, #0x11
    bne .L_578
    b .L_a30
.L_4f0:
    cmp r8, #0x10
    beq .L_a30
    cmp r8, #0x11
    bne .L_578
    b .L_a30
.L_504:
    cmp r8, #0xe
    beq .L_a30
    b .L_578
.L_510:
    cmp r8, #0x12
    blt .L_530
    cmp r8, #0x15
    bgt .L_530
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_a30
    b .L_578
.L_530:
    cmp r8, #0x16
    blt .L_550
    cmp r8, #0x1d
    bgt .L_550
    ldr r0, [sp, #0x60]
    cmp r0, #0x0
    beq .L_a30
    b .L_578
.L_550:
    cmp r8, #0x1e
    blt .L_578
    cmp r8, #0x1f
    bgt .L_578
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_a30
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    bne .L_a30
.L_578:
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_5d8
    b .L_5a4
    b .L_5b8
    b .L_5c0
    b .L_5a4
    b .L_5d8
    b .L_5c8
    b .L_5d0
.L_5a4:
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    ldreq r4, [sp, #0x28]
    ldrne r4, [sp, #0x24]
    b .L_5dc
.L_5b8:
    ldr r4, [sp, #0x20]
    b .L_5dc
.L_5c0:
    ldr r4, [sp, #0x1c]
    b .L_5dc
.L_5c8:
    ldr r4, [sp, #0x18]
    b .L_5dc
.L_5d0:
    ldr r4, [sp, #0x14]
    b .L_5dc
.L_5d8:
    ldr r4, [sp, #0x10]
.L_5dc:
    ldr r0, [r7, #0x20]
    mov r6, #0x0
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_608
    cmp r8, #0x12
    blt .L_608
    cmp r8, #0x15
    bgt .L_608
    cmp r8, #0x12
    bne .L_630
.L_608:
    ldr r0, _LIT9
    bl func_ov006_021c6ad0
    cmp r0, #0x0
    cmpeq r8, #0x5
    beq .L_630
    ldr r0, [r9, #0x50]
    ldr r6, _LIT8
    add r0, r0, #0xe
    cmp r8, r0
    ldreq r6, [sp, #0x34]
.L_630:
    cmp r8, #0x16
    blt .L_6b4
    cmp r8, #0x1d
    bgt .L_6b4
    ldr r0, [r7, #0x20]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r6, #0x0
    bne .L_6b4
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    moveq r6, #0x0
    beq .L_6b4
    cmp r8, #0x16
    blt .L_67c
    cmp r8, #0x19
    suble r2, r8, #0x16
    movle r3, #0x1
    ble .L_684
.L_67c:
    sub r2, r8, #0x1a
    mov r3, #0x0
.L_684:
    ldr r1, [r7, #0x10]
    ldr r0, [r7, #0x8]
    sub r0, r1, r0
    cmp r2, r0
    movge r6, #0x0
    bge .L_6b4
    cmp r3, #0x0
    beq .L_6b4
    add r0, r7, r2
    ldrsb r0, [r0, #0x1c]
    cmp r0, #0x0
    moveq r6, #0x0
.L_6b4:
    ldr r0, [r9, #0x54]
    cmp r8, r0
    ldreq sl, [r4, #0x10]
    beq .L_714
    ldr r0, [r7, #0x20]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_710
    ldr r0, _LIT10
    ldr r0, [r0, #0x18]
    cmp r0, #0x1
    cmpeq r8, #0x15
    beq .L_700
    cmp r0, #0x2
    cmpeq r8, #0x13
    beq .L_700
    cmp r0, #0x3
    cmpeq r8, #0x14
    bne .L_708
.L_700:
    ldr sl, [r4, #0x10]
    b .L_714
.L_708:
    ldr sl, [r4, #0xc]
    b .L_714
.L_710:
    ldr sl, [r4, #0xc]
.L_714:
    cmp r8, #0x1a
    blt .L_75c
    cmp r8, #0x1d
    bgt .L_75c
    cmp r6, #0x0
    beq .L_75c
    ldr r3, [r7, #0x8]
    sub r2, r8, #0x1a
    add r2, r3, r2
    ldr r3, [r7, #0x20]
    ldr r1, [r9, #0x50]
    mov r3, r3, lsl #0x1f
    mov r0, fp
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6c1c
    bl func_0202bb88
    cmp r0, #0x0
    addeq sl, sl, #0x2
.L_75c:
    cmp r8, #0xd
    mov r1, #0x0
    addls pc, pc, r8, lsl #0x2
    b .L_8f0
    b .L_8f0
    b .L_8f0
    b .L_8f0
    b .L_8f0
    b .L_8f0
    b .L_8f0
    b .L_8f0
    b .L_7a4
    b .L_7d4
    b .L_804
    b .L_834
    b .L_864
    b .L_894
    b .L_8c4
.L_7a4:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x1
    bl func_ov006_021b7be0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_7cc
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_8f0
.L_7cc:
    mov r1, #0x0
    b .L_8f0
.L_7d4:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x2
    bl func_ov006_021b7be0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_7fc
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_8f0
.L_7fc:
    mov r1, #0x0
    b .L_8f0
.L_804:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x3
    bl func_ov006_021b7be0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_82c
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_8f0
.L_82c:
    mov r1, #0x0
    b .L_8f0
.L_834:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x4
    bl func_ov006_021b7be0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_85c
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_8f0
.L_85c:
    mov r1, #0x0
    b .L_8f0
.L_864:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x5
    bl func_ov006_021b7be0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_88c
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_8f0
.L_88c:
    mov r1, #0x0
    b .L_8f0
.L_894:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x6
    bl func_ov006_021b7be0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_8bc
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_8f0
.L_8bc:
    mov r1, #0x0
    b .L_8f0
.L_8c4:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x0
    bl func_ov006_021b7be0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_8ec
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_8f0
.L_8ec:
    mov r1, #0x0
.L_8f0:
    ldr r0, [r9, #0x40]
    cmp r0, #0x3
    ldr r0, [r9, #0x50]
    cmpeq r8, #0x1
    moveq r1, #0x1
    cmp r0, #0x4
    bne .L_938
    cmp r8, #0x0
    cmpne r8, #0x5
    cmpne r8, #0x2
    cmpne r8, #0x3
    cmpne r8, #0x4
    beq .L_938
    cmp r8, #0x12
    blt .L_934
    cmp r8, #0x15
    ble .L_938
.L_934:
    mov r1, #0x1
.L_938:
    ldr r0, [r9]
    cmp r1, #0x0
    mov r1, #0x5
    add r2, r8, #0x2b
    orrne r6, r6, #0x4
    bl func_0202160c
    mov r5, r0
    ldrsh r0, [r4]
    str r0, [sp, #0x30]
    ldrsh r0, [r4, #0x2]
    str r0, [sp, #0x2c]
    ldr r0, [r7, #0x20]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_9b0
    cmp r8, #0x15
    bne .L_9b0
    ldr r0, [r9, #0x50]
    ldr r1, [r7, #0x8]
    cmp r0, #0x4
    moveq r0, #0x27
    movne r0, #0x47
    mul r0, r1, r0
    ldr r2, [r7, #0x10]
    ldr r1, [sp, #0xc]
    sub r1, r2, r1
    bl func_020b377c
    ldr r1, [sp, #0x2c]
    add r0, r1, r0
    str r0, [sp, #0x2c]
.L_9b0:
    mov r0, r5
    mov r1, #0x2
    mov r2, r8
    bl func_0202165c
    ldr r2, [sp, #0x30]
    mov r0, r5
    mov r1, #0x3
    bl func_0202165c
    ldr r2, [sp, #0x2c]
    mov r0, r5
    mov r1, #0x4
    bl func_0202165c
    ldrsh r2, [r4, #0x4]
    mov r0, r5
    mov r1, #0x11
    bl func_0202165c
    ldrsh r2, [r4, #0x6]
    mov r0, r5
    mov r1, #0x12
    bl func_0202165c
    ldr r2, [r4, #0x8]
    mov r0, r5
    mov r1, #0xc
    bl func_0202165c
    mov r2, sl
    mov r0, r5
    mov r1, #0xd
    bl func_0202165c
    mov r0, r5
    mov r2, r6
    mov r1, #0x0
    bl func_0202165c
.L_a30:
    ldr r0, [sp, #0x28]
    add r8, r8, #0x1
    add r0, r0, #0x14
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x24]
    cmp r8, #0x20
    add r0, r0, #0x14
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x20]
    add r0, r0, #0x14
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x14
    str r0, [sp, #0x1c]
    ldr r0, [sp, #0x18]
    add r0, r0, #0x14
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x14]
    add r0, r0, #0x14
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x10]
    add r0, r0, #0x14
    str r0, [sp, #0x10]
    blt .L_430
    mov r0, #0x1
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_021cca68+0x280
_LIT1: .word data_ov006_0224f328
_LIT2: .word data_ov006_021cca68
_LIT3: .word data_ov006_021ccf68
_LIT4: .word data_ov006_021cd1e8
_LIT5: .word data_ov006_021cd6e8
_LIT6: .word data_ov006_021cd968
_LIT7: .word data_ov006_021cd468
_LIT8: .word 0x000001c1
_LIT9: .word data_ov006_0225dd50
_LIT10: .word data_ov000_021b1c4c
