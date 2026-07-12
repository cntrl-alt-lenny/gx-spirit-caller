; func_ov002_021cba94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022cf088
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0a0
        .extern data_ov002_022cf0a4
        .extern data_ov002_022cf0a8
        .extern data_ov002_022cf1a8
        .extern func_0202b854
        .extern func_0202e1e0
        .extern func_0202e2a4
        .extern func_ov002_021b0b24
        .extern func_ov002_021b1e40
        .extern func_ov002_021b90e4
        .extern func_ov002_021ba924
        .extern func_ov002_021baa58
        .extern func_ov002_021c2854
        .extern func_ov002_021c28dc
        .extern func_ov002_021c9310
        .extern func_ov002_021c9718
        .extern func_ov002_021c97ac
        .extern func_ov002_021c9a4c
        .extern func_ov002_0229acd0
        .global func_ov002_021cba94
        .arm
func_ov002_021cba94:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    ldr r0, _LIT0
    ldrh r8, [r0, #0x2]
    ldrh r3, [r0, #0x4]
    ldrh r7, [r0, #0x6]
    mov r6, r8, lsl #0x1f
    mov r4, r8, lsl #0x10
    mov r0, r3, lsl #0x10
    mov sl, r6, lsr #0x1f
    mov r5, r8, lsl #0x1a
    mov r2, r3, lsl #0x1f
    mov fp, r4, lsr #0x16
    tst r7, #0x10
    mov r6, r0, lsr #0x16
    movne r0, #0x1
    moveq r0, #0x0
    mov r4, r2, lsr #0x1f
    tst r7, #0x20
    movne r2, #0x1
    moveq r2, #0x0
    orr r0, r0, r2, lsl #0x1
    str r0, [sp, #0x8]
    mov r1, r3, lsl #0x1a
    mov r9, r5, lsr #0x1b
    mov r5, r1, lsr #0x1b
    add r1, r9, fp
    cmp r1, #0xa
    ldr r0, _LIT0
    movle r9, r1
    ldr r1, [r0, #0x810]
    movle fp, #0x0
    strh r8, [sp, #0x12]
    strh r3, [sp, #0x10]
    cmp r1, #0x0
    beq .L_a4
    cmp r1, #0x1
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a4:
    mov r0, sl
    mov r1, r9
    mov r2, fp
    bl func_ov002_021c9310
    mov r8, r0
    ands r0, r7, #0x1
    str r0, [sp, #0x4]
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r8]
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x40000
    orr r2, r1, r0, lsr #0xd
    bic r1, r2, #0x80000
    bic r0, r1, #0x20000
    bic r2, r0, #0x100000
    ldr r0, [sp, #0x8]
    bic r1, r2, #0x18000
    mov r0, r0, lsl #0x1e
    orr r0, r1, r0, lsr #0xf
    str r0, [r8]
    cmp r5, #0xe
    bne .L_250
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_250
    cmp r9, #0x5
    bge .L_1dc
    tst r7, #0x8
    bne .L_1dc
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_1dc
    cmp sl, r4
    bne .L_164
    ldr r0, _LIT1
    and r1, sl, #0x1
    mul r2, r1, r0
    ldr r1, _LIT2
    ldr r0, [r1, r2]
    orr r0, r0, #0x2000000
    str r0, [r1, r2]
.L_164:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b854
    cmp r0, #0x8
    blt .L_198
    ldr r3, _LIT3
    mov ip, #0x0
    mov r0, sl
    mov r1, #0xb
    mov r2, #0x1
    str ip, [sp]
    bl func_ov002_021b1e40
.L_198:
    ldr r1, [r8]
    mov r0, #0x1
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    mov r2, r0, lsl r1
    ldr r1, _LIT4
    mov r0, #0x0
    bl func_ov002_021c2854
    ldr r1, [r8]
    mov r0, #0x1
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    mov r2, r0, lsl r1
    rsb r1, r0, #0x14c0
    bl func_ov002_021c2854
.L_1dc:
    ldr r1, [r8]
    mov r0, #0x1
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    mov r2, r0, lsl r1
    ldr r1, _LIT5
    mov r0, #0x0
    bl func_ov002_021c2854
    ldr r1, [r8]
    mov r0, #0x1
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    mov r2, r0, lsl r1
    ldr r1, _LIT5
    bl func_ov002_021c2854
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_250
    ldr r0, [r8]
    ldr r1, _LIT6
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c28dc
.L_250:
    sub r0, r5, #0xb
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_298
    b .L_274
    b .L_274
    b .L_274
    b .L_298
    b .L_28c
.L_274:
    ldr r0, [r8]
    bic r1, r0, #0x4000
    bic r0, r1, #0x18000
    bic r0, r0, #0x200000
    str r0, [r8]
    b .L_298
.L_28c:
    ldr r0, [r8]
    bic r0, r0, #0x200000
    str r0, [r8]
.L_298:
    ldr r0, _LIT7
    mov r1, r8
    bl func_ov002_021b90e4
    ldr r0, _LIT8
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp sl, r0
    bne .L_360
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_360
    cmp r5, #0xf
    bne .L_318
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_318
    mov r0, #0x26
    mov r1, #0x1
    bl func_ov002_021b0b24
    ldr r0, _LIT0
    ldr r0, [r0, #0x818]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_318
    mov r0, #0x27
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_318:
    cmp r5, #0xb
    bne .L_32c
    mov r0, #0x2b
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_32c:
    cmp r5, #0xd
    bne .L_340
    mov r0, #0x2c
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_340:
    cmp r9, #0x4
    bgt .L_360
    cmp r5, #0xb
    cmpne r5, #0xd
    bne .L_360
    mov r0, #0x2a
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_360:
    sub r0, r5, #0xb
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_428
    b .L_404
    b .L_3a4
    b .L_384
    b .L_3c4
    b .L_3e4
.L_384:
    cmp r6, #0x0
    ble .L_428
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT9
    ldr r6, [r0, r2]
    b .L_428
.L_3a4:
    cmp r6, #0x0
    ble .L_428
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT10
    ldr r6, [r0, r2]
    b .L_428
.L_3c4:
    cmp r6, #0x0
    ble .L_428
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT11
    ldr r6, [r0, r2]
    b .L_428
.L_3e4:
    cmp r6, #0x0
    ble .L_428
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT12
    ldr r6, [r0, r2]
    b .L_428
.L_404:
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r6, r1, r0
    ldr r3, _LIT13
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x1
    ldr r6, [r3, r6]
    bl func_ov002_021c9a4c
.L_428:
    ldrh r1, [sp, #0xe]
    mov r0, sl, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0xe]
    ldrh r1, [sp, #0xe]
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0xe]
    ldrh r1, [sp, #0xe]
    mov r0, fp, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0xe]
    ldrh r0, [sp, #0xe]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c9718
    ldrh r1, [sp, #0xe]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp, #0xe]
    ldrh r0, [sp, #0xe]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c97ac
    ldrh r3, [sp, #0xc]
    mov r1, r4, lsl #0x10
    mov r2, r1, lsr #0x10
    ldrh r1, [sp, #0xe]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0x1
    and r2, r2, #0x1
    orr r2, r3, r2
    strh r2, [sp, #0xc]
    ldrh r3, [sp, #0xc]
    bic r1, r1, #0x4000
    mov r0, r0, lsl #0x1f
    orr r1, r1, r0, lsr #0x11
    strh r1, [sp, #0xe]
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r3, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0xc]
    ldrh r3, [sp, #0xc]
    mov r0, r6, lsl #0x10
    mov r1, r0, lsr #0x10
    ldrh r2, [sp, #0xe]
    bic r3, r3, #0x3fc0
    mov r1, r1, lsl #0x18
    orr r3, r3, r1, lsr #0x12
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1a
    mov r2, r2, lsl #0x12
    strh r3, [sp, #0xc]
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021ba924
    cmp r5, #0xf
    ldrneh r0, [sp, #0xc]
    moveq r2, #0x0
    movne r0, r0, lsl #0x12
    movne r2, r0, lsr #0x18
    tst r7, #0x2040
    beq .L_5cc
    ldrh r2, [sp, #0xe]
    tst r7, #0x2000
    movne r9, #0xff
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1
    orr r1, r1, r2, lsl #0x2
    orr r1, sl, r1
    and r0, r9, #0xf
    and r1, r1, #0xf
    orr r0, r1, r0, lsl #0x4
    and r0, r0, #0xff
    mov r0, r0, lsl #0x8
    orr r0, r0, #0x40
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
.L_5cc:
    ldrh r0, [sp, #0xc]
    ldr r3, _LIT7
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021baa58
    ldrh r0, [sp, #0xc]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c9718
    ldrh r1, [sp, #0xc]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp, #0xc]
    ldrh r0, [sp, #0xc]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c97ac
    ldr r1, _LIT0
    ldrh r4, [sp, #0xc]
    ldr r1, [r1, #0x818]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r3, r0, lsl #0x1f
    bic r4, r4, #0x4000
    mov r1, r1, lsr #0x18
    orr r3, r4, r3, lsr #0x11
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    strh r3, [sp, #0xc]
    mov r1, r1, lsl #0x10
    ldrh r2, [sp, #0xe]
    ldrh r3, [sp, #0xc]
    mov r0, #0x18
    mov r1, r1, lsr #0x10
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a8
_LIT3: .word 0x0000165a
_LIT4: .word 0x000014bf
_LIT5: .word 0x00001361
_LIT6: .word 0x00001574
_LIT7: .word data_ov002_022cf088
_LIT8: .word data_ov002_022cd65c
_LIT9: .word data_ov002_022cf09c
_LIT10: .word data_ov002_022cf0a4
_LIT11: .word data_ov002_022cf0a0
_LIT12: .word data_ov002_022cf0a8
_LIT13: .word data_ov002_022cf098
