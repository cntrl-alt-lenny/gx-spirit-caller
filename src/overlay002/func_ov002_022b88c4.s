; func_ov002_022b88c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccc1c
        .extern data_ov002_022ccc28
        .extern data_ov002_022ccc38
        .extern data_ov002_022cd014
        .extern data_ov002_022cd018
        .extern data_ov002_022cd01c
        .extern data_ov002_022cd024
        .extern data_ov002_022cd028
        .extern data_ov002_022cd02c
        .extern data_ov002_022cd034
        .extern data_ov002_022cd038
        .extern data_ov002_022cd03c
        .extern data_ov002_022cd044
        .extern data_ov002_022cd048
        .extern data_ov002_022cd050
        .extern func_020a978c
        .extern func_020aaf10
        .extern func_020b3870
        .extern func_ov002_022b9388
        .global func_ov002_022b88c4
        .arm
func_ov002_022b88c4:
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
    bl func_ov002_022b9388
    mov r7, r0
    cmp sl, #0x0
    bne .L_294
    ldrh r0, [r7, #0x6]
    tst r0, #0x1
    movne r4, #0x1
    bne .L_298
.L_294:
    mov r4, #0x0
.L_298:
    cmp sl, #0x0
    cmpeq r4, #0x0
    beq .L_99c
    cmp r9, #0x0
    beq .L_624
    ldrh sl, [r7, #0x6]
    tst sl, #0x4
    beq .L_2f0
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_c54
    ldr r1, _LIT1
    add r0, sp, #0x4
    bl func_020a978c
    mov r8, #0x100
    b .L_c54
.L_2f0:
    tst sl, #0x10
    beq .L_350
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_c54
    ldr r1, _LIT2
    add r0, sp, #0x4
    bl func_020a978c
    ldr r1, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x4
    mov r1, r3, lsr #0x1f
    rsb r0, r1, r3, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    add r8, r0, #0x100
    b .L_c54
.L_350:
    ldrb r9, [r7, #0x2]
    cmp r9, #0x3
    bne .L_59c
    ldr r1, _LIT3
    mvn r9, #0x0
    cmp r5, r1
    bgt .L_394
    bge .L_428
    sub r0, r1, #0x370
    cmp r5, r0
    bgt .L_384
    beq .L_3d0
    b .L_50c
.L_384:
    ldr r0, _LIT4
    cmp r5, r0
    beq .L_4c8
    b .L_50c
.L_394:
    add r0, r1, #0x180
    cmp r5, r0
    bgt .L_3a8
    beq .L_478
    b .L_50c
.L_3a8:
    add r0, r1, #0x2d8
    cmp r5, r0
    bgt .L_50c
    ldr r0, _LIT5
    cmp r5, r0
    blt .L_50c
    addne r0, r0, #0x3
    cmpne r5, r0
    beq .L_478
    b .L_50c
.L_3d0:
    ldr r3, [r6, #0x10]
    ldr r1, _LIT6
    mov r0, r3, lsr #0x1f
    smull r2, r5, r1, r3
    add r5, r3, r5
    add r5, r0, r5, asr #0x4
    mov r6, #0x1e
    smull r2, r5, r6, r5
    subs r5, r3, r2
    bne .L_54c
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
    b .L_54c
.L_428:
    ldr r2, [r6, #0x10]
    ldr r1, _LIT0
    mov r0, r2, lsr #0x1f
    smull r3, r5, r1, r2
    add r5, r0, r5, asr #0x2
    mov r6, #0xa
    smull r3, r5, r6, r5
    subs r5, r2, r3
    bne .L_54c
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
    b .L_54c
.L_478:
    ldr r2, [r6, #0x10]
    ldr r1, _LIT0
    mov r0, r2, lsr #0x1f
    smull r3, r5, r1, r2
    add r5, r0, r5, asr #0x3
    mov r6, #0x14
    smull r3, r5, r6, r5
    subs r5, r2, r3
    bne .L_54c
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
    b .L_54c
.L_4c8:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_54c
    smull r0, r2, r5, r6
    add r2, r3, r2, asr #0x3
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1e
    ldr r2, _LIT9
    add r0, r1, r0, ror #0x1e
    ldr r9, [r2, r0, lsl #0x2]
    b .L_54c
.L_50c:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_54c
    smull r0, r2, r5, r6
    add r2, r3, r2, asr #0x3
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1e
    ldr r2, _LIT10
    add r0, r1, r0, ror #0x1e
    ldr r9, [r2, r0, lsl #0x2]
.L_54c:
    cmp r9, #0x0
    blt .L_c54
    cmp r4, #0x0
    beq .L_564
    tst sl, #0x2
    movne r9, #0x0
.L_564:
    ldr r1, _LIT11
    add r0, sp, #0x4
    add r2, r9, #0x1
    bl func_020a978c
    cmp r9, #0x0
    bne .L_594
    ldrh r0, [r7, #0x6]
    tst r0, #0x2
    beq .L_594
    ldr r1, _LIT12
    add r0, sp, #0x4
    bl func_020aaf10
.L_594:
    mov r8, #0x0
    b .L_c54
.L_59c:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_c54
    smull r1, r0, r5, r6
    mov r1, r9
    add r0, r3, r0, asr #0x4
    bl func_020b3870
    mov r5, r1
    cmp r4, #0x0
    beq .L_5e4
    tst sl, #0x2
    movne r5, #0x0
.L_5e4:
    cmp r9, #0x1
    moveq r2, r5
    ldr r1, _LIT11
    addne r2, r5, #0x1
    add r0, sp, #0x4
    bl func_020a978c
    cmp r5, #0x0
    bne .L_61c
    ldrh r0, [r7, #0x6]
    tst r0, #0x2
    beq .L_61c
    ldr r1, _LIT12
    add r0, sp, #0x4
    bl func_020aaf10
.L_61c:
    mov r8, #0x0
    b .L_c54
.L_624:
    ldrh r9, [r7, #0x6]
    tst r9, #0x4
    beq .L_668
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_c54
    ldr r1, _LIT1
    add r0, sp, #0x4
    bl func_020a978c
    ldr r8, _LIT13
    b .L_c54
.L_668:
    tst r9, #0x20
    beq .L_6c8
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_c54
    ldr r1, _LIT14
    add r0, sp, #0x4
    bl func_020a978c
    ldr r1, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x4
    mov r1, r3, lsr #0x1f
    rsb r0, r1, r3, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    add r8, r0, #0x100
    b .L_c54
.L_6c8:
    ldrb sl, [r7, #0x3]
    cmp sl, #0x3
    bne .L_914
    ldr r1, _LIT3
    mvn sl, #0x0
    cmp r5, r1
    bgt .L_70c
    bge .L_7a0
    sub r0, r1, #0x370
    cmp r5, r0
    bgt .L_6fc
    beq .L_748
    b .L_884
.L_6fc:
    ldr r0, _LIT4
    cmp r5, r0
    beq .L_840
    b .L_884
.L_70c:
    add r0, r1, #0x180
    cmp r5, r0
    bgt .L_720
    beq .L_7f0
    b .L_884
.L_720:
    add r0, r1, #0x2d8
    cmp r5, r0
    bgt .L_884
    ldr r0, _LIT5
    cmp r5, r0
    blt .L_884
    addne r0, r0, #0x3
    cmpne r5, r0
    beq .L_7f0
    b .L_884
.L_748:
    ldr r3, [r6, #0x10]
    ldr r1, _LIT6
    mov r0, r3, lsr #0x1f
    smull r2, r5, r1, r3
    add r5, r3, r5
    add r5, r0, r5, asr #0x4
    mov r6, #0x1e
    smull r2, r5, r6, r5
    subs r5, r3, r2
    bne .L_8c4
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
    b .L_8c4
.L_7a0:
    ldr r2, [r6, #0x10]
    ldr r1, _LIT0
    mov r0, r2, lsr #0x1f
    smull r3, r5, r1, r2
    add r5, r0, r5, asr #0x2
    mov r6, #0xa
    smull r3, r5, r6, r5
    subs r5, r2, r3
    bne .L_8c4
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
    b .L_8c4
.L_7f0:
    ldr r2, [r6, #0x10]
    ldr r1, _LIT0
    mov r0, r2, lsr #0x1f
    smull r3, r5, r1, r2
    add r5, r0, r5, asr #0x3
    mov r6, #0x14
    smull r3, r5, r6, r5
    subs r5, r2, r3
    bne .L_8c4
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
    b .L_8c4
.L_840:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_8c4
    smull r0, r2, r5, r6
    add r2, r3, r2, asr #0x3
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1e
    ldr r2, _LIT9
    add r0, r1, r0, ror #0x1e
    ldr sl, [r2, r0, lsl #0x2]
    b .L_8c4
.L_884:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_8c4
    smull r0, r2, r5, r6
    add r2, r3, r2, asr #0x3
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1e
    ldr r2, _LIT10
    add r0, r1, r0, ror #0x1e
    ldr sl, [r2, r0, lsl #0x2]
.L_8c4:
    cmp sl, #0x0
    blt .L_c54
    cmp r4, #0x0
    beq .L_8dc
    tst r9, #0x2
    movne sl, #0x0
.L_8dc:
    ldr r1, _LIT15
    add r0, sp, #0x4
    add r2, sl, #0x1
    bl func_020a978c
    cmp sl, #0x0
    bne .L_90c
    ldrh r0, [r7, #0x6]
    tst r0, #0x2
    beq .L_90c
    ldr r1, _LIT12
    add r0, sp, #0x4
    bl func_020aaf10
.L_90c:
    mov r8, #0x0
    b .L_c54
.L_914:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_c54
    smull r1, r0, r5, r6
    mov r1, sl
    add r0, r3, r0, asr #0x4
    bl func_020b3870
    mov r5, r1
    cmp r4, #0x0
    beq .L_95c
    tst r9, #0x2
    movne r5, #0x0
.L_95c:
    cmp sl, #0x1
    moveq r2, r5
    ldr r1, _LIT15
    addne r2, r5, #0x1
    add r0, sp, #0x4
    bl func_020a978c
    cmp r5, #0x0
    bne .L_994
    ldrh r0, [r7, #0x6]
    tst r0, #0x2
    beq .L_994
    ldr r1, _LIT12
    add r0, sp, #0x4
    bl func_020aaf10
.L_994:
    mov r8, #0x0
    b .L_c54
.L_99c:
    cmp r9, #0x0
    ldrh r0, [r7, #0x6]
    beq .L_b00
    tst r0, #0x8
    beq .L_9e8
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_c54
    ldr r1, _LIT16
    add r0, sp, #0x4
    bl func_020a978c
    mov r8, #0x100
    b .L_c54
.L_9e8:
    tst r0, #0x40
    beq .L_a48
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_c54
    ldr r1, _LIT17
    add r0, sp, #0x4
    bl func_020a978c
    ldr r1, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x4
    mov r1, r3, lsr #0x1f
    rsb r0, r1, r3, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    add r8, r0, #0x100
    b .L_c54
.L_a48:
    ldrb r4, [r7, #0x4]
    cmp r4, #0x3
    bne .L_aac
    ldr r5, [r6, #0x10]
    ldr r4, _LIT0
    mov r3, r5, lsr #0x1f
    smull r0, r1, r4, r5
    add r1, r3, r1, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, r1
    subs r1, r5, r0
    bne .L_c54
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
    bl func_020a978c
    mov r8, #0x0
    b .L_c54
.L_aac:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_c54
    smull r1, r0, r5, r6
    mov r1, r4
    add r0, r3, r0, asr #0x4
    bl func_020b3870
    mov r2, r1
    cmp r4, #0x1
    ldr r1, _LIT18
    addne r2, r2, #0x1
    add r0, sp, #0x4
    bl func_020a978c
    mov r8, #0x0
    b .L_c54
.L_b00:
    tst r0, #0x8
    beq .L_b40
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_c54
    ldr r1, _LIT16
    add r0, sp, #0x4
    bl func_020a978c
    ldr r8, _LIT13
    b .L_c54
.L_b40:
    tst r0, #0x80
    beq .L_ba0
    ldr r3, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r4
    subs r4, r3, r0
    bne .L_c54
    ldr r1, _LIT19
    add r0, sp, #0x4
    bl func_020a978c
    ldr r1, [r6, #0x10]
    ldr r2, _LIT0
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x4
    mov r1, r3, lsr #0x1f
    rsb r0, r1, r3, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    add r8, r0, #0x100
    b .L_c54
.L_ba0:
    ldrb r4, [r7, #0x5]
    cmp r4, #0x3
    bne .L_c04
    ldr r5, [r6, #0x10]
    ldr r4, _LIT0
    mov r3, r5, lsr #0x1f
    smull r0, r1, r4, r5
    add r1, r3, r1, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, r1
    subs r1, r5, r0
    bne .L_c54
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
    bl func_020a978c
    mov r8, #0x0
    b .L_c54
.L_c04:
    ldr r6, [r6, #0x10]
    ldr r5, _LIT0
    mov r3, r6, lsr #0x1f
    smull r0, r1, r5, r6
    add r1, r3, r1, asr #0x4
    mov r2, #0x28
    smull r0, r1, r2, r1
    subs r1, r6, r0
    bne .L_c54
    smull r1, r0, r5, r6
    mov r1, r4
    add r0, r3, r0, asr #0x4
    bl func_020b3870
    mov r2, r1
    cmp r4, #0x1
    ldr r1, _LIT20
    addne r2, r2, #0x1
    add r0, sp, #0x4
    bl func_020a978c
    mov r8, #0x0
.L_c54:
    cmp r8, #0x0
    blt .L_c70
    ldrsh r2, [r7]
    ldr r0, [sp, #0x30]
    ldr r1, _LIT21
    add r3, sp, #0x4
    bl func_020a978c
.L_c70:
    mov r0, r8
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x66666667
_LIT1: .word data_ov002_022cd014
_LIT2: .word data_ov002_022cd018
_LIT3: .word 0x0000161c
_LIT4: .word 0x000013e7
_LIT5: .word 0x000018f1
_LIT6: .word 0x88888889
_LIT7: .word 0x55555556
_LIT8: .word data_ov002_022ccc1c
_LIT9: .word data_ov002_022ccc28
_LIT10: .word data_ov002_022ccc38
_LIT11: .word data_ov002_022cd01c
_LIT12: .word data_ov002_022cd024
_LIT13: .word 0x00000101
_LIT14: .word data_ov002_022cd028
_LIT15: .word data_ov002_022cd02c
_LIT16: .word data_ov002_022cd034
_LIT17: .word data_ov002_022cd038
_LIT18: .word data_ov002_022cd03c
_LIT19: .word data_ov002_022cd044
_LIT20: .word data_ov002_022cd048
_LIT21: .word data_ov002_022cd050
