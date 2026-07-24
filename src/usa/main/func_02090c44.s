; func_02090c44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209149c
        .extern func_020914fc
        .extern string_put_char
        .extern func_020b3714
        .global func_02090c44
        .arm
func_02090c44:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x64
    mov r9, r2
    str r1, [sp, #0x54]
    str r0, [sp, #0x5c]
    str r0, [sp, #0x58]
    ldrsb r0, [r9]
    str r1, [sp]
    mov fp, r3
    cmp r0, #0x0
    beq .L_87c
    mov r0, #0xa
    str r0, [sp, #0xc]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x20
    str r0, [sp, #0x1c]
    mov r0, #0x30
    str r0, [sp, #0x20]
    mvn r0, #0x0
    str r0, [sp, #0x8]
    mov r0, #0x57
    str r0, [sp, #0x10]
    mov r0, #0x8
    str r0, [sp, #0x14]
    mov r0, #0x37
    str r0, [sp, #0x18]
    mov r0, #0x10
    str r0, [sp, #0x24]
    mov r0, #0x1
    str r0, [sp, #0x28]
    mov r0, #0x2b
    str r0, [sp, #0x34]
    mov r0, #0x2d
    str r0, [sp, #0x30]
    mov r0, #0x2
    str r0, [sp, #0x2c]
.L_94:
    ldrsb r1, [r9]
    and r0, r1, #0xff
    eor r0, r0, #0x20
    sub r0, r0, #0xa1
    cmp r0, #0x3c
    bcs .L_d0
    add r0, sp, #0x54
    bl string_put_char
    ldrsb r1, [r9, #0x1]!
    cmp r1, #0x0
    beq .L_870
    add r0, sp, #0x54
    add r9, r9, #0x1
    bl string_put_char
    b .L_870
.L_d0:
    cmp r1, #0x25
    beq .L_e8
    add r0, sp, #0x54
    add r9, r9, #0x1
    bl string_put_char
    b .L_870
.L_e8:
    ldr r6, [sp, #0x4]
    ldr r5, [sp, #0x8]
    ldr r2, [sp, #0xc]
    ldr r0, [sp, #0x10]
    mov sl, r6
    mov r3, r9
.L_100:
    ldrsb r4, [r9, #0x1]!
    cmp r4, #0x20
    bgt .L_118
    cmp r4, #0x20
    beq .L_158
    b .L_170
.L_118:
    cmp r4, #0x30
    bgt .L_170
    cmp r4, #0x2b
    blt .L_170
    cmp r4, #0x2b
    beq .L_144
    cmp r4, #0x2d
    beq .L_160
    cmp r4, #0x30
    beq .L_168
    b .L_170
.L_144:
    ldrsb r1, [r9, #-1]
    cmp r1, #0x20
    bne .L_170
    orr r6, r6, #0x2
    b .L_100
.L_158:
    orr r6, r6, #0x1
    b .L_100
.L_160:
    orr r6, r6, #0x8
    b .L_100
.L_168:
    orr r6, r6, #0x10
    b .L_100
.L_170:
    cmp r4, #0x2a
    bne .L_1a4
    add fp, fp, #0x4
    ldr sl, [fp, #-4]
    add r9, r9, #0x1
    cmp sl, #0x0
    rsblt sl, sl, #0x0
    orrlt r6, r6, #0x8
    b .L_1b8
.L_194:
    ldrsb r4, [r9], #0x1
    mov r1, #0xa
    mla r1, sl, r1, r4
    sub sl, r1, #0x30
.L_1a4:
    ldrsb r1, [r9]
    cmp r1, #0x30
    blt .L_1b8
    cmp r1, #0x39
    ble .L_194
.L_1b8:
    ldrsb r1, [r9]
    cmp r1, #0x2e
    bne .L_210
    ldrsb r1, [r9, #0x1]!
    ldr r5, [sp, #0x4]
    cmp r1, #0x2a
    bne .L_1fc
    add fp, fp, #0x4
    ldr r5, [fp, #-4]
    add r9, r9, #0x1
    cmp r5, #0x0
    ldrlt r5, [sp, #0x8]
    b .L_210
.L_1ec:
    ldrsb r4, [r9], #0x1
    mov r1, #0xa
    mla r1, r5, r1, r4
    sub r5, r1, #0x30
.L_1fc:
    ldrsb r1, [r9]
    cmp r1, #0x30
    blt .L_210
    cmp r1, #0x39
    ble .L_1ec
.L_210:
    ldrsb r1, [r9]
    cmp r1, #0x68
    beq .L_228
    cmp r1, #0x6c
    beq .L_240
    b .L_254
.L_228:
    ldrsb r1, [r9, #0x1]!
    cmp r1, #0x68
    orrne r6, r6, #0x40
    addeq r9, r9, #0x1
    orreq r6, r6, #0x100
    b .L_254
.L_240:
    ldrsb r1, [r9, #0x1]!
    cmp r1, #0x6c
    orrne r6, r6, #0x20
    addeq r9, r9, #0x1
    orreq r6, r6, #0x80
.L_254:
    ldrsb r1, [r9]
    cmp r1, #0x69
    bgt .L_2a4
    cmp r1, #0x63
    blt .L_284
    cmp r1, #0x63
    beq .L_318
    cmp r1, #0x64
    beq .L_4d0
    cmp r1, #0x69
    beq .L_4d0
    b .L_4b4
.L_284:
    cmp r1, #0x25
    bgt .L_298
    cmp r1, #0x25
    beq .L_498
    b .L_4b4
.L_298:
    cmp r1, #0x58
    beq .L_304
    b .L_4b4
.L_2a4:
    cmp r1, #0x6e
    bgt .L_2b8
    cmp r1, #0x6e
    beq .L_440
    b .L_4b4
.L_2b8:
    sub r1, r1, #0x6f
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_4b4
    b .L_2f0
    b .L_30c
    b .L_4b4
    b .L_4b4
    b .L_38c
    b .L_4b4
    b .L_2fc
    b .L_4b4
    b .L_4b4
    b .L_4c8
.L_2f0:
    ldr r2, [sp, #0x14]
    orr r6, r6, #0x1000
    b .L_4d0
.L_2fc:
    orr r6, r6, #0x1000
    b .L_4d0
.L_304:
    ldr r0, [sp, #0x18]
    b .L_4c8
.L_30c:
    orr r6, r6, #0x4
    ldr r5, [sp, #0x14]
    b .L_4c8
.L_318:
    cmp r5, #0x0
    bge .L_4b4
    ands r0, r6, #0x8
    add fp, fp, #0x4
    ldr r4, [fp, #-4]
    beq .L_354
    mov r0, r4, lsl #0x18
    mov r1, r0, asr #0x18
    add r0, sp, #0x54
    bl string_put_char
    ldr r1, [sp, #0x1c]
    sub r2, sl, #0x1
    add r0, sp, #0x54
    bl func_020914fc
    b .L_384
.L_354:
    ands r0, r6, #0x10
    ldrne r0, [sp, #0x20]
    sub r2, sl, #0x1
    ldreq r0, [sp, #0x1c]
    mov r0, r0, lsl #0x18
    mov r1, r0, asr #0x18
    add r0, sp, #0x54
    bl func_020914fc
    mov r0, r4, lsl #0x18
    mov r1, r0, asr #0x18
    add r0, sp, #0x54
    bl string_put_char
.L_384:
    add r9, r9, #0x1
    b .L_870
.L_38c:
    add fp, fp, #0x4
    cmp r5, #0x0
    ldr r7, [sp, #0x4]
    ldr r4, [fp, #-4]
    bge .L_3c4
    ldrsb r0, [r4]
    cmp r0, #0x0
    beq .L_3d8
.L_3ac:
    add r7, r7, #0x1
    ldrsb r0, [r4, r7]
    cmp r0, #0x0
    bne .L_3ac
    b .L_3d8
.L_3c0:
    add r7, r7, #0x1
.L_3c4:
    cmp r7, r5
    bge .L_3d8
    ldrsb r0, [r4, r7]
    cmp r0, #0x0
    bne .L_3c0
.L_3d8:
    ands r0, r6, #0x8
    sub sl, sl, r7
    beq .L_408
    mov r1, r4
    mov r2, r7
    add r0, sp, #0x54
    bl func_0209149c
    ldr r1, [sp, #0x1c]
    mov r2, sl
    add r0, sp, #0x54
    bl func_020914fc
    b .L_438
.L_408:
    ands r0, r6, #0x10
    ldrne r0, [sp, #0x20]
    mov r2, sl
    ldreq r0, [sp, #0x1c]
    mov r0, r0, lsl #0x18
    mov r1, r0, asr #0x18
    add r0, sp, #0x54
    bl func_020914fc
    mov r1, r4
    mov r2, r7
    add r0, sp, #0x54
    bl func_0209149c
.L_438:
    add r9, r9, #0x1
    b .L_870
.L_440:
    ands r0, r6, #0x100
    ldr r1, [sp, #0x58]
    ldr r0, [sp, #0x5c]
    sub r2, r1, r0
    bne .L_490
    ands r0, r6, #0x40
    addne fp, fp, #0x4
    ldrne r0, [fp, #-4]
    strneh r2, [r0]
    bne .L_490
    ands r0, r6, #0x80
    addeq fp, fp, #0x4
    ldreq r0, [fp, #-4]
    streq r2, [r0]
    beq .L_490
    add fp, fp, #0x4
    ldr r0, [fp, #-4]
    mov r1, r2, asr #0x1f
    str r2, [r0]
    str r1, [r0, #0x4]
.L_490:
    add r9, r9, #0x1
    b .L_870
.L_498:
    add r0, r3, #0x1
    cmp r0, r9
    bne .L_4b4
    add r0, sp, #0x54
    add r9, r9, #0x1
    bl string_put_char
    b .L_870
.L_4b4:
    add r0, sp, #0x54
    mov r1, r3
    sub r2, r9, r3
    bl func_0209149c
    b .L_870
.L_4c8:
    ldr r2, [sp, #0x24]
    orr r6, r6, #0x1000
.L_4d0:
    ands r1, r6, #0x8
    bicne r6, r6, #0x10
    cmp r5, #0x0
    bicge r6, r6, #0x10
    ldrlt r5, [sp, #0x28]
    ldr r7, [sp, #0x4]
    ands r1, r6, #0x1000
    beq .L_584
    ands r1, r6, #0x100
    addne fp, fp, #0x4
    ldrneb r4, [fp, #-4]
    movne r1, #0x0
    bne .L_534
    ands r1, r6, #0x40
    addne fp, fp, #0x4
    ldrneh r4, [fp, #-4]
    movne r1, #0x0
    bne .L_534
    ands r1, r6, #0x80
    addne fp, fp, #0x8
    ldrne r1, [fp, #-4]
    ldrne r4, [fp, #-8]
    addeq fp, fp, #0x4
    ldreq r4, [fp, #-4]
    moveq r1, #0x0
.L_534:
    bic r6, r6, #0x3
    ands r3, r6, #0x4
    beq .L_63c
    cmp r2, #0x10
    bne .L_570
    mov r3, #0x0
    cmp r1, r3
    cmpeq r4, r3
    beq .L_63c
    ldr r3, [sp, #0x20]
    ldr r7, [sp, #0x2c]
    strb r3, [sp, #0x39]
    add r3, r0, #0x21
    strb r3, [sp, #0x38]
    b .L_63c
.L_570:
    cmp r2, #0x8
    ldreq r3, [sp, #0x20]
    ldreq r7, [sp, #0x28]
    streqb r3, [sp, #0x38]
    b .L_63c
.L_584:
    ands r1, r6, #0x100
    addne fp, fp, #0x4
    ldrnesb r4, [fp, #-4]
    movne r1, r4, asr #0x1f
    bne .L_5c8
    ands r1, r6, #0x40
    addne fp, fp, #0x4
    ldrnesh r4, [fp, #-4]
    movne r1, r4, asr #0x1f
    bne .L_5c8
    ands r1, r6, #0x80
    addne fp, fp, #0x8
    ldrne r4, [fp, #-8]
    ldrne r1, [fp, #-4]
    addeq fp, fp, #0x4
    ldreq r4, [fp, #-4]
    moveq r1, r4, asr #0x1f
.L_5c8:
    mov r3, #0x0
    and r8, r3, #0x0
    cmp r8, r3
    and r8, r1, #-2147483648
    cmpeq r8, r3
    beq .L_604
    ldr r7, [sp, #0x30]
    mvn r4, r4
    strb r7, [sp, #0x38]
    mvn r7, r1
    mov r1, #0x1
    adds r4, r4, r1
    adc r1, r7, r3
    ldr r7, [sp, #0x28]
    b .L_63c
.L_604:
    cmp r1, r3
    cmpeq r4, r3
    bne .L_618
    cmp r5, #0x0
    beq .L_63c
.L_618:
    ands r3, r6, #0x2
    ldrne r3, [sp, #0x34]
    ldrne r7, [sp, #0x28]
    strneb r3, [sp, #0x38]
    bne .L_63c
    ands r3, r6, #0x1
    ldrne r3, [sp, #0x1c]
    ldrne r7, [sp, #0x28]
    strneb r3, [sp, #0x38]
.L_63c:
    cmp r2, #0x8
    ldr r8, [sp, #0x4]
    beq .L_65c
    cmp r2, #0xa
    beq .L_6a4
    cmp r2, #0x10
    beq .L_740
    b .L_78c
.L_65c:
    mov r0, #0x0
    cmp r1, r0
    cmpeq r4, r0
    beq .L_78c
.L_66c:
    and r0, r4, #0x7
    add r3, r0, #0x30
    add r0, sp, #0x3a
    strb r3, [r0, r8]
    mov r4, r4, lsr #0x3
    mov r2, #0x0
    mov r0, r1, lsr #0x3
    orr r4, r4, r1, lsl #0x1d
    cmp r0, r2
    cmpeq r4, r2
    mov r1, r0
    add r8, r8, #0x1
    bne .L_66c
    b .L_78c
.L_6a4:
    mov r0, #0x0
    cmp r0, r0
    cmpeq r1, r0
    bne .L_6f0
    cmp r4, #0x0
    beq .L_78c
.L_6bc:
    ldr r0, _LIT0
    umull r1, r0, r4, r0
    movs r0, r0, lsr #0x3
    mov r1, #0xa
    mul r1, r0, r1
    sub r1, r4, r1
    mov r4, r0
    add r1, r1, #0x30
    add r0, sp, #0x3a
    strb r1, [r0, r8]
    add r8, r8, #0x1
    bne .L_6bc
    b .L_78c
.L_6f0:
    cmp r1, r0
    cmpeq r4, r0
    beq .L_78c
.L_6fc:
    ldr r2, [sp, #0xc]
    ldr r3, [sp, #0x4]
    mov r0, r4
    bl func_020b3714
    mov r3, #0xa
    umull r3, ip, r0, r3
    subs r3, r4, r3
    mov r2, #0x0
    add r4, r3, #0x30
    add r3, sp, #0x3a
    strb r4, [r3, r8]
    cmp r1, r2
    cmpeq r0, r2
    mov r4, r0
    add r8, r8, #0x1
    bne .L_6fc
    b .L_78c
.L_740:
    mov r2, #0x0
    cmp r1, r2
    cmpeq r4, r2
    beq .L_78c
.L_750:
    and r3, r4, #0xf
    cmp r3, #0xa
    mov r4, r4, lsr #0x4
    addlt r3, r3, #0x30
    mov r2, r1, lsr #0x4
    orr r4, r4, r1, lsl #0x1c
    mov r1, r2
    addge r3, r3, r0
    add r2, sp, #0x3a
    strb r3, [r2, r8]
    mov r2, #0x0
    cmp r1, r2
    add r8, r8, #0x1
    cmpeq r4, r2
    bne .L_750
.L_78c:
    cmp r7, #0x0
    ble .L_7b0
    ldrsb r0, [sp, #0x38]
    cmp r0, #0x30
    ldreq r1, [sp, #0x20]
    addeq r0, sp, #0x3a
    streqb r1, [r0, r8]
    ldreq r7, [sp, #0x4]
    addeq r8, r8, #0x1
.L_7b0:
    sub r5, r5, r8
    ands r0, r6, #0x10
    beq .L_7cc
    sub r0, sl, r8
    sub r0, r0, r7
    cmp r5, r0
    movlt r5, r0
.L_7cc:
    cmp r5, #0x0
    subgt sl, sl, r5
    add r0, r7, r8
    ands r6, r6, #0x8
    sub sl, sl, r0
    bne .L_7f4
    ldr r1, [sp, #0x1c]
    add r0, sp, #0x54
    mov r2, sl
    bl func_020914fc
.L_7f4:
    cmp r7, #0x0
    ble .L_81c
    add r0, sp, #0x38
    add r4, r0, r7
.L_804:
    ldrsb r1, [r4, #-1]!
    sub r7, r7, #0x1
    add r0, sp, #0x54
    bl string_put_char
    cmp r7, #0x0
    bgt .L_804
.L_81c:
    ldr r1, [sp, #0x20]
    mov r2, r5
    add r0, sp, #0x54
    bl func_020914fc
    cmp r8, #0x0
    ble .L_854
    add r0, sp, #0x3a
    add r4, r0, r8
.L_83c:
    ldrsb r1, [r4, #-1]!
    sub r8, r8, #0x1
    add r0, sp, #0x54
    bl string_put_char
    cmp r8, #0x0
    bgt .L_83c
.L_854:
    cmp r6, #0x0
    beq .L_86c
    ldr r1, [sp, #0x1c]
    mov r2, sl
    add r0, sp, #0x54
    bl func_020914fc
.L_86c:
    add r9, r9, #0x1
.L_870:
    ldrsb r0, [r9]
    cmp r0, #0x0
    bne .L_94
.L_87c:
    ldr r0, [sp, #0x54]
    cmp r0, #0x0
    ldrne r0, [sp, #0x58]
    movne r1, #0x0
    strneb r1, [r0]
    bne .L_8ac
    ldr r0, [sp]
    cmp r0, #0x0
    ldrne r1, [sp, #0x5c]
    movne r2, #0x0
    addne r0, r1, r0
    strneb r2, [r0, #-1]
.L_8ac:
    ldr r1, [sp, #0x58]
    ldr r0, [sp, #0x5c]
    sub r0, r1, r0
    add sp, sp, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0xcccccccd
