; func_ov006_021bc45c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021b1d4c
        .extern data_ov006_021ccb88
        .extern data_ov006_021cce08
        .extern data_ov006_021cd088
        .extern data_ov006_021cd308
        .extern data_ov006_021cd588
        .extern data_ov006_021cd808
        .extern data_ov006_021cda88
        .extern data_ov006_0224f448
        .extern data_ov006_0225de70
        .extern func_02021660
        .extern func_020216b0
        .extern func_0202bbdc
        .extern func_020b3870
        .extern func_ov006_021b6d1c
        .extern func_ov006_021b7ce0
        .extern func_ov006_021c6bdc
        .global func_ov006_021bc45c
        .arm
func_ov006_021bc45c:
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
.L_2304:
    cmp r8, #0x0
    blt .L_2368
    cmp r8, #0xd
    bgt .L_2368
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_2904
    ldr r0, [r9, #0x40]
    cmp r0, #0x0
    beq .L_244c
    cmp r0, #0x2
    beq .L_2340
    cmp r0, #0x3
    beq .L_244c
    b .L_234c
.L_2340:
    cmp r8, #0x1
    beq .L_2904
    b .L_244c
.L_234c:
    cmp r8, #0x1
    beq .L_2904
    cmp r8, #0x6
    blt .L_244c
    cmp r8, #0xd
    ble .L_2904
    b .L_244c
.L_2368:
    cmp r8, #0xe
    blt .L_23e4
    cmp r8, #0x11
    bgt .L_23e4
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_2904
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_23d8
    b .L_244c
    b .L_23b0
    b .L_23c4
    b .L_244c
    b .L_23d8
    b .L_244c
    b .L_2904
.L_23b0:
    cmp r8, #0xe
    beq .L_2904
    cmp r8, #0x11
    bne .L_244c
    b .L_2904
.L_23c4:
    cmp r8, #0x10
    beq .L_2904
    cmp r8, #0x11
    bne .L_244c
    b .L_2904
.L_23d8:
    cmp r8, #0xe
    beq .L_2904
    b .L_244c
.L_23e4:
    cmp r8, #0x12
    blt .L_2404
    cmp r8, #0x15
    bgt .L_2404
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_2904
    b .L_244c
.L_2404:
    cmp r8, #0x16
    blt .L_2424
    cmp r8, #0x1d
    bgt .L_2424
    ldr r0, [sp, #0x60]
    cmp r0, #0x0
    beq .L_2904
    b .L_244c
.L_2424:
    cmp r8, #0x1e
    blt .L_244c
    cmp r8, #0x1f
    bgt .L_244c
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_2904
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    bne .L_2904
.L_244c:
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_24ac
    b .L_2478
    b .L_248c
    b .L_2494
    b .L_2478
    b .L_24ac
    b .L_249c
    b .L_24a4
.L_2478:
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    ldreq r4, [sp, #0x28]
    ldrne r4, [sp, #0x24]
    b .L_24b0
.L_248c:
    ldr r4, [sp, #0x20]
    b .L_24b0
.L_2494:
    ldr r4, [sp, #0x1c]
    b .L_24b0
.L_249c:
    ldr r4, [sp, #0x18]
    b .L_24b0
.L_24a4:
    ldr r4, [sp, #0x14]
    b .L_24b0
.L_24ac:
    ldr r4, [sp, #0x10]
.L_24b0:
    ldr r0, [r7, #0x20]
    mov r6, #0x0
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_24dc
    cmp r8, #0x12
    blt .L_24dc
    cmp r8, #0x15
    bgt .L_24dc
    cmp r8, #0x12
    bne .L_2504
.L_24dc:
    ldr r0, _LIT9
    bl func_ov006_021c6bdc
    cmp r0, #0x0
    cmpeq r8, #0x5
    beq .L_2504
    ldr r0, [r9, #0x50]
    ldr r6, _LIT8
    add r0, r0, #0xe
    cmp r8, r0
    ldreq r6, [sp, #0x34]
.L_2504:
    cmp r8, #0x16
    blt .L_2588
    cmp r8, #0x1d
    bgt .L_2588
    ldr r0, [r7, #0x20]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r6, #0x0
    bne .L_2588
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    moveq r6, #0x0
    beq .L_2588
    cmp r8, #0x16
    blt .L_2550
    cmp r8, #0x19
    suble r2, r8, #0x16
    movle r3, #0x1
    ble .L_2558
.L_2550:
    sub r2, r8, #0x1a
    mov r3, #0x0
.L_2558:
    ldr r1, [r7, #0x10]
    ldr r0, [r7, #0x8]
    sub r0, r1, r0
    cmp r2, r0
    movge r6, #0x0
    bge .L_2588
    cmp r3, #0x0
    beq .L_2588
    add r0, r7, r2
    ldrsb r0, [r0, #0x1c]
    cmp r0, #0x0
    moveq r6, #0x0
.L_2588:
    ldr r0, [r9, #0x54]
    cmp r8, r0
    ldreq sl, [r4, #0x10]
    beq .L_25e8
    ldr r0, [r7, #0x20]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_25e4
    ldr r0, _LIT10
    ldr r0, [r0, #0x18]
    cmp r0, #0x1
    cmpeq r8, #0x15
    beq .L_25d4
    cmp r0, #0x2
    cmpeq r8, #0x13
    beq .L_25d4
    cmp r0, #0x3
    cmpeq r8, #0x14
    bne .L_25dc
.L_25d4:
    ldr sl, [r4, #0x10]
    b .L_25e8
.L_25dc:
    ldr sl, [r4, #0xc]
    b .L_25e8
.L_25e4:
    ldr sl, [r4, #0xc]
.L_25e8:
    cmp r8, #0x1a
    blt .L_2630
    cmp r8, #0x1d
    bgt .L_2630
    cmp r6, #0x0
    beq .L_2630
    ldr r3, [r7, #0x8]
    sub r2, r8, #0x1a
    add r2, r3, r2
    ldr r3, [r7, #0x20]
    ldr r1, [r9, #0x50]
    mov r3, r3, lsl #0x1f
    mov r0, fp
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    bl func_0202bbdc
    cmp r0, #0x0
    addeq sl, sl, #0x2
.L_2630:
    cmp r8, #0xd
    mov r1, #0x0
    addls pc, pc, r8, lsl #0x2
    b .L_27c4
    b .L_27c4
    b .L_27c4
    b .L_27c4
    b .L_27c4
    b .L_27c4
    b .L_27c4
    b .L_27c4
    b .L_2678
    b .L_26a8
    b .L_26d8
    b .L_2708
    b .L_2738
    b .L_2768
    b .L_2798
.L_2678:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x1
    bl func_ov006_021b7ce0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_26a0
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_27c4
.L_26a0:
    mov r1, #0x0
    b .L_27c4
.L_26a8:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x2
    bl func_ov006_021b7ce0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_26d0
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_27c4
.L_26d0:
    mov r1, #0x0
    b .L_27c4
.L_26d8:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x3
    bl func_ov006_021b7ce0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_2700
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_27c4
.L_2700:
    mov r1, #0x0
    b .L_27c4
.L_2708:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x4
    bl func_ov006_021b7ce0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_2730
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_27c4
.L_2730:
    mov r1, #0x0
    b .L_27c4
.L_2738:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x5
    bl func_ov006_021b7ce0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_2760
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_27c4
.L_2760:
    mov r1, #0x0
    b .L_27c4
.L_2768:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x6
    bl func_ov006_021b7ce0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_2790
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_27c4
.L_2790:
    mov r1, #0x0
    b .L_27c4
.L_2798:
    ldr r1, [r9, #0x50]
    mov r0, fp
    mov r2, #0x0
    bl func_ov006_021b7ce0
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_27c0
    cmp r0, #0x0
    movlt r1, #0x1
    blt .L_27c4
.L_27c0:
    mov r1, #0x0
.L_27c4:
    ldr r0, [r9, #0x40]
    cmp r0, #0x3
    ldr r0, [r9, #0x50]
    cmpeq r8, #0x1
    moveq r1, #0x1
    cmp r0, #0x4
    bne .L_280c
    cmp r8, #0x0
    cmpne r8, #0x5
    cmpne r8, #0x2
    cmpne r8, #0x3
    cmpne r8, #0x4
    beq .L_280c
    cmp r8, #0x12
    blt .L_2808
    cmp r8, #0x15
    ble .L_280c
.L_2808:
    mov r1, #0x1
.L_280c:
    ldr r0, [r9]
    cmp r1, #0x0
    mov r1, #0x5
    add r2, r8, #0x2b
    orrne r6, r6, #0x4
    bl func_02021660
    mov r5, r0
    ldrsh r0, [r4]
    str r0, [sp, #0x30]
    ldrsh r0, [r4, #0x2]
    str r0, [sp, #0x2c]
    ldr r0, [r7, #0x20]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_2884
    cmp r8, #0x15
    bne .L_2884
    ldr r0, [r9, #0x50]
    ldr r1, [r7, #0x8]
    cmp r0, #0x4
    moveq r0, #0x27
    movne r0, #0x47
    mul r0, r1, r0
    ldr r2, [r7, #0x10]
    ldr r1, [sp, #0xc]
    sub r1, r2, r1
    bl func_020b3870
    ldr r1, [sp, #0x2c]
    add r0, r1, r0
    str r0, [sp, #0x2c]
.L_2884:
    mov r0, r5
    mov r1, #0x2
    mov r2, r8
    bl func_020216b0
    ldr r2, [sp, #0x30]
    mov r0, r5
    mov r1, #0x3
    bl func_020216b0
    ldr r2, [sp, #0x2c]
    mov r0, r5
    mov r1, #0x4
    bl func_020216b0
    ldrsh r2, [r4, #0x4]
    mov r0, r5
    mov r1, #0x11
    bl func_020216b0
    ldrsh r2, [r4, #0x6]
    mov r0, r5
    mov r1, #0x12
    bl func_020216b0
    ldr r2, [r4, #0x8]
    mov r0, r5
    mov r1, #0xc
    bl func_020216b0
    mov r2, sl
    mov r0, r5
    mov r1, #0xd
    bl func_020216b0
    mov r0, r5
    mov r2, r6
    mov r1, #0x0
    bl func_020216b0
.L_2904:
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
    blt .L_2304
    mov r0, #0x1
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_021cce08
_LIT1: .word data_ov006_0224f448
_LIT2: .word data_ov006_021ccb88
_LIT3: .word data_ov006_021cd088
_LIT4: .word data_ov006_021cd308
_LIT5: .word data_ov006_021cd808
_LIT6: .word data_ov006_021cda88
_LIT7: .word data_ov006_021cd588
_LIT8: .word 0x000001c1
_LIT9: .word data_ov006_0225de70
_LIT10: .word data_ov000_021b1d4c
