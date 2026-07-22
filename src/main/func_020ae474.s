; func_020ae474 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b00
        .extern func_020a71e4
        .extern func_020a7268
        .extern func_020a73e8
        .extern func_020aaddc
        .extern FindU16InArray
        .extern func_020acec0
        .extern func_020ad438
        .extern func_020ad688
        .extern func_020ad96c
        .extern func_020ade28
        .extern func_020aee3c
        .extern func_020aee78
        .global func_020ae474
        .arm
func_020ae474:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x430
    mov r3, #0x20
    mov fp, r2
    strh r3, [sp, #0x1c]
    ldrh r2, [fp]
    mov r9, r0
    mov r8, r1
    cmp r2, #0x0
    mov r4, #0x0
    beq .L_8d0
.L_30:
    mov r0, fp
    mov r1, #0x25
    bl func_020aee78
    str r0, [sp, #0xc]
    cmp r0, #0x0
    bne .L_84
    mov r0, fp
    bl func_020aee3c
    movs r2, r0
    add r4, r4, r2
    beq .L_8d0
    mov r0, r8
    mov r1, fp
    blx r9
    cmp r0, #0x0
    bne .L_8d0
    add sp, sp, #0x430
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_84:
    sub r0, r0, fp
    add r0, r0, r0, lsr #0x1f
    movs r2, r0, asr #0x1
    add r4, r4, r2
    beq .L_bc
    mov r0, r8
    mov r1, fp
    blx r9
    cmp r0, #0x0
    addeq sp, sp, #0x430
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
.L_bc:
    add r1, sp, #0x400
    ldr r0, [sp, #0xc]
    add r1, r1, #0x64
    add r2, sp, #0x20
    bl func_020acec0
    ldrh r1, [sp, #0x26]
    mov fp, r0
    cmp r1, #0x61
    bgt .L_12c
    bge .L_498
    cmp r1, #0x47
    bgt .L_120
    subs r0, r1, #0x41
    addpl pc, pc, r0, lsl #0x2
    b .L_114
    b .L_498
    b .L_73c
    b .L_73c
    b .L_73c
    b .L_428
    b .L_428
    b .L_428
.L_114:
    cmp r1, #0x25
    beq .L_728
    b .L_73c
.L_120:
    cmp r1, #0x58
    beq .L_2ec
    b .L_73c
.L_12c:
    cmp r1, #0x75
    bgt .L_194
    subs r0, r1, #0x64
    addpl pc, pc, r0, lsl #0x2
    b .L_188
    b .L_1b0
    b .L_428
    b .L_428
    b .L_428
    b .L_73c
    b .L_1b0
    b .L_73c
    b .L_73c
    b .L_73c
    b .L_73c
    b .L_644
    b .L_2ec
    b .L_73c
    b .L_73c
    b .L_73c
    b .L_508
    b .L_73c
    b .L_2ec
.L_188:
    cmp r1, #0x63
    beq .L_6d0
    b .L_73c
.L_194:
    cmp r1, #0x78
    bgt .L_1a4
    beq .L_2ec
    b .L_73c
.L_1a4:
    ldr r0, _LIT0
    cmp r1, r0
    b .L_73c
.L_1b0:
    ldrb r0, [sp, #0x24]
    cmp r0, #0x3
    bne .L_1d0
    ldr r1, [sp, #0x464]
    add r1, r1, #0x4
    str r1, [sp, #0x464]
    ldr sl, [r1, #-4]
    b .L_268
.L_1d0:
    cmp r0, #0x4
    bne .L_1f8
    ldr r1, [sp, #0x464]
    add r2, r1, #0x8
    str r2, [sp, #0x464]
    ldr r1, [r2, #-8]
    str r1, [sp, #0x10]
    ldr r1, [r2, #-4]
    str r1, [sp, #0x14]
    b .L_268
.L_1f8:
    cmp r0, #0x6
    bne .L_220
    ldr r1, [sp, #0x464]
    add r2, r1, #0x8
    str r2, [sp, #0x464]
    ldr r1, [r2, #-8]
    str r1, [sp, #0x10]
    ldr r1, [r2, #-4]
    str r1, [sp, #0x14]
    b .L_268
.L_220:
    cmp r0, #0x7
    bne .L_23c
    ldr r1, [sp, #0x464]
    add r1, r1, #0x4
    str r1, [sp, #0x464]
    ldr sl, [r1, #-4]
    b .L_268
.L_23c:
    cmp r0, #0x8
    bne .L_258
    ldr r1, [sp, #0x464]
    add r1, r1, #0x4
    str r1, [sp, #0x464]
    ldr sl, [r1, #-4]
    b .L_268
.L_258:
    ldr r1, [sp, #0x464]
    add r1, r1, #0x4
    str r1, [sp, #0x464]
    ldr sl, [r1, #-4]
.L_268:
    cmp r0, #0x2
    moveq r1, sl, lsl #0x10
    moveq sl, r1, asr #0x10
    cmp r0, #0x4
    cmpne r0, #0x6
    add r0, sp, #0x20
    bne .L_2b0
    sub r5, sp, #0x4
    ldmia r0, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    ldr r3, [r5]
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x14]
    add r2, sp, #0x430
    bl func_020ad688
    movs r6, r0
    beq .L_73c
    b .L_2d4
.L_2b0:
    sub r5, sp, #0x8
    ldmia r0, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    add r1, sp, #0x430
    mov r0, sl
    ldmia r5, {r2, r3}
    bl func_020ad438
    movs r6, r0
    beq .L_73c
.L_2d4:
    add r0, sp, #0x400
    add r0, r0, #0x2e
    sub r0, r0, r6
    add r0, r0, r0, lsr #0x1f
    mov r7, r0, asr #0x1
    b .L_788
.L_2ec:
    ldrb r0, [sp, #0x24]
    cmp r0, #0x3
    bne .L_30c
    ldr r1, [sp, #0x464]
    add r1, r1, #0x4
    str r1, [sp, #0x464]
    ldr sl, [r1, #-4]
    b .L_3a4
.L_30c:
    cmp r0, #0x4
    bne .L_334
    ldr r1, [sp, #0x464]
    add r2, r1, #0x8
    str r2, [sp, #0x464]
    ldr r1, [r2, #-8]
    str r1, [sp, #0x10]
    ldr r1, [r2, #-4]
    str r1, [sp, #0x14]
    b .L_3a4
.L_334:
    cmp r0, #0x6
    bne .L_35c
    ldr r1, [sp, #0x464]
    add r2, r1, #0x8
    str r2, [sp, #0x464]
    ldr r1, [r2, #-8]
    str r1, [sp, #0x10]
    ldr r1, [r2, #-4]
    str r1, [sp, #0x14]
    b .L_3a4
.L_35c:
    cmp r0, #0x7
    bne .L_378
    ldr r1, [sp, #0x464]
    add r1, r1, #0x4
    str r1, [sp, #0x464]
    ldr sl, [r1, #-4]
    b .L_3a4
.L_378:
    cmp r0, #0x8
    bne .L_394
    ldr r1, [sp, #0x464]
    add r1, r1, #0x4
    str r1, [sp, #0x464]
    ldr sl, [r1, #-4]
    b .L_3a4
.L_394:
    ldr r1, [sp, #0x464]
    add r1, r1, #0x4
    str r1, [sp, #0x464]
    ldr sl, [r1, #-4]
.L_3a4:
    cmp r0, #0x2
    moveq r1, sl, lsl #0x10
    moveq sl, r1, lsr #0x10
    cmp r0, #0x4
    cmpne r0, #0x6
    add r0, sp, #0x20
    bne .L_3ec
    sub r5, sp, #0x4
    ldmia r0, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    ldr r3, [r5]
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x14]
    add r2, sp, #0x430
    bl func_020ad688
    movs r6, r0
    beq .L_73c
    b .L_410
.L_3ec:
    sub r5, sp, #0x8
    ldmia r0, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    add r1, sp, #0x430
    mov r0, sl
    ldmia r5, {r2, r3}
    bl func_020ad438
    movs r6, r0
    beq .L_73c
.L_410:
    add r0, sp, #0x400
    add r0, r0, #0x2e
    sub r0, r0, r6
    add r0, r0, r0, lsr #0x1f
    mov r7, r0, asr #0x1
    b .L_788
.L_428:
    ldrb r0, [sp, #0x24]
    cmp r0, #0x9
    ldrne r0, [sp, #0x464]
    addne r0, r0, #0x8
    strne r0, [sp, #0x464]
    bne .L_44c
    ldr r0, [sp, #0x464]
    add r0, r0, #0x8
    str r0, [sp, #0x464]
.L_44c:
    ldr r7, [r0, #-8]
    ldr r6, [r0, #-4]
    add r0, sp, #0x20
    sub r5, sp, #0x4
    ldmia r0, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    ldr r3, [r5]
    mov r0, r7
    mov r1, r6
    add r2, sp, #0x430
    bl func_020ade28
    movs r6, r0
    beq .L_73c
    add r0, sp, #0x400
    add r0, r0, #0x2e
    sub r0, r0, r6
    add r0, r0, r0, lsr #0x1f
    mov r7, r0, asr #0x1
    b .L_788
.L_498:
    ldrb r0, [sp, #0x24]
    cmp r0, #0x9
    ldrne r0, [sp, #0x464]
    addne r0, r0, #0x8
    strne r0, [sp, #0x464]
    bne .L_4bc
    ldr r0, [sp, #0x464]
    add r0, r0, #0x8
    str r0, [sp, #0x464]
.L_4bc:
    ldr r7, [r0, #-8]
    ldr r6, [r0, #-4]
    add r0, sp, #0x20
    sub r5, sp, #0x4
    ldmia r0, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    ldr r3, [r5]
    mov r0, r7
    mov r1, r6
    add r2, sp, #0x430
    bl func_020ad96c
    movs r6, r0
    beq .L_73c
    add r0, sp, #0x400
    add r0, r0, #0x2e
    sub r0, r0, r6
    add r0, r0, r0, lsr #0x1f
    mov r7, r0, asr #0x1
    b .L_788
.L_508:
    ldrb r0, [sp, #0x24]
    cmp r0, #0x5
    bne .L_5a4
    ldr r0, [sp, #0x464]
    add r0, r0, #0x4
    str r0, [sp, #0x464]
    ldr r6, [r0, #-4]
    ldrb r0, [sp, #0x23]
    cmp r6, #0x0
    ldreq r6, _LIT1
    cmp r0, #0x0
    beq .L_55c
    ldrh r1, [r6], #0x2
    ldrb r0, [sp, #0x22]
    and r7, r1, #0xff
    cmp r0, #0x0
    beq .L_788
    ldr r0, [sp, #0x2c]
    cmp r7, r0
    movgt r7, r0
    b .L_788
.L_55c:
    ldrb r0, [sp, #0x22]
    cmp r0, #0x0
    beq .L_594
    ldr r7, [sp, #0x2c]
    mov r0, r6
    mov r2, r7
    mov r1, #0x0
    bl FindU16InArray
    cmp r0, #0x0
    beq .L_788
    sub r0, r0, r6
    add r0, r0, r0, lsr #0x1f
    mov r7, r0, asr #0x1
    b .L_788
.L_594:
    mov r0, r6
    bl func_020aee3c
    mov r7, r0
    b .L_788
.L_5a4:
    ldr r0, [sp, #0x464]
    add r0, r0, #0x4
    str r0, [sp, #0x464]
    ldr r5, [r0, #-4]
    ldrb r0, [sp, #0x23]
    cmp r5, #0x0
    ldreq r5, _LIT2
    cmp r0, #0x0
    beq .L_5ec
    ldrh r1, [r6]
    ldrb r0, [sp, #0x22]
    and r6, r1, #0xff
    cmp r0, #0x0
    beq .L_624
    ldr r0, [sp, #0x2c]
    cmp r6, r0
    movgt r6, r0
    b .L_624
.L_5ec:
    ldrb r0, [sp, #0x22]
    cmp r0, #0x0
    beq .L_618
    ldr r6, [sp, #0x2c]
    mov r0, r5
    mov r2, r6
    mov r1, #0x0
    bl func_020a73e8
    cmp r0, #0x0
    subne r6, r0, r5
    b .L_624
.L_618:
    mov r0, r5
    bl func_020aaddc
    mov r6, r0
.L_624:
    add r0, sp, #0x30
    mov r1, r5
    mov r2, r6
    bl func_020a7268
    movs r7, r0
    bmi .L_73c
    add r6, sp, #0x30
    b .L_788
.L_644:
    ldr r1, [sp, #0x464]
    ldrb r0, [sp, #0x24]
    add r1, r1, #0x4
    str r1, [sp, #0x464]
    ldr r6, [r1, #-4]
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_8c4
    b .L_688
    b .L_8c4
    b .L_690
    b .L_698
    b .L_6c0
    b .L_8c4
    b .L_6a0
    b .L_6b0
    b .L_6b8
.L_688:
    str r4, [r6]
    b .L_8c4
.L_690:
    strh r4, [r6]
    b .L_8c4
.L_698:
    str r4, [r6]
    b .L_8c4
.L_6a0:
    str r4, [r6]
    mov r0, r4, asr #0x1f
    str r0, [r6, #0x4]
    b .L_8c4
.L_6b0:
    str r4, [r6]
    b .L_8c4
.L_6b8:
    str r4, [r6]
    b .L_8c4
.L_6c0:
    str r4, [r6]
    mov r0, r4, asr #0x1f
    str r0, [r6, #0x4]
    b .L_8c4
.L_6d0:
    ldrb r0, [sp, #0x24]
    add r6, sp, #0x30
    cmp r0, #0x5
    bne .L_6fc
    ldr r0, [sp, #0x464]
    mov r7, #0x1
    add r0, r0, #0x4
    str r0, [sp, #0x464]
    ldr r0, [r0, #-4]
    strh r0, [r6]
    b .L_788
.L_6fc:
    ldr r0, [sp, #0x464]
    add r1, sp, #0x18
    add r0, r0, #0x4
    str r0, [sp, #0x464]
    ldr r3, [r0, #-4]
    mov r0, r6
    mov r2, #0x1
    strb r3, [sp, #0x18]
    bl func_020a71e4
    mov r7, r0
    b .L_788
.L_728:
    mov r0, #0x25
    strh r0, [sp, #0x30]
    add r6, sp, #0x30
    mov r7, #0x1
    b .L_788
.L_73c:
    ldr r0, [sp, #0xc]
    bl func_020aee3c
    movs r5, r0
    beq .L_774
    ldr r1, [sp, #0xc]
    mov r0, r8
    mov r2, r5
    blx r9
    cmp r0, #0x0
    addeq sp, sp, #0x430
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
.L_774:
    add sp, sp, #0x430
    add r0, r4, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_788:
    ldrb r0, [sp, #0x20]
    mov r5, r7
    cmp r0, #0x0
    beq .L_838
    cmp r0, #0x2
    moveq r1, #0x30
    movne r1, #0x20
    strh r1, [sp, #0x1c]
    ldrh r0, [r6]
    cmp r0, #0x2b
    cmpne r0, #0x2d
    cmpne r0, #0x20
    bne .L_7f4
    cmp r1, #0x30
    bne .L_7f4
    mov r0, r8
    mov r1, r6
    mov r2, #0x1
    blx r9
    cmp r0, #0x0
    addeq sp, sp, #0x430
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
    add r6, r6, #0x2
    sub r7, r7, #0x1
.L_7f4:
    ldr r0, [sp, #0x28]
    cmp r5, r0
    bge .L_838
.L_800:
    mov r0, r8
    add r1, sp, #0x1c
    mov r2, #0x1
    blx r9
    cmp r0, #0x0
    addeq sp, sp, #0x430
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
    ldr r0, [sp, #0x28]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_800
.L_838:
    cmp r7, #0x0
    beq .L_868
    mov r0, r8
    mov r1, r6
    mov r2, r7
    blx r9
    cmp r0, #0x0
    addeq sp, sp, #0x430
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
.L_868:
    ldrb r0, [sp, #0x20]
    cmp r0, #0x0
    bne .L_8c0
    ldr r0, [sp, #0x28]
    cmp r5, r0
    bge .L_8c0
    mov r7, #0x20
.L_884:
    mov r0, r8
    add r1, sp, #0x1a
    mov r2, #0x1
    strh r7, [sp, #0x1a]
    blx r9
    cmp r0, #0x0
    addeq sp, sp, #0x430
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
    ldr r0, [sp, #0x28]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_884
.L_8c0:
    add r4, r4, r5
.L_8c4:
    ldrh r0, [fp]
    cmp r0, #0x0
    bne .L_30
.L_8d0:
    mov r0, r4
    add sp, sp, #0x430
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x0000ffff
_LIT1: .word data_02102b00
_LIT2: .word data_02102b00+0x4
