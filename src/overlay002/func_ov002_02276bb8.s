; func_ov002_02276bb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern data_ov002_022d0250
        .extern func_0202b878
        .extern func_0202b890
        .extern func_0202ef08
        .extern func_ov002_021ae638
        .extern func_ov002_021b947c
        .extern func_ov002_021baca8
        .extern func_ov002_021bad58
        .extern func_ov002_021c4c9c
        .extern func_ov002_021c848c
        .extern func_ov002_021c93cc
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021d90c0
        .extern func_ov002_021d93e0
        .extern func_ov002_021deb84
        .extern func_ov002_021df62c
        .extern func_ov002_021df6d4
        .extern func_ov002_021e30b4
        .extern func_ov002_021fe3d4
        .extern func_ov002_0225406c
        .extern func_ov002_02256f38
        .extern func_ov002_022768b4
        .extern func_ov002_022862cc
        .global func_ov002_02276bb8
        .arm
func_ov002_02276bb8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x44
    ldr r7, _LIT0
    ldr r2, [r7, #0x18]
    mov r0, r2, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_42a0
    b .L_3070
    b .L_3118
    b .L_37f4
    b .L_3884
    b .L_3884
    b .L_3884
    b .L_3884
    b .L_3884
    b .L_3894
    b .L_3938
.L_3070:
    ldr r2, [r7]
    mov r0, r2, lsl #0x18
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_30e8
    mov r0, r2, lsl #0x1f
    ldr r1, _LIT1
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_30d4
    add r1, r7, #0x10
    str r1, [sp]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r1, [r7]
    ldrb r3, [r7, #0x8]
    mov r4, r1, lsl #0x9
    mov r2, r1, lsl #0x1a
    mov r1, r4, lsr #0x11
    mov r2, r2, lsr #0x1f
    bl func_ov002_022862cc
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_30e8
.L_30d4:
    mov r0, r2, lsl #0x1a
    mov r1, r2, lsr #0x17
    mov r2, r0, lsr #0x1f
    mov r0, #0xf7
    bl func_ov002_021ae638
.L_30e8:
    ldr r3, _LIT3
    add sp, sp, #0x44
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3118:
    ldr r1, [r7]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_3154
    ldr r0, _LIT2
    bic r1, r1, #0xc0
    ldr r0, [r0, #0xd44]
    mov r0, r0, lsl #0x1e
    orr r1, r1, r0, lsr #0x18
    mov r0, r1, lsl #0x18
    movs r0, r0, lsr #0x1e
    str r1, [r7]
    orreq r0, r1, #0x20
    streq r0, [r7]
.L_3154:
    ldr r0, [r7]
    mov r1, r0, lsl #0x1a
    movs r1, r1, lsr #0x1f
    beq .L_31ac
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, [r7]
    orr r3, r1, #0x60
    mov r1, r0, lsl #0x9
    mov r0, r0, lsl #0x18
    mov r2, r0, lsr #0x1e
    mov r0, r3, lsl #0x10
    mov r1, r1, lsr #0x11
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    ldrb r3, [r7, #0x8]
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d479c
.L_31ac:
    ldrb r0, [r7, #0x8]
    mov r8, #0x0
    mov r9, r8
    strb r8, [r7, #0x9]
    cmp r0, #0x0
    ble .L_323c
    mov r5, r8
    mov r6, #0x8000
    mov r4, r8
.L_31d0:
    add r0, r7, r9, lsl #0x1
    ldrh r1, [r0, #0x10]
    mov r2, r4
    mov r3, r4
    tst r1, #0xff
    movne r0, r6
    moveq r0, r5
    orr r0, r0, #0x4a
    mov r0, r0, lsl #0x10
    mov r1, r1, asr #0x8
    mov r0, r0, lsr #0x10
    and r1, r1, #0xff
    bl func_ov002_021d479c
    cmp r9, #0x0
    beq .L_3220
    add r0, r7, r9, lsl #0x1
    ldrh r1, [r0, #0x10]
    ldrh r0, [r0, #0xe]
    cmp r1, r0
    beq .L_322c
.L_3220:
    ldrb r0, [r7, #0x9]
    add r0, r0, #0x1
    strb r0, [r7, #0x9]
.L_322c:
    ldrb r0, [r7, #0x8]
    add r9, r9, #0x1
    cmp r9, r0
    blt .L_31d0
.L_323c:
    cmp r0, #0x0
    mov r6, #0x0
    ble .L_32c0
    ldr r4, _LIT4
    ldr r9, _LIT5
    mov r5, #0x1
    mov sl, #0x14
.L_3258:
    add fp, r7, r6, lsl #0x1
    ldrh r3, [fp, #0x10]
    cmp r6, #0x0
    mov r0, r3, asr #0x8
    and r2, r0, #0xff
    and r1, r3, #0xff
    add r0, r2, r1, lsl #0x4
    orr r8, r8, r5, lsl r0
    ble .L_32b0
    ldrh r0, [fp, #0xe]
    cmp r3, r0
    bne .L_32b0
    and r1, r1, #0x1
    mla r0, r1, r9, r4
    mla r0, r2, sl, r0
    ldr r1, [r7]
    ldr r0, [r0, #0x30]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x13
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x13
    bl func_ov002_021df6d4
.L_32b0:
    ldrb r0, [r7, #0x8]
    add r6, r6, #0x1
    cmp r6, r0
    blt .L_3258
.L_32c0:
    ldr r0, [r7]
    mov r1, r8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021deb84
    ldr r6, [r7]
    ldr r0, [r7]
    mov r1, r6, lsl #0x1b
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne sl, #0x8000
    mov r3, r1, lsr #0x1c
    mov r1, r6, lsl #0x18
    mov r2, r6, lsl #0x1a
    mov r9, r1, lsr #0x1e
    ldrh r5, [r7, #0x16]
    moveq sl, #0x0
    mov r4, r6, lsr #0x17
    mov r1, r6, lsl #0x9
    mov r8, r2, lsr #0x1f
    mov r2, r1, lsr #0x11
    orr r6, sl, #0x4f
    mov r1, r6, lsl #0x10
    and r6, r0, #0x1
    mov r0, r3, lsl #0x1b
    orr r0, r6, r0, lsr #0x1a
    mov r3, r8, lsl #0x1f
    mov r6, r9, lsl #0x1f
    orr r0, r0, r3, lsr #0x11
    orr r0, r0, r6, lsr #0x10
    mov r3, r0, lsl #0x10
    mov r5, r5, lsl #0x1d
    mov r0, r4, lsl #0x1
    add r0, r0, r5, lsr #0x1f
    mov r4, r0, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r1, lsr #0x10
    mov r1, r2, lsr #0x10
    mov r2, r3, lsr #0x10
    mov r3, r4, lsr #0x10
    bl func_ov002_021d479c
    ldrb r1, [r7, #0x8]
    mov r6, #0x0
    mov r4, r6
    cmp r1, #0x0
    ble .L_33b8
    add r0, sp, #0x38
.L_337c:
    cmp r4, #0x0
    beq .L_3398
    add r2, r7, r4, lsl #0x1
    ldrh r3, [r2, #0x10]
    ldrh r2, [r2, #0xe]
    cmp r3, r2
    beq .L_33ac
.L_3398:
    add r2, r7, r4, lsl #0x1
    ldrh r2, [r2, #0x10]
    mov r3, r6
    add r6, r6, #0x1
    str r2, [r0, r3, lsl #0x2]
.L_33ac:
    add r4, r4, #0x1
    cmp r4, r1
    blt .L_337c
.L_33b8:
    ldr r2, [r7]
    ldr r3, _LIT6
    mov r0, r2, lsl #0x9
    cmp r3, r0, lsr #0x11
    mov r0, r0, lsr #0x11
    bcc .L_3408
    cmp r0, r3
    bcs .L_3624
    sub r1, r3, #0x39
    cmp r0, r1
    bhi .L_33f8
    bcs .L_3528
    sub r1, r3, #0x300
    cmp r0, r1
    beq .L_3474
    b .L_37c4
.L_33f8:
    sub r1, r3, #0x34
    cmp r0, r1
    beq .L_35b0
    b .L_37c4
.L_3408:
    add r2, r3, #0x1dc
    cmp r0, r2
    bhi .L_3430
    mov r1, r2
    cmp r0, r1
    bcs .L_3678
    add r1, r3, #0x1b0
    cmp r0, r1
    beq .L_3678
    b .L_37c4
.L_3430:
    ldr r3, _LIT7
    cmp r0, r3
    bhi .L_3464
    sub r2, r3, #0x4
    cmp r0, r2
    bcc .L_37c4
    beq .L_36a4
    sub r2, r3, #0x1
    cmp r0, r2
    beq .L_370c
    cmp r0, r3
    beq .L_3744
    b .L_37c4
.L_3464:
    add r2, r3, #0xf
    cmp r0, r2
    beq .L_377c
    b .L_37c4
.L_3474:
    mov r0, r2, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_37c4
    cmp r6, #0x3
    bne .L_37c4
    mov sl, #0x0
    mov r9, sl
    mov r8, sl
    cmp r6, #0x0
    ble .L_34e0
    add r5, sp, #0x38
    add r4, sp, #0xc
.L_34a4:
    ldr r3, [r5, r8, lsl #0x2]
    mov r2, r4
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    and r0, r3, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c4c9c
    ldr r1, [sp, #0x28]
    ldr r0, [sp, #0x2c]
    add r8, r8, #0x1
    cmp r8, r6
    add sl, sl, r1
    add r9, r9, r0
    blt .L_34a4
.L_34e0:
    ldr r0, _LIT8
    ldr r1, [r7]
    cmp r9, r0
    movgt r9, r0
    ldr r0, _LIT8
    mov r4, r1, lsl #0x1f
    cmp sl, r0
    movgt sl, r0
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsl #0x1b
    mov r3, r0, lsl #0x10
    mov r2, sl, lsl #0x10
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1c
    orr r2, r3, r2, lsr #0x10
    bl func_ov002_021d90c0
    b .L_37c4
.L_3528:
    cmp r6, #0x1
    blt .L_37c4
    ldr r2, [sp, #0x38]
    mov r1, r0, lsl #0x10
    and r0, r2, #0xff
    ldr r5, _LIT4
    and r4, r0, #0x1
    sub r0, r3, #0xe20
    mla r3, r4, r0, r5
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r2, r0, #0xff
    mov r0, #0x14
    smulbb r0, r2, r0
    add r2, r3, #0x30
    ldr r3, [r2, r0]
    mov r2, r1, lsr #0x10
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldr r0, [r7]
    mov r3, #0x5
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d59cc
    b .L_37c4
.L_35b0:
    mov r0, r2, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_37c4
    cmp r6, #0x2
    bne .L_37c4
    ldr r2, [sp, #0x38]
    ldr r5, [sp, #0x3c]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    and r0, r2, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c848c
    mov r1, r5, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    mov r4, r0
    and r0, r5, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c848c
    ldr r1, [r7]
    mov r2, r0
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1c
    add r2, r4, r2
    bl func_ov002_021d90c0
    b .L_37c4
.L_3624:
    mov r0, r2, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_37c4
    cmp r6, #0x1
    bne .L_37c4
    ldr r2, [sp, #0x38]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    and r0, r2, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c848c
    ldr r1, [r7]
    mov r2, r0
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r2, r2, lsl #0x1
    bl func_ov002_021d90c0
    b .L_37c4
.L_3678:
    ldrh r0, [r7, #0x6]
    cmp r0, #0x0
    beq .L_37c4
    ldr r0, [r7]
    mov r2, #0x1
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d90c0
    b .L_37c4
.L_36a4:
    cmp r1, #0x0
    beq .L_37c4
    ldrh r1, [r7, #0xa]
    ldr r0, _LIT9
    mov r1, r1, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202ef08
    cmp r0, #0x0
    beq .L_37c4
    ldrh r1, [r7, #0xa]
    ldr r2, [r7]
    ldr r0, _LIT9
    mov r1, r1, lsl #0x2
    ldrh r0, [r0, r1]
    mov r4, r2, lsl #0x1f
    mov r3, r2, lsl #0x1b
    mov r0, r0, lsl #0x13
    mov r1, r0, lsr #0x13
    mov r0, #0xa
    mul r2, r1, r0
    mov r0, r4, lsr #0x1f
    mov r1, r3, lsr #0x1c
    bl func_ov002_021d90c0
    b .L_37c4
.L_370c:
    cmp r1, #0x0
    bne .L_37c4
    mov r1, #0x0
    str r1, [sp]
    ldr r1, [r7]
    mov r2, r0, lsl #0x10
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r2, r2, lsr #0x10
    mov r3, #0x5
    bl func_ov002_021d59cc
    b .L_37c4
.L_3744:
    cmp r6, #0x1
    bne .L_37c4
    mov r1, #0x0
    str r1, [sp]
    ldr r1, [r7]
    mov r2, r0, lsl #0x10
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r2, r2, lsr #0x10
    mov r3, #0x5
    bl func_ov002_021d59cc
    b .L_37c4
.L_377c:
    cmp r1, #0x0
    beq .L_37c4
    ldrh r4, [r7, #0x10]
    bl func_0202b890
    mov r1, r4, asr #0x8
    mov r2, r0
    and r0, r4, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c93cc
    cmp r0, #0x0
    beq .L_37c4
    ldr r0, [r7]
    mov r2, #0x1
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d90c0
.L_37c4:
    ldr r3, _LIT3
    add sp, sp, #0x44
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_37f4:
    ldr r0, [r7]
    mov r1, r0, lsl #0x1a
    movs r1, r1, lsr #0x1f
    bne .L_381c
    bic r0, r2, #0xff
    orr r0, r0, #0x9
    str r0, [r7, #0x18]
    add sp, sp, #0x44
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_381c:
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, [r7]
    orr r3, r1, #0x2c
    mov r1, r0, lsl #0x9
    mov r0, r0, lsl #0x1b
    mov r2, r0, lsr #0x1c
    mov r0, r3, lsl #0x10
    mov r1, r1, lsr #0x11
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d479c
    ldr r1, _LIT0
    add sp, sp, #0x44
    ldr r2, [r1, #0x18]
    mov r0, #0x0
    bic r2, r2, #0xff
    orr r2, r2, #0x3
    str r2, [r1, #0x18]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3884:
    mov r0, #0x1f
    bl func_ov002_022768b4
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3894:
    ldr r4, [r7]
    ldr r0, _LIT5
    mov r1, r4, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r1, _LIT4
    and r2, r3, #0x1
    mla r1, r2, r0, r1
    mov r0, r4, lsl #0x1b
    mov r4, r0, lsr #0x1c
    mov r0, #0x14
    mla r0, r4, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addeq sp, sp, #0x44
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r3, #0x0
    movne r1, #0x8000
    ldr r0, _LIT0
    moveq r1, #0x0
    orr r1, r1, #0x45
    ldrh r2, [r0, #0x4]
    mov r0, r1, lsl #0x10
    mov r1, r4, lsl #0x10
    ldrb r3, [r7, #0x8]
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d479c
    ldr r3, _LIT3
    add sp, sp, #0x44
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3938:
    bl func_ov002_021fe3d4
    cmp r0, #0x0
    addne sp, sp, #0x44
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r3, [r7, #0x8]
    mov r4, #0x0
    cmp r3, #0x0
    ble .L_3a58
    ldr r5, _LIT10
    ldr r9, _LIT9
    sub r6, r5, #0x39
    mov fp, #0x1
.L_396c:
    add r1, r7, r4, lsl #0x1
    ldrh r0, [r1, #0xa]
    mov r0, r0, lsl #0x2
    ldrh r0, [r9, r0]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    cmp sl, r6
    beq .L_3998
    cmp sl, r5
    beq .L_39d0
    b .L_3a48
.L_3998:
    ldrh r0, [r1, #0x10]
    ldr r1, [r7]
    mov r2, r1, lsl #0x1f
    and r0, r0, #0xff
    cmp r0, r2, lsr #0x1f
    bne .L_3a48
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202b878
    mov r8, r0
    mov r0, sl
    bl func_0202b878
    cmp r8, r0
    bne .L_3a48
.L_39d0:
    add r0, r7, r4, lsl #0x1
    ldrh r8, [r0, #0xa]
    mov r0, r8
    bl func_ov002_021b947c
    ldr r2, [r7]
    and r1, r8, #0x1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    cmp r2, r1
    mov r8, r1, lsl #0x1f
    movne r2, fp
    mov r0, r0, lsl #0x10
    moveq r2, #0x0
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    mov r2, r2, lsl #0x18
    and r0, r0, #0xff
    mov r0, r0, lsl #0x10
    add r1, r7, r4, lsl #0x1
    and r8, r8, #-2147483648
    and r2, r2, #0x1000000
    orr r2, r8, r2
    and r0, r0, #0x1f0000
    orr r2, r2, #0x400000
    orr r0, r0, r2
    mov r3, sl, lsl #0x10
    ldrh r1, [r1, #0xa]
    mov r2, #0x0
    orr r0, r0, r3, lsr #0x10
    bl func_ov002_021e30b4
.L_3a48:
    ldrb r3, [r7, #0x8]
    add r4, r4, #0x1
    cmp r4, r3
    blt .L_396c
.L_3a58:
    mov r2, #0x0
    mov r4, r2
    cmp r3, #0x0
    ble .L_3a94
.L_3a68:
    cmp r4, #0x0
    beq .L_3a84
    add r0, r7, r4, lsl #0x1
    ldrh r1, [r0, #0x10]
    ldrh r0, [r0, #0xe]
    cmp r1, r0
    beq .L_3a88
.L_3a84:
    add r2, r2, #0x1
.L_3a88:
    add r4, r4, #0x1
    cmp r4, r3
    blt .L_3a68
.L_3a94:
    cmp r2, #0x2
    blt .L_3b40
    ldr r4, _LIT4
    ldr r5, _LIT11
    ldr r9, _LIT5
    mov r8, #0x5
    mov r6, #0x64
    mov sl, #0x0
.L_3ab4:
    ldr r0, [r7]
    mov r1, r8
    mov r0, r0, lsl #0x1f
    mov r2, r5
    mov r0, r0, lsr #0x1f
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_3b30
    ldr r1, [r7]
    mov r0, r8, lsl #0x10
    mov r1, r1, lsl #0x1f
    mov fp, r1, lsr #0x1f
    and r1, fp, #0x1
    mla r2, r1, r9, r4
    add r1, r2, #0x30
    ldr r3, [r1, r6]
    mov fp, fp, lsl #0x1f
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    and r1, fp, #-2147483648
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    mov r3, r2, lsl #0x10
    orr r1, r1, #0x200000
    and r0, r0, #0x1f0000
    orr r0, r1, r0
    mov r2, sl
    orr r0, r0, r5
    mov r1, r3, lsr #0x10
    bl func_ov002_021e30b4
.L_3b30:
    add r8, r8, #0x1
    cmp r8, #0xa
    add r6, r6, #0x14
    blt .L_3ab4
.L_3b40:
    ldr r6, _LIT12
    ldr r4, _LIT2
    mov sl, #0x0
    mov r5, #0x1
    mov fp, #0x5
.L_3b54:
    ldr r0, [r4, #0xcec]
    mov r9, fp
    eor r8, r0, sl
.L_3b60:
    mov r0, r8
    mov r1, r9
    mov r2, r6
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_3b88
    mov r0, r8
    mov r1, r9
    mov r2, r5
    bl func_ov002_021d93e0
.L_3b88:
    add r9, r9, #0x1
    cmp r9, #0x9
    ble .L_3b60
    add sl, sl, #0x1
    cmp sl, #0x2
    blt .L_3b54
    ldr r1, [r7]
    mov r0, r1, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_4270
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_0225406c
    ldr r0, [r7]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_ov002_02256f38
    ldr r0, [r7]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021bad58
    cmp r0, #0x0
    beq .L_4168
    ldr r4, [r7]
    ldr r2, _LIT4
    mov r0, r4, lsl #0x1f
    mov r5, r0, lsr #0x1f
    mov r0, r4, lsl #0x1b
    mov r1, r0, lsr #0x1c
    ldr r0, _LIT5
    and r5, r5, #0x1
    mla r6, r5, r0, r2
    ldr r2, [sp, #0x8]
    mov r3, #0x14
    bic r2, r2, #0x200
    orr r2, r2, r5, lsl #0x9
    mov r0, r4, lsl #0x18
    mul r5, r1, r3
    add r6, r6, #0x30
    ldr r6, [r6, r5]
    mov r0, r0, lsr #0x1e
    mov r5, r6, lsl #0x2
    ldr r4, _LIT0
    bic r2, r2, #0x3c00
    mov r1, r1, lsl #0x1c
    orr r1, r2, r1, lsr #0x12
    orr r1, r1, #0x8000
    bic r9, r1, #0x4000
    ldrh r4, [r4, #0x4]
    mov r5, r5, lsr #0x18
    mov r8, r0, lsl #0x1f
    mov r0, r5, lsl #0x1
    mov r2, r6, lsl #0x12
    add r2, r0, r2, lsr #0x1f
    and r4, r4, #0x1
    ldr r1, _LIT13
    orr r5, r9, r8, lsr #0x11
    sub r0, r3, #0x214
    and r3, r5, r0
    and r0, r2, r1
    orr r0, r3, r0
    bic r0, r0, #0x10000
    str r0, [sp, #0x8]
    cmp r4, #0x0
    movgt r3, #0x1
    ldr r0, [sp, #0x8]
    ldrb r1, [r7, #0x9]
    movle r3, #0x0
    bic r2, r0, #0x20000
    mov r0, r3, lsl #0x1f
    orr r2, r2, r0, lsr #0xe
    ldr r0, [r7]
    bic r2, r2, #0xc0000
    mov r1, r1, lsl #0x1e
    orr r2, r2, r1, lsr #0xc
    mov r0, r0, lsl #0x9
    ldr r1, _LIT14
    str r2, [sp, #0x8]
    cmp r1, r0, lsr #0x11
    mov r3, r0, lsr #0x11
    bcc .L_3ee4
    cmp r3, r1
    bcs .L_411c
    ldr r0, _LIT15
    cmp r3, r0
    bhi .L_3de4
    bcs .L_411c
    sub r2, r1, #0x3d8
    cmp r3, r2
    bhi .L_3d78
    mov r0, r2
    cmp r3, r0
    bcs .L_411c
    ldr r1, _LIT16
    cmp r3, r1
    bhi .L_3d54
    sub r0, r1, #0x4
    cmp r3, r0
    bcc .L_3d30
    cmpne r3, r1
    beq .L_411c
    b .L_4168
.L_3d30:
    sub r0, r1, #0xf4
    cmp r3, r0
    bhi .L_3d44
    beq .L_411c
    b .L_4168
.L_3d44:
    sub r0, r1, #0x80
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_3d54:
    add r0, r1, #0x5
    cmp r3, r0
    bhi .L_3d68
    beq .L_411c
    b .L_4168
.L_3d68:
    add r0, r1, #0x26
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_3d78:
    sub r1, r0, #0x57
    cmp r3, r1
    bhi .L_3db4
    sub r0, r0, #0x57
    cmp r3, r0
    bcs .L_411c
    ldr r0, _LIT17
    cmp r3, r0
    bhi .L_3da4
    beq .L_411c
    b .L_4168
.L_3da4:
    add r0, r0, #0x74
    cmp r3, r0
    beq .L_4104
    b .L_4168
.L_3db4:
    sub r1, r0, #0x37
    cmp r3, r1
    bhi .L_3dd4
    bcs .L_411c
    sub r0, r0, #0x3d
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_3dd4:
    sub r0, r0, #0x6
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_3de4:
    add r2, r0, #0xcd
    cmp r3, r2
    bhi .L_3e68
    mov r1, r2
    cmp r3, r1
    bcs .L_411c
    add r1, r0, #0x67
    cmp r3, r1
    bhi .L_3e38
    bcs .L_4110
    add r1, r0, #0x23
    cmp r3, r1
    bhi .L_3e28
    add r0, r0, #0x23
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_3e28:
    add r0, r0, #0x48
    cmp r3, r0
    beq .L_4104
    b .L_4168
.L_3e38:
    add r1, r0, #0x8b
    cmp r3, r1
    bhi .L_3e58
    bcs .L_411c
    add r0, r0, #0x88
    cmp r3, r0
    beq .L_4110
    b .L_4168
.L_3e58:
    add r0, r0, #0xb3
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_3e68:
    sub r2, r1, #0xc2
    cmp r3, r2
    bhi .L_3eac
    sub r1, r1, #0xc2
    cmp r3, r1
    bcs .L_411c
    add r1, r0, #0xd1
    cmp r3, r1
    bhi .L_3e9c
    add r0, r0, #0xd1
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_3e9c:
    add r0, r0, #0x114
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_3eac:
    sub r2, r1, #0x14
    cmp r3, r2
    bhi .L_3ed4
    mov r0, r2
    cmp r3, r0
    bcs .L_411c
    sub r0, r1, #0x78
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_3ed4:
    rsb r0, r0, #0x2c00
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_3ee4:
    add r0, r1, #0x20c
    cmp r3, r0
    bhi .L_4034
    bcs .L_4110
    add r0, r1, #0x100
    cmp r3, r0
    bhi .L_3f80
    add r0, r1, #0xff
    cmp r3, r0
    bcc .L_3f1c
    addne r0, r1, #0x100
    cmpne r3, r0
    beq .L_411c
    b .L_4168
.L_3f1c:
    add r0, r1, #0x41
    cmp r3, r0
    bhi .L_3f50
    bcs .L_4110
    add r0, r1, #0x21
    cmp r3, r0
    bhi .L_3f40
    beq .L_4110
    b .L_4168
.L_3f40:
    add r0, r1, #0x2b
    cmp r3, r0
    beq .L_4110
    b .L_4168
.L_3f50:
    add r0, r1, #0xe2
    cmp r3, r0
    bhi .L_3f70
    bcs .L_411c
    add r0, r1, #0xd6
    cmp r3, r0
    beq .L_4110
    b .L_4168
.L_3f70:
    add r0, r1, #0xfb
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_3f80:
    add r0, r1, #0x158
    cmp r3, r0
    bhi .L_3fb4
    bcs .L_4110
    ldr r0, _LIT18
    cmp r3, r0
    bhi .L_3fa4
    beq .L_4110
    b .L_4168
.L_3fa4:
    add r0, r0, #0x31
    cmp r3, r0
    beq .L_4110
    b .L_4168
.L_3fb4:
    add r0, r1, #0x1d4
    cmp r3, r0
    bhi .L_3fd4
    bcs .L_4110
    ldr r0, _LIT19
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_3fd4:
    cmp r3, #0x1900
    beq .L_411c
    b .L_4168
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022cd318
_LIT4: .word data_ov002_022cf16c
_LIT5: .word 0x00000868
_LIT6: .word 0x00001688
_LIT7: .word 0x00001a21
_LIT8: .word 0x0000ffff
_LIT9: .word data_ov002_022d0250
_LIT10: .word 0x000014f3
_LIT11: .word 0x00001662
_LIT12: .word 0x000019b2
_LIT13: .word 0x000001ff
_LIT14: .word 0x0000170c
_LIT15: .word 0x00001503
_LIT16: .word 0x0000128e
_LIT17: .word 0x00001341
_LIT18: .word 0x0000182e
_LIT19: .word 0x0000189e
_LIT20: .word 0x00001a1d
.L_4034:
    ldr r1, _LIT20
    cmp r3, r1
    bhi .L_40a4
    bcs .L_4110
    cmp r3, #0x19c0
    bhi .L_4074
    bcs .L_411c
    sub r0, r1, #0xe5
    cmp r3, r0
    bhi .L_4064
    beq .L_411c
    b .L_4168
.L_4064:
    sub r0, r1, #0x87
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_4074:
    sub r0, r1, #0x4a
    cmp r3, r0
    bhi .L_4094
    bcs .L_411c
    sub r0, r1, #0x57
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_4094:
    sub r0, r1, #0x13
    cmp r3, r0
    beq .L_4110
    b .L_4168
.L_40a4:
    add r0, r1, #0x91
    cmp r3, r0
    bhi .L_40d4
    bcs .L_411c
    add r0, r1, #0x13
    cmp r3, r0
    bhi .L_40c8
    beq .L_4110
    b .L_4168
.L_40c8:
    cmp r3, #0x1a80
    beq .L_411c
    b .L_4168
.L_40d4:
    add r0, r1, #0x93
    cmp r3, r0
    bhi .L_40f4
    bcs .L_411c
    add r0, r1, #0x92
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_40f4:
    add r0, r1, #0xfd
    cmp r3, r0
    beq .L_411c
    b .L_4168
.L_4104:
    ldrb r0, [r7, #0x8]
    cmp r0, #0x3
    bcc .L_4168
.L_4110:
    ldrb r0, [r7, #0x8]
    cmp r0, #0x0
    beq .L_4168
.L_411c:
    ldr r0, [r7]
    ldr r2, [sp, #0x8]
    mov r1, r0, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1b
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1c
    and r5, r1, #-2147483648
    mov r4, r0, lsl #0x10
    mov r0, r2, lsl #0x17
    mov r0, r0, lsr #0x17
    mov r1, r0, lsl #0x10
    orr r5, r5, #0xc200000
    and r4, r4, #0x1f0000
    mov r0, r3, lsl #0x10
    orr r3, r5, r4
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_4168:
    ldr r3, [r7]
    ldr r4, _LIT5
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r3, lsl #0x1b
    and r5, r0, #0x1
    mov r1, r1, lsr #0x1c
    mov r2, #0x14
    mul r6, r5, r4
    ldr r5, _LIT21
    ldr r4, _LIT22
    mul r2, r1, r2
    add r5, r5, r6
    ldr r8, [r2, r5]
    add r6, r4, r6
    mov r5, r8, lsr #0x6
    mov r4, r8, lsr #0x2
    and r5, r5, #0x1
    orr r4, r4, r8, lsr #0x1
    and r4, r4, #0x1
    ldrh r6, [r2, r6]
    mvn r5, r5
    mvn r2, r4
    and r4, r6, r5
    tst r4, r2
    beq .L_4270
    ldr r4, _LIT23
    mov r2, r3, lsl #0x9
    cmp r4, r2, lsr #0x11
    mov r5, r2, lsr #0x11
    bcc .L_41fc
    cmp r5, r4
    bcs .L_4220
    sub r2, r4, #0xdc
    cmp r5, r2
    beq .L_4220
    b .L_4270
.L_41fc:
    add r2, r4, #0x4f
    cmp r5, r2
    bhi .L_4210
    beq .L_4220
    b .L_4270
.L_4210:
    add r2, r4, #0xac
    cmp r5, r2
    beq .L_424c
    b .L_4270
.L_4220:
    ldr r2, [r7]
    mov r2, r2, lsr #0x17
    bl func_ov002_021df62c
    ldr r0, [r7]
    mov r2, #0x3
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d93e0
    b .L_4270
.L_424c:
    mov r2, r3, lsr #0x17
    bl func_ov002_021df62c
    ldr r0, [r7]
    mov r2, #0x2
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d93e0
.L_4270:
    ldr r3, _LIT3
    add sp, sp, #0x44
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_42a0:
    mov r0, #0x1
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT21: .word data_ov002_022cf1ac
_LIT22: .word data_ov002_022cf1a4
_LIT23: .word 0x00001913
