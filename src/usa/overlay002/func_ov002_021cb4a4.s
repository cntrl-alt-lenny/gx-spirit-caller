; func_ov002_021cb4a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022cf088
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0a0
        .extern data_ov002_022cf0a8
        .extern func_0202e1e0
        .extern func_ov002_021b0b24
        .extern func_ov002_021b90e4
        .extern func_ov002_021b939c
        .extern func_ov002_021b98d4
        .extern func_ov002_021b9950
        .extern func_ov002_021ba924
        .extern func_ov002_021baa58
        .extern func_ov002_021c2854
        .extern func_ov002_021c28dc
        .extern func_ov002_021c2b74
        .extern func_ov002_021c2c54
        .extern func_ov002_021c9310
        .extern func_ov002_021c9718
        .extern func_ov002_021c97ac
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021cb4a4
        .arm
func_ov002_021cb4a4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldrh r3, [r0, #0x2]
    mov r0, r3, lsl #0x10
    mov r6, r0, lsr #0x16
    mov r2, r3, lsl #0x1f
    mov r1, r3, lsl #0x1a
    mov r0, r6
    strh r3, [sp, #0xa]
    mov r4, r2, lsr #0x1f
    mov r5, r1, lsr #0x1b
    bl func_ov002_021b939c
    ldr r1, _LIT0
    mov fp, r0
    ldrh r7, [r1, #0x4]
    mov r0, fp, lsr #0x10
    ldr r2, [r1, #0x810]
    mov r8, r7, lsl #0x1f
    mov r9, r7, lsl #0x1a
    mov r0, r0, lsl #0x10
    mov r3, r7, lsl #0x10
    strh r7, [sp, #0x8]
    mov r7, r0, lsr #0x10
    mov r0, r3, lsr #0x16
    cmp r2, #0x0
    mov r8, r8, lsr #0x1f
    mov r9, r9, lsr #0x1b
    str r0, [sp]
    ldrh sl, [r1, #0x6]
    beq .L_94
    cmp r2, #0x1
    beq .L_15c
    cmp r2, #0x2
    beq .L_5a4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_94:
    cmp r5, #0xe
    bne .L_ec
    mov r0, r4
    mov r1, r6
    bl func_ov002_021b98d4
    ldr r1, _LIT1
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    sub r1, r1, #0x1
    cmp r1, r0
    beq .L_ec
    mov r1, r6, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021c2b74
    mov r1, r4
    mov r2, r5
    mov r3, r6
    mov r0, #0x16
    bl func_ov002_0229acd0
.L_ec:
    cmp r5, #0xf
    bne .L_144
    mov r0, r4
    mov r1, r6
    bl func_ov002_021b9950
    ldr r1, _LIT1
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT3
    ldr r1, [r1, r3]
    sub r1, r1, #0x1
    cmp r1, r0
    beq .L_144
    mov r1, r6, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021c2c54
    mov r1, r4
    mov r2, r5
    mov r3, r6
    mov r0, #0x16
    bl func_ov002_0229acd0
.L_144:
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_15c:
    mov r0, #0x16
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    and r0, fp, #0xff
    cmp r0, r4
    bne .L_194
    mov r0, fp, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, r5
    beq .L_1a8
.L_194:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a8:
    mov r0, r4
    mov r1, r5
    mov r2, r7
    bl func_ov002_021c9310
    mov r6, r0
    ands fp, sl, #0x1
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r6]
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x40000
    orr r0, r1, r0, lsr #0xd
    bic r1, r0, #0x80000
    bic r0, r1, #0x20000
    bic r0, r0, #0x100000
    str r0, [r6]
    cmp r5, #0xb
    bne .L_220
    tst sl, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    tst sl, #0x20
    movne r2, #0x1
    moveq r2, #0x0
    ldr r1, [r6]
    orr r0, r0, r2, lsl #0x1
    bic r1, r1, #0x18000
    mov r0, r0, lsl #0x1e
    orr r0, r1, r0, lsr #0xf
    str r0, [r6]
.L_220:
    cmp r9, #0xb
    cmpne r9, #0xc
    cmpne r9, #0xd
    bne .L_244
    ldr r0, [r6]
    bic r1, r0, #0x4000
    bic r0, r1, #0x18000
    bic r0, r0, #0x200000
    str r0, [r6]
.L_244:
    cmp r9, #0xe
    bne .L_2c8
    cmp r5, #0xf
    beq .L_2c8
    ldr r0, [r6]
    mov r1, #0x1
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x3
    mov r2, r1, lsl r0
    ldr r1, _LIT4
    mov r0, #0x0
    bl func_ov002_021c2854
    ldr r1, [r6]
    mov r0, #0x1
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    mov r2, r0, lsl r1
    ldr r1, _LIT4
    bl func_ov002_021c2854
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_2c8
    ldr r0, [r6]
    ldr r1, _LIT5
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c28dc
.L_2c8:
    ldr r0, _LIT6
    mov r1, r6
    bl func_ov002_021b90e4
    cmp r9, #0xb
    bne .L_2f4
    ldr r0, _LIT1
    and r1, r8, #0x1
    mul r2, r1, r0
    ldr r0, _LIT7
    ldr r0, [r0, r2]
    str r0, [sp]
.L_2f4:
    ldr r0, _LIT8
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r4, r0
    bne .L_368
    cmp fp, #0x0
    beq .L_368
    cmp r9, #0xf
    bne .L_354
    mov r0, #0x26
    mov r1, #0x1
    bl func_ov002_021b0b24
    ldr r0, _LIT0
    ldr r0, [r0, #0x818]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_354
    tst sl, #0x80
    bne .L_354
    mov r0, #0x27
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_354:
    cmp r5, #0xb
    bne .L_368
    mov r0, #0x28
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_368:
    ldrh r1, [sp, #0x6]
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x6]
    ldrh r1, [sp, #0x6]
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x6]
    ldrh r1, [sp, #0x6]
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x6]
    ldrh r0, [sp, #0x6]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c9718
    ldrh r1, [sp, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp, #0x6]
    ldrh r0, [sp, #0x6]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c97ac
    ldrh r3, [sp, #0x4]
    mov r1, r8, lsl #0x10
    mov r2, r1, lsr #0x10
    ldrh r1, [sp, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0x1
    and r2, r2, #0x1
    orr r2, r3, r2
    strh r2, [sp, #0x4]
    ldrh r4, [sp, #0x4]
    bic r1, r1, #0x4000
    mov r0, r0, lsl #0x1f
    orr r1, r1, r0, lsr #0x11
    mov r0, r9, lsl #0x10
    mov r3, r0, lsr #0x10
    ldr r0, [sp]
    strh r1, [sp, #0x6]
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    ldrh r1, [sp, #0x6]
    bic r4, r4, #0x3e
    mov r3, r3, lsl #0x1b
    mov r0, r1, lsl #0x1f
    orr r3, r4, r3, lsr #0x1a
    strh r3, [sp, #0x4]
    ldrh r3, [sp, #0x4]
    mov r1, r1, lsl #0x1a
    mov r2, r2, lsl #0x18
    bic r3, r3, #0x3fc0
    orr r3, r3, r2, lsr #0x12
    mov r2, r7
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    strh r3, [sp, #0x4]
    bl func_ov002_021ba924
    cmp r9, #0xf
    ldrneh r0, [sp, #0x4]
    moveq r2, #0x0
    movne r0, r0, lsl #0x12
    movne r2, r0, lsr #0x18
    ldrh r0, [sp, #0x4]
    tst sl, #0x80
    ldr r3, _LIT6
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    movne r2, #0x80
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021baa58
    ldrh r0, [sp, #0x4]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c9718
    ldrh r1, [sp, #0x4]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp, #0x4]
    ldrh r0, [sp, #0x4]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c97ac
    ldr r1, _LIT0
    ldrh r4, [sp, #0x4]
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
    strh r3, [sp, #0x4]
    mov r1, r1, lsl #0x10
    ldrh r2, [sp, #0x6]
    ldrh r3, [sp, #0x4]
    mov r0, #0x18
    mov r1, r1, lsr #0x10
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5a4:
    mvn r0, #0x0
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0a0
_LIT3: .word data_ov002_022cf0a8
_LIT4: .word 0x00001361
_LIT5: .word 0x00001574
_LIT6: .word data_ov002_022cf088
_LIT7: .word data_ov002_022cf098
_LIT8: .word data_ov002_022cd65c
