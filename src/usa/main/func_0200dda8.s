; func_0200dda8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02186a08
        .extern func_0200dd3c
        .extern func_0200f120
        .extern func_0200f290
        .extern func_0200f498
        .extern func_0200f668
        .global func_0200dda8
        .arm
func_0200dda8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r1, #0xc]
    cmp r0, #0x0
    addle sp, sp, #0xc
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x8]
    str r0, [sp, #0x4]
.L_2c:
    ldr r0, _LIT0
    ldr r1, [r0, #0x14]
    ldr r0, [sp, #0x4]
    add r4, r1, r0
    ldr r0, [r4, #0x60]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1f
    beq .L_54
    mov r0, r4
    bl func_0200dd3c
.L_54:
    ldr r0, [r4, #0x27c]
    cmp r0, #0x0
    beq .L_70
    ldr r0, [r0, #0x60]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_bb8
.L_70:
    ldr r0, [r4, #0x60]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_bb8
    mov r2, #0x0
    mov r0, r4
    sub r3, r2, #0x1
    mov r1, #0x7
    bl func_0200f290
    mov r2, #0x0
    mov r0, r4
    sub r3, r2, #0x1
    mov r1, #0x7
    bl func_0200f120
    mov r2, #0x0
    mov r0, r4
    sub r3, r2, #0x1
    mov r1, #0x7
    bl func_0200f498
    mov r0, r4
    mov r1, #0x7
    mov r2, #0x0
    sub r3, r2, #0x1
    bl func_0200f668
    ldr r2, [r4, #0x80]
    cmp r2, #0x0
    beq .L_208
    ldr r3, [r4, #0x84]
    mov r0, r3, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_208
    mov r1, r3, lsl #0xa
    mov r0, r3, lsl #0x1e
    mov r1, r1, asr #0x10
    movs r0, r0, asr #0x1f
    ldr r0, [r2]
    bne .L_110
    mov r2, r3, lsl #0x1c
    movs r2, r2, asr #0x1f
    beq .L_160
.L_110:
    ldr r5, [r4, #0x84]
    ldr r2, _LIT1
    add r3, r1, #0x1
    and r5, r5, r2
    mov r3, r3, lsl #0x10
    orr r5, r5, r3, lsr #0xa
    mov r3, r5, lsl #0xa
    str r5, [r4, #0x84]
    cmp r0, r3, asr #0x10
    bgt .L_1d4
    mov r0, r5, lsl #0x1a
    movs r0, r0, asr #0x1f
    andne r0, r5, r2
    strne r0, [r4, #0x84]
    bne .L_1d4
    and r2, r5, r2
    mov r0, r1, lsl #0x10
    orr r0, r2, r0, lsr #0xa
    str r0, [r4, #0x84]
    b .L_1d4
.L_160:
    mov r2, r3, lsl #0x1d
    movs r2, r2, asr #0x1f
    bne .L_178
    mov r2, r3, lsl #0x1b
    movs r2, r2, asr #0x1f
    beq .L_1d4
.L_178:
    ldr r5, [r4, #0x84]
    ldr r2, _LIT1
    sub r3, r1, #0x1
    and r5, r5, r2
    mov r3, r3, lsl #0x10
    orr r5, r5, r3, lsr #0xa
    mov r3, r5, lsl #0xa
    str r5, [r4, #0x84]
    movs r3, r3, asr #0x10
    bpl .L_1d4
    mov r3, r5, lsl #0x1a
    movs r3, r3, asr #0x1f
    beq .L_1c4
    sub r0, r0, #0x1
    and r1, r5, r2
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0xa
    str r0, [r4, #0x84]
    b .L_1d4
.L_1c4:
    and r2, r5, r2
    mov r0, r1, lsl #0x10
    orr r0, r2, r0, lsr #0xa
    str r0, [r4, #0x84]
.L_1d4:
    ldr r0, [r4, #0x84]
    mov r1, r0, lsl #0x1c
    movs r1, r1, asr #0x1f
    bne .L_1f0
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq .L_208
.L_1f0:
    ldr r0, [r4, #0x84]
    bic r0, r0, #0x2
    bic r1, r0, #0x4
    bic r0, r1, #0x8
    bic r0, r0, #0x10
    str r0, [r4, #0x84]
.L_208:
    ldr r1, [r4, #0x90]
    cmp r1, #0x0
    beq .L_3fc
    ldr r0, [r1]
    mov r2, #0x0
    cmp r0, #0x0
    bls .L_3fc
    ldr sl, _LIT2
    mov r7, r2
    mov lr, r2
.L_230:
    ldr r0, [r1, #0x4]
    ldr r1, [r4, #0x94]
    ldr r5, [r0, r2, lsl #0x2]
    add r3, r1, r7
    cmp r5, #0x0
    ldrne r0, [r5]
    cmpne r0, #0x0
    beq .L_3e4
    ldr r0, [r3]
    mov r0, r0, lsl #0x19
    movs r0, r0, asr #0x1f
    bne .L_3e4
    mov r1, lr
    add r8, r3, #0x4
.L_268:
    ldr r6, [r8]
    ldr r0, [r3]
    ldr fp, [r5, #0xc]
    mov r9, r6, lsl #0xc
    ldr r6, [fp, r1, lsl #0x2]
    mov r9, r9, asr #0x16
    mov fp, r0, lsl #0x1e
    movs fp, fp, asr #0x1f
    bne .L_298
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1f
    beq .L_2b0
.L_298:
    ldr r0, [r8]
    add fp, r9, #0x1
    and r0, r0, sl
    mov fp, fp, lsl #0x16
    orr r0, r0, fp, lsr #0xc
    str r0, [r8]
.L_2b0:
    ldr r0, [r3]
    mov fp, r0, lsl #0x1d
    movs fp, fp, asr #0x1f
    bne .L_2cc
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq .L_2ec
.L_2cc:
    ldr fp, [r8]
    and r0, fp, sl
    mov fp, fp, lsl #0xc
    mov fp, fp, asr #0x16
    sub fp, fp, #0x1
    mov fp, fp, lsl #0x16
    orr r0, r0, fp, lsr #0xc
    str r0, [r8]
.L_2ec:
    ldr r0, [r8]
    mov fp, r0, lsl #0xc
    movs fp, fp, asr #0x16
    bpl .L_340
    ldr fp, [r3]
    mov fp, fp, lsl #0x1a
    movs fp, fp, asr #0x1f
    beq .L_330
    and r0, r0, sl
    ldrh ip, [r6]
    ldrh fp, [r6, #0x2]
    mul fp, ip, fp
    sub fp, fp, #0x1
    mov fp, fp, lsl #0x16
    orr r0, r0, fp, lsr #0xc
    str r0, [r8]
    b .L_340
.L_330:
    and fp, r0, sl
    mov r0, r9, lsl #0x16
    orr r0, fp, r0, lsr #0xc
    str r0, [r8]
.L_340:
    ldrh r0, [r6]
    ldrh fp, [r6, #0x2]
    ldr r6, [r8]
    mul fp, r0, fp
    mov r0, r6, lsl #0xc
    cmp fp, r0, asr #0x16
    bgt .L_384
    ldr r0, [r3]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    andne r0, r6, sl
    strne r0, [r8]
    bne .L_384
    and r6, r6, sl
    mov r0, r9, lsl #0x16
    orr r0, r6, r0, lsr #0xc
    str r0, [r8]
.L_384:
    add r1, r1, #0x1
    cmp r1, #0xd
    add r8, r8, #0x4
    blt .L_268
    ldr r0, [r3]
    orr r1, r0, #0x40
    mov r0, r1, lsl #0x1c
    str r1, [r3]
    movs r0, r0, asr #0x1f
    beq .L_3c0
    bic r0, r1, #0x8
    bic r1, r0, #0x2
    bic r0, r1, #0x10
    bic r0, r0, #0x4
    str r0, [r3]
.L_3c0:
    ldr r0, [r3]
    mov r1, r0, lsl #0x1b
    movs r1, r1, asr #0x1f
    beq .L_3e4
    bic r0, r0, #0x8
    bic r1, r0, #0x2
    bic r0, r1, #0x10
    bic r0, r0, #0x4
    str r0, [r3]
.L_3e4:
    ldr r1, [r4, #0x90]
    add r2, r2, #0x1
    ldr r0, [r1]
    add r7, r7, #0x38
    cmp r2, r0
    bcc .L_230
.L_3fc:
    ldr r0, [r4, #0x88]
    cmp r0, #0x0
    beq .L_630
    ldr r8, [r0, #0x4]
    cmp r8, #0x0
    beq .L_bb8
    ldr r1, [r0]
    mov r0, #0x0
    cmp r1, #0x0
    bls .L_630
    str r0, [sp]
    mov fp, #0x1
    mov r3, r0
    mov ip, r0
.L_434:
    ldr r2, [r8, r0, lsl #0x2]
    ldr r5, [r4, #0x8c]
    ldr r1, [sp]
    cmp r2, #0x0
    add r9, r5, r1
    ldrne r1, [r2]
    cmpne r1, #0x0
    beq .L_610
    ldr r1, [r9]
    mov r2, r1, lsl #0x9
    movs r2, r2, asr #0x1f
    bne .L_610
    mov r1, r1, lsl #0x1f
    movs r1, r1, asr #0x1f
    beq .L_610
    mov r1, #0x0
.L_474:
    ldr r5, [r9]
    mov r2, r5, lsl #0x1e
    movs r2, r2, asr #0x1f
    bne .L_490
    mov r2, r5, lsl #0x1c
    movs r2, r2, asr #0x1f
    beq .L_514
.L_490:
    add r7, r9, r1, lsl #0x2
    ldrsh r6, [r7, #0x4]
    ldrsh r5, [r7, #0x6]
    add r2, r6, #0x1
    strh r2, [r7, #0x4]
    ldrsh lr, [r7, #0x4]
    ldr r2, [r8, r0, lsl #0x2]
    ldrsh sl, [r7, #0x6]
    ldr r2, [r2, #0x8]
    ldr r2, [r2, r1, lsl #0x2]
    mov sl, sl, lsl #0x1
    ldr r2, [r2, #0xc]
    ldrh r2, [r2, sl]
    cmp lr, r2
    blt .L_5c8
    strh ip, [r7, #0x4]
    ldrsh r2, [r7, #0x6]
    add r2, r2, #0x1
    strh r2, [r7, #0x6]
    ldrsh r2, [r7, #0x6]
    ldr sl, [r8, r0, lsl #0x2]
    ldr sl, [sl, #0x8]
    ldr sl, [sl, r1, lsl #0x2]
    ldr sl, [sl]
    cmp r2, sl
    bcc .L_5c8
    ldr r2, [r9]
    mov r2, r2, lsl #0x1a
    movs r2, r2, asr #0x1f
    strneh ip, [r7, #0x6]
    streqh r6, [r7, #0x4]
    streqh r5, [r7, #0x6]
    b .L_5c8
.L_514:
    mov r2, r5, lsl #0x1d
    movs r2, r2, asr #0x1f
    bne .L_52c
    mov r2, r5, lsl #0x1b
    movs r2, r2, asr #0x1f
    beq .L_5c8
.L_52c:
    add r2, r9, r1, lsl #0x2
    ldrsh r6, [r2, #0x4]
    mov r5, r3
    ldrsh r7, [r2, #0x6]
    sub sl, r6, #0x1
    strh sl, [r2, #0x4]
    ldrsh sl, [r2, #0x4]
    cmp sl, #0x0
    bge .L_5c8
    ldrsh sl, [r2, #0x6]
    sub sl, sl, #0x1
    strh sl, [r2, #0x6]
    ldrsh sl, [r2, #0x6]
    cmp sl, #0x0
    bge .L_584
    mov r5, fp
    ldr sl, [r8, r0, lsl #0x2]
    ldr sl, [sl, #0x8]
    ldr sl, [sl, r1, lsl #0x2]
    ldr sl, [sl]
    sub sl, sl, #0x1
    strh sl, [r2, #0x6]
.L_584:
    ldr r2, [r8, r0, lsl #0x2]
    add sl, r9, r1, lsl #0x2
    ldr r2, [r2, #0x8]
    ldrsh lr, [sl, #0x6]
    ldr r2, [r2, r1, lsl #0x2]
    ldr r2, [r2, #0xc]
    mov lr, lr, lsl #0x1
    ldrh r2, [r2, lr]
    sub r2, r2, #0x1
    strh r2, [sl, #0x4]
    ldr r2, [r9]
    mov r2, r2, lsl #0x1a
    movs r2, r2, asr #0x1f
    bne .L_5c8
    cmp r5, #0x0
    strneh r6, [sl, #0x4]
    strneh r7, [sl, #0x6]
.L_5c8:
    add r1, r1, #0x1
    cmp r1, #0x5
    blt .L_474
    ldr r1, [r9]
    orr r2, r1, #0x400000
    mov r1, r2, lsl #0x1c
    str r2, [r9]
    movs r1, r1, asr #0x1f
    bne .L_5f8
    mov r1, r2, lsl #0x1b
    movs r1, r1, asr #0x1f
    beq .L_610
.L_5f8:
    ldr r1, [r9]
    bic r1, r1, #0x8
    bic r2, r1, #0x10
    bic r1, r2, #0x2
    bic r1, r1, #0x4
    str r1, [r9]
.L_610:
    ldr r1, [r4, #0x88]
    add r0, r0, #0x1
    ldr r2, [r1]
    ldr r1, [sp]
    cmp r0, r2
    add r1, r1, #0x18
    str r1, [sp]
    bcc .L_434
.L_630:
    ldr r8, [r4, #0x98]
    cmp r8, #0x0
    beq .L_8f4
    ldr r1, [r8]
    mov r0, #0x0
    cmp r1, #0x0
    bls .L_8f4
    ldr r2, _LIT3
    ldr r5, _LIT4
    sub r1, r2, #0x100000
    mov sl, r0
    mov lr, r1
    mov r3, r1
.L_664:
    ldr r7, [r4, #0xa0]
    ldr r8, [r8, #0x4]
    ldr r6, [r7, sl]
    ldr r8, [r8, r0, lsl #0x2]
    add r9, r7, sl
    mov r7, r6, lsl #0x1f
    movs r7, r7, asr #0x1f
    beq .L_8dc
    mov r7, r6, lsl #0x19
    movs r7, r7, asr #0x1f
    bne .L_8dc
    cmp r8, #0x0
    beq .L_8a0
    mov r7, r6, lsl #0x1e
    movs r7, r7, asr #0x1f
    bne .L_6b0
    mov r7, r6, lsl #0x1c
    movs r7, r7, asr #0x1f
    beq .L_788
.L_6b0:
    ldr r7, [r9, #0x4]
    and r6, r7, r5
    mov r7, r7, lsl #0x2
    mov r7, r7, asr #0x16
    add r7, r7, #0x1
    mov r7, r7, lsl #0x16
    orr r6, r6, r7, lsr #0x2
    str r6, [r9, #0x4]
    ldrh r7, [r8, #0x4]
    mov r6, r6, lsl #0x16
    mov fp, r6, asr #0x16
    sub r7, r7, #0x1
    cmp r7, r6, asr #0x16
    ldrleh ip, [r8, #0x6]
    ble .L_6f8
    ldr r6, [r8, #0x10]
    add r6, r6, fp, lsl #0x1
    ldrh ip, [r6, #0x2]
.L_6f8:
    ldr r6, [r9, #0x4]
    mov r7, r6, lsl #0x2
    cmp ip, r7, asr #0x16
    bgt .L_8a0
    add r7, fp, #0x1
    and r6, r6, r5, asr #0x14
    and r7, r7, r2
    orr r6, r6, r7
    and r7, r6, r3
    str r7, [r9, #0x4]
    ldrh r8, [r8, #0x4]
    mov r6, r7, lsl #0x16
    cmp r8, r6, asr #0x16
    bgt .L_8a0
    sub r6, r8, #0x1
    and r7, r7, r5, asr #0x14
    and r6, r6, r2
    orr r6, r7, r6
    str r6, [r9, #0x4]
    ldr r6, [r9]
    mov r6, r6, lsl #0x1a
    movs r6, r6, asr #0x1f
    ldr r6, [r9, #0x4]
    beq .L_768
    and r6, r6, r5
    and r6, r6, r5, asr #0x14
    str r6, [r9, #0x4]
    b .L_8a0
.L_768:
    mov r7, r6, lsl #0x2
    mov r7, r7, asr #0x16
    sub r7, r7, #0x1
    and r6, r6, r5
    mov r7, r7, lsl #0x16
    orr r6, r6, r7, lsr #0x2
    str r6, [r9, #0x4]
    b .L_8a0
.L_788:
    mov r7, r6, lsl #0x1d
    movs r7, r7, asr #0x1f
    bne .L_7a0
    mov r6, r6, lsl #0x1b
    movs r6, r6, asr #0x1f
    beq .L_8a0
.L_7a0:
    ldr r7, [r9, #0x4]
    and r6, r7, r1
    mov r7, r7, lsl #0xc
    mov r7, r7, asr #0x16
    sub r7, r7, #0x1
    mov r7, r7, lsl #0x16
    orr r7, r6, r7, lsr #0xc
    and r6, r7, r5
    mov r7, r7, lsl #0x2
    mov r7, r7, asr #0x16
    sub r7, r7, #0x1
    mov r7, r7, lsl #0x16
    orr r6, r6, r7, lsr #0x2
    str r6, [r9, #0x4]
    mov r6, r6, lsl #0x16
    mov fp, r6, asr #0x16
    cmp fp, #0x0
    movle ip, #0x0
    ble .L_7f8
    ldr r7, [r8, #0x10]
    mov r6, fp, lsl #0x1
    ldrh ip, [r7, r6]
.L_7f8:
    ldr r6, [r9, #0x4]
    mov r7, r6, lsl #0x2
    cmp ip, r7, asr #0x16
    ble .L_8a0
    sub r7, fp, #0x1
    and r6, r6, r5, asr #0x14
    and r7, r7, r2
    orr r7, r6, r7
    mov r6, r7, lsl #0x16
    str r7, [r9, #0x4]
    movs r6, r6, asr #0x16
    bpl .L_894
    and r6, r7, r5, asr #0x14
    str r6, [r9, #0x4]
    ldr r6, [r9]
    mov r6, r6, lsl #0x1a
    movs r6, r6, asr #0x1f
    beq .L_874
    ldrh r6, [r8, #0x6]
    ldr r7, [r9, #0x4]
    and r7, r7, r5
    mov r6, r6, lsl #0x16
    orr r6, r7, r6, lsr #0x2
    str r6, [r9, #0x4]
    ldrh r7, [r8, #0x4]
    and r6, r6, r5, asr #0x14
    sub r7, r7, #0x1
    and r7, r7, r2
    orr r6, r6, r7
    str r6, [r9, #0x4]
    b .L_894
.L_874:
    ldr r6, [r9, #0x4]
    mov r7, r6, lsl #0x2
    and r6, r6, r5
    mov r7, r7, asr #0x16
    add r7, r7, #0x1
    mov r7, r7, lsl #0x16
    orr r6, r6, r7, lsr #0x2
    str r6, [r9, #0x4]
.L_894:
    ldr r6, [r9, #0x4]
    and r6, r6, lr
    str r6, [r9, #0x4]
.L_8a0:
    ldr r6, [r9]
    orr r7, r6, #0x40
    mov r6, r7, lsl #0x1c
    str r7, [r9]
    movs r6, r6, asr #0x1f
    bne .L_8c4
    mov r6, r7, lsl #0x1b
    movs r6, r6, asr #0x1f
    beq .L_8dc
.L_8c4:
    ldr r6, [r9]
    bic r6, r6, #0x8
    bic r6, r6, #0x10
    bic r6, r6, #0x2
    bic r6, r6, #0x4
    str r6, [r9]
.L_8dc:
    ldr r8, [r4, #0x98]
    add r0, r0, #0x1
    ldr r6, [r8]
    add sl, sl, #0x8
    cmp r0, r6
    bcc .L_664
.L_8f4:
    ldr r7, [r4, #0xa4]
    cmp r7, #0x0
    beq .L_bb8
    ldr r0, [r7]
    mov r8, #0x0
    cmp r0, #0x0
    bls .L_bb8
    ldr r1, _LIT3
    ldr r3, _LIT4
    sub r0, r1, #0x100000
    mov sl, r8
    mov lr, r0
    mov r2, r0
.L_928:
    ldr r6, [r4, #0xa8]
    ldr r7, [r7, #0x4]
    ldr r5, [r6, sl]
    ldr r7, [r7, r8, lsl #0x2]
    add r9, r6, sl
    mov r6, r5, lsl #0x1f
    movs r6, r6, asr #0x1f
    beq .L_ba0
    mov r6, r5, lsl #0x19
    movs r6, r6, asr #0x1f
    bne .L_ba0
    cmp r7, #0x0
    beq .L_b64
    mov r6, r5, lsl #0x1e
    movs r6, r6, asr #0x1f
    bne .L_974
    mov r6, r5, lsl #0x1c
    movs r6, r6, asr #0x1f
    beq .L_a4c
.L_974:
    ldr r6, [r9, #0x4]
    and r5, r6, r3
    mov r6, r6, lsl #0x2
    mov r6, r6, asr #0x16
    add r6, r6, #0x1
    mov r6, r6, lsl #0x16
    orr r5, r5, r6, lsr #0x2
    str r5, [r9, #0x4]
    ldrh r6, [r7, #0x4]
    mov r5, r5, lsl #0x16
    mov fp, r5, asr #0x16
    sub r6, r6, #0x1
    cmp r6, r5, asr #0x16
    ldrleh ip, [r7, #0x6]
    ble .L_9bc
    ldr r5, [r7, #0xc]
    add r5, r5, fp, lsl #0x1
    ldrh ip, [r5, #0x2]
.L_9bc:
    ldr r5, [r9, #0x4]
    mov r6, r5, lsl #0x2
    cmp ip, r6, asr #0x16
    bgt .L_b64
    add r6, fp, #0x1
    and r5, r5, r3, asr #0x14
    and r6, r6, r1
    orr r5, r5, r6
    and r6, r5, r2
    str r6, [r9, #0x4]
    ldrh r7, [r7, #0x4]
    mov r5, r6, lsl #0x16
    cmp r7, r5, asr #0x16
    bgt .L_b64
    sub r5, r7, #0x1
    and r6, r6, r3, asr #0x14
    and r5, r5, r1
    orr r5, r6, r5
    str r5, [r9, #0x4]
    ldr r5, [r9]
    mov r5, r5, lsl #0x1a
    movs r5, r5, asr #0x1f
    ldr r5, [r9, #0x4]
    beq .L_a2c
    and r5, r5, r3
    and r5, r5, r3, asr #0x14
    str r5, [r9, #0x4]
    b .L_b64
.L_a2c:
    mov r6, r5, lsl #0x2
    mov r6, r6, asr #0x16
    sub r6, r6, #0x1
    and r5, r5, r3
    mov r6, r6, lsl #0x16
    orr r5, r5, r6, lsr #0x2
    str r5, [r9, #0x4]
    b .L_b64
.L_a4c:
    mov r6, r5, lsl #0x1d
    movs r6, r6, asr #0x1f
    bne .L_a64
    mov r5, r5, lsl #0x1b
    movs r5, r5, asr #0x1f
    beq .L_b64
.L_a64:
    ldr r6, [r9, #0x4]
    and r5, r6, r0
    mov r6, r6, lsl #0xc
    mov r6, r6, asr #0x16
    sub r6, r6, #0x1
    mov r6, r6, lsl #0x16
    orr r6, r5, r6, lsr #0xc
    and r5, r6, r3
    mov r6, r6, lsl #0x2
    mov r6, r6, asr #0x16
    sub r6, r6, #0x1
    mov r6, r6, lsl #0x16
    orr r5, r5, r6, lsr #0x2
    str r5, [r9, #0x4]
    mov r5, r5, lsl #0x16
    mov fp, r5, asr #0x16
    cmp fp, #0x0
    movle ip, #0x0
    ble .L_abc
    ldr r6, [r7, #0xc]
    mov r5, fp, lsl #0x1
    ldrh ip, [r6, r5]
.L_abc:
    ldr r5, [r9, #0x4]
    mov r6, r5, lsl #0x2
    cmp ip, r6, asr #0x16
    ble .L_b64
    sub r6, fp, #0x1
    and r5, r5, r3, asr #0x14
    and r6, r6, r1
    orr r6, r5, r6
    mov r5, r6, lsl #0x16
    str r6, [r9, #0x4]
    movs r5, r5, asr #0x16
    bpl .L_b58
    and r5, r6, r3, asr #0x14
    str r5, [r9, #0x4]
    ldr r5, [r9]
    mov r5, r5, lsl #0x1a
    movs r5, r5, asr #0x1f
    beq .L_b38
    ldrh r5, [r7, #0x6]
    ldr r6, [r9, #0x4]
    and r6, r6, r3
    mov r5, r5, lsl #0x16
    orr r5, r6, r5, lsr #0x2
    str r5, [r9, #0x4]
    ldrh r6, [r7, #0x4]
    and r5, r5, r3, asr #0x14
    sub r6, r6, #0x1
    and r6, r6, r1
    orr r5, r5, r6
    str r5, [r9, #0x4]
    b .L_b58
.L_b38:
    ldr r5, [r9, #0x4]
    mov r6, r5, lsl #0x2
    and r5, r5, r3
    mov r6, r6, asr #0x16
    add r6, r6, #0x1
    mov r6, r6, lsl #0x16
    orr r5, r5, r6, lsr #0x2
    str r5, [r9, #0x4]
.L_b58:
    ldr r5, [r9, #0x4]
    and r5, r5, lr
    str r5, [r9, #0x4]
.L_b64:
    ldr r5, [r9]
    orr r6, r5, #0x40
    mov r5, r6, lsl #0x1c
    str r6, [r9]
    movs r5, r5, asr #0x1f
    bne .L_b88
    mov r5, r6, lsl #0x1b
    movs r5, r5, asr #0x1f
    beq .L_ba0
.L_b88:
    ldr r5, [r9]
    bic r5, r5, #0x8
    bic r5, r5, #0x10
    bic r5, r5, #0x2
    bic r5, r5, #0x4
    str r5, [r9]
.L_ba0:
    ldr r7, [r4, #0xa4]
    add r8, r8, #0x1
    ldr r5, [r7]
    add sl, sl, #0x8
    cmp r8, r5
    bcc .L_928
.L_bb8:
    ldr r0, [sp, #0x8]
    ldr r1, _LIT0
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x4]
    ldr r1, [r1, #0xc]
    add r0, r0, #0x284
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x8]
    cmp r0, r1
    blt .L_2c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02186a08
_LIT1: .word 0xffc0003f
_LIT2: .word 0xfff003ff
_LIT3: .word 0x000003ff
_LIT4: .word 0xc00fffff
