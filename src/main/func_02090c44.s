; func_02090c44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02091584
        .extern func_020915e4
        .extern func_0209164c
        .extern func_020b3808
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
    beq .L_9c0
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
.L_1d8:
    ldrsb r1, [r9]
    and r0, r1, #0xff
    eor r0, r0, #0x20
    sub r0, r0, #0xa1
    cmp r0, #0x3c
    bcs .L_214
    add r0, sp, #0x54
    bl func_0209164c
    ldrsb r1, [r9, #0x1]!
    cmp r1, #0x0
    beq .L_9b4
    add r0, sp, #0x54
    add r9, r9, #0x1
    bl func_0209164c
    b .L_9b4
.L_214:
    cmp r1, #0x25
    beq .L_22c
    add r0, sp, #0x54
    add r9, r9, #0x1
    bl func_0209164c
    b .L_9b4
.L_22c:
    ldr r6, [sp, #0x4]
    ldr r5, [sp, #0x8]
    ldr r2, [sp, #0xc]
    ldr r0, [sp, #0x10]
    mov sl, r6
    mov r3, r9
.L_244:
    ldrsb r4, [r9, #0x1]!
    cmp r4, #0x20
    bgt .L_25c
    cmp r4, #0x20
    beq .L_29c
    b .L_2b4
.L_25c:
    cmp r4, #0x30
    bgt .L_2b4
    cmp r4, #0x2b
    blt .L_2b4
    cmp r4, #0x2b
    beq .L_288
    cmp r4, #0x2d
    beq .L_2a4
    cmp r4, #0x30
    beq .L_2ac
    b .L_2b4
.L_288:
    ldrsb r1, [r9, #-1]
    cmp r1, #0x20
    bne .L_2b4
    orr r6, r6, #0x2
    b .L_244
.L_29c:
    orr r6, r6, #0x1
    b .L_244
.L_2a4:
    orr r6, r6, #0x8
    b .L_244
.L_2ac:
    orr r6, r6, #0x10
    b .L_244
.L_2b4:
    cmp r4, #0x2a
    bne .L_2e8
    add fp, fp, #0x4
    ldr sl, [fp, #-4]
    add r9, r9, #0x1
    cmp sl, #0x0
    rsblt sl, sl, #0x0
    orrlt r6, r6, #0x8
    b .L_2fc
.L_2d8:
    ldrsb r4, [r9], #0x1
    mov r1, #0xa
    mla r1, sl, r1, r4
    sub sl, r1, #0x30
.L_2e8:
    ldrsb r1, [r9]
    cmp r1, #0x30
    blt .L_2fc
    cmp r1, #0x39
    ble .L_2d8
.L_2fc:
    ldrsb r1, [r9]
    cmp r1, #0x2e
    bne .L_354
    ldrsb r1, [r9, #0x1]!
    ldr r5, [sp, #0x4]
    cmp r1, #0x2a
    bne .L_340
    add fp, fp, #0x4
    ldr r5, [fp, #-4]
    add r9, r9, #0x1
    cmp r5, #0x0
    ldrlt r5, [sp, #0x8]
    b .L_354
.L_330:
    ldrsb r4, [r9], #0x1
    mov r1, #0xa
    mla r1, r5, r1, r4
    sub r5, r1, #0x30
.L_340:
    ldrsb r1, [r9]
    cmp r1, #0x30
    blt .L_354
    cmp r1, #0x39
    ble .L_330
.L_354:
    ldrsb r1, [r9]
    cmp r1, #0x68
    beq .L_36c
    cmp r1, #0x6c
    beq .L_384
    b .L_398
.L_36c:
    ldrsb r1, [r9, #0x1]!
    cmp r1, #0x68
    orrne r6, r6, #0x40
    addeq r9, r9, #0x1
    orreq r6, r6, #0x100
    b .L_398
.L_384:
    ldrsb r1, [r9, #0x1]!
    cmp r1, #0x6c
    orrne r6, r6, #0x20
    addeq r9, r9, #0x1
    orreq r6, r6, #0x80
.L_398:
    ldrsb r1, [r9]
    cmp r1, #0x69
    bgt .L_3e8
    cmp r1, #0x63
    blt .L_3c8
    cmp r1, #0x63
    beq .L_45c
    cmp r1, #0x64
    beq .L_614
    cmp r1, #0x69
    beq .L_614
    b .L_5f8
.L_3c8:
    cmp r1, #0x25
    bgt .L_3dc
    cmp r1, #0x25
    beq .L_5dc
    b .L_5f8
.L_3dc:
    cmp r1, #0x58
    beq .L_448
    b .L_5f8
.L_3e8:
    cmp r1, #0x6e
    bgt .L_3fc
    cmp r1, #0x6e
    beq .L_584
    b .L_5f8
.L_3fc:
    sub r1, r1, #0x6f
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_5f8
    b .L_434
    b .L_450
    b .L_5f8
    b .L_5f8
    b .L_4d0
    b .L_5f8
    b .L_440
    b .L_5f8
    b .L_5f8
    b .L_60c
.L_434:
    ldr r2, [sp, #0x14]
    orr r6, r6, #0x1000
    b .L_614
.L_440:
    orr r6, r6, #0x1000
    b .L_614
.L_448:
    ldr r0, [sp, #0x18]
    b .L_60c
.L_450:
    orr r6, r6, #0x4
    ldr r5, [sp, #0x14]
    b .L_60c
.L_45c:
    cmp r5, #0x0
    bge .L_5f8
    ands r0, r6, #0x8
    add fp, fp, #0x4
    ldr r4, [fp, #-4]
    beq .L_498
    mov r0, r4, lsl #0x18
    mov r1, r0, asr #0x18
    add r0, sp, #0x54
    bl func_0209164c
    ldr r1, [sp, #0x1c]
    sub r2, sl, #0x1
    add r0, sp, #0x54
    bl func_020915e4
    b .L_4c8
.L_498:
    ands r0, r6, #0x10
    ldrne r0, [sp, #0x20]
    sub r2, sl, #0x1
    ldreq r0, [sp, #0x1c]
    mov r0, r0, lsl #0x18
    mov r1, r0, asr #0x18
    add r0, sp, #0x54
    bl func_020915e4
    mov r0, r4, lsl #0x18
    mov r1, r0, asr #0x18
    add r0, sp, #0x54
    bl func_0209164c
.L_4c8:
    add r9, r9, #0x1
    b .L_9b4
.L_4d0:
    add fp, fp, #0x4
    cmp r5, #0x0
    ldr r7, [sp, #0x4]
    ldr r4, [fp, #-4]
    bge .L_508
    ldrsb r0, [r4]
    cmp r0, #0x0
    beq .L_51c
.L_4f0:
    add r7, r7, #0x1
    ldrsb r0, [r4, r7]
    cmp r0, #0x0
    bne .L_4f0
    b .L_51c
.L_504:
    add r7, r7, #0x1
.L_508:
    cmp r7, r5
    bge .L_51c
    ldrsb r0, [r4, r7]
    cmp r0, #0x0
    bne .L_504
.L_51c:
    ands r0, r6, #0x8
    sub sl, sl, r7
    beq .L_54c
    mov r1, r4
    mov r2, r7
    add r0, sp, #0x54
    bl func_02091584
    ldr r1, [sp, #0x1c]
    mov r2, sl
    add r0, sp, #0x54
    bl func_020915e4
    b .L_57c
.L_54c:
    ands r0, r6, #0x10
    ldrne r0, [sp, #0x20]
    mov r2, sl
    ldreq r0, [sp, #0x1c]
    mov r0, r0, lsl #0x18
    mov r1, r0, asr #0x18
    add r0, sp, #0x54
    bl func_020915e4
    mov r1, r4
    mov r2, r7
    add r0, sp, #0x54
    bl func_02091584
.L_57c:
    add r9, r9, #0x1
    b .L_9b4
.L_584:
    ands r0, r6, #0x100
    ldr r1, [sp, #0x58]
    ldr r0, [sp, #0x5c]
    sub r2, r1, r0
    bne .L_5d4
    ands r0, r6, #0x40
    addne fp, fp, #0x4
    ldrne r0, [fp, #-4]
    strneh r2, [r0]
    bne .L_5d4
    ands r0, r6, #0x80
    addeq fp, fp, #0x4
    ldreq r0, [fp, #-4]
    streq r2, [r0]
    beq .L_5d4
    add fp, fp, #0x4
    ldr r0, [fp, #-4]
    mov r1, r2, asr #0x1f
    str r2, [r0]
    str r1, [r0, #0x4]
.L_5d4:
    add r9, r9, #0x1
    b .L_9b4
.L_5dc:
    add r0, r3, #0x1
    cmp r0, r9
    bne .L_5f8
    add r0, sp, #0x54
    add r9, r9, #0x1
    bl func_0209164c
    b .L_9b4
.L_5f8:
    add r0, sp, #0x54
    mov r1, r3
    sub r2, r9, r3
    bl func_02091584
    b .L_9b4
.L_60c:
    ldr r2, [sp, #0x24]
    orr r6, r6, #0x1000
.L_614:
    ands r1, r6, #0x8
    bicne r6, r6, #0x10
    cmp r5, #0x0
    bicge r6, r6, #0x10
    ldrlt r5, [sp, #0x28]
    ldr r7, [sp, #0x4]
    ands r1, r6, #0x1000
    beq .L_6c8
    ands r1, r6, #0x100
    addne fp, fp, #0x4
    ldrneb r4, [fp, #-4]
    movne r1, #0x0
    bne .L_678
    ands r1, r6, #0x40
    addne fp, fp, #0x4
    ldrneh r4, [fp, #-4]
    movne r1, #0x0
    bne .L_678
    ands r1, r6, #0x80
    addne fp, fp, #0x8
    ldrne r1, [fp, #-4]
    ldrne r4, [fp, #-8]
    addeq fp, fp, #0x4
    ldreq r4, [fp, #-4]
    moveq r1, #0x0
.L_678:
    bic r6, r6, #0x3
    ands r3, r6, #0x4
    beq .L_780
    cmp r2, #0x10
    bne .L_6b4
    mov r3, #0x0
    cmp r1, r3
    cmpeq r4, r3
    beq .L_780
    ldr r3, [sp, #0x20]
    ldr r7, [sp, #0x2c]
    strb r3, [sp, #0x39]
    add r3, r0, #0x21
    strb r3, [sp, #0x38]
    b .L_780
.L_6b4:
    cmp r2, #0x8
    ldreq r3, [sp, #0x20]
    ldreq r7, [sp, #0x28]
    streqb r3, [sp, #0x38]
    b .L_780
.L_6c8:
    ands r1, r6, #0x100
    addne fp, fp, #0x4
    ldrnesb r4, [fp, #-4]
    movne r1, r4, asr #0x1f
    bne .L_70c
    ands r1, r6, #0x40
    addne fp, fp, #0x4
    ldrnesh r4, [fp, #-4]
    movne r1, r4, asr #0x1f
    bne .L_70c
    ands r1, r6, #0x80
    addne fp, fp, #0x8
    ldrne r4, [fp, #-8]
    ldrne r1, [fp, #-4]
    addeq fp, fp, #0x4
    ldreq r4, [fp, #-4]
    moveq r1, r4, asr #0x1f
.L_70c:
    mov r3, #0x0
    and r8, r3, #0x0
    cmp r8, r3
    and r8, r1, #-2147483648
    cmpeq r8, r3
    beq .L_748
    ldr r7, [sp, #0x30]
    mvn r4, r4
    strb r7, [sp, #0x38]
    mvn r7, r1
    mov r1, #0x1
    adds r4, r4, r1
    adc r1, r7, r3
    ldr r7, [sp, #0x28]
    b .L_780
.L_748:
    cmp r1, r3
    cmpeq r4, r3
    bne .L_75c
    cmp r5, #0x0
    beq .L_780
.L_75c:
    ands r3, r6, #0x2
    ldrne r3, [sp, #0x34]
    ldrne r7, [sp, #0x28]
    strneb r3, [sp, #0x38]
    bne .L_780
    ands r3, r6, #0x1
    ldrne r3, [sp, #0x1c]
    ldrne r7, [sp, #0x28]
    strneb r3, [sp, #0x38]
.L_780:
    cmp r2, #0x8
    ldr r8, [sp, #0x4]
    beq .L_7a0
    cmp r2, #0xa
    beq .L_7e8
    cmp r2, #0x10
    beq .L_884
    b .L_8d0
.L_7a0:
    mov r0, #0x0
    cmp r1, r0
    cmpeq r4, r0
    beq .L_8d0
.L_7b0:
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
    bne .L_7b0
    b .L_8d0
.L_7e8:
    mov r0, #0x0
    cmp r0, r0
    cmpeq r1, r0
    bne .L_834
    cmp r4, #0x0
    beq .L_8d0
.L_800:
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
    bne .L_800
    b .L_8d0
.L_834:
    cmp r1, r0
    cmpeq r4, r0
    beq .L_8d0
.L_840:
    ldr r2, [sp, #0xc]
    ldr r3, [sp, #0x4]
    mov r0, r4
    bl func_020b3808
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
    bne .L_840
    b .L_8d0
.L_884:
    mov r2, #0x0
    cmp r1, r2
    cmpeq r4, r2
    beq .L_8d0
.L_894:
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
    bne .L_894
.L_8d0:
    cmp r7, #0x0
    ble .L_8f4
    ldrsb r0, [sp, #0x38]
    cmp r0, #0x30
    ldreq r1, [sp, #0x20]
    addeq r0, sp, #0x3a
    streqb r1, [r0, r8]
    ldreq r7, [sp, #0x4]
    addeq r8, r8, #0x1
.L_8f4:
    sub r5, r5, r8
    ands r0, r6, #0x10
    beq .L_910
    sub r0, sl, r8
    sub r0, r0, r7
    cmp r5, r0
    movlt r5, r0
.L_910:
    cmp r5, #0x0
    subgt sl, sl, r5
    add r0, r7, r8
    ands r6, r6, #0x8
    sub sl, sl, r0
    bne .L_938
    ldr r1, [sp, #0x1c]
    add r0, sp, #0x54
    mov r2, sl
    bl func_020915e4
.L_938:
    cmp r7, #0x0
    ble .L_960
    add r0, sp, #0x38
    add r4, r0, r7
.L_948:
    ldrsb r1, [r4, #-1]!
    sub r7, r7, #0x1
    add r0, sp, #0x54
    bl func_0209164c
    cmp r7, #0x0
    bgt .L_948
.L_960:
    ldr r1, [sp, #0x20]
    mov r2, r5
    add r0, sp, #0x54
    bl func_020915e4
    cmp r8, #0x0
    ble .L_998
    add r0, sp, #0x3a
    add r4, r0, r8
.L_980:
    ldrsb r1, [r4, #-1]!
    sub r8, r8, #0x1
    add r0, sp, #0x54
    bl func_0209164c
    cmp r8, #0x0
    bgt .L_980
.L_998:
    cmp r6, #0x0
    beq .L_9b0
    ldr r1, [sp, #0x1c]
    mov r2, sl
    add r0, sp, #0x54
    bl func_020915e4
.L_9b0:
    add r9, r9, #0x1
.L_9b4:
    ldrsb r0, [r9]
    cmp r0, #0x0
    bne .L_1d8
.L_9c0:
    ldr r0, [sp, #0x54]
    cmp r0, #0x0
    ldrne r0, [sp, #0x58]
    movne r1, #0x0
    strneb r1, [r0]
    bne .L_9f0
    ldr r0, [sp]
    cmp r0, #0x0
    ldrne r1, [sp, #0x5c]
    movne r2, #0x0
    addne r0, r1, r0
    strneb r2, [r0, #-1]
.L_9f0:
    ldr r1, [sp, #0x58]
    ldr r0, [sp, #0x5c]
    sub r0, r1, r0
    add sp, sp, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0xcccccccd
