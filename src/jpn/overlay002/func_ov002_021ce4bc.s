; func_ov002_021ce4bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd3d8
        .extern data_ov002_022cd3ec
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022cf088
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a8
        .extern data_ov002_022d008c
        .extern func_0202b854
        .extern func_0202de48
        .extern func_0202e1e0
        .extern func_0202e2a4
        .extern func_0202ea74
        .extern func_0202efa8
        .extern func_ov002_021b0b24
        .extern func_ov002_021b1e40
        .extern func_ov002_021b204c
        .extern func_ov002_021b9048
        .extern func_ov002_021b90e4
        .extern func_ov002_021ba924
        .extern func_ov002_021baa58
        .extern func_ov002_021babc8
        .extern func_ov002_021c2854
        .extern func_ov002_021c28dc
        .extern func_ov002_021c9718
        .extern func_ov002_021c97ac
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021ce4bc
        .arm
func_ov002_021ce4bc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r4, #0x1
    ldrh r1, [r0, #0x6]
    moveq r4, #0x0
    ldrh r8, [r0, #0x2]
    ldrh r9, [r0, #0x4]
    tst r1, #0x1
    movne r0, #0x1
    strne r0, [sp, #0x4]
    moveq r0, #0x0
    streq r0, [sp, #0x4]
    ldr r0, _LIT1
    ldr r1, [r0]
    cmp r4, r1
    ldreq r0, [r0, #0x1c]
    cmpeq r8, r0
    ldreq r5, _LIT2
    ldr r0, _LIT0
    ldrne r5, _LIT3
    ldr r1, [r0, #0x810]
    ldr r2, [r5]
    cmp r1, #0x4
    mov r3, r2, lsl #0x13
    mov fp, r3, lsr #0x13
    addls pc, pc, r1, lsl #0x2
    b .L_f24
    b .L_860
    b .L_8a4
    b .L_8d0
    b .L_ecc
    b .L_f0c
.L_860:
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r3, lsr #0x1f
    mov r1, r4
    mov r2, r8
    mov r0, #0x1e
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0, #0x810]
    add sp, sp, #0xc
    add r2, r2, #0x1
    str r2, [r0, #0x810]
    str r1, [r0, #0x814]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8a4:
    mov r0, #0x1e
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8d0:
    ldr r0, [sp, #0x4]
    bic r1, r2, #0x40000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0xd
    orr r0, r0, #0xa0000
    bic r0, r0, #0x100000
    str r0, [r5]
    cmp r9, #0xf
    ldreq r0, [r5]
    biceq r0, r0, #0x200000
    streq r0, [r5]
    cmp r9, #0xe
    bne .L_b14
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_b14
    cmp r8, #0x5
    bge .L_aa0
    cmp r9, #0xe
    bne .L_aa0
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_aa0
    ldr r0, [r5]
    mov r0, r0, lsl #0x12
    cmp r4, r0, lsr #0x1f
    bne .L_970
    ldr r0, _LIT4
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r1, _LIT5
    ldr r0, [r1, r2]
    orr r0, r0, #0x2000000
    str r0, [r1, r2]
.L_970:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b854
    cmp r0, #0x8
    blt .L_9a4
    ldr r3, _LIT6
    mov r6, #0x0
    mov r0, r4
    mov r1, #0xb
    mov r2, #0x1
    str r6, [sp]
    bl func_ov002_021b1e40
.L_9a4:
    ldr r0, [r5]
    mov r1, #0x1
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x3
    mov r2, r1, lsl r0
    ldr r1, _LIT7
    mov r0, #0x0
    bl func_ov002_021c2854
    ldr r1, [r5]
    mov r0, #0x1
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    mov r2, r0, lsl r1
    rsb r1, r0, #0x14c0
    bl func_ov002_021c2854
    ldr r0, [r5]
    mov r1, #0x4
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_021b9048
    cmp r0, #0x0
    beq .L_a10
    ldr r1, _LIT8
    mov r0, r4
    bl func_ov002_021c28dc
.L_a10:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202efa8
    cmp r0, #0x0
    beq .L_a70
    ldr r7, _LIT9
    mov sl, #0x5
    mov r6, #0x0
.L_a34:
    mov r0, r4
    mov r1, sl
    mov r2, r7
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_a64
    mov r0, r4
    mov r1, sl
    mov r2, #0x1
    mov r3, r7
    str r6, [sp]
    bl func_ov002_021b1e40
.L_a64:
    add sl, sl, #0x1
    cmp sl, #0xa
    blt .L_a34
.L_a70:
    ldr r0, [r5, #0x10]
    mov r0, r0, lsr #0x19
    tst r0, #0x1
    beq .L_aa0
    ldr r0, _LIT4
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT10
    ldr r1, _LIT11
    ldrh r0, [r0, r2]
    mov r2, #0x0
    bl func_ov002_021b204c
.L_aa0:
    ldr r0, [r5]
    mov r1, #0x1
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x3
    mov r2, r1, lsl r0
    ldr r1, _LIT12
    mov r0, #0x0
    bl func_ov002_021c2854
    ldr r1, [r5]
    mov r0, #0x1
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    mov r2, r0, lsl r1
    ldr r1, _LIT12
    bl func_ov002_021c2854
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_b14
    ldr r0, [r5]
    ldr r1, _LIT13
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c28dc
.L_b14:
    cmp r9, #0xf
    bne .L_b54
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_b54
    ldr r1, _LIT14
    mov r0, #0x0
    mov r2, #0x1
    bl func_ov002_021c2854
    mov r0, #0x1
    ldr r1, _LIT14
    mov r2, r0
    bl func_ov002_021c2854
.L_b54:
    mov r0, fp
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_ba0
    mov r0, fp
    bl func_0202b854
    cmp r0, #0x2
    bgt .L_ba0
    mov r0, fp
    bl func_0202de48
    cmp r0, #0x0
    bne .L_ba0
    ldr r3, _LIT15
    mov r6, #0x0
    mov r0, r4
    mov r1, #0xb
    mov r2, #0x1
    str r6, [sp]
    bl func_ov002_021b1e40
.L_ba0:
    mov r0, fp
    bl func_0202ea74
    cmp r0, #0x0
    beq .L_bcc
    ldr r3, _LIT16
    mov r6, #0x0
    mov r0, r4
    mov r1, #0xb
    mov r2, #0x2
    str r6, [sp]
    bl func_ov002_021b1e40
.L_bcc:
    ldr r0, _LIT17
    mov r1, r5
    bl func_ov002_021b90e4
    ldr r0, _LIT18
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r4, r0
    bne .L_c9c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_c9c
    mov r0, #0xf
    mov r1, #0x1
    bl func_ov002_021b0b24
    ldr r0, _LIT19
    ldr r0, [r0, #0xcec]
    cmp r0, r4
    bne .L_c20
    mov r0, #0x10
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_c20:
    cmp r9, #0xf
    bne .L_c6c
    mov r0, fp
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_c6c
    mov r0, #0x26
    mov r1, #0x1
    bl func_ov002_021b0b24
    ldr r0, _LIT0
    ldr r0, [r0, #0x818]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_c6c
    mov r0, #0x27
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_c6c:
    cmp r9, #0xd
    bne .L_c9c
    mov r0, fp
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_c9c
    mov r0, #0x2c
    mov r1, #0x1
    bl func_ov002_021b0b24
    mov r0, #0x2a
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_c9c:
    ldr r0, _LIT1
    ldr r1, [r0]
    cmp r4, r1
    ldreq r1, [r0, #0x1c]
    cmpeq r8, r1
    moveq r1, #0x0
    streq r1, [r0, #0x58]
    beq .L_cd8
    ldr r0, _LIT1
    ldr r1, [r0, #0x4]
    cmp r4, r1
    ldreq r1, [r0, #0x20]
    cmpeq r8, r1
    moveq r1, #0x0
    streq r1, [r0, #0x90]
.L_cd8:
    ldrh r1, [sp, #0xa]
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0xa]
    ldrh r1, [sp, #0xa]
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0xa]
    ldrh r1, [sp, #0xa]
    ldr r0, _LIT0
    ldrh r2, [sp, #0x8]
    ldr r0, [r0, #0x818]
    bic r1, r1, #0x3fc0
    orr r1, r1, #0x3fc0
    mov r0, r0, lsl #0x12
    strh r1, [sp, #0xa]
    mov r0, r0, lsr #0x1f
    ldrh r4, [r5, #0x6]
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    ldrh r6, [sp, #0xa]
    ldrh r3, [r5, #0x8]
    bic r2, r2, #0x1
    and r1, r1, #0x1
    orr r1, r2, r1
    strh r1, [sp, #0x8]
    ldrh r1, [sp, #0x8]
    bic r5, r6, #0x8000
    mov r4, r4, lsl #0x1f
    orr r4, r5, r4, lsr #0x10
    strh r4, [sp, #0xa]
    ldrh r4, [sp, #0xa]
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    bic r4, r4, #0x4000
    mov r2, r3, lsl #0x1f
    orr r2, r4, r2, lsr #0x11
    strh r0, [sp, #0x8]
    cmp r9, #0xd
    movne r0, #0x1
    strh r2, [sp, #0xa]
    moveq r0, #0x0
    ldrh r4, [sp, #0x8]
    ldrh r2, [sp, #0xa]
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1a
    mov r2, r2, lsl #0x12
    bic r4, r4, #0x3fc0
    mov r3, r3, lsl #0x18
    orr r3, r4, r3, lsr #0x12
    strh r3, [sp, #0x8]
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021ba924
    ldrh r0, [sp, #0x8]
    ldr r3, _LIT17
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
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
    ldrh r2, [sp, #0x8]
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1a
    mov r2, r2, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c97ac
    ldrh r1, [sp, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x4000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x11
    strh r0, [sp, #0x8]
    ldr r1, _LIT0
    ldrh r2, [sp, #0xa]
    ldr r1, [r1, #0x818]
    ldrh r3, [sp, #0x8]
    mov r4, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r4, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, #0x18
    orr r1, r1, #0x70000
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ecc:
    ldr r2, [r0, #0x818]
    mov r1, r4
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r2, r0, r2, lsr #0x1f
    mov r0, #0x4a
    mov r3, #0x0
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f0c:
    mov r0, #0x4a
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
.L_f24:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word data_ov002_022cd314
_LIT2: .word data_ov002_022cd3d8
_LIT3: .word data_ov002_022cd3ec
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf1a8
_LIT6: .word 0x0000165a
_LIT7: .word 0x000014bf
_LIT8: .word 0x00001762
_LIT9: .word 0x00001972
_LIT10: .word data_ov002_022cf1a2
_LIT11: .word 0x0000197d
_LIT12: .word 0x00001361
_LIT13: .word 0x00001574
_LIT14: .word 0x000016da
_LIT15: .word 0x000017b2
_LIT16: .word 0x000019b8
_LIT17: .word data_ov002_022cf088
_LIT18: .word data_ov002_022cd65c
_LIT19: .word data_ov002_022d008c
