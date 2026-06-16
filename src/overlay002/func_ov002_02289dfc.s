; func_ov002_02289dfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf1a2
        .extern func_0202b8f0
        .extern func_0202ed90
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bbc58
        .extern func_ov002_021bc22c
        .extern func_ov002_021be384
        .extern func_ov002_021c325c
        .extern func_ov002_021c8470
        .extern func_ov002_021c84a8
        .extern func_ov002_021c84c4
        .extern func_ov002_022575c8
        .extern func_ov002_0227d27c
        .extern func_ov002_02291248
        .global func_ov002_02289dfc
        .arm
func_ov002_02289dfc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov sl, r0
    ldrh r0, [sl, #0x2]
    mov r2, r0, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x14
    bne .L_8a4
    ldr r2, _LIT0
    mov r0, r0, lsl #0x1f
    mov r7, r0, lsr #0x1f
    ldr r0, [r2]
    ldr fp, [r2, #0x20]
    str r0, [sp, #0x10]
    ldr r0, [r2, #0x1c]
    mov r9, #0x0
    str r0, [sp, #0xc]
    ldr r0, [r2, #0x4]
    cmp fp, #0x5
    str r0, [sp, #0x8]
    movge r0, #0x1
    strge r0, [sp]
    movlt r0, #0x0
    strlt r0, [sp]
    ldrh r2, [sl]
    ldr r0, _LIT1
    mov r8, r9
    cmp r2, r0
    bgt .L_15c
    bge .L_260
    ldr r0, _LIT2
    cmp r2, r0
    bgt .L_f4
    bge .L_244
    sub r1, r0, #0x39
    cmp r2, r1
    bgt .L_c8
    bge .L_23c
    sub r1, r0, #0x5a
    cmp r2, r1
    bgt .L_5dc
    sub r1, r0, #0x5b
    cmp r2, r1
    blt .L_5dc
    beq .L_230
    sub r0, r0, #0x5a
    cmp r2, r0
    subeq r9, r9, #0x190
    moveq r8, r9
    b .L_5dc
.L_c8:
    sub r1, r0, #0x38
    cmp r2, r1
    bgt .L_e4
    sub r0, r0, #0x38
    cmp r2, r0
    moveq r8, #0x1f4
    b .L_5dc
.L_e4:
    sub r0, r0, #0x1
    cmp r2, r0
    moveq r9, #0x2bc
    b .L_5dc
.L_f4:
    add r1, r0, #0xdf
    cmp r2, r1
    bgt .L_130
    bge .L_388
    add r1, r0, #0x6
    cmp r2, r1
    bgt .L_120
    add r0, r0, #0x6
    cmp r2, r0
    subeq r8, r9, #0x1f4
    b .L_5dc
.L_120:
    add r0, r0, #0xc4
    cmp r2, r0
    subeq r9, r9, #0x2bc
    b .L_5dc
.L_130:
    add r1, r0, #0x168
    cmp r2, r1
    bgt .L_14c
    add r0, r0, #0x168
    cmp r2, r0
    beq .L_24c
    b .L_5dc
.L_14c:
    add r0, r0, #0x194
    cmp r2, r0
    beq .L_29c
    b .L_5dc
.L_15c:
    add r3, r0, #0x278
    cmp r2, r3
    bgt .L_1d8
    bge .L_380
    add r3, r0, #0xbb
    cmp r2, r3
    bgt .L_1ac
    bge .L_318
    add r1, r0, #0x29
    cmp r2, r1
    bgt .L_198
    add r0, r0, #0x29
    cmp r2, r0
    moveq r9, #0x1f4
    b .L_5dc
.L_198:
    add r0, r0, #0x52
    cmp r2, r0
    moveq r9, #0xc8
    moveq r8, #0x1f4
    b .L_5dc
.L_1ac:
    add r1, r0, #0x190
    cmp r2, r1
    bgt .L_1c8
    add r0, r0, #0x190
    cmp r2, r0
    beq .L_50c
    b .L_5dc
.L_1c8:
    add r0, r0, #0x1f8
    cmp r2, r0
    beq .L_358
    b .L_5dc
.L_1d8:
    ldr r1, _LIT3
    cmp r2, r1
    bgt .L_20c
    bge .L_350
    sub r0, r1, #0xda
    cmp r2, r0
    bgt .L_1fc
    beq .L_554
    b .L_5dc
.L_1fc:
    sub r0, r1, #0xab
    cmp r2, r0
    beq .L_338
    b .L_5dc
.L_20c:
    ldr r0, _LIT4
    cmp r2, r0
    bgt .L_220
    beq .L_598
    b .L_5dc
.L_220:
    add r0, r0, #0x9
    cmp r2, r0
    moveq r9, #0x1f4
    b .L_5dc
.L_230:
    mov r9, #0x190
    mov r8, r9
    b .L_5dc
.L_23c:
    mov r9, #0x1f4
    b .L_5dc
.L_244:
    mov r8, #0x2bc
    b .L_5dc
.L_24c:
    mov r0, r7
    bl func_ov002_021c325c
    mov r1, #0x64
    mul r9, r0, r1
    b .L_5dc
.L_260:
    ldr r0, [sp, #0x8]
    ldr r1, _LIT5
    ldr r2, _LIT6
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    mov r0, #0x14
    mla r0, fp, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    rsb r0, r0, #0x0
    add r0, r0, r0, lsr #0x1f
    mov r9, r0, asr #0x1
    b .L_5dc
.L_29c:
    ldr r0, [sp, #0x8]
    ldr r1, _LIT5
    and r2, r0, #0x1
    mov r0, #0x14
    mul r5, r2, r1
    and r3, r7, #0x1
    mul r4, fp, r0
    ldr r2, _LIT6
    mul r1, r3, r1
    add r0, r2, r5
    add r0, r0, r4
    ldr r0, [r0, #0x30]
    ldr r1, [r2, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    rsb r9, r1, #0x0
    bl func_ov002_0227d27c
    cmp r0, #0x0
    addne sp, sp, #0x14
    movne r0, r8
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    beq .L_5dc
    mov r0, #0x320
    rsb r0, r0, #0x0
    cmp r9, r0
    movle r9, r0
    b .L_5dc
.L_318:
    mov r0, sl
    bl func_ov002_02291248
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, r9
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r9, #0x1f4
    b .L_5dc
.L_338:
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021bbc58
    mov r1, #0xc8
    mul r9, r0, r1
    b .L_5dc
.L_350:
    ldr r9, _LIT8
    b .L_5dc
.L_358:
    rsb r1, r7, #0x1
    ldr r0, _LIT5
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, _LIT9
    mov r0, #0xc8
    ldr r1, [r1, r2]
    mul r8, r1, r0
    mov r9, r8
    b .L_5dc
.L_380:
    sub r8, r9, #0xfa0
    b .L_5dc
.L_388:
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x8]
    cmp r1, r0
    beq .L_5dc
    mov r0, r1
    cmp r0, r7
    ldr r1, _LIT5
    mov r2, #0x14
    bne .L_488
    and r4, r0, #0x1
    ldr r0, [sp, #0xc]
    ldr r3, _LIT7
    mul r2, r0, r2
    mla r0, r4, r1, r3
    ldrh r0, [r2, r0]
    str r9, [sp, #0x4]
    cmp r0, #0x0
    bne .L_5dc
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0xc]
    mov r0, sl
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_5dc
    ldr r2, _LIT6
    ldr r0, _LIT5
    and r1, r7, #0x1
    mla r5, r1, r0, r2
    add r6, r5, #0x30
    mov r4, r9
.L_400:
    mov r0, sl
    mov r1, r7
    mov r2, r4
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_44c
    ldrh r0, [r5, #0x36]
    cmp r0, #0x0
    bne .L_44c
    ldr r0, [r6]
    mov r1, r0, lsl #0x13
    ldr r0, _LIT10
    cmp r0, r1, lsr #0x13
    moveq r0, #0x1
    movne r0, #0x0
    add r1, r0, #0x1
    ldr r0, [sp, #0x4]
    add r0, r0, r1
    str r0, [sp, #0x4]
.L_44c:
    add r5, r5, #0x14
    add r6, r6, #0x14
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_400
    rsb r0, r7, #0x1
    mov r1, #0x1
    bl func_ov002_021bc22c
    add r1, r0, #0x1
    ldr r0, [sp, #0x4]
    cmp r1, r0
    bge .L_5dc
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_488:
    ldr r0, [sp, #0x8]
    ldr r3, _LIT7
    and r4, r0, #0x1
    mul r2, fp, r2
    mla r0, r4, r1, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    bne .L_5dc
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0xc]
    mov r0, sl
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_5dc
    ldr r0, [sp, #0x8]
    mov r1, fp
    bl func_ov002_021c8470
    mov r4, r0
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0xc]
    bl func_ov002_021c8470
    rsb r1, r7, #0x1
    rsb r3, r0, r4, lsl #0x1
    ldr r0, _LIT5
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT6
    ldr r0, [r0, r2]
    cmp r3, r0
    blt .L_5dc
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_50c:
    ldr r2, _LIT6
    ldr r0, _LIT5
    and r1, r7, #0x1
    mla r4, r1, r0, r2
    mov r5, r9
.L_520:
    cmp r5, fp
    ldrneh r0, [r4, #0x38]
    cmpne r0, #0x0
    beq .L_540
    mov r0, r7
    mov r1, r5
    bl func_ov002_021c84c4
    add r8, r8, r0
.L_540:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r4, r4, #0x14
    ble .L_520
    b .L_5dc
.L_554:
    mov r4, r9
.L_558:
    mov r0, sl
    mov r1, r7
    mov r2, r4
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_588
    mov r0, r7
    mov r1, r4
    bl func_ov002_021c8470
    cmp r0, r9
    movle r0, r9
    mov r9, r0
.L_588:
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_558
    b .L_5dc
.L_598:
    ldr r0, [sp, #0x8]
    cmp r7, r0
    bne .L_5b8
    mov r1, fp
    bl func_ov002_021b9ecc
    bl func_0202ed90
    cmp r0, #0x0
    movne r9, #0x320
.L_5b8:
    ldr r0, [sp, #0x8]
    cmp r7, r0
    beq .L_5dc
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0xc]
    bl func_ov002_021b9ecc
    bl func_0202ed90
    cmp r0, #0x0
    movne r9, #0x320
.L_5dc:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_6c8
    mov r5, #0x0
    mov r6, r5
    mov r4, #0x1
.L_5f4:
    ldr r0, [sp, #0x10]
    mov r1, r6
    mov r2, r4
    bl func_ov002_021be384
    add r6, r6, #0x1
    cmp r6, #0x4
    add r5, r5, r0
    ble .L_5f4
    cmp r5, #0x1
    ble .L_67c
    ldrh r1, [sl]
    ldr r0, _LIT11
    cmp r1, r0
    beq .L_63c
    add r0, r0, #0x1
    cmp r1, r0
    beq .L_65c
    b .L_67c
.L_63c:
    ldrh r0, [sl, #0x2]
    mov r1, r0, lsl #0x1f
    ldr r0, [sp, #0x10]
    add sp, sp, #0x14
    cmp r0, r1, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_65c:
    ldrh r0, [sl, #0x2]
    mov r1, r0, lsl #0x1f
    ldr r0, [sp, #0x8]
    add sp, sp, #0x14
    cmp r0, r1, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_67c:
    ldr r0, [sp, #0x10]
    cmp r7, r0
    bne .L_8a4
    cmp r9, #0x0
    beq .L_8a4
    ldr r1, [sp, #0xc]
    bl func_ov002_021c8470
    rsb r2, r7, #0x1
    ldr r1, _LIT5
    and r2, r2, #0x1
    mul r3, r2, r1
    ldr r1, _LIT6
    add r2, r9, r0
    ldr r0, [r1, r3]
    cmp r2, r0
    blt .L_8a4
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6c8:
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x8]
    cmp r1, r0
    beq .L_8a4
    orrs r0, r9, r8
    beq .L_8a4
    ldr r0, [sp, #0x8]
    mov r1, #0x14
    cmp r7, r0
    ldr r0, _LIT5
    bne .L_7dc
    ldr r2, _LIT7
    and r3, r7, #0x1
    mul r1, fp, r1
    mla r0, r3, r0, r2
    ldrh r6, [r1, r0]
    rsb r5, r7, #0x1
    ldr r1, [sp, #0xc]
    mov r0, r5
    bl func_ov002_021c8470
    mov r4, r0
    cmp r6, #0x0
    mov r0, r7
    mov r1, fp
    beq .L_734
    bl func_ov002_021c84a8
    b .L_738
.L_734:
    bl func_ov002_021c8470
.L_738:
    cmp r6, #0x0
    beq .L_758
    cmp r8, #0x0
    movlt r8, #0x0
    rsbs r1, r9, #0x0
    movmi r1, #0x0
    add r1, r1, r8
    b .L_770
.L_758:
    cmp r9, #0x0
    movlt r1, #0x0
    movge r1, r9
    rsbs r2, r9, #0x0
    movmi r2, #0x0
    add r1, r2, r1
.L_770:
    add r1, r0, r1
    cmp r4, r1
    bgt .L_898
    cmp r4, r0
    sub r4, r1, r4
    addgt sp, sp, #0x14
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r7
    mov r1, fp
    bl func_ov002_021b9ecc
    ldr r1, _LIT12
    cmp r0, r1
    bne .L_7b4
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7b4:
    ldr r0, _LIT5
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT6
    ldr r0, [r0, r2]
    cmp r4, r0
    blt .L_898
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7dc:
    rsb r4, r7, #0x1
    and r2, r4, #0x1
    mul r5, r2, r0
    ldr r0, _LIT7
    mul r1, fp, r1
    add r0, r0, r5
    ldrh r6, [r1, r0]
    ldr r1, [sp, #0xc]
    mov r0, r7
    bl func_ov002_021c8470
    mov r7, r0
    cmp r6, #0x0
    mov r0, r4
    mov r1, fp
    beq .L_820
    bl func_ov002_021c84a8
    b .L_824
.L_820:
    bl func_ov002_021c8470
.L_824:
    cmp r6, #0x0
    beq .L_834
    rsbs r1, r8, #0x0
    b .L_838
.L_834:
    rsbs r1, r9, #0x0
.L_838:
    movmi r1, #0x0
    cmp r9, #0x0
    movlt r9, #0x0
    add r3, r9, r1
    cmp r7, r0
    bgt .L_864
    add r1, r7, r3
    cmp r1, r0
    addgt sp, sp, #0x14
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_864:
    cmp r6, #0x0
    bne .L_898
    ldr r2, _LIT6
    sub r1, r7, r0
    ldr r2, [r2, r5]
    cmp r1, r2
    bge .L_898
    add r1, r7, r3
    sub r0, r1, r0
    cmp r0, r2
    addge sp, sp, #0x14
    movge r0, #0x1
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_898:
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8a4:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x000014eb
_LIT2: .word 0x0000132a
_LIT3: .word 0x0000192d
_LIT4: .word 0x00001a60
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf16c
_LIT7: .word data_ov002_022cf1a2
_LIT8: .word 0x000005dc
_LIT9: .word data_ov002_022cf178
_LIT10: .word 0x000018fc
_LIT11: .word 0x000012cf
_LIT12: .word 0x00001292
