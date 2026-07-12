; func_ov002_022b87b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccb28
        .extern data_ov002_022ccb34
        .extern data_ov002_022ccb44
        .extern data_ov002_022ccf20
        .extern data_ov002_022ccf24
        .extern data_ov002_022ccf28
        .extern data_ov002_022ccf30
        .extern data_ov002_022ccf34
        .extern data_ov002_022ccf38
        .extern data_ov002_022ccf40
        .extern data_ov002_022ccf44
        .extern data_ov002_022ccf48
        .extern data_ov002_022ccf50
        .extern data_ov002_022ccf54
        .extern data_ov002_022ccf5c
        .extern func_020a9698
        .extern func_020aae1c
        .extern func_020b377c
        .extern func_ov002_022b9278
        .global func_ov002_022b87b4
        .arm
func_ov002_022b87b4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xc
    mov r9, r3
    ldr r4, [sp, #0x38]
    mov sl, r2
    ldr r3, [sp, #0x34]
    mov r2, #0x1
    mov r6, r0
    mov r5, r1
    str r4, [sp]
    mvn r8, #0x0
    bl func_ov002_022b9278
    mov r7, r0
    cmp sl, #0x0
    bne .L_4c
    ldrh r0, [r7, #0x6]
    tst r0, #0x1
    movne r4, #0x1
    bne .L_50
.L_4c:
    mov r4, #0x0
.L_50:
    cmp sl, #0x0
    cmpeq r4, #0x0
    beq .L_754
    cmp r9, #0x0
    beq .L_3dc
    ldrh sl, [r7, #0x6]
    tst sl, #0x4
    beq .L_a8
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_a0c
    ldr r1, _LIT1
    add r0, sp, #0x4
    bl func_020a9698
    mov r8, #0x100
    b .L_a0c
.L_a8:
    tst sl, #0x10
    beq .L_108
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_a0c
    ldr r1, _LIT2
    add r0, sp, #0x4
    bl func_020a9698
    ldr r1, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x4
    mov r1, r3, lsr #0x1f
    rsb r0, r1, r3, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    add r8, r0, #0x100
    b .L_a0c
.L_108:
    ldrb r9, [r7, #0x2]
    cmp r9, #0x3
    bne .L_354
    ldr r1, _LIT3
    mvn r9, #0x0
    cmp r5, r1
    bgt .L_14c
    bge .L_1e0
    sub r0, r1, #0x370
    cmp r5, r0
    bgt .L_13c
    beq .L_188
    b .L_2c4
.L_13c:
    ldr r0, _LIT4
    cmp r5, r0
    beq .L_280
    b .L_2c4
.L_14c:
    add r0, r1, #0x180
    cmp r5, r0
    bgt .L_160
    beq .L_230
    b .L_2c4
.L_160:
    add r0, r1, #0x2d8
    cmp r5, r0
    bgt .L_2c4
    ldr r0, _LIT5
    cmp r5, r0
    blt .L_2c4
    addne r0, r0, #0x3
    cmpne r5, r0
    beq .L_230
    b .L_2c4
.L_188:
    ldr r3, [r6, #0x10]
    ldr r1, _LIT6
    mov r0, r3, lsr #0x1f
    smull r2, r5, r1, r3
    add r5, r3, r5
    add r5, r0, r5, asr #0x4
    mov r6, #0x1e
    smull r2, r5, r6, r5
    subs r5, r3, r2
    bne .L_304
    smull r5, r2, r1, r3
    add r2, r3, r2
    ldr r1, _LIT7
    add r2, r0, r2, asr #0x4
    smull r0, r5, r1, r2
    add r5, r5, r2, lsr #0x1f
    mov r3, #0x3
    smull r0, r1, r3, r5
    ldr r1, _LIT8
    sub r5, r2, r0
    ldr r9, [r1, r5, lsl #0x2]
    b .L_304
.L_1e0:
    ldr r2, [r6, #0x10]
    ldr r1, _LIT0
    mov r0, r2, lsr #0x1f
    smull r3, r5, r1, r2
    add r5, r0, r5, asr #0x2
    mov r6, #0xa
    smull r3, r5, r6, r5
    subs r5, r2, r3
    bne .L_304
    ldr r5, _LIT7
    smull r3, r2, r1, r2
    add r2, r0, r2, asr #0x2
    smull r0, r6, r5, r2
    add r6, r6, r2, lsr #0x1f
    mov r3, #0x3
    smull r0, r1, r3, r6
    ldr r1, _LIT8
    sub r6, r2, r0
    ldr r9, [r1, r6, lsl #0x2]
    b .L_304
.L_230:
    ldr r2, [r6, #0x10]
    ldr r1, _LIT0
    mov r0, r2, lsr #0x1f
    smull r3, r5, r1, r2
    add r5, r0, r5, asr #0x3
    mov r6, #0x14
    smull r3, r5, r6, r5
    subs r5, r2, r3
    bne .L_304
    ldr r5, _LIT7
    smull r3, r2, r1, r2
    add r2, r0, r2, asr #0x3
    smull r0, r6, r5, r2
    add r6, r6, r2, lsr #0x1f
    mov r3, #0x3
    smull r0, r1, r3, r6
    ldr r1, _LIT8
    sub r6, r2, r0
    ldr r9, [r1, r6, lsl #0x2]
    b .L_304
.L_280:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_304
    smull r0, r2, r5, r6
    add r2, r3, r2, asr #0x3
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1e
    ldr r2, _LIT9
    add r0, r1, r0, ror #0x1e
    ldr r9, [r2, r0, lsl #0x2]
    b .L_304
.L_2c4:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_304
    smull r0, r2, r5, r6
    add r2, r3, r2, asr #0x3
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1e
    ldr r2, _LIT10
    add r0, r1, r0, ror #0x1e
    ldr r9, [r2, r0, lsl #0x2]
.L_304:
    cmp r9, #0x0
    blt .L_a0c
    cmp r4, #0x0
    beq .L_31c
    tst sl, #0x2
    movne r9, #0x0
.L_31c:
    ldr r1, _LIT11
    add r0, sp, #0x4
    add r2, r9, #0x1
    bl func_020a9698
    cmp r9, #0x0
    bne .L_34c
    ldrh r0, [r7, #0x6]
    tst r0, #0x2
    beq .L_34c
    ldr r1, _LIT12
    add r0, sp, #0x4
    bl func_020aae1c
.L_34c:
    mov r8, #0x0
    b .L_a0c
.L_354:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_a0c
    smull r1, r0, r5, r6
    mov r1, r9
    add r0, r3, r0, asr #0x4
    bl func_020b377c
    mov r5, r1
    cmp r4, #0x0
    beq .L_39c
    tst sl, #0x2
    movne r5, #0x0
.L_39c:
    cmp r9, #0x1
    moveq r2, r5
    ldr r1, _LIT11
    addne r2, r5, #0x1
    add r0, sp, #0x4
    bl func_020a9698
    cmp r5, #0x0
    bne .L_3d4
    ldrh r0, [r7, #0x6]
    tst r0, #0x2
    beq .L_3d4
    ldr r1, _LIT12
    add r0, sp, #0x4
    bl func_020aae1c
.L_3d4:
    mov r8, #0x0
    b .L_a0c
.L_3dc:
    ldrh r9, [r7, #0x6]
    tst r9, #0x4
    beq .L_420
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_a0c
    ldr r1, _LIT1
    add r0, sp, #0x4
    bl func_020a9698
    ldr r8, _LIT13
    b .L_a0c
.L_420:
    tst r9, #0x20
    beq .L_480
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_a0c
    ldr r1, _LIT14
    add r0, sp, #0x4
    bl func_020a9698
    ldr r1, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x4
    mov r1, r3, lsr #0x1f
    rsb r0, r1, r3, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    add r8, r0, #0x100
    b .L_a0c
.L_480:
    ldrb sl, [r7, #0x3]
    cmp sl, #0x3
    bne .L_6cc
    ldr r1, _LIT3
    mvn sl, #0x0
    cmp r5, r1
    bgt .L_4c4
    bge .L_558
    sub r0, r1, #0x370
    cmp r5, r0
    bgt .L_4b4
    beq .L_500
    b .L_63c
.L_4b4:
    ldr r0, _LIT4
    cmp r5, r0
    beq .L_5f8
    b .L_63c
.L_4c4:
    add r0, r1, #0x180
    cmp r5, r0
    bgt .L_4d8
    beq .L_5a8
    b .L_63c
.L_4d8:
    add r0, r1, #0x2d8
    cmp r5, r0
    bgt .L_63c
    ldr r0, _LIT5
    cmp r5, r0
    blt .L_63c
    addne r0, r0, #0x3
    cmpne r5, r0
    beq .L_5a8
    b .L_63c
.L_500:
    ldr r3, [r6, #0x10]
    ldr r1, _LIT6
    mov r0, r3, lsr #0x1f
    smull r2, r5, r1, r3
    add r5, r3, r5
    add r5, r0, r5, asr #0x4
    mov r6, #0x1e
    smull r2, r5, r6, r5
    subs r5, r3, r2
    bne .L_67c
    smull r5, r2, r1, r3
    add r2, r3, r2
    ldr r1, _LIT7
    add r2, r0, r2, asr #0x4
    smull r0, r5, r1, r2
    add r5, r5, r2, lsr #0x1f
    mov r3, #0x3
    smull r0, r1, r3, r5
    ldr r1, _LIT8
    sub r5, r2, r0
    ldr sl, [r1, r5, lsl #0x2]
    b .L_67c
.L_558:
    ldr r2, [r6, #0x10]
    ldr r1, _LIT0
    mov r0, r2, lsr #0x1f
    smull r3, r5, r1, r2
    add r5, r0, r5, asr #0x2
    mov r6, #0xa
    smull r3, r5, r6, r5
    subs r5, r2, r3
    bne .L_67c
    ldr r5, _LIT7
    smull r3, r2, r1, r2
    add r2, r0, r2, asr #0x2
    smull r0, r6, r5, r2
    add r6, r6, r2, lsr #0x1f
    mov r3, #0x3
    smull r0, r1, r3, r6
    ldr r1, _LIT8
    sub r6, r2, r0
    ldr sl, [r1, r6, lsl #0x2]
    b .L_67c
.L_5a8:
    ldr r2, [r6, #0x10]
    ldr r1, _LIT0
    mov r0, r2, lsr #0x1f
    smull r3, r5, r1, r2
    add r5, r0, r5, asr #0x3
    mov r6, #0x14
    smull r3, r5, r6, r5
    subs r5, r2, r3
    bne .L_67c
    ldr r5, _LIT7
    smull r3, r2, r1, r2
    add r2, r0, r2, asr #0x3
    smull r0, r6, r5, r2
    add r6, r6, r2, lsr #0x1f
    mov r3, #0x3
    smull r0, r1, r3, r6
    ldr r1, _LIT8
    sub r6, r2, r0
    ldr sl, [r1, r6, lsl #0x2]
    b .L_67c
.L_5f8:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_67c
    smull r0, r2, r5, r6
    add r2, r3, r2, asr #0x3
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1e
    ldr r2, _LIT9
    add r0, r1, r0, ror #0x1e
    ldr sl, [r2, r0, lsl #0x2]
    b .L_67c
.L_63c:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_67c
    smull r0, r2, r5, r6
    add r2, r3, r2, asr #0x3
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1e
    ldr r2, _LIT10
    add r0, r1, r0, ror #0x1e
    ldr sl, [r2, r0, lsl #0x2]
.L_67c:
    cmp sl, #0x0
    blt .L_a0c
    cmp r4, #0x0
    beq .L_694
    tst r9, #0x2
    movne sl, #0x0
.L_694:
    ldr r1, _LIT15
    add r0, sp, #0x4
    add r2, sl, #0x1
    bl func_020a9698
    cmp sl, #0x0
    bne .L_6c4
    ldrh r0, [r7, #0x6]
    tst r0, #0x2
    beq .L_6c4
    ldr r1, _LIT12
    add r0, sp, #0x4
    bl func_020aae1c
.L_6c4:
    mov r8, #0x0
    b .L_a0c
.L_6cc:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_a0c
    smull r1, r0, r5, r6
    mov r1, sl
    add r0, r3, r0, asr #0x4
    bl func_020b377c
    mov r5, r1
    cmp r4, #0x0
    beq .L_714
    tst r9, #0x2
    movne r5, #0x0
.L_714:
    cmp sl, #0x1
    moveq r2, r5
    ldr r1, _LIT15
    addne r2, r5, #0x1
    add r0, sp, #0x4
    bl func_020a9698
    cmp r5, #0x0
    bne .L_74c
    ldrh r0, [r7, #0x6]
    tst r0, #0x2
    beq .L_74c
    ldr r1, _LIT12
    add r0, sp, #0x4
    bl func_020aae1c
.L_74c:
    mov r8, #0x0
    b .L_a0c
.L_754:
    cmp r9, #0x0
    ldrh r0, [r7, #0x6]
    beq .L_8b8
    tst r0, #0x8
    beq .L_7a0
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_a0c
    ldr r1, _LIT16
    add r0, sp, #0x4
    bl func_020a9698
    mov r8, #0x100
    b .L_a0c
.L_7a0:
    tst r0, #0x40
    beq .L_800
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_a0c
    ldr r1, _LIT17
    add r0, sp, #0x4
    bl func_020a9698
    ldr r1, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x4
    mov r1, r3, lsr #0x1f
    rsb r0, r1, r3, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    add r8, r0, #0x100
    b .L_a0c
.L_800:
    ldrb r4, [r7, #0x4]
    cmp r4, #0x3
    bne .L_864
    ldr r5, [r6, #0x10]
    ldr r4, _LIT0
    mov r3, r5, lsr #0x1f
    smull r0, r1, r4, r5
    add r1, r3, r1, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, r1
    subs r1, r5, r0
    bne .L_a0c
    smull r0, r2, r4, r5
    add r2, r3, r2, asr #0x3
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    ldr r2, _LIT10
    ldr r1, _LIT18
    ldr r2, [r2, r0, lsl #0x2]
    add r0, sp, #0x4
    add r2, r2, #0x1
    bl func_020a9698
    mov r8, #0x0
    b .L_a0c
.L_864:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_a0c
    smull r1, r0, r5, r6
    mov r1, r4
    add r0, r3, r0, asr #0x4
    bl func_020b377c
    mov r2, r1
    cmp r4, #0x1
    ldr r1, _LIT18
    addne r2, r2, #0x1
    add r0, sp, #0x4
    bl func_020a9698
    mov r8, #0x0
    b .L_a0c
.L_8b8:
    tst r0, #0x8
    beq .L_8f8
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_a0c
    ldr r1, _LIT16
    add r0, sp, #0x4
    bl func_020a9698
    ldr r8, _LIT13
    b .L_a0c
.L_8f8:
    tst r0, #0x80
    beq .L_958
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_a0c
    ldr r1, _LIT19
    add r0, sp, #0x4
    bl func_020a9698
    ldr r1, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x4
    mov r1, r3, lsr #0x1f
    rsb r0, r1, r3, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    add r8, r0, #0x100
    b .L_a0c
.L_958:
    ldrb r4, [r7, #0x5]
    cmp r4, #0x3
    bne .L_9bc
    ldr r5, [r6, #0x10]
    ldr r4, _LIT0
    mov r3, r5, lsr #0x1f
    smull r0, r1, r4, r5
    add r1, r3, r1, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, r1
    subs r1, r5, r0
    bne .L_a0c
    smull r0, r2, r4, r5
    add r2, r3, r2, asr #0x3
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    ldr r2, _LIT10
    ldr r1, _LIT20
    ldr r2, [r2, r0, lsl #0x2]
    add r0, sp, #0x4
    add r2, r2, #0x1
    bl func_020a9698
    mov r8, #0x0
    b .L_a0c
.L_9bc:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_a0c
    smull r1, r0, r5, r6
    mov r1, r4
    add r0, r3, r0, asr #0x4
    bl func_020b377c
    mov r2, r1
    cmp r4, #0x1
    ldr r1, _LIT20
    addne r2, r2, #0x1
    add r0, sp, #0x4
    bl func_020a9698
    mov r8, #0x0
.L_a0c:
    cmp r8, #0x0
    blt .L_a28
    ldrsh r2, [r7]
    ldr r0, [sp, #0x30]
    ldr r1, _LIT21
    add r3, sp, #0x4
    bl func_020a9698
.L_a28:
    mov r0, r8
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x66666667
_LIT1: .word data_ov002_022ccf20
_LIT2: .word data_ov002_022ccf24
_LIT3: .word 0x0000161c
_LIT4: .word 0x000013e7
_LIT5: .word 0x000018f1
_LIT6: .word 0x88888889
_LIT7: .word 0x55555556
_LIT8: .word data_ov002_022ccb28
_LIT9: .word data_ov002_022ccb34
_LIT10: .word data_ov002_022ccb44
_LIT11: .word data_ov002_022ccf28
_LIT12: .word data_ov002_022ccf30
_LIT13: .word 0x00000101
_LIT14: .word data_ov002_022ccf34
_LIT15: .word data_ov002_022ccf38
_LIT16: .word data_ov002_022ccf40
_LIT17: .word data_ov002_022ccf44
_LIT18: .word data_ov002_022ccf48
_LIT19: .word data_ov002_022ccf50
_LIT20: .word data_ov002_022ccf54
_LIT21: .word data_ov002_022ccf5c
