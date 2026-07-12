; func_ov002_021cdcec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022cf088
        .extern data_ov002_022cf1a8
        .extern func_0202b854
        .extern func_0202e1e0
        .extern func_0202e2a4
        .extern func_0202efa8
        .extern func_ov002_021b0b24
        .extern func_ov002_021b1e40
        .extern func_ov002_021b9048
        .extern func_ov002_021b90e4
        .extern func_ov002_021b97e4
        .extern func_ov002_021b985c
        .extern func_ov002_021b99c8
        .extern func_ov002_021ba924
        .extern func_ov002_021baa58
        .extern func_ov002_021babc8
        .extern func_ov002_021c2854
        .extern func_ov002_021c28dc
        .extern func_ov002_021c9310
        .extern func_ov002_021c9424
        .extern func_ov002_021c9718
        .extern func_ov002_021c97ac
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021cdcec
        .arm
func_ov002_021cdcec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    mov r6, #0x1
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r4, #0x1
    ldrh r3, [r0, #0x4]
    ldrh r2, [r0, #0x2]
    moveq r4, #0x0
    and r0, r3, #0xff
    cmp r0, #0xf
    mov r0, r3, asr #0x8
    mov r1, r2, asr #0x8
    and r8, r1, #0xff
    ldr r1, _LIT0
    moveq r5, #0x1
    and r0, r0, #0xff
    and r7, r2, #0xff
    and r2, r0, #0xf0
    and r0, r0, #0xf
    str r0, [sp, #0x4]
    mov r0, r2, asr #0x4
    and fp, r3, #0xff
    movne r5, #0x0
    cmp fp, #0xd
    cmpne fp, #0xc
    movne r6, #0x0
    cmp r7, #0xb
    and sl, r0, #0xff
    ldrh r1, [r1, #0x6]
    beq .L_b4
    cmp r7, #0xc
    beq .L_a4
    cmp r7, #0xd
    bne .L_c0
    mov r0, r4
    bl func_ov002_021b97e4
    mov r8, r0
    b .L_c0
.L_a4:
    mov r0, r4
    bl func_ov002_021b985c
    mov r8, r0
    b .L_c0
.L_b4:
    mov r0, r4
    bl func_ov002_021b99c8
    mov r8, r0
.L_c0:
    ldr r1, _LIT0
    ldr r0, [r1, #0x810]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_798
    b .L_e8
    b .L_f8
    b .L_18c
    b .L_734
    b .L_780
.L_e8:
    add r0, r0, #0x1
    str r0, [r1, #0x810]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f8:
    mov r0, r4
    mov r1, r7
    mov r2, r8
    bl func_ov002_021c9310
    mov r5, r0
    mov r0, r4
    mov r1, r7
    mov r2, r8
    bl func_ov002_021c9310
    ldr r0, [r0]
    ldr r1, [r5]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    adds r3, r0, r1, lsr #0x1f
    beq .L_168
    and r1, r7, #0xff
    and r0, r8, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    cmp r6, #0x0
    mov r2, r0, lsr #0x10
    movne r3, #0x0
    mov r1, r4
    mov r0, #0x1d
    bl func_ov002_0229acd0
    b .L_174
.L_168:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
.L_174:
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18c:
    mov r0, #0x1d
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r6, #0x0
    mov r0, r4
    mov r1, r7
    beq .L_1e8
    mov r2, r8
    bl func_ov002_021c9310
    mov r1, r0
    ldr r2, [r1]
    ldr r0, _LIT1
    bic r3, r2, #0x40000
    bic r6, r3, #0x80000
    bic r2, r6, #0x20000
    bic r3, r2, #0x100000
    bic r2, r3, #0x4000
    bic r2, r2, #0x200000
    str r2, [r1]
    bl func_ov002_021b90e4
    b .L_46c
.L_1e8:
    mov r2, r8
    bl func_ov002_021c9310
    mov r9, r0
    ldr r1, [r9]
    ldr r0, [sp, #0x4]
    bic r1, r1, #0x40000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0xd
    orr r1, r0, #0x80000
    bic r0, r1, #0x20000
    bic r0, r0, #0x100000
    str r0, [r9]
    cmp sl, #0x0
    ldrne r0, [r9]
    bicne r0, r0, #0x4000
    strne r0, [r9]
    cmp r5, #0x0
    ldrne r0, [r9]
    bicne r0, r0, #0x200000
    strne r0, [r9]
    cmp fp, #0xe
    bne .L_420
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_420
    cmp r7, #0x5
    bge .L_3ac
    cmp sl, #0x0
    bne .L_3ac
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_3ac
    ldr r0, [r9]
    mov r0, r0, lsl #0x12
    cmp r4, r0, lsr #0x1f
    bne .L_2ac
    ldr r0, _LIT2
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r1, _LIT3
    ldr r0, [r1, r2]
    orr r0, r0, #0x2000000
    str r0, [r1, r2]
.L_2ac:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b854
    cmp r0, #0x8
    blt .L_2e0
    ldr r3, _LIT4
    mov r6, #0x0
    mov r0, r4
    mov r1, #0xb
    mov r2, #0x1
    str r6, [sp]
    bl func_ov002_021b1e40
.L_2e0:
    ldr r0, [r9]
    mov r1, #0x1
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x3
    mov r2, r1, lsl r0
    ldr r1, _LIT5
    mov r0, #0x0
    bl func_ov002_021c2854
    ldr r1, [r9]
    mov r0, #0x1
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    mov r2, r0, lsl r1
    rsb r1, r0, #0x14c0
    bl func_ov002_021c2854
    ldr r0, [r9]
    mov r1, #0x4
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_021b9048
    cmp r0, #0x0
    beq .L_34c
    ldr r1, _LIT6
    mov r0, r4
    bl func_ov002_021c28dc
.L_34c:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202efa8
    cmp r0, #0x0
    beq .L_3ac
    ldr r6, _LIT7
    mov sl, #0x5
.L_36c:
    mov r0, r4
    mov r1, sl
    mov r2, r6
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_3a0
    mov r3, #0x0
    str r3, [sp]
    mov r0, r4
    mov r1, sl
    mov r2, #0x1
    mov r3, r6
    bl func_ov002_021b1e40
.L_3a0:
    add sl, sl, #0x1
    cmp sl, #0xa
    blt .L_36c
.L_3ac:
    ldr r0, [r9]
    mov r1, #0x1
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x3
    mov r2, r1, lsl r0
    ldr r1, _LIT8
    mov r0, #0x0
    bl func_ov002_021c2854
    ldr r1, [r9]
    mov r0, #0x1
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    mov r2, r0, lsl r1
    ldr r1, _LIT8
    bl func_ov002_021c2854
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_420
    ldr r0, [r9]
    ldr r1, _LIT9
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c28dc
.L_420:
    cmp r5, #0x0
    beq .L_460
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_460
    ldr r1, _LIT10
    mov r0, #0x0
    mov r2, #0x1
    bl func_ov002_021c2854
    mov r0, #0x1
    ldr r1, _LIT10
    mov r2, r0
    bl func_ov002_021c2854
.L_460:
    ldr r0, _LIT1
    mov r1, r9
    bl func_ov002_021b90e4
.L_46c:
    ldr r0, _LIT11
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r4, r0
    bne .L_504
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_504
    mov r0, #0xd
    mov r1, #0x1
    bl func_ov002_021b0b24
    cmp r7, #0x4
    bgt .L_4ac
    mov r0, #0xe
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_4ac:
    cmp r5, #0x0
    beq .L_504
    mov r0, r4
    mov r1, r7
    mov r2, r8
    bl func_ov002_021c9424
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_504
    mov r0, #0x26
    mov r1, #0x1
    bl func_ov002_021b0b24
    ldr r0, _LIT0
    ldr r0, [r0, #0x818]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_504
    mov r0, #0x27
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_504:
    ldrh r1, [sp, #0xa]
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0xa]
    ldrh r1, [sp, #0xa]
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0xa]
    ldrh r1, [sp, #0xa]
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r3, r1, r0, lsr #0x12
    mov r0, r4
    mov r1, r7
    mov r2, r8
    strh r3, [sp, #0xa]
    bl func_ov002_021c9718
    ldrh r1, [sp, #0xa]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x8000
    orr r3, r1, r0, lsr #0x10
    mov r0, r4
    mov r1, r7
    mov r2, r8
    strh r3, [sp, #0xa]
    bl func_ov002_021c97ac
    ldr r2, _LIT0
    mov r0, r0, lsl #0x10
    ldr r3, [r2, #0x818]
    ldrh r1, [sp, #0x8]
    mov r3, r3, lsl #0x12
    mov r3, r3, lsr #0x1f
    mov r3, r3, lsl #0x10
    mov r4, r3, lsr #0x10
    mov r3, fp, lsl #0x10
    mov r6, r0, lsr #0x10
    mov r0, r3, lsr #0x10
    bic r3, r1, #0x1
    and r1, r4, #0x1
    orr r1, r3, r1
    strh r1, [sp, #0x8]
    ldrh r1, [sp, #0x8]
    ldrh r2, [sp, #0xa]
    mov r0, r0, lsl #0x1b
    bic r1, r1, #0x3e
    bic r3, r2, #0x4000
    mov r2, r6, lsl #0x1f
    orr r0, r1, r0, lsr #0x1a
    orr r2, r3, r2, lsr #0x11
    strh r0, [sp, #0x8]
    cmp fp, #0xd
    movne r0, #0x1
    strh r2, [sp, #0xa]
    moveq r0, #0x0
    ldrh r3, [sp, #0x8]
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    ldrh r1, [sp, #0xa]
    bic r3, r3, #0x3fc0
    mov r2, r2, lsl #0x18
    mov r0, r1, lsl #0x1f
    orr r3, r3, r2, lsr #0x12
    mov r1, r1, lsl #0x1a
    mov r2, r8
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    strh r3, [sp, #0x8]
    bl func_ov002_021ba924
    cmp r5, #0x0
    ldreqh r0, [sp, #0x8]
    movne r2, #0x0
    moveq r0, r0, lsl #0x12
    moveq r2, r0, lsr #0x18
    ldrh r0, [sp, #0x8]
    ldr r3, _LIT1
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021baa58
    ldrh r0, [sp, #0x8]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c9718
    ldrh r1, [sp, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp, #0x8]
    ldrh r0, [sp, #0x8]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c97ac
    ldr r1, _LIT0
    ldrh r4, [sp, #0x8]
    ldr r1, [r1, #0x818]
    mov r0, r0, lsl #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x18
    mov r3, r0, lsl #0x1f
    bic r4, r4, #0x4000
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    orr r3, r4, r3, lsr #0x11
    strh r3, [sp, #0x8]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    ldrh r2, [sp, #0xa]
    ldrh r3, [sp, #0x8]
    mov r0, #0x18
    orr r1, r1, #0x50000
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_734:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_768
    add r0, r7, r8
    cmp r0, #0xa
    bgt .L_768
    ldr r0, [r1, #0x818]
    mov r1, r4
    mov r0, r0, lsl #0x13
    mov r2, r0, lsr #0x13
    mov r0, #0x4a
    mov r3, #0x0
    bl func_ov002_0229acd0
.L_768:
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_780:
    mov r0, #0x4a
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
.L_798:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word data_ov002_022cf088
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf1a8
_LIT4: .word 0x0000165a
_LIT5: .word 0x000014bf
_LIT6: .word 0x00001762
_LIT7: .word 0x00001972
_LIT8: .word 0x00001361
_LIT9: .word 0x00001574
_LIT10: .word 0x000016da
_LIT11: .word data_ov002_022cd65c
