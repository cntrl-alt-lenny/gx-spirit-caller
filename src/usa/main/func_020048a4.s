; func_020048a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b9c
        .extern func_02004668
        .global func_020048a4
        .arm
func_020048a4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    mov r8, r0
    ldr r0, [r8, #0x1c]
    mov r7, r1
    mov r0, r0, lsl #0x18
    mov r1, r0, lsr #0x18
    ldr r0, [sp, #0x5c]
    cmp r1, #0xff
    str r0, [sp, #0x5c]
    ldr r0, [sp, #0x60]
    str r2, [sp, #0x8]
    str r3, [sp, #0xc]
    ldr r6, [sp, #0x58]
    str r0, [sp, #0x60]
    moveq r4, #0x0
    beq .L_50
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x17
    mov r4, r0, lsr #0x17
.L_50:
    cmp r1, #0xff
    movne r0, #0x1
    strne r0, [sp, #0x14]
    moveq r0, #0x0
    streq r0, [sp, #0x14]
    ldr r0, [r8, #0x10]
    ldr r2, [r8, #0x24]
    str r0, [sp, #0x10]
    cmp r0, #0x0
    ldreq r0, [sp, #0x5c]
    ldr r5, [r8, #0x14]
    streq r0, [sp, #0x10]
    ldr r0, [sp, #0x5c]
    cmp r5, #0x0
    sub r1, r0, #0x8
    ldreq r5, [sp, #0x5c]
    mov r0, r2, lsl #0x10
    cmp r1, #0x8
    mov fp, r2, lsl #0x14
    str r0, [sp, #0x30]
    addls pc, pc, r1, lsl #0x2
    b .L_118
    b .L_cc
    b .L_118
    b .L_dc
    b .L_118
    b .L_ec
    b .L_118
    b .L_fc
    b .L_118
    b .L_10c
.L_cc:
    ldr r0, _LIT0
    ldr r0, [r0, #0x88]
    str r0, [sp, #0x2c]
    b .L_118
.L_dc:
    ldr r0, _LIT0
    ldr r0, [r0, #0x90]
    str r0, [sp, #0x2c]
    b .L_118
.L_ec:
    ldr r0, _LIT0
    ldr r0, [r0, #0x98]
    str r0, [sp, #0x2c]
    b .L_118
.L_fc:
    ldr r0, _LIT0
    ldr r0, [r0, #0xa0]
    str r0, [sp, #0x2c]
    b .L_118
.L_10c:
    ldr r0, _LIT0
    ldr r0, [r0, #0xa8]
    str r0, [sp, #0x2c]
.L_118:
    mov r0, #0x0
    str r0, [r8, #0x28]
    ldr r0, [r8, #0x20]
    bic r0, r0, #0x400000
    str r0, [r8, #0x20]
    ldrsb r1, [r7]
    cmp r1, #0x0
    beq .L_610
    ldr r0, [sp, #0x5c]
    mov r0, r0, asr #0x1
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x10]
    mov r0, r0, asr #0x1
    str r0, [sp, #0x1c]
    ldr r0, [sp, #0x5c]
    add r0, r0, r0, lsl #0x1
    str r0, [sp, #0x18]
.L_15c:
    cmp r1, #0x20
    bgt .L_190
    bge .L_1c4
    cmp r1, #0xd
    bgt .L_2a8
    cmp r1, #0x9
    blt .L_2a8
    beq .L_278
    cmp r1, #0xa
    beq .L_19c
    cmp r1, #0xd
    beq .L_294
    b .L_2a8
.L_190:
    cmp r1, #0x40
    beq .L_234
    b .L_2a8
.L_19c:
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    add r7, r7, #0x1
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_610
    b .L_604
.L_1c4:
    ldr r0, [r8, #0x24]
    mov r0, r0, lsl #0x18
    cmp r4, r0, lsr #0x18
    mov r0, r0, lsr #0x18
    bls .L_22c
    ldr r1, [r8, #0x20]
    mov r1, r1, lsl #0x7
    movs r1, r1, lsr #0x1f
    ldrne r1, [r8, #0x18]
    bne .L_1f8
    ldr r1, [r8, #0x10]
    cmp r1, #0x0
    ldreq r1, [sp, #0x20]
.L_1f8:
    add r4, r4, r1
    ldr r1, [sp, #0xc]
    add r1, r1, r4
    add r2, r1, fp, lsr #0x1c
    ldr r1, [r8]
    cmp r2, r1, lsl #0x3
    bls .L_22c
    mov r4, r0
    add r6, r6, r5
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_610
.L_22c:
    add r7, r7, #0x1
    b .L_604
.L_234:
    ldrsb r1, [r7, #0x1]!
    cmp r1, #0x30
    blt .L_2a8
    cmp r1, #0x39
    bgt .L_2a8
    sub r0, r1, #0x30
    rsb r1, r0, #0xf
    and r2, r1, #0xf
    ldr r0, _LIT0
    add r7, r7, #0x1
    str r2, [r0, #0x8]
    mov r2, r1, lsl #0x1c
    ldr r0, [r8, #0x24]
    bic r0, r0, #0x1e0000
    orr r0, r0, r2, lsr #0xb
    str r0, [r8, #0x24]
    b .L_604
.L_278:
    ldr r1, [r8, #0x24]
    and r0, r4, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    str r0, [r8, #0x24]
    add r7, r7, #0x1
    b .L_604
.L_294:
    ldr r0, [r8, #0x24]
    add r7, r7, #0x1
    bic r0, r0, #0xff
    str r0, [r8, #0x24]
    b .L_604
.L_2a8:
    cmp r1, #0x0
    blt .L_334
    ldr r0, [r8, #0x24]
    and r9, r1, #0xff
    mov r0, r0, lsl #0xf
    movs r0, r0, lsr #0x1f
    ldrne r0, [sp, #0x1c]
    strne r0, [sp, #0x28]
    bne .L_2e8
    ldr r0, [sp, #0x2c]
    ldrb r1, [r0, r9, asr #0x1]
    mov r0, r9, lsl #0x1f
    mov r0, r0, lsr #0x1d
    mov r0, r1, asr r0
    and r0, r0, #0xf
    str r0, [sp, #0x28]
.L_2e8:
    add r0, r7, #0x1
    str r0, [sp, #0x24]
    ldr r0, [sp, #0xc]
    add r1, r0, r4
    ldr r0, [sp, #0x28]
    add r0, r0, r1
    add r1, r0, fp, lsr #0x1c
    ldr r0, [r8]
    cmp r1, r0, lsl #0x3
    bls .L_59c
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_610
    b .L_59c
.L_334:
    ldr r0, [sp, #0x10]
    and r2, r1, #0xff
    ldrb r1, [r7, #0x1]
    str r0, [sp, #0x28]
    add r0, r7, #0x2
    str r0, [sp, #0x24]
    orr r9, r1, r2, lsl #0x8
    ldr r0, [sp, #0xc]
    ldr r2, [sp, #0x5c]
    add r1, r0, r4
    add r2, r2, r1
    ldr r0, [r8]
    add r2, r2, fp, lsr #0x1c
    cmp r2, r0, lsl #0x3
    bls .L_394
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_610
    b .L_59c
.L_394:
    ldr r2, [sp, #0x5c]
    add r3, r4, r2, lsl #0x1
    ldr r2, [sp, #0xc]
    add r2, r3, r2
    add r2, r2, fp, lsr #0x1c
    cmp r2, r0, lsl #0x3
    bls .L_428
    mov r0, r7
.L_3b4:
    ldrsb r1, [r0, #0x2]!
    cmp r1, #0x40
    beq .L_3b4
    bl func_02004668
    cmp r0, #0x0
    beq .L_3f0
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_610
    b .L_59c
.L_3f0:
    ldr r0, _LIT1
    cmp r9, r0
    addne r0, r0, #0xc
    cmpne r9, r0
    bne .L_59c
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_610
    b .L_59c
.L_428:
    ldr r2, [sp, #0x18]
    add r2, r1, r2
    add r2, r2, fp, lsr #0x1c
    cmp r2, r0, lsl #0x3
    bls .L_504
    ldr r0, _LIT1
    mov sl, r7
    cmp r9, r0
    addne r0, r0, #0xc
    cmpne r9, r0
    bne .L_4a8
.L_454:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_454
    cmp r0, #0x0
    beq .L_59c
.L_468:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_468
    mov r0, sl
    bl func_02004668
    cmp r0, #0x0
    beq .L_59c
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_610
    b .L_59c
.L_4a8:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_4a8
    mov r0, sl
    bl func_02004668
    cmp r0, #0x0
    beq .L_59c
.L_4c4:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_4c4
    mov r0, sl
    bl func_02004668
    cmp r0, #0x0
    beq .L_59c
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_610
    b .L_59c
.L_504:
    ldr r2, [sp, #0x5c]
    add r1, r1, r2, lsl #0x2
    add r1, r1, fp, lsr #0x1c
    cmp r1, r0, lsl #0x3
    bls .L_59c
    ldr r0, _LIT1
    mov sl, r7
    cmp r9, r0
    addne r0, r0, #0xc
    cmpne r9, r0
    bne .L_59c
.L_530:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_530
    cmp r0, #0x0
    beq .L_59c
.L_544:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_544
    mov r0, sl
    bl func_02004668
    cmp r0, #0x0
    beq .L_59c
.L_560:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_560
    mov r0, sl
    bl func_02004668
    cmp r0, #0x0
    beq .L_59c
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_610
.L_59c:
    ldr r0, [sp, #0x30]
    add r1, r6, r5
    add r1, r1, r0, lsr #0x1c
    ldr r0, [r8, #0x4]
    cmp r1, r0, lsl #0x3
    bls .L_5c4
    ldr r0, [r8, #0x20]
    orr r0, r0, #0x400000
    str r0, [r8, #0x20]
    b .L_610
.L_5c4:
    ldr r3, [sp, #0xc]
    ldr r0, [sp, #0x5c]
    str r6, [sp]
    str r0, [sp, #0x4]
    ldr r2, [sp, #0x8]
    ldr r7, [sp, #0x60]
    mov r1, r9
    mov r0, r8
    add r3, r3, r4
    blx r7
    ldr r0, [sp, #0x28]
    ldr r7, [sp, #0x24]
    add r4, r4, r0
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    bne .L_610
.L_604:
    ldrsb r1, [r7]
    cmp r1, #0x0
    bne .L_15c
.L_610:
    ldr r0, [sp, #0xc]
    str r7, [r8, #0x28]
    add r0, r0, r4
    str r0, [r8, #0x8]
    str r6, [r8, #0xc]
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102b9c
_LIT1: .word 0x00008169
