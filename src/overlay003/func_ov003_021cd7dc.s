; func_ov003_021cd7dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov003_021cf6c0
        .extern func_0201e7e4
        .extern func_02034784
        .extern func_020a991c
        .extern func_ov003_021cedf8
        .global func_ov003_021cd7dc
        .arm
func_ov003_021cd7dc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x40
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_4210
    b .L_4210
    b .L_4210
    b .L_3564
    b .L_3620
    b .L_3784
    b .L_3918
    b .L_3c84
    b .L_3d48
    b .L_3ed8
    b .L_4168
.L_3564:
    mov r0, #0x0
    mov r9, r4
    str r0, [sp, #0x30]
    mov fp, #0xa4
    mov r5, r0
.L_3578:
    ldr r0, [sp, #0x30]
    mov r8, #0x0
    cmp r0, #0x0
    moveq r6, #0x2
    moveq r7, #0x1
    movne r6, #0x1
    movne r7, #0x0
    mov sl, #0x58
.L_3598:
    ldr r1, [r4, #0xc]
    rsb r0, sl, #0x100
    mul r2, r1, r0
    mov r0, r2, asr #0x3
    add r0, r2, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    rsb r0, r0, #0x118
    stmia sp, {r0, fp}
    str r5, [sp, #0x8]
    str r5, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r9, r7, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r1, r6
    mov r3, r5
    bl func_ov003_021cedf8
    cmp r7, #0x0
    add r8, r8, #0x1
    addne r7, r7, #0x1
    add sl, sl, #0x38
    cmp r8, #0x3
    blt .L_3598
    ldr r0, [sp, #0x30]
    add r9, r9, #0x6c
    add r0, r0, #0x1
    str r0, [sp, #0x30]
    cmp r0, #0x2
    blt .L_3578
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3620:
    mov r0, #0x0
    mov r7, r4
    str r0, [sp, #0x2c]
.L_362c:
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    bne .L_3650
    ldr r0, [r4, #0x10]
    mov r9, #0x2
    str r9, [sp, #0x38]
    str r0, [sp, #0x34]
    mov sl, #0x1
    b .L_36b0
.L_3650:
    ldr r0, _LIT0
    mov sl, #0x0
    ldr r3, [r0, #0x38]
    ldr r2, _LIT1
    mov r0, r3, lsr #0x1f
    smull r1, r5, r2, r3
    add r5, r3, r5
    add r5, r0, r5, asr #0x4
    mov r2, #0x1e
    smull r0, r1, r2, r5
    str sl, [sp, #0x38]
    subs r5, r3, r0
    mov r9, #0x1
    bne .L_36a8
    bl func_020a991c
    ldr r2, _LIT2
    mov r3, #0x3
    smull r1, r5, r2, r0
    add r5, r5, r0, lsr #0x1f
    smull r1, r2, r3, r5
    sub r5, r0, r1
    str r5, [r4, #0x14]
.L_36a8:
    ldr r0, [r4, #0x14]
    str r0, [sp, #0x34]
.L_36b0:
    mov r6, #0x0
    mov r8, #0x70
    mov fp, #0xa4
    mov r5, r6
.L_36c0:
    stmia sp, {r8, fp}
    mov r0, #0x1
    str r0, [sp, #0x8]
    str r5, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r7, sl, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r1, r9
    mov r3, r5
    bl func_ov003_021cedf8
    cmp sl, #0x0
    add r6, r6, #0x1
    addne sl, sl, #0x1
    add r8, r8, #0x38
    cmp r6, #0x3
    blt .L_36c0
    ldr r0, [sp, #0x34]
    mov r1, #0x38
    mul r1, r0, r1
    add r0, r1, #0x70
    str r0, [sp]
    mov r0, #0xa4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, #0x2000
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x38]
    mov r3, #0x40
    str r3, [sp, #0x14]
    add r0, r7, r0, lsl #0x2
    ldr r2, [r0, #0xd4]
    mov r0, r4
    mov r1, r9
    sub r3, r3, #0x41
    bl func_ov003_021cedf8
    ldr r0, [sp, #0x2c]
    add r7, r7, #0x6c
    add r0, r0, #0x1
    str r0, [sp, #0x2c]
    cmp r0, #0x2
    blt .L_362c
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3784:
    mov r0, #0x0
    mov r7, r4
    str r0, [sp, #0x28]
.L_3790:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_37b8
    ldr r0, [r4, #0x10]
    mov r9, #0x2
    str r0, [sp, #0x18]
    mov r0, #0x3
    mov sl, #0x1
    str r0, [sp, #0x1c]
    b .L_3844
.L_37b8:
    ldr r0, [r4, #0x14]
    mov r9, #0x1
    str r9, [sp, #0x1c]
    str r0, [sp, #0x18]
    mov sl, #0x0
    bl func_02034784
    cmp r0, #0x0
    beq .L_3844
    ldr r0, _LIT3
    ldr r0, [r0, #0x54]
    cmp r0, #0x0
    bne .L_3844
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, [r0, #0x38]
    mov r2, #0x1e
    smull r0, r5, r1, r3
    add r5, r3, r5
    mov r0, r3, lsr #0x1f
    add r5, r0, r5, asr #0x4
    smull r0, r1, r2, r5
    subs r5, r3, r0
    mov r0, sl
    str r0, [sp, #0x1c]
    bne .L_383c
    bl func_020a991c
    ldr r2, _LIT2
    mov r3, #0x3
    smull r1, r5, r2, r0
    add r5, r5, r0, lsr #0x1f
    smull r1, r2, r3, r5
    sub r5, r0, r1
    str r5, [r4, #0x14]
.L_383c:
    ldr r0, [r4, #0x14]
    str r0, [sp, #0x18]
.L_3844:
    mov r6, #0x0
    mov r8, #0x70
    mov fp, #0xa4
    mov r5, r6
.L_3854:
    stmia sp, {r8, fp}
    mov r0, #0x1
    str r0, [sp, #0x8]
    str r5, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r7, sl, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r1, r9
    mov r3, r5
    bl func_ov003_021cedf8
    cmp sl, #0x0
    add r6, r6, #0x1
    addne sl, sl, #0x1
    add r8, r8, #0x38
    cmp r6, #0x3
    blt .L_3854
    ldr r0, [sp, #0x18]
    mov r1, #0x38
    mul r1, r0, r1
    add r0, r1, #0x70
    str r0, [sp]
    mov r0, #0xa4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, #0x2000
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x1c]
    mov r3, #0x40
    str r3, [sp, #0x14]
    add r0, r7, r0, lsl #0x2
    ldr r2, [r0, #0xd4]
    mov r0, r4
    mov r1, r9
    sub r3, r3, #0x41
    bl func_ov003_021cedf8
    ldr r0, [sp, #0x28]
    add r7, r7, #0x6c
    add r0, r0, #0x1
    str r0, [sp, #0x28]
    cmp r0, #0x2
    blt .L_3790
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3918:
    mov r7, r4
    mov r5, #0x0
.L_3920:
    bl func_02034784
    cmp r0, #0x0
    beq .L_3a7c
    ldr r0, _LIT3
    ldr r0, [r0, #0x54]
    cmp r0, #0x0
    bne .L_3a7c
    cmp r5, #0x0
    bne .L_3958
    ldr r2, [r4, #0x10]
    mov r6, #0x2
    mov r7, #0x1
    mov fp, #0x3
    b .L_39b4
.L_3958:
    ldr r0, _LIT0
    mov r7, #0x0
    ldr r3, [r0, #0x38]
    ldr r2, _LIT1
    mov r0, r3, lsr #0x1f
    smull r1, r6, r2, r3
    add r6, r3, r6
    add r6, r0, r6, asr #0x4
    mov r2, #0x1e
    smull r0, r1, r2, r6
    mov fp, r7
    subs r6, r3, r0
    mov r6, #0x1
    bne .L_39b0
    bl func_020a991c
    ldr r2, _LIT2
    mov r3, #0x3
    smull r1, r8, r2, r0
    add r8, r8, r0, lsr #0x1f
    smull r1, r2, r3, r8
    sub r8, r0, r1
    str r8, [r4, #0x14]
.L_39b0:
    ldr r2, [r4, #0x14]
.L_39b4:
    mov r0, #0x38
    mul r1, r2, r0
    mov r0, #0x6c
    mla r9, r5, r0, r4
    mvn r0, #0x0
    add sl, r1, #0x70
    mov r5, #0x0
    mov r8, #0x70
    add fp, r9, fp, lsl #0x2
    str r0, [sp, #0x3c]
.L_39dc:
    str r8, [sp]
    mov r0, #0xa4
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r9, r7, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r1, r6
    mov r3, #0x0
    bl func_ov003_021cedf8
    cmp r7, #0x0
    str sl, [sp]
    mov r0, #0xa4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, #0x2000
    str r0, [sp, #0x10]
    mov r0, #0x40
    str r0, [sp, #0x14]
    ldr r2, [fp, #0xd4]
    ldr r3, [sp, #0x3c]
    mov r0, r4
    mov r1, r6
    addne r7, r7, #0x1
    bl func_ov003_021cedf8
    add r5, r5, #0x1
    add r8, r8, #0x38
    cmp r5, #0x3
    blt .L_39dc
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3a7c:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_3a94
    cmp r0, #0x1
    beq .L_3be0
    b .L_3c6c
.L_3a94:
    cmp r5, #0x0
    ldrne fp, [r4, #0x14]
    movne r9, #0x1
    movne sl, #0x0
    bne .L_3ab4
    ldr fp, [r4, #0x10]
    mov r9, #0x2
    mov sl, #0x1
.L_3ab4:
    mov r0, #0x38
    mul r0, fp, r0
    add r0, r0, #0x70
    rsb r0, r0, #0xa8
    str r0, [sp, #0x20]
    mov r6, #0x0
    mov r8, #0x70
.L_3ad0:
    cmp r6, fp
    bne .L_3b4c
    ldr r1, [r4, #0xc]
    mov r0, r4
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1c
    add r1, r2, r1, ror #0x1c
    rsb r2, r1, #0x10
    ldr r1, [sp, #0x20]
    mov r3, #0x0
    mul r2, r1, r2
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    mov r1, r1, asr #0x4
    rsb r1, r1, #0xa8
    str r1, [sp]
    mov r1, #0xa4
    str r1, [sp, #0x4]
    mov r1, #0x1
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r1, #0x3400
    str r1, [sp, #0x10]
    mov r1, #0xa0
    str r1, [sp, #0x14]
    add r2, r7, sl, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r1, r9
    bl func_ov003_021cedf8
    b .L_3bc4
.L_3b4c:
    ldr r0, [r4, #0xc]
    cmp r5, #0x0
    mov r1, r0, lsr #0x1f
    beq .L_3b74
    rsb r0, r1, r0, lsl #0x1c
    add r1, r1, r0, ror #0x1c
    mov r0, #0xc
    mul r0, r1, r0
    rsb r0, r0, #0xa4
    b .L_3b84
.L_3b74:
    rsb r0, r1, r0, lsl #0x1c
    add r0, r1, r0, ror #0x1c
    mov r0, r0, lsl #0x2
    add r0, r0, #0xa4
.L_3b84:
    str r8, [sp]
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r7, sl, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r1, r9
    mov r3, #0x0
    bl func_ov003_021cedf8
.L_3bc4:
    add r6, r6, #0x1
    cmp sl, #0x0
    addne sl, sl, #0x1
    add r8, r8, #0x38
    cmp r6, #0x3
    blt .L_3ad0
    b .L_3c6c
.L_3be0:
    cmp r5, #0x0
    movne r1, #0x1
    movne r0, #0x0
    bne .L_3bfc
    ldr r0, [r4, #0x10]
    mov r1, #0x2
    add r0, r0, #0x1
.L_3bfc:
    cmp r5, #0x0
    movne r3, #0xa4
    bne .L_3c34
    ldr r2, [r4, #0xc]
    mov r6, #0x84
    mov r3, r2, lsr #0x1f
    rsb r2, r3, r2, lsl #0x1c
    add r2, r3, r2, ror #0x1c
    rsb r2, r2, #0x10
    mul r3, r2, r6
    mov r2, r3, asr #0x3
    add r2, r3, r2, lsr #0x1c
    mov r2, r2, asr #0x4
    add r3, r2, #0x20
.L_3c34:
    mov r2, #0xa8
    stmia sp, {r2, r3}
    mov r2, #0x1
    str r2, [sp, #0x8]
    mov r3, #0x0
    str r3, [sp, #0xc]
    mov r2, #0x3400
    str r2, [sp, #0x10]
    mov r2, #0xa0
    add r0, r7, r0, lsl #0x2
    str r2, [sp, #0x14]
    ldr r2, [r0, #0xf4]
    mov r0, r4
    bl func_ov003_021cedf8
.L_3c6c:
    add r5, r5, #0x1
    cmp r5, #0x2
    add r7, r7, #0x6c
    blt .L_3920
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3c84:
    mov r6, r4
    mov r5, #0x0
    mvn fp, #0x0
.L_3c90:
    cmp r5, #0x0
    bne .L_3cb4
    ldr r0, _LIT3
    mov r7, #0x2
    ldr r0, [r0, #0x44]
    mov sl, #0x4
    add r8, r0, #0x1
    mov r9, #0x0
    b .L_3cec
.L_3cb4:
    ldr r0, _LIT3
    mov r7, #0x1
    ldr r0, [r0, #0x48]
    mov sl, #0x88
    add r8, r0, #0x4
    mov r9, fp
    bl func_02034784
    cmp r0, #0x0
    beq .L_3cec
    ldr r0, _LIT3
    ldr r0, [r0, #0x54]
    cmp r0, #0x0
    moveq r8, #0x0
    moveq r9, r8
.L_3cec:
    add sl, sl, #0x1c
    mov r0, #0xa8
    stmia sp, {r0, sl}
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r6, r8, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r1, r7
    mov r3, r9
    mov r0, r4
    bl func_ov003_021cedf8
    add r5, r5, #0x1
    add r6, r6, #0x6c
    cmp r5, #0x2
    blt .L_3c90
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3d48:
    ldr r0, _LIT3
    ldr r0, [r0, #0x50]
    cmp r0, #0x0
    beq .L_3dec
    ble .L_3d74
    mov r0, #0x0
    str r0, [sp, #0x38]
    mov r0, #0x4
    mov r6, #0x2
    str r0, [sp, #0x34]
    b .L_3d88
.L_3d74:
    bge .L_3d88
    mov r6, #0x1
    mov r0, #0x88
    str r6, [sp, #0x38]
    str r0, [sp, #0x34]
.L_3d88:
    ldr r0, [sp, #0x38]
    mov r1, #0x6c
    mul r5, r0, r1
    add r7, r4, #0xc0
    ldr r0, [r7, r5]
    bl func_0201e7e4
    cmp r0, #0x0
    beq .L_3dec
    mov r0, #0xa8
    str r0, [sp]
    ldr r0, [sp, #0x34]
    mov r3, #0x80
    add r0, r0, #0x1c
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, #0x2800
    str r0, [sp, #0x10]
    str r3, [sp, #0x14]
    ldr r2, [r7, r5]
    mov r0, r4
    mov r1, r6
    sub r3, r3, #0x81
    bl func_ov003_021cedf8
.L_3dec:
    mov r9, #0x0
    mov sl, r4
    mov r8, #0xa8
    mov r7, #0x1
    mov r6, r9
    mov fp, #0x3400
    mvn r5, #0x0
.L_3e08:
    cmp r9, #0x0
    bne .L_3e54
    ldr r2, _LIT3
    mov r1, #0x2
    ldr r2, [r2, #0x50]
    mov r0, #0x20
    cmp r2, r5
    bne .L_3e44
    ldr r2, [r4, #0xc]
    mov r0, #0x6
    mul r3, r2, r0
    mov r0, r3, asr #0x2
    add r0, r3, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    add r0, r0, #0x20
.L_3e44:
    ldr r2, _LIT3
    ldr r2, [r2, #0x44]
    add r2, r2, #0x1
    b .L_3e94
.L_3e54:
    ldr r2, _LIT3
    mov r1, #0x1
    ldr r2, [r2, #0x50]
    mov r0, #0xa4
    cmp r2, #0x1
    bne .L_3e88
    ldr r2, [r4, #0xc]
    mov r0, #0x6
    mul r3, r2, r0
    mov r0, r3, asr #0x2
    add r0, r3, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    rsb r0, r0, #0xa4
.L_3e88:
    ldr r2, _LIT3
    ldr r2, [r2, #0x48]
    add r2, r2, #0x1
.L_3e94:
    str r8, [sp]
    stmib sp, {r0, r7}
    str r6, [sp, #0xc]
    str fp, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, sl, r2, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r3, r6
    bl func_ov003_021cedf8
    add r9, r9, #0x1
    add sl, sl, #0x6c
    cmp r9, #0x2
    blt .L_3e08
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3ed8:
    mov r7, r4
    mov r5, #0x0
.L_3ee0:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_3f00
    cmp r0, #0x1
    beq .L_3f80
    cmp r0, #0x2
    beq .L_4004
    b .L_4150
.L_3f00:
    cmp r5, #0x0
    bne .L_3f24
    ldr r0, _LIT3
    mov r1, #0x2
    ldr r0, [r0, #0x44]
    mov r6, #0x4
    add r2, r0, #0x1
    mov r3, #0x0
    b .L_3f3c
.L_3f24:
    ldr r0, _LIT3
    mov r6, #0x88
    ldr r0, [r0, #0x48]
    sub r3, r6, #0x89
    add r2, r0, #0x7
    mov r1, #0x1
.L_3f3c:
    mov r0, #0xa8
    str r0, [sp]
    add r0, r6, #0x1c
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r0, r7, r2, lsl #0x2
    ldr r2, [r0, #0xf4]
    mov r0, r4
    bl func_ov003_021cedf8
    b .L_4150
.L_3f80:
    cmp r5, #0x0
    movne r1, #0x1
    movne r2, #0x0
    movne r3, #0xa4
    bne .L_3fc8
    ldr r0, [r4, #0xc]
    ldr r3, [r4, #0x10]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1c
    add r1, r1, r0, ror #0x1c
    mov r0, #0x84
    mul r2, r1, r0
    mov r0, r2, asr #0x3
    add r0, r2, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    add r2, r3, #0x1
    add r3, r0, #0x20
    mov r1, #0x2
.L_3fc8:
    mov r0, #0xa8
    stmia sp, {r0, r3}
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r3, #0x0
    str r3, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r0, r7, r2, lsl #0x2
    ldr r2, [r0, #0xf4]
    mov r0, r4
    bl func_ov003_021cedf8
    b .L_4150
.L_4004:
    cmp r5, #0x0
    ldrne fp, [r4, #0x14]
    movne r9, #0x1
    movne sl, #0x0
    bne .L_4024
    ldr fp, [r4, #0x10]
    mov r9, #0x2
    mov sl, #0x1
.L_4024:
    mov r0, #0x38
    mul r0, fp, r0
    add r0, r0, #0x70
    rsb r0, r0, #0xa8
    str r0, [sp, #0x24]
    mov r6, #0x0
    mov r8, #0x70
.L_4040:
    cmp r6, fp
    bne .L_40b8
    ldr r1, [r4, #0xc]
    mov r0, r4
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1c
    add r2, r2, r1, ror #0x1c
    ldr r1, [sp, #0x24]
    mov r3, #0x0
    mul r2, r1, r2
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    mov r1, r1, asr #0x4
    rsb r1, r1, #0xa8
    str r1, [sp]
    mov r1, #0xa4
    str r1, [sp, #0x4]
    mov r1, #0x1
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r1, #0x3400
    str r1, [sp, #0x10]
    mov r1, #0xa0
    str r1, [sp, #0x14]
    add r2, r7, sl, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r1, r9
    bl func_ov003_021cedf8
    b .L_4138
.L_40b8:
    ldr r0, [r4, #0xc]
    cmp r5, #0x0
    mov r1, r0, lsr #0x1f
    beq .L_40e4
    rsb r0, r1, r0, lsl #0x1c
    add r0, r1, r0, ror #0x1c
    rsb r1, r0, #0x10
    mov r0, #0xc
    mul r0, r1, r0
    rsb r0, r0, #0xa4
    b .L_40f8
.L_40e4:
    rsb r0, r1, r0, lsl #0x1c
    add r0, r1, r0, ror #0x1c
    rsb r0, r0, #0x10
    mov r0, r0, lsl #0x2
    add r0, r0, #0xa4
.L_40f8:
    str r8, [sp]
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r7, sl, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r1, r9
    mov r3, #0x0
    bl func_ov003_021cedf8
.L_4138:
    add r6, r6, #0x1
    cmp sl, #0x0
    addne sl, sl, #0x1
    add r8, r8, #0x38
    cmp r6, #0x3
    blt .L_4040
.L_4150:
    add r5, r5, #0x1
    cmp r5, #0x2
    add r7, r7, #0x6c
    blt .L_3ee0
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4168:
    ldr r0, _LIT3
    ldr r0, [r0, #0x50]
    cmp r0, #0x1
    bne .L_4194
    ldr r0, _LIT3
    mov r3, #0x0
    ldr r0, [r0, #0x44]
    mov r1, #0x2
    add r0, r0, #0x1
    mov r2, #0x4
    b .L_41ac
.L_4194:
    ldr r0, _LIT3
    mov r3, #0x1
    ldr r0, [r0, #0x48]
    mov r1, r3
    add r0, r0, #0x1
    mov r2, #0x88
.L_41ac:
    ldr r5, [r4, #0xc]
    mov r6, #0x6c
    rsb r7, r5, #0x10
    mov r5, #0x70
    mul r8, r7, r5
    mov r5, r8, asr #0x3
    add r5, r8, r5, lsr #0x1c
    mov r5, r5, asr #0x4
    rsb r7, r5, #0x118
    mla r5, r3, r6, r4
    str r7, [sp]
    add r2, r2, #0x1c
    str r2, [sp, #0x4]
    mov r2, #0x1
    str r2, [sp, #0x8]
    mov r3, #0x0
    str r3, [sp, #0xc]
    mov r2, #0x3400
    str r2, [sp, #0x10]
    mov r2, #0xa0
    str r2, [sp, #0x14]
    add r0, r5, r0, lsl #0x2
    ldr r2, [r0, #0xf4]
    mov r0, r4
    bl func_ov003_021cedf8
.L_4210:
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021040ac
_LIT1: .word 0x88888889
_LIT2: .word 0x55555556
_LIT3: .word data_ov003_021cf6c0
