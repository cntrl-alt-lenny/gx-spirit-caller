; func_02083cf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee68
        .extern data_020bee69
        .extern data_020bee6a
        .extern data_020bee6b
        .extern func_02084d24
        .extern func_020946c4
        .global func_02083cf0
        .arm
func_02083cf0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov sl, r0
    ldr r0, [sl]
    mov r9, r1
    ldrb r4, [r0, #0x1]
    mov r7, #0x4
    strb r4, [sl, #0xae]
    ldr r0, [sl, #0x8]
    orr r0, r0, #0x10
    str r0, [sl, #0x8]
    ldr r1, [sl, #0x8]
    ands r0, r1, #0x400
    beq .L_98
    cmp r9, #0x40
    beq .L_48
    cmp r9, #0x60
    bne .L_4c
.L_48:
    add r7, r7, #0x1
.L_4c:
    cmp r9, #0x20
    beq .L_5c
    cmp r9, #0x60
    bne .L_84
.L_5c:
    add r7, r7, #0x1
    ands r0, r1, #0x100
    bne .L_84
    ldr r0, [sl]
    add r1, sp, #0x8
    ldrb r3, [r0, #0x4]
    mov r0, #0x14
    mov r2, #0x1
    str r3, [sp, #0x8]
    bl func_02084d24
.L_84:
    ldr r0, [sl]
    add sp, sp, #0x14
    add r0, r0, r7
    str r0, [sl]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_98:
    cmp r9, #0x40
    beq .L_a8
    cmp r9, #0x60
    bne .L_e4
.L_a8:
    cmp r9, #0x40
    ldreq r0, [sl]
    add r7, r7, #0x1
    ldreqb r0, [r0, #0x4]
    streq r0, [sp, #0xc]
    ldrne r0, [sl]
    ldrneb r0, [r0, #0x5]
    strne r0, [sp, #0xc]
    ldr r0, [sl, #0x8]
    ands r0, r0, #0x100
    bne .L_e4
    add r1, sp, #0xc
    mov r0, #0x14
    mov r2, #0x1
    bl func_02084d24
.L_e4:
    add r0, sl, #0x12c
    str r0, [sl, #0xb4]
    ldr r0, [sl, #0x24]
    cmp r0, #0x0
    ldrneb r8, [sl, #0x92]
    moveq r8, #0x0
    cmp r8, #0x1
    bne .L_138
    ldr r1, [sl, #0x8]
    mov r0, sl
    bic r1, r1, #0x40
    str r1, [sl, #0x8]
    ldr r1, [sl, #0x24]
    blx r1
    ldr r0, [sl, #0x24]
    cmp r0, #0x0
    ldrneb r8, [sl, #0x92]
    ldr r0, [sl, #0x8]
    moveq r8, #0x0
    and r0, r0, #0x40
    b .L_13c
.L_138:
    mov r0, #0x0
.L_13c:
    cmp r0, #0x0
    bne .L_348
    ldr r0, [sl, #0x4]
    ldr r1, [r0, #0x34]
    cmp r1, #0x0
    beq .L_170
    mov r0, #0x58
    mla r6, r4, r0, r1
    ldr r0, [sl, #0x8]
    ands r0, r0, #0x80
    moveq r0, #0x1
    movne r0, #0x0
    b .L_178
.L_170:
    add r6, sl, #0x12c
    mov r0, #0x0
.L_178:
    cmp r0, #0x0
    bne .L_344
    mov r0, #0x0
    str r0, [r6]
    ldr r0, [sl, #0x4]
    ldr r1, [r0, #0x10]
    cmp r1, #0x0
    beq .L_1b0
    ldr r3, [r0, #0x14]
    mov r0, r6
    mov r2, r4
    blx r3
    cmp r0, #0x0
    bne .L_344
.L_1b0:
    ldr r2, [sl, #0xd4]
    ldrh r0, [r2, #0x6]
    ldrh r1, [r2, r0]
    add r0, r2, r0
    mla r0, r1, r4, r0
    ldr r1, [r0, #0x4]
    ldrh r0, [r2, r1]
    add r4, r2, r1
    add r5, r4, #0x4
    ands r0, r0, #0x1
    ldrne r0, [r6]
    orrne r0, r0, #0x4
    strne r0, [r6]
    bne .L_204
    ldr r0, [r5]
    str r0, [r6, #0x4c]
    ldr r0, [r5, #0x4]
    str r0, [r6, #0x50]
    ldr r0, [r5, #0x8]
    add r5, r5, #0xc
    str r0, [r6, #0x54]
.L_204:
    ldrh r1, [r4]
    ands r0, r1, #0x2
    ldrne r0, [r6]
    orrne r0, r0, #0x2
    strne r0, [r6]
    bne .L_32c
    ands r0, r1, #0x8
    beq .L_2e0
    and r1, r1, #0xf0
    mov fp, r1, asr #0x4
    ldrsh r1, [r5]
    add r0, r6, #0x28
    str r1, [sp]
    ldrsh r1, [r5, #0x2]
    str r1, [sp, #0x4]
    bl func_020946c4
    ldrh r0, [r4]
    add r1, r6, fp, lsl #0x2
    add r5, r5, #0x4
    ands r0, r0, #0x100
    movne r0, #0x1000
    rsbne r2, r0, #0x0
    moveq r2, #0x1000
    str r2, [r1, #0x28]
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldrb r0, [r0, fp, lsl #0x2]
    add r2, r6, r0, lsl #0x2
    ldr r0, [sp]
    str r0, [r2, #0x28]
    ldrb r0, [r1, fp, lsl #0x2]
    add r1, r6, r0, lsl #0x2
    ldr r0, [sp, #0x4]
    str r0, [r1, #0x28]
    ldrh r0, [r4]
    ands r0, r0, #0x200
    ldrne r0, [sp, #0x4]
    rsbne r0, r0, #0x0
    strne r0, [sp, #0x4]
    ldr r0, _LIT2
    ldrb r0, [r0, fp, lsl #0x2]
    add r1, r6, r0, lsl #0x2
    ldr r0, [sp, #0x4]
    str r0, [r1, #0x28]
    ldrh r0, [r4]
    ands r0, r0, #0x400
    ldrne r0, [sp]
    rsbne r0, r0, #0x0
    strne r0, [sp]
    ldr r0, _LIT3
    ldrb r0, [r0, fp, lsl #0x2]
    add r1, r6, r0, lsl #0x2
    ldr r0, [sp]
    str r0, [r1, #0x28]
    b .L_32c
.L_2e0:
    ldrsh r0, [r4, #0x2]
    str r0, [r6, #0x28]
    ldrsh r0, [r5]
    str r0, [r6, #0x2c]
    ldrsh r0, [r5, #0x2]
    str r0, [r6, #0x30]
    ldrsh r0, [r5, #0x4]
    str r0, [r6, #0x34]
    ldrsh r0, [r5, #0x6]
    str r0, [r6, #0x38]
    ldrsh r0, [r5, #0x8]
    str r0, [r6, #0x3c]
    ldrsh r0, [r5, #0xa]
    str r0, [r6, #0x40]
    ldrsh r0, [r5, #0xc]
    str r0, [r6, #0x44]
    ldrsh r0, [r5, #0xe]
    add r5, r5, #0x10
    str r0, [r6, #0x48]
.L_32c:
    ldrh r3, [r4]
    ldr r2, [sl]
    ldr r4, [sl, #0xe8]
    mov r0, r6
    mov r1, r5
    blx r4
.L_344:
    str r6, [sl, #0xb4]
.L_348:
    cmp r8, #0x2
    bne .L_384
    ldr r1, [sl, #0x8]
    mov r0, sl
    bic r1, r1, #0x40
    str r1, [sl, #0x8]
    ldr r1, [sl, #0x24]
    blx r1
    ldr r0, [sl, #0x24]
    cmp r0, #0x0
    ldrneb r8, [sl, #0x92]
    ldr r0, [sl, #0x8]
    moveq r8, #0x0
    and r0, r0, #0x40
    b .L_388
.L_384:
    mov r0, #0x0
.L_388:
    cmp r0, #0x0
    bne .L_3a8
    ldr r0, [sl, #0x8]
    ands r0, r0, #0x100
    bne .L_3a8
    ldr r0, [sl, #0xb4]
    ldr r1, [sl, #0xec]
    blx r1
.L_3a8:
    mov r0, #0x0
    str r0, [sl, #0xb4]
    cmp r8, #0x3
    bne .L_3d8
    ldr r1, [sl, #0x8]
    mov r0, sl
    bic r1, r1, #0x40
    str r1, [sl, #0x8]
    ldr r1, [sl, #0x24]
    blx r1
    ldr r0, [sl, #0x8]
    and r0, r0, #0x40
.L_3d8:
    cmp r9, #0x20
    beq .L_3e8
    cmp r9, #0x60
    bne .L_41c
.L_3e8:
    cmp r0, #0x0
    add r7, r7, #0x1
    bne .L_41c
    ldr r0, [sl, #0x8]
    ands r0, r0, #0x100
    bne .L_41c
    ldr r0, [sl]
    add r1, sp, #0x10
    ldrb r3, [r0, #0x4]
    mov r0, #0x13
    mov r2, #0x1
    str r3, [sp, #0x10]
    bl func_02084d24
.L_41c:
    ldr r0, [sl]
    add r0, r0, r7
    str r0, [sl]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020bee68
_LIT1: .word data_020bee69
_LIT2: .word data_020bee6a
_LIT3: .word data_020bee6b
