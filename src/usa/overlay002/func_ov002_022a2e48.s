; func_ov002_022a2e48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov002_022d0170
        .extern data_ov002_022d0eb8
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d0f34
        .extern func_0207ef74
        .extern func_0208deac
        .extern func_0208e230
        .extern func_ov002_022476f0
        .extern func_ov002_0226b300
        .extern func_ov002_0229cfa0
        .extern func_ov002_0229f244
        .extern func_ov002_0229f30c
        .extern func_ov002_022a0fec
        .extern func_ov002_022a15a0
        .extern func_ov002_022a2a1c
        .extern func_ov002_022ad6a8
        .extern func_ov002_022b25b8
        .global func_ov002_022a2e48
        .arm
func_ov002_022a2e48:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov r4, r0
    ldr r1, [r4]
    cmp r1, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_022a2a1c
    ldr r0, [r4, #0x4]
    cmp r0, #0xc
    bgt .L_498
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_a78
    b .L_a78
    b .L_a78
    b .L_a78
    b .L_6fc
    b .L_a78
    b .L_a78
    b .L_a78
    b .L_4a4
    b .L_a78
    b .L_a78
    b .L_a78
    b .L_9ac
    b .L_9b8
.L_498:
    cmp r0, #0x20
    beq .L_9ec
    b .L_a78
.L_4a4:
    ldr r0, [r4, #0x38]
    cmp r0, #0x8
    blt .L_a78
    ldr r2, [r4, #0x8]
    ldr r1, _LIT0
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0xe
    ldrh r0, [r1, r0]
    mov r1, r2, lsr #0x10
    mov r2, r1, lsl #0x10
    mov r1, r0, lsl #0x13
    ldr r0, _LIT1
    mov r1, r1, lsr #0x13
    mov r5, r2, lsr #0x10
    bl func_ov002_0229cfa0
    mov r2, r0, lsr #0x7
    ldr r1, _LIT2
    add r0, sp, #0xc
    str r1, [sp, #0x24]
    strh r2, [sp, #0x28]
    add r1, r4, #0x198
    bl func_ov002_0229f244
    ldr r0, [r4, #0x198]
    ldr r2, [sp, #0xc]
    cmp r0, #0x0
    ldrne r0, [r4, #0x1b0]
    ldr r1, [sp, #0x10]
    cmpne r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    str r2, [sp, #0x1c]
    str r1, [sp, #0x20]
    cmp r0, #0x0
    beq .L_540
    ldr r0, [r4, #0x1b0]
    tst r0, #0x4
    moveq r6, #0x1
    movne r6, #0x0
    b .L_544
.L_540:
    ldr r6, [r4, #0x19c]
.L_544:
    mov r0, r4
    bl func_ov002_022a15a0
    ldr r2, [sp, #0x20]
    ldr r1, [r4, #0x198]
    add r0, r2, r0
    sub r0, r0, #0x10
    cmp r1, #0x0
    add r3, r0, r6
    ldrne r0, [r4, #0x1b0]
    cmpne r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_590
    ldr r0, [r4, #0x1b0]
    tst r0, #0x4
    moveq r6, #0x1
    movne r6, #0x0
    b .L_594
.L_590:
    ldr r6, [r4, #0x19c]
.L_594:
    ldr r2, [sp, #0x1c]
    ldr r1, [sp, #0x24]
    ldr r0, _LIT3
    sub r2, r2, #0x10
    add r2, r2, r6
    and r1, r1, r0
    and r0, r3, #0xff
    orr r0, r1, r0
    mov r2, r2, lsl #0x17
    orr r3, r0, r2, lsr #0x7
    ldr r0, _LIT4
    add r1, sp, #0x24
    mov r2, #0x1
    str r3, [sp, #0x24]
    bl func_0207ef74
    add r0, sp, #0x4
    add r1, r4, #0x1b8
    bl func_ov002_0229f244
    ldr r0, [r4, #0x1b8]
    ldr r2, [sp, #0x4]
    cmp r0, #0x0
    ldrne r0, [r4, #0x1d0]
    ldr r1, [sp, #0x8]
    cmpne r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    str r2, [sp, #0x1c]
    str r1, [sp, #0x20]
    cmp r0, #0x0
    beq .L_620
    ldr r0, [r4, #0x1d0]
    tst r0, #0x4
    moveq r6, #0x1
    movne r6, #0x0
    b .L_624
.L_620:
    ldr r6, [r4, #0x1bc]
.L_624:
    mov r0, r4
    bl func_ov002_022a15a0
    ldr r2, [sp, #0x20]
    ldr r1, [r4, #0x1b8]
    add r0, r2, r0
    sub r0, r0, #0x11
    cmp r1, #0x0
    add r3, r0, r6
    ldrne r0, [r4, #0x1d0]
    cmpne r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_670
    ldr r0, [r4, #0x1d0]
    tst r0, #0x4
    moveq r6, #0x1
    movne r6, #0x0
    b .L_674
.L_670:
    ldr r6, [r4, #0x1bc]
.L_674:
    ldr r2, [sp, #0x1c]
    ldr r1, [sp, #0x24]
    ldr r0, _LIT3
    sub r2, r2, #0x10
    add r2, r2, r6
    and r1, r1, r0
    and r0, r3, #0xff
    mov r2, r2, lsl #0x17
    orr r0, r1, r0
    orr r2, r0, r2, lsr #0x7
    ldr r0, _LIT5
    ldr r1, _LIT6
    str r2, [sp, #0x24]
    and r0, r2, r0
    ldr r1, [r1, #0x4]
    orr r0, r0, #0x100
    orr r0, r0, r1, lsl #0x19
    str r0, [sp, #0x24]
    cmp r5, #0x0
    bne .L_6e8
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_ov002_0229cfa0
    mov r1, #0x400
    ldrh r2, [sp, #0x28]
    rsb r1, r1, #0x0
    and r1, r2, r1
    orr r0, r1, r0, lsr #0x7
    strh r0, [sp, #0x28]
.L_6e8:
    ldr r0, _LIT4
    add r1, sp, #0x24
    mov r2, #0x1
    bl func_0207ef74
    b .L_a78
.L_6fc:
    ldr r0, [r4, #0x38]
    cmp r0, #0x8
    blt .L_a78
    ldr r1, _LIT7
    mov r0, #0x1000
    str r1, [sp, #0x14]
    strh r0, [sp, #0x18]
    ldr r0, [r4, #0x24]
    ldr r1, [r4, #0x20]
    cmp r0, #0x4
    movlt r9, #0x40
    movge r9, #0x2a
    mul r1, r9, r1
    mov r0, r4
    add r5, r1, #0x20
    bl func_ov002_022a15a0
    ldr r2, [r4, #0x30]
    mov r1, #0x400
    add r7, r0, r2, lsl #0x3
    ldrh r2, [sp, #0x18]
    rsb r1, r1, #0x0
    ldr r6, [sp, #0x14]
    and r1, r2, r1
    orr r3, r1, #0x9b
    ldr r0, _LIT3
    orr r3, r3, #0x100
    and r1, r6, r0
    and r0, r7, #0xff
    orr r0, r1, r0
    mov r2, r5, lsl #0x17
    orr r6, r0, r2, lsr #0x7
    ldr r0, _LIT4
    add r1, sp, #0x14
    mov r2, #0x1
    str r6, [sp, #0x14]
    strh r3, [sp, #0x18]
    bl func_0207ef74
    mov r0, r4
    bl func_ov002_022a15a0
    add r1, r5, #0x20
    mov r5, r1, lsl #0x17
    ldr r1, [r4, #0x30]
    ldr r3, [sp, #0x14]
    add r0, r0, r1, lsl #0x3
    and r2, r0, #0xff
    ldr r0, _LIT3
    ldrh r1, [sp, #0x18]
    and r0, r3, r0
    orr r0, r0, r2
    orr r0, r0, r5, lsr #0x7
    str r0, [sp, #0x14]
    mov r0, #0x400
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0x9f
    orr r0, r0, #0x100
    strh r0, [sp, #0x18]
    ldr r0, _LIT4
    add r1, sp, #0x14
    mov r2, #0x1
    bl func_0207ef74
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x24]
    add r7, r1, #0x1
    cmp r7, r0
    bge .L_8d4
    mul sl, r7, r9
    ldr r0, _LIT8
    mov r5, #0x400
    ldr fp, _LIT3
    rsb r5, r5, #0x0
    add r6, r0, #0x4
.L_81c:
    mov r0, r4
    add r8, sl, #0x20
    bl func_ov002_022a15a0
    ldr r2, [r4, #0x30]
    ldr r3, [sp, #0x14]
    add r0, r0, r2, lsl #0x3
    and r2, r0, #0xff
    and r3, r3, fp
    ldrh r0, [sp, #0x18]
    mov r1, r8, lsl #0x17
    orr r2, r3, r2
    orr r1, r2, r1, lsr #0x7
    str r1, [sp, #0x14]
    and r1, r0, r5
    orr r0, r1, #0x93
    orr r0, r0, #0x100
    strh r0, [sp, #0x18]
    ldr r0, _LIT4
    add r1, sp, #0x14
    mov r2, #0x1
    bl func_0207ef74
    mov r0, r4
    bl func_ov002_022a15a0
    add r1, r8, #0x20
    ldr r3, [r4, #0x30]
    mov r2, r1, lsl #0x17
    ldr r1, [sp, #0x14]
    add r0, r0, r3, lsl #0x3
    and r1, r1, fp
    and r0, r0, #0xff
    orr r0, r1, r0
    orr r0, r0, r2, lsr #0x7
    ldrh r2, [sp, #0x18]
    str r0, [sp, #0x14]
    ldr r0, _LIT4
    and r2, r2, r5
    orr r2, r2, r6
    strh r2, [sp, #0x18]
    add r1, sp, #0x14
    mov r2, #0x1
    bl func_0207ef74
    ldr r0, [r4, #0x24]
    add r7, r7, #0x1
    add sl, sl, r9
    cmp r7, r0
    blt .L_81c
.L_8d4:
    ldr r0, [r4, #0x20]
    subs r7, r0, #0x1
    bmi .L_a78
    mul sl, r7, r9
    ldr r0, _LIT8
    mov r5, #0x400
    ldr fp, _LIT3
    rsb r5, r5, #0x0
    add r6, r0, #0x4
.L_8f8:
    mov r0, r4
    add r8, sl, #0x20
    bl func_ov002_022a15a0
    ldr r2, [r4, #0x30]
    ldr r3, [sp, #0x14]
    add r0, r0, r2, lsl #0x3
    and r2, r0, #0xff
    and r3, r3, fp
    ldrh r0, [sp, #0x18]
    mov r1, r8, lsl #0x17
    orr r2, r3, r2
    orr r1, r2, r1, lsr #0x7
    str r1, [sp, #0x14]
    and r1, r0, r5
    orr r0, r1, #0x93
    orr r0, r0, #0x100
    strh r0, [sp, #0x18]
    ldr r0, _LIT4
    add r1, sp, #0x14
    mov r2, #0x1
    bl func_0207ef74
    mov r0, r4
    bl func_ov002_022a15a0
    add r1, r8, #0x20
    ldr r3, [r4, #0x30]
    mov r2, r1, lsl #0x17
    ldr r1, [sp, #0x14]
    add r0, r0, r3, lsl #0x3
    and r1, r1, fp
    and r0, r0, #0xff
    orr r0, r1, r0
    orr r0, r0, r2, lsr #0x7
    ldrh r2, [sp, #0x18]
    str r0, [sp, #0x14]
    ldr r0, _LIT4
    and r2, r2, r5
    orr r2, r2, r6
    strh r2, [sp, #0x18]
    add r1, sp, #0x14
    mov r2, #0x1
    bl func_0207ef74
    sub sl, sl, r9
    subs r7, r7, #0x1
    bpl .L_8f8
    b .L_a78
.L_9ac:
    mov r0, r4
    bl func_ov002_022b25b8
    b .L_a78
.L_9b8:
    ldr r0, [r4, #0x38]
    cmp r0, #0x8
    blt .L_a78
    bl func_ov002_0226b300
    ldr r1, [r4, #0x20]
    cmp r1, r0
    beq .L_a78
    bl func_ov002_0226b300
    str r0, [r4, #0x20]
    mov r1, r0
    mov r0, r4
    bl func_ov002_022a0fec
    b .L_a78
.L_9ec:
    bl func_ov002_022476f0
    ldr r1, [r4, #0x8]
    mov r6, r0
    subs r0, r1, r6
    mov r5, #0x0
    beq .L_a3c
    add r7, r4, #0x100
.L_a08:
    bl func_0208deac
    ldrh r1, [r7, #0x18]
    add r0, r0, r5, lsl #0x1
    strh r1, [r0, #0x1a]
    bl func_0208deac
    add r0, r0, r5, lsl #0x1
    ldrh r1, [r7, #0x1a]
    add r5, r5, #0x1
    strh r1, [r0, #0x5a]
    ldr r1, [r4, #0x8]
    sub r0, r1, r6
    cmp r5, r0
    bcc .L_a08
.L_a3c:
    cmp r5, r1
    bcs .L_a78
    add r6, r4, #0x100
.L_a48:
    bl func_0208deac
    ldrh r1, [r6, #0x14]
    add r0, r0, r5, lsl #0x1
    strh r1, [r0, #0x1a]
    bl func_0208deac
    add r0, r0, r5, lsl #0x1
    ldrh r1, [r6, #0x16]
    add r5, r5, #0x1
    strh r1, [r0, #0x5a]
    ldr r0, [r4, #0x8]
    cmp r5, r0
    bcc .L_a48
.L_a78:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bge .L_a8c
    mov r0, r4
    bl func_ov002_022ad6a8
.L_a8c:
    ldr r0, [r4, #0x194]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_abc
    add r6, r4, #0x198
.L_aa0:
    mov r0, r6
    bl func_ov002_0229f30c
    ldr r0, [r4, #0x194]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x20
    blt .L_aa0
.L_abc:
    ldr r0, _LIT9
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1e
    tst r0, #0x2
    moveq r1, #0x1
    ldr r0, [r4, #0x34]
    movne r1, #0x0
    mov r2, r1, lsl #0x4
    mov r0, r0, lsl #0x3
    ldr r1, [r4, #0x4]
    add r2, r2, #0x58
    add r0, r0, r0, lsr #0x1f
    cmp r1, #0xb
    sub r5, r2, r0, asr #0x1
    bne .L_b48
    ldr r0, [r4, #0x28]
    mov r2, #0x3f
    cmp r0, #0x0
    movgt r0, #0x1
    strgt r0, [r4, #0x3c]
    ldr r1, [r4, #0x28]
    ldr r0, _LIT10
    sub r1, r1, #0x11
    and r0, r0, r1, lsl #0x10
    orr r1, r0, #0xef
    ldr r0, _LIT11
    orr r1, r1, #0x100
    str r1, [r0], #0x38
    ldr r3, [r4, #0x38]
    mov r1, #0x8
    rsb r6, r3, #0x10
    str r6, [sp]
    bl func_0208e230
    b .L_b78
.L_b48:
    ldr r0, _LIT10
    rsb r2, r5, #0x0
    ldr r1, _LIT11
    and r0, r0, r2, lsl #0x10
    str r0, [r1]
    ldr r3, [r4, #0x38]
    add r0, r1, #0x38
    rsb r6, r3, #0x10
    mov r1, #0xc
    mov r2, #0x3f
    str r6, [sp]
    bl func_0208e230
.L_b78:
    ldr r0, [r4, #0x4]
    cmp r0, #0x20
    bne .L_bd0
    ldr r0, _LIT9
    rsb r2, r5, #0x0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1e
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    movne r1, #0x18
    moveq r1, #0x0
    ldr r0, _LIT12
    sub r3, r1, #0x4
    mov r1, r0, lsl #0x10
    and r3, r3, r0
    and r1, r1, r2, lsl #0x10
    ldr r0, _LIT13
    orr r1, r3, r1
    str r1, [r0]
    b .L_bfc
.L_bd0:
    cmp r0, #0xb
    bne .L_be8
    ldr r0, _LIT13
    mov r1, #0x0
    str r1, [r0]
    b .L_bfc
.L_be8:
    ldr r0, _LIT10
    rsb r2, r5, #0x0
    ldr r1, _LIT13
    and r0, r0, r2, lsl #0x10
    str r0, [r1]
.L_bfc:
    ldr r2, _LIT14
    ldr r0, [r4, #0x38]
    ldr r1, [r2]
    cmp r0, #0x8
    and r0, r1, #0x1f00
    mov r0, r0, lsr #0x8
    bic r0, r0, #0xc
    bge .L_c38
    ldr r1, [r2]
    orr r0, r0, #0x8
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c38:
    ldr r1, [r2]
    orr r0, r0, #0xc
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    mov r0, #0x0
    str r0, [r4, #0x48]
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d0170
_LIT1: .word data_ov002_022d0f34
_LIT2: .word 0x80002400
_LIT3: .word 0xfe00ff00
_LIT4: .word data_ov002_022d0eb8
_LIT5: .word 0xc1fffcff
_LIT6: .word data_ov002_022d0f2c
_LIT7: .word 0x80006400
_LIT8: .word 0x00000193
_LIT9: .word data_02104e6c
_LIT10: .word 0x01ff0000
_LIT11: .word 0x04001018
_LIT12: .word 0x000001ff
_LIT13: .word 0x0400101c
_LIT14: .word 0x04001000
