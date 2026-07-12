; func_ov002_02278690 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf090
        .extern data_ov002_022d008c
        .extern data_ov002_022d0170
        .extern func_0202e2a4
        .extern func_ov002_021ae558
        .extern func_ov002_021b939c
        .extern func_ov002_021bac78
        .extern func_ov002_021c8390
        .extern func_ov002_021c83ac
        .extern func_ov002_021c9d10
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021d8fd0
        .extern func_ov002_021e267c
        .extern func_ov002_021e2fc4
        .extern func_ov002_021fe2e4
        .extern func_ov002_0226af1c
        .extern func_ov002_022861bc
        .global func_ov002_02278690
        .arm
func_ov002_02278690:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r4, _LIT0
    ldr r0, [r4, #0x18]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_3a48
    b .L_2ba4
    b .L_2cdc
    b .L_2e14
    b .L_3a48
    b .L_3a48
    b .L_3a48
    b .L_3a48
    b .L_3a48
    b .L_3038
    b .L_30dc
.L_2ba4:
    ldr r0, [r4]
    mov r1, r0, lsl #0x18
    mov r1, r1, lsr #0x1e
    cmp r1, #0x2
    bne .L_2cac
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c9d10
    cmp r0, #0x0
    bne .L_2bdc
    ldr r0, [r4]
    bic r0, r0, #0xc0
    str r0, [r4]
    b .L_2cac
.L_2bdc:
    ldr r5, [r4]
    ldr r1, _LIT1
    mov r0, r5, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_2c30
    add r1, r4, #0x10
    str r1, [sp]
    mov r1, #0x1
    str r1, [sp, #0x4]
    ldr r1, [r4]
    ldrb r3, [r4, #0x8]
    mov r4, r1, lsl #0x9
    mov r2, r1, lsl #0x1a
    mov r1, r4, lsr #0x11
    mov r2, r2, lsr #0x1f
    bl func_ov002_022861bc
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_2cac
.L_2c30:
    mov r1, r5, lsr #0x17
    movs r1, r1, lsr #0x1
    bne .L_2c94
    ldr r1, _LIT3
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r2, _LIT4
    ldr r1, _LIT5
    and r5, r5, r2
    ldr r3, [r1, r3]
    ldr r1, _LIT6
    add r0, r0, r3, lsl #0x1
    orr r0, r5, r0, lsl #0x17
    mov r3, r0, lsr #0x17
    mov r7, r3, lsl #0x2
    mov r3, r0, lsl #0x9
    ldrh r6, [r1, r7]
    mov r3, r3, lsr #0x11
    mov r3, r3, lsl #0x10
    mov r5, r2, lsr #0xa
    and r6, r6, r2, lsl #0xd
    and r2, r5, r3, lsr #0x10
    orr r2, r6, r2
    str r0, [r4]
    strh r2, [r1, r7]
.L_2c94:
    ldr r1, [r4]
    mov r0, #0xf7
    mov r2, r1, lsl #0x1a
    mov r1, r1, lsr #0x17
    mov r2, r2, lsr #0x1f
    bl func_ov002_021ae558
.L_2cac:
    ldr r3, _LIT7
    add sp, sp, #0xc
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_2cdc:
    ldr r1, [r4]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_2d18
    ldr r0, _LIT2
    bic r1, r1, #0xc0
    ldr r0, [r0, #0xd44]
    mov r0, r0, lsl #0x1e
    orr r1, r1, r0, lsr #0x18
    mov r0, r1, lsl #0x18
    movs r0, r0, lsr #0x1e
    str r1, [r4]
    orreq r0, r1, #0x20
    streq r0, [r4]
.L_2d18:
    ldr r0, [r4]
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_2da4
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    and r0, r0, #0x10
    cmp r0, #0x0
    ldr r0, [r4]
    movgt r1, #0x1
    movle r1, #0x0
    mov r0, r0, lsl #0x1f
    teq r1, r0, lsr #0x1f
    movne r1, #0x8000
    moveq r1, #0x0
    ldrh r0, [r4, #0x4]
    orr r5, r1, #0x60
    tst r0, #0x1
    ldr r0, [r4]
    movne r3, #0x1
    mov r1, r0, lsl #0x9
    moveq r3, #0x0
    mov r0, r0, lsl #0x18
    mov r2, r0, lsr #0x1e
    mov r1, r1, lsr #0x11
    add r3, r3, #0x5
    mov r0, r5, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
.L_2da4:
    ldr r1, [r4]
    ldr r0, _LIT8
    mov r2, r1, lsl #0x9
    mov r2, r2, lsr #0x11
    cmp r2, r0
    bne .L_2de4
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    tst r0, #0x20
    beq .L_2de4
    mov r0, r1, lsl #0x1f
    mov r2, #0x1
    ldr r1, _LIT9
    mov r3, r2
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226af1c
.L_2de4:
    ldr r3, _LIT7
    add sp, sp, #0xc
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_2e14:
    ldr r0, [r4]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202e2a4
    cmp r0, #0x0
    beq .L_2e98
    ldr r0, [r4]
    ldr r1, [r4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r0, #0x8000
    moveq r0, #0x0
    orr r2, r0, #0x48
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x1e
    mov r3, r0, lsl #0x1
    mov r5, r1, lsl #0x1b
    mov r0, r1, lsl #0x9
    mov r4, r1, lsl #0x1a
    mov r1, r0, lsr #0x11
    mov r0, r2, lsl #0x10
    mov r2, r1, lsl #0x10
    orr r1, r3, r4, lsr #0x1f
    mov r5, r5, lsr #0x1c
    orr r1, r1, r5, lsl #0x4
    and r1, r1, #0xff
    mov r1, r1, lsl #0x18
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d46ac
    b .L_3018
.L_2e98:
    ldr r1, [r4]
    ldr r0, _LIT10
    mov r2, r1, lsl #0x9
    cmp r0, r2, lsr #0x11
    mov r2, r2, lsr #0x11
    mov r5, #0x0
    bne .L_2ed0
    mov r0, r1, lsl #0x1f
    mov r1, r2, lsl #0x10
    mov r3, r5
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e267c
.L_2ed0:
    ldrh r0, [r4, #0x4]
    tst r0, #0x1
    beq .L_2fa0
    ldr r0, [r4]
    ldr r1, _LIT11
    mov r0, r0, lsl #0x9
    cmp r1, r0, lsr #0x11
    mov r2, r0, lsr #0x11
    bcc .L_2f2c
    cmp r2, r1
    bcs .L_2f58
    ldr r0, _LIT12
    cmp r2, r0
    bhi .L_2f1c
    bcs .L_2f58
    sub r0, r0, #0x1c4
    cmp r2, r0
    beq .L_2f58
    b .L_2fa0
.L_2f1c:
    add r0, r0, #0xf9
    cmp r2, r0
    beq .L_2f58
    b .L_2fa0
.L_2f2c:
    ldr r0, _LIT13
    cmp r2, r0
    bhi .L_2f4c
    bcs .L_2f90
    add r0, r1, #0xf2
    cmp r2, r0
    beq .L_2f70
    b .L_2fa0
.L_2f4c:
    add r0, r0, #0x7c
    cmp r2, r0
    bne .L_2fa0
.L_2f58:
    ldr r0, [r4]
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    b .L_2fa0
.L_2f70:
    ldr r1, _LIT14
    ldr r0, _LIT9
    ldr r1, [r1, #0x6a8]
    cmp r1, r0
    movgt r1, r0
    mov r0, r1, lsl #0x10
    mov r5, r0, lsr #0x10
    b .L_2fa0
.L_2f90:
    ldr r0, _LIT14
    ldr r0, [r0, #0x6a4]
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
.L_2fa0:
    ldrh r0, [r4, #0x4]
    ldr r7, [r4]
    mov r3, r5
    and r0, r0, #0x1
    cmp r0, #0x0
    mov r2, r7, lsl #0x1f
    mov r5, r2, lsr #0x1f
    mov r0, r7, lsl #0x1b
    mov r4, r0, lsr #0x1c
    movgt r1, #0x1
    mov r0, r7, lsl #0x1a
    and r5, r5, #0x1
    mov r4, r4, lsl #0x1b
    movle r1, #0x0
    orr r4, r5, r4, lsr #0x1a
    mov r6, r0, lsr #0x1f
    mov r2, r7, lsl #0x18
    mov r0, r2, lsr #0x1e
    orr r1, r4, r1, lsl #0x6
    mov r2, r7, lsr #0x17
    mov r2, r2, lsl #0x10
    mov r5, r6, lsl #0x1f
    mov r4, r0, lsl #0x1f
    orr r0, r1, r5, lsr #0x11
    orr r0, r0, r4, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r0, #0x2d
    bl func_ov002_021d46ac
.L_3018:
    ldr r1, _LIT0
    add sp, sp, #0xc
    ldr r2, [r1, #0x18]
    mov r0, #0x0
    bic r2, r2, #0xff
    orr r2, r2, #0x8
    str r2, [r1, #0x18]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_3038:
    ldr r5, [r4]
    ldr r0, _LIT3
    mov r1, r5, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r1, _LIT15
    and r2, r3, #0x1
    mla r1, r2, r0, r1
    mov r0, r5, lsl #0x1b
    mov r5, r0, lsr #0x1c
    mov r0, #0x14
    mla r0, r5, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addeq sp, sp, #0xc
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r3, #0x0
    movne r1, #0x8000
    ldr r0, _LIT0
    moveq r1, #0x0
    orr r1, r1, #0x45
    ldrh r2, [r0, #0x4]
    mov r0, r1, lsl #0x10
    mov r1, r5, lsl #0x10
    ldrb r3, [r4, #0x8]
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d46ac
    ldr r3, _LIT7
    add sp, sp, #0xc
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_30dc:
    bl func_ov002_021fe2e4
    cmp r0, #0x0
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldrh r2, [r4, #0x6]
    ldr r0, _LIT16
    cmp r2, r0
    bgt .L_325c
    bge .L_3410
    ldr r3, _LIT17
    cmp r2, r3
    bgt .L_31ac
    bge .L_3494
    ldr r1, _LIT18
    cmp r2, r1
    bgt .L_3168
    bge .L_3470
    sub r0, r1, #0x9d
    cmp r2, r0
    bgt .L_3144
    bge .L_3494
    sub r0, r1, #0x234
    cmp r2, r0
    beq .L_33e8
    b .L_3640
.L_3144:
    sub r0, r1, #0x77
    cmp r2, r0
    bgt .L_3158
    beq .L_3410
    b .L_3640
.L_3158:
    sub r0, r1, #0x27
    cmp r2, r0
    beq .L_3410
    b .L_3640
.L_3168:
    add r0, r1, #0x77
    cmp r2, r0
    bgt .L_3188
    bge .L_34f4
    add r0, r1, #0x4c
    cmp r2, r0
    beq .L_3494
    b .L_3640
.L_3188:
    add r0, r1, #0xcf
    cmp r2, r0
    bgt .L_319c
    beq .L_3494
    b .L_3640
.L_319c:
    add r0, r1, #0xfb
    cmp r2, r0
    beq .L_3494
    b .L_3640
.L_31ac:
    sub r1, r0, #0xf5
    cmp r2, r1
    bgt .L_321c
    bge .L_3494
    rsb r0, r0, #0x3140
    cmp r2, r0
    bgt .L_31f8
    ldr r0, _LIT19
    cmp r2, r0
    blt .L_31e8
    beq .L_34bc
    add r0, r0, #0x4
    cmp r2, r0
    beq .L_33e8
    b .L_3640
.L_31e8:
    sub r0, r0, #0x13
    cmp r2, r0
    beq .L_3494
    b .L_3640
.L_31f8:
    ldr r0, _LIT20
    cmp r2, r0
    bgt .L_320c
    beq .L_34bc
    b .L_3640
.L_320c:
    add r0, r0, #0x3c
    cmp r2, r0
    beq .L_34bc
    b .L_3640
.L_321c:
    sub r1, r0, #0x6d
    cmp r2, r1
    bgt .L_323c
    bge .L_3534
    sub r0, r0, #0xdc
    cmp r2, r0
    beq .L_3410
    b .L_3640
.L_323c:
    cmp r2, #0x1900
    bgt .L_324c
    beq .L_3494
    b .L_3640
.L_324c:
    add r0, r3, #0x2a0
    cmp r2, r0
    beq .L_3494
    b .L_3640
.L_325c:
    add r1, r0, #0xf1
    cmp r2, r1
    bgt .L_3350
    bge .L_3410
    add r1, r0, #0x8d
    cmp r2, r1
    bgt .L_32e8
    bge .L_3438
    add r1, r0, #0x25
    cmp r2, r1
    bgt .L_32bc
    bge .L_3410
    add r1, r0, #0x3
    cmp r2, r1
    bgt .L_3640
    add r1, r0, #0x1
    cmp r2, r1
    blt .L_3640
    addne r1, r0, #0x2
    cmpne r2, r1
    addne r0, r0, #0x3
    cmpne r2, r0
    beq .L_3410
    b .L_3640
.L_32bc:
    add r1, r0, #0x67
    cmp r2, r1
    bgt .L_32d8
    add r0, r0, #0x67
    cmp r2, r0
    beq .L_3514
    b .L_3640
.L_32d8:
    add r0, r0, #0x8c
    cmp r2, r0
    beq .L_3438
    b .L_3640
.L_32e8:
    add r1, r0, #0xc1
    cmp r2, r1
    bgt .L_3308
    bge .L_33e8
    add r0, r0, #0xc0
    cmp r2, r0
    beq .L_33e8
    b .L_3640
.L_3308:
    add r1, r0, #0xc2
    cmp r2, r1
    bgt .L_3324
    add r0, r0, #0xc2
    cmp r2, r0
    beq .L_33e8
    b .L_3640
.L_3324:
    add r1, r0, #0xc6
    cmp r2, r1
    bgt .L_3640
    add r1, r0, #0xc3
    cmp r2, r1
    blt .L_3640
    beq .L_33e8
    add r0, r0, #0xc6
    cmp r2, r0
    beq .L_3594
    b .L_3640
.L_3350:
    ldr r1, _LIT21
    cmp r2, r1
    bgt .L_33a4
    bge .L_34bc
    sub r0, r1, #0x61
    cmp r2, r0
    bgt .L_3380
    bge .L_3494
    sub r0, r1, #0x77
    cmp r2, r0
    beq .L_35f0
    b .L_3640
.L_3380:
    sub r0, r1, #0x6
    cmp r2, r0
    bgt .L_3394
    beq .L_34bc
    b .L_3640
.L_3394:
    sub r0, r1, #0x5
    cmp r2, r0
    beq .L_34bc
    b .L_3640
.L_33a4:
    add r0, r1, #0x18
    cmp r2, r0
    bgt .L_33c4
    bge .L_3494
    add r0, r1, #0x1
    cmp r2, r0
    beq .L_34bc
    b .L_3640
.L_33c4:
    add r0, r1, #0x19
    cmp r2, r0
    bgt .L_33d8
    beq .L_3494
    b .L_3640
.L_33d8:
    add r0, r1, #0x4b
    cmp r2, r0
    beq .L_3494
    b .L_3640
.L_33e8:
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [r4]
    mov r3, #0x5
    mov r5, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d58dc
    b .L_3640
.L_3410:
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [r4]
    mov r3, #0x3
    mov r5, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d58dc
    b .L_3640
.L_3438:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    tst r0, #0x20
    beq .L_3640
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [r4]
    mov r3, #0x3
    mov r5, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d58dc
    b .L_3640
.L_3470:
    mov r3, #0x1
    str r3, [sp]
    ldr r0, [r4]
    mov r5, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d58dc
    b .L_3640
.L_3494:
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [r4]
    mov r3, #0x2
    mov r5, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d58dc
    b .L_3640
.L_34bc:
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r4]
    mov r3, #0x3
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x11
    mov r5, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r2, r0, lsl #0x10
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r2, r2, lsr #0x10
    bl func_ov002_021d58dc
    b .L_3640
.L_34f4:
    ldr r1, [r4]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsl #0x1b
    mov r1, r1, lsr #0x1c
    rsb r2, r0, #0x1
    bl func_ov002_021d8fd0
    b .L_3640
.L_3514:
    ldr r0, [r4]
    mov r2, #0x1
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d8fd0
    b .L_3640
.L_3534:
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [r4]
    mov r3, #0x3
    mov r1, r0, lsl #0x1b
    mov r5, r0, lsl #0x1f
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d58dc
    ldr r0, [r4]
    mov r1, r0, lsl #0x1b
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021c83ac
    ldr r1, [r4]
    mov r2, r0, lsl #0x10
    mov r3, r1, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x10
    ldrh r1, [r4, #0x6]
    mov r2, #0x1
    bl func_ov002_021e267c
    b .L_3640
.L_3594:
    ldr r0, [r4]
    mov r1, r0, lsl #0x1b
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021c8390
    add r0, r0, r0, lsr #0x1f
    ldr r1, _LIT9
    mov r2, r0, asr #0x1
    cmp r1, r0, asr #0x1
    movlt r2, r1
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldr r0, [r4]
    ldrh r2, [r4, #0x6]
    mov r1, r0, lsl #0x1b
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r3, #0x2
    bl func_ov002_021d58dc
    b .L_3640
.L_35f0:
    ldr r0, _LIT2
    ldr r1, [r4]
    ldr r0, [r0, #0xcec]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    mov r0, r1, lsr #0x1f
    movne r1, #0x1
    moveq r1, #0x0
    add r1, r1, #0x1
    mov r3, #0x0
    and r1, r1, #0xff
    str r3, [sp]
    mov r1, r1, lsl #0x4
    ldr r3, [r4]
    orr r1, r1, #0x2
    mov r5, r3, lsl #0x1b
    mov r3, r1, lsl #0x10
    mov r1, r5, lsr #0x1c
    mov r3, r3, lsr #0x10
    bl func_ov002_021d58dc
.L_3640:
    ldr r0, [r4]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021bac78
    cmp r0, #0x0
    beq .L_3a18
    ldr r1, [r4]
    ldr r0, _LIT22
    mov r1, r1, lsl #0x9
    cmp r0, r1, lsr #0x11
    mov r1, r1, lsr #0x11
    mov r2, #0x0
    bcc .L_3794
    cmp r1, r0
    bcs .L_386c
    sub r3, r0, #0xc7
    cmp r1, r3
    bhi .L_3728
    bcs .L_386c
    sub r3, r0, #0x310
    cmp r1, r3
    bhi .L_36d0
    sub r0, r0, #0x310
    cmp r1, r0
    bcs .L_386c
    ldr r0, _LIT23
    cmp r1, r0
    bhi .L_36c0
    beq .L_386c
    b .L_38ec
.L_36c0:
    add r0, r0, #0xd7
    cmp r1, r0
    beq .L_386c
    b .L_38ec
.L_36d0:
    sub r3, r0, #0x190
    cmp r1, r3
    bhi .L_36f8
    sub r0, r0, #0x190
    cmp r1, r0
    bcs .L_386c
    ldr r0, _LIT24
    cmp r1, r0
    beq .L_386c
    b .L_38ec
.L_36f8:
    ldr r3, _LIT25
    cmp r1, r3
    bhi .L_38ec
    sub r0, r3, #0x4
    cmp r1, r0
    bcc .L_38ec
    beq .L_3874
    sub r0, r3, #0x3
    cmp r1, r0
    cmpne r1, r3
    beq .L_386c
    b .L_38ec
.L_3728:
    sub r3, r0, #0x43
    cmp r1, r3
    bhi .L_3764
    bcs .L_386c
    sub r3, r0, #0xa0
    cmp r1, r3
    bhi .L_3754
    sub r0, r0, #0xa0
    cmp r1, r0
    beq .L_3888
    b .L_38ec
.L_3754:
    sub r0, r0, #0x84
    cmp r1, r0
    beq .L_386c
    b .L_38ec
.L_3764:
    sub r3, r0, #0x5
    cmp r1, r3
    bhi .L_3784
    bcs .L_386c
    sub r0, r0, #0x1e
    cmp r1, r0
    beq .L_386c
    b .L_38ec
.L_3784:
    sub r0, r0, #0x1
    cmp r1, r0
    beq .L_386c
    b .L_38ec
.L_3794:
    add r3, r0, #0x1e8
    cmp r1, r3
    bhi .L_3810
    bcs .L_386c
    ldr r5, _LIT26
    cmp r1, r5
    bhi .L_37e0
    bcs .L_3888
    add r3, r0, #0x50
    cmp r1, r3
    bhi .L_37d0
    add r0, r0, #0x50
    cmp r1, r0
    beq .L_3888
    b .L_38ec
.L_37d0:
    sub r0, r5, #0x73
    cmp r1, r0
    beq .L_389c
    b .L_38ec
.L_37e0:
    add r0, r5, #0x2a
    cmp r1, r0
    bhi .L_3800
    bcs .L_386c
    add r0, r5, #0x19
    cmp r1, r0
    beq .L_386c
    b .L_38ec
.L_3800:
    add r0, r5, #0x72
    cmp r1, r0
    beq .L_38c4
    b .L_38ec
.L_3810:
    ldr r3, _LIT13
    cmp r1, r3
    bhi .L_3844
    bcs .L_38c4
    sub r0, r3, #0x49
    cmp r1, r0
    bhi .L_3834
    beq .L_38dc
    b .L_38ec
.L_3834:
    sub r0, r3, #0x26
    cmp r1, r0
    beq .L_3888
    b .L_38ec
.L_3844:
    add r0, r3, #0x44
    cmp r1, r0
    bhi .L_3860
    bcs .L_3888
    cmp r1, #0x1a80
    beq .L_386c
    b .L_38ec
.L_3860:
    add r0, r3, #0x63
    cmp r1, r0
    bne .L_38ec
.L_386c:
    mov r2, #0x1
    b .L_38ec
.L_3874:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    tst r0, #0x20
    movne r2, #0x1
    b .L_38ec
.L_3888:
    ldrh r0, [r4, #0x6]
    cmp r0, r1
    moveq r2, #0x1
    movne r2, #0x0
    b .L_38ec
.L_389c:
    ldrh r0, [r4, #0x6]
    cmp r0, r1
    bne .L_38bc
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    tst r0, #0x20
    moveq r2, #0x1
    beq .L_38ec
.L_38bc:
    mov r2, #0x0
    b .L_38ec
.L_38c4:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    tst r0, #0x1
    movne r2, #0x1
    moveq r2, #0x0
    b .L_38ec
.L_38dc:
    ldrh r1, [r4, #0x6]
    sub r0, r3, #0x42
    cmp r1, r0
    moveq r2, #0x1
.L_38ec:
    cmp r2, #0x0
    beq .L_3a18
    ldr r5, [r4]
    ldr r2, _LIT15
    mov r0, r5, lsl #0x1f
    mov r6, r0, lsr #0x1f
    mov r0, r5, lsl #0x1b
    mov r1, r0, lsr #0x1c
    mov r3, #0x14
    mul ip, r1, r3
    ldr r0, _LIT3
    and r6, r6, #0x1
    mla lr, r6, r0, r2
    mov r0, r5, lsl #0x18
    ldr r2, [sp, #0x8]
    add lr, lr, #0x30
    bic r2, r2, #0x200
    orr r2, r2, r6, lsl #0x9
    ldr lr, [lr, ip]
    mov r0, r0, lsr #0x1e
    mov ip, lr, lsl #0x2
    ldr r5, _LIT0
    bic r2, r2, #0x3c00
    mov r1, r1, lsl #0x1c
    orr r1, r2, r1, lsr #0x12
    orr r1, r1, #0x8000
    bic r7, r1, #0x4000
    mov r6, r0, lsl #0x1f
    mov ip, ip, lsr #0x18
    ldrh r5, [r5, #0x4]
    mov r2, lr, lsl #0x12
    mov r0, ip, lsl #0x1
    add r2, r0, r2, lsr #0x1f
    and r5, r5, #0x1
    cmp r5, #0x0
    ldr r1, _LIT27
    orr r6, r7, r6, lsr #0x11
    sub r0, r3, #0x214
    and r3, r6, r0
    and r0, r2, r1
    orr r0, r3, r0
    bic r0, r0, #0x10000
    str r0, [sp, #0x8]
    movgt r2, #0x1
    ldr r5, [r4]
    ldr r1, [sp, #0x8]
    ldrb r0, [r4, #0x9]
    mov r3, r5, lsl #0x1f
    mov r3, r3, lsr #0x1f
    mov r4, r3, lsl #0x1f
    mov r3, r5, lsl #0x1b
    and r4, r4, #-2147483648
    mov r3, r3, lsr #0x1c
    mov r5, r5, lsl #0x9
    orr r4, r4, #0x200000
    mov r3, r3, lsl #0x10
    movle r2, #0x0
    bic ip, r1, #0x20000
    mov r1, r2, lsl #0x1f
    orr r1, ip, r1, lsr #0xe
    bic r1, r1, #0xc0000
    mov r0, r0, lsl #0x1e
    orr r2, r1, r0, lsr #0xc
    mov r0, r2, lsl #0x17
    mov r0, r0, lsr #0x17
    mov r1, r0, lsl #0x10
    mov r5, r5, lsr #0x11
    orr r4, r4, #0x10000000
    and r3, r3, #0x1f0000
    mov r0, r5, lsl #0x10
    orr r3, r4, r3
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    str r2, [sp, #0x8]
    bl func_ov002_021e2fc4
.L_3a18:
    ldr r3, _LIT7
    add sp, sp, #0xc
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_3a48:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x00000868
_LIT4: .word 0x007fffff
_LIT5: .word data_ov002_022cf090
_LIT6: .word data_ov002_022d0170
_LIT7: .word data_ov002_022cd238
_LIT8: .word 0x000014d5
_LIT9: .word 0x0000ffff
_LIT10: .word 0x00001578
_LIT11: .word 0x00001809
_LIT12: .word 0x00001636
_LIT13: .word 0x00001a4e
_LIT14: .word data_ov002_022ce1a8
_LIT15: .word data_ov002_022cf08c
_LIT16: .word 0x0000196b
_LIT17: .word 0x000016a4
_LIT18: .word 0x0000151e
_LIT19: .word 0x000017d1
_LIT20: .word 0x00001822
_LIT21: .word 0x00001adc
_LIT22: .word 0x0000180c
_LIT23: .word 0x000012b1
_LIT24: .word 0x0000164a
_LIT25: .word 0x000016fb
_LIT26: .word 0x0000197d
_LIT27: .word 0x000001ff
