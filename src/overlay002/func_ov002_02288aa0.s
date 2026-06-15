; func_ov002_02288aa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf288
        .extern func_0202b8a8
        .extern func_0202b8f0
        .extern func_0202e2c8
        .extern func_0202eac8
        .extern func_0202f9e8
        .extern func_0203058c
        .extern func_ov002_021afb74
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bae7c
        .extern func_ov002_021bbd14
        .extern func_ov002_021bbf50
        .extern func_ov002_021bc000
        .extern func_ov002_021bc0d4
        .extern func_ov002_021bcf00
        .extern func_ov002_021c1e44
        .extern func_ov002_021c3c50
        .extern func_ov002_021c8470
        .extern func_ov002_021c84a8
        .extern func_ov002_021c84e0
        .extern func_ov002_02216004
        .extern func_ov002_022536e8
        .extern func_ov002_022575c8
        .extern func_ov002_02257ab8
        .extern func_ov002_0227b0b8
        .extern func_ov002_0227da98
        .extern func_ov002_022806a4
        .extern func_ov002_02280980
        .extern func_ov002_02280ad8
        .extern func_ov002_02280b74
        .extern func_ov002_0228c460
        .extern func_ov002_02291214
        .global func_ov002_02288aa0
        .arm
func_ov002_02288aa0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    mov sl, r0
    ldrh r2, [sl, #0x2]
    str r1, [sp, #0x4]
    mov r0, r2, lsl #0x14
    mov r0, r0, lsr #0x1a
    add r0, r0, #0xee
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_1340
    ldr r0, _LIT0
    mov r1, r2, lsl #0x1f
    ldr r5, [r0, #0x20]
    ldr r7, [r0]
    ldr fp, [r0, #0x1c]
    ldr r0, [r0, #0x4]
    cmp r5, #0x5
    movge r8, #0x1
    mov r4, r1, lsr #0x1f
    str r0, [sp, #0x8]
    movlt r8, #0x0
    mov r0, r7
    mov r1, fp
    bl func_ov002_021c8470
    cmp r8, #0x0
    mov r6, r0
    movne r9, #0x0
    bne .L_c8
    ldr r0, [sp, #0x8]
    ldr r1, _LIT1
    mov r2, #0x14
    ldr r3, _LIT2
    and r9, r0, #0x1
    mul r2, r5, r2
    mla r0, r9, r1, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    beq .L_b8
    ldr r0, [sp, #0x8]
    mov r1, r5
    bl func_ov002_021c84a8
    mov r9, r0
    b .L_c8
.L_b8:
    ldr r0, [sp, #0x8]
    mov r1, r5
    bl func_ov002_021c8470
    mov r9, r0
.L_c8:
    ldrh r1, [sl]
    ldr r3, _LIT3
    cmp r1, r3
    bgt .L_2e0
    bge .L_df0
    ldr r2, _LIT4
    cmp r1, r2
    bgt .L_1fc
    bge .L_a28
    sub r0, r3, #0x354
    cmp r1, r0
    bgt .L_160
    bge .L_534
    ldr r3, _LIT5
    cmp r1, r3
    bgt .L_130
    bge .L_bf0
    sub r0, r3, #0x140
    cmp r1, r0
    bgt .L_120
    beq .L_bf0
    b .L_1340
.L_120:
    sub r0, r3, #0x12
    cmp r1, r0
    beq .L_1010
    b .L_1340
.L_130:
    add r0, r3, #0x81
    cmp r1, r0
    bgt .L_150
    bge .L_9cc
    add r0, r3, #0x11
    cmp r1, r0
    beq .L_4cc
    b .L_1340
.L_150:
    add r0, r3, #0x8f
    cmp r1, r0
    beq .L_dd0
    b .L_1340
.L_160:
    sub r0, r2, #0x83
    cmp r1, r0
    bgt .L_1cc
    cmp r1, #0x1380
    blt .L_184
    beq .L_bd8
    cmp r1, r0
    beq .L_828
    b .L_1340
.L_184:
    sub r0, r2, #0xa2
    cmp r1, r0
    bgt .L_1bc
    bge .L_e30
    sub r0, r2, #0xed
    cmp r1, r0
    bgt .L_1340
    sub r0, r2, #0xee
    cmp r1, r0
    blt .L_1340
    subne r0, r2, #0xed
    cmpne r1, r0
    beq .L_828
    b .L_1340
.L_1bc:
    sub r0, r2, #0x87
    cmp r1, r0
    beq .L_d34
    b .L_1340
.L_1cc:
    sub r0, r2, #0x6
    cmp r1, r0
    bgt .L_1ec
    bge .L_960
    sub r0, r2, #0xb
    cmp r1, r0
    beq .L_828
    b .L_1340
.L_1ec:
    sub r0, r2, #0x2
    cmp r1, r0
    beq .L_534
    b .L_1340
.L_1fc:
    add r0, r2, #0xae
    cmp r1, r0
    bgt .L_270
    bge .L_bf0
    add r0, r2, #0x1c
    cmp r1, r0
    bgt .L_240
    bge .L_6f8
    add r0, r2, #0x6
    cmp r1, r0
    bgt .L_230
    beq .L_668
    b .L_1340
.L_230:
    add r0, r2, #0xa
    cmp r1, r0
    beq .L_c54
    b .L_1340
.L_240:
    add r0, r2, #0x67
    cmp r1, r0
    bgt .L_260
    bge .L_79c
    add r0, r2, #0x37
    cmp r1, r0
    beq .L_534
    b .L_1340
.L_260:
    add r0, r2, #0xa2
    cmp r1, r0
    beq .L_1278
    b .L_1340
.L_270:
    sub r0, r3, #0xd5
    cmp r1, r0
    bgt .L_2b0
    bge .L_1054
    add r0, r2, #0x134
    cmp r1, r0
    bgt .L_2a0
    bge .L_cf0
    add r0, r2, #0xf1
    cmp r1, r0
    beq .L_534
    b .L_1340
.L_2a0:
    sub r0, r3, #0xf7
    cmp r1, r0
    beq .L_534
    b .L_1340
.L_2b0:
    sub r0, r3, #0xbd
    cmp r1, r0
    bgt .L_2d0
    bge .L_534
    sub r0, r3, #0xc1
    cmp r1, r0
    beq .L_58c
    b .L_1340
.L_2d0:
    sub r0, r3, #0x41
    cmp r1, r0
    beq .L_534
    b .L_1340
.L_2e0:
    ldr r0, _LIT6
    cmp r1, r0
    bgt .L_3e4
    bge .L_928
    add r2, r3, #0x130
    cmp r1, r2
    bgt .L_36c
    bge .L_c8c
    sub r2, r0, #0x260
    cmp r1, r2
    bgt .L_33c
    sub r0, r0, #0x260
    cmp r1, r0
    bge .L_bf0
    add r0, r3, #0x33
    cmp r1, r0
    bgt .L_32c
    beq .L_10cc
    b .L_1340
.L_32c:
    add r0, r3, #0x6e
    cmp r1, r0
    beq .L_df0
    b .L_1340
.L_33c:
    add r0, r3, #0xe4
    cmp r1, r0
    bgt .L_35c
    bge .L_5c8
    add r0, r3, #0xac
    cmp r1, r0
    beq .L_534
    b .L_1340
.L_35c:
    add r0, r3, #0xe8
    cmp r1, r0
    beq .L_ad0
    b .L_1340
.L_36c:
    sub r2, r0, #0x150
    cmp r1, r2
    bgt .L_3b4
    bge .L_df0
    sub r2, r0, #0x154
    cmp r1, r2
    bgt .L_3a4
    sub r0, r0, #0x154
    cmp r1, r0
    bge .L_1174
    add r0, r3, #0x134
    cmp r1, r0
    beq .L_bd8
    b .L_1340
.L_3a4:
    ldr r0, _LIT7
    cmp r1, r0
    beq .L_558
    b .L_1340
.L_3b4:
    ldr r0, _LIT8
    cmp r1, r0
    bgt .L_3d4
    bge .L_828
    sub r0, r0, #0x7
    cmp r1, r0
    beq .L_534
    b .L_1340
.L_3d4:
    add r0, r0, #0x4d
    cmp r1, r0
    beq .L_1054
    b .L_1340
.L_3e4:
    add r2, r3, #0x3d8
    cmp r1, r2
    bgt .L_460
    bge .L_1228
    cmp r1, #0x1980
    bgt .L_430
    bge .L_112c
    add r2, r0, #0x29
    cmp r1, r2
    bgt .L_420
    bge .L_b30
    add r0, r0, #0x1
    cmp r1, r0
    beq .L_828
    b .L_1340
.L_420:
    add r0, r0, #0x58
    cmp r1, r0
    beq .L_9b0
    b .L_1340
.L_430:
    add r2, r0, #0xb1
    cmp r1, r2
    bgt .L_450
    bge .L_12a4
    add r0, r0, #0xae
    cmp r1, r0
    beq .L_11b0
    b .L_1340
.L_450:
    add r0, r0, #0xe5
    cmp r1, r0
    beq .L_8c4
    b .L_1340
.L_460:
    cmp r1, #0x1b00
    bgt .L_49c
    bge .L_12d0
    ldr r0, _LIT9
    cmp r1, r0
    bgt .L_48c
    bge .L_cf0
    sub r0, r0, #0x8a
    cmp r1, r0
    beq .L_534
    b .L_1340
.L_48c:
    add r0, r0, #0xa
    cmp r1, r0
    beq .L_828
    b .L_1340
.L_49c:
    ldr r0, _LIT10
    cmp r1, r0
    bgt .L_4bc
    bge .L_534
    sub r0, r0, #0xa
    cmp r1, r0
    beq .L_12fc
    b .L_1340
.L_4bc:
    add r0, r0, #0x4
    cmp r1, r0
    beq .L_828
    b .L_1340
.L_4cc:
    add r1, sp, #0xc
    mov r0, sl
    bl func_ov002_02216004
    cmp r0, #0x0
    addlt sp, sp, #0x10
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [sp, #0xc]
    mov r0, sl
    mov r2, r1, asr #0x8
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_021c1e44
    cmp r0, #0x0
    addne sp, sp, #0x10
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    add sp, sp, #0x10
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    cmp r7, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_534:
    ldrh r0, [sl, #0x2]
    add sp, sp, #0x10
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    cmp r7, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_558:
    cmp r8, #0x0
    beq .L_580
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    cmp r7, r0
    addeq sp, sp, #0x10
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_580:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_58c:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bcf00
    ldrh r1, [sl, #0x2]
    mov r4, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bcf00
    cmp r4, r0
    movge r0, #0x1
    add sp, sp, #0x10
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5c8:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    cmp r7, r0
    bne .L_65c
    ldr r0, _LIT1
    ldr r1, _LIT11
    and r2, r7, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, fp, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202b8a8
    cmp r0, #0x4
    bgt .L_624
    mov r0, r5
    bl func_0203058c
    cmp r0, #0x0
    beq .L_630
.L_624:
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_630:
    cmp r8, #0x0
    beq .L_65c
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT11
    ldr r0, [r0, r2]
    cmp r6, r0
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_65c:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_668:
    rsb r0, r4, #0x1
    cmp r7, r0
    cmpeq r8, #0x0
    bne .L_6ec
    cmp r6, r9
    blt .L_6ec
    ldr r2, _LIT11
    ldr r0, _LIT1
    and r1, r4, #0x1
    mla r9, r1, r0, r2
    add r8, r9, #0x30
    mov r7, #0x0
.L_698:
    cmp r7, r5
    beq .L_6d8
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_6d8
    ldrh r0, [r9, #0x36]
    cmp r0, #0x0
    bne .L_6d8
    mov r0, r4
    mov r1, r7
    bl func_ov002_021c8470
    cmp r0, r6
    addgt sp, sp, #0x10
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6d8:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x14
    add r9, r9, #0x14
    blt .L_698
.L_6ec:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6f8:
    rsb r0, r4, #0x1
    cmp r7, r0
    cmpeq r8, #0x0
    bne .L_790
    cmp r6, r9
    blt .L_790
    ldr r1, _LIT1
    and r0, r4, #0x1
    mul r2, r0, r1
    ldr r4, _LIT11
    ldr r0, [r4, r2]
    cmp r6, r0
    addge sp, sp, #0x10
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x8]
    and r2, r0, #0x1
    mul r3, r2, r1
    mov r0, #0x14
    mul r2, r5, r0
    ldr r1, _LIT12
    add r0, r1, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, r4, r3
    add r0, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202f9e8
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x10
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_790:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_79c:
    rsb r4, r4, #0x1
    cmp r7, r4
    cmpeq r8, #0x0
    bne .L_81c
    cmp r6, r9
    blt .L_81c
    ldr r2, _LIT11
    ldr r0, _LIT1
    and r1, r4, #0x1
    mla r6, r1, r0, r2
    add r5, r6, #0x30
    mov r7, #0x0
.L_7cc:
    cmp r7, fp
    beq .L_808
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r6, #0x38]
    cmpne r0, #0x0
    beq .L_808
    mov r0, r4
    mov r1, r7
    bl func_ov002_021c8470
    cmp r0, r9
    addlt sp, sp, #0x10
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_808:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r5, r5, #0x14
    add r6, r6, #0x14
    blt .L_7cc
.L_81c:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_828:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_8b8
    cmp r8, #0x0
    bne .L_850
    cmp r6, r9
    blt .L_8a0
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_850:
    ldr r1, _LIT1
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r2, _LIT11
    ldr r2, [r2, r3]
    cmp r6, r2
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    sub r1, r1, #0x28c
    cmp r6, r1
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r1, #0x1
    mov r2, r1
    bl func_ov002_021bc0d4
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8a0:
    mov r0, r4
    bl func_ov002_0228c460
    cmp r0, #0x0
    addne sp, sp, #0x10
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8b8:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8c4:
    ldr r1, [sp, #0x4]
    mov r0, sl
    bl func_ov002_02291214
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_928
    cmp r8, #0x0
    beq .L_928
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT11
    ldr r0, [r0, r2]
    cmp r6, r0
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r6, #0x7d0
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_928:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_954
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_021bc0d4
    cmp r0, #0x1
    movgt r0, #0x1
    add sp, sp, #0x10
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_954:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_960:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_9a4
    ldr r0, _LIT1
    ldr r1, _LIT11
    and r2, r7, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, fp, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2c8
    cmp r0, #0x0
    addne sp, sp, #0x10
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9a4:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9b0:
    ldr r1, _LIT13
    mov r0, r4
    bl func_ov002_021bc000
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9cc:
    rsb r1, r4, #0x1
    cmp r7, r1
    bne .L_a1c
    cmp r8, #0x0
    addne sp, sp, #0x10
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r6, r9
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_a1c
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    addeq sp, sp, #0x10
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a1c:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a28:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_ac4
    ldr r1, _LIT1
    and r2, r0, #0x1
    mul r5, r2, r1
    ldr r3, _LIT11
    ldr r2, [r3, r5]
    cmp r6, r2
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r8, #0x0
    beq .L_a7c
    and r2, r4, #0x1
    mul r1, r2, r1
    ldr r1, [r3, r1]
    cmp r6, r1
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a7c:
    mov r1, fp
    mov r2, #0x1
    bl func_ov002_0227b0b8
    cmp r6, r0
    addlt sp, sp, #0x10
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT14
    cmp r6, r0
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r8, #0x0
    bne .L_ac4
    cmp r6, r9
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ac4:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ad0:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_b24
    cmp r8, #0x0
    addne sp, sp, #0x10
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r6, r9
    ble .L_b24
    ldr r0, [sp, #0x8]
    ldr r1, _LIT1
    mov r2, #0x14
    ldr r3, _LIT2
    and r4, r0, #0x1
    mul r2, r5, r2
    mla r0, r4, r1, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b24:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b30:
    rsb r1, r4, #0x1
    cmp r7, r1
    bne .L_bcc
    cmp r8, #0x0
    sub r0, r6, r9
    bne .L_b78
    ldr r2, [sp, #0x8]
    ldr r3, _LIT1
    mov r6, #0x14
    ldr r7, _LIT2
    and r8, r2, #0x1
    mul r6, r5, r6
    mla r2, r8, r3, r7
    ldrh r2, [r6, r2]
    cmp r2, #0x0
    addne sp, sp, #0x10
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b78:
    ldr r2, _LIT1
    and r1, r1, #0x1
    mul r3, r1, r2
    ldr r5, _LIT11
    ldr r1, [r5, r3]
    cmp r0, r1
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    and r1, r4, #0x1
    mul r3, r1, r2
    ldr r1, [r5, r3]
    cmp r0, r1
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    sub r1, r2, #0x28c
    cmp r0, r1
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bcc:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bd8:
    mov r0, r4
    bl func_ov002_0227da98
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bf0:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_c48
    cmp r8, #0x0
    beq .L_c28
    ldr r1, _LIT1
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT11
    ldr r1, [r1, r3]
    cmp r6, r1
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c28:
    mov r1, fp
    mov r2, #0x1
    bl func_ov002_0227b0b8
    cmp r6, r0
    movlt r0, #0x0
    add sp, sp, #0x10
    movge r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c48:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c54:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_c80
    mov r0, r7
    mov r1, fp
    bl func_ov002_021c84e0
    cmp r0, #0x4
    movge r0, #0x1
    add sp, sp, #0x10
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c80:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c8c:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_ce4
    ldr r1, _LIT1
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r2, _LIT11
    add r1, r1, #0x350
    ldr r2, [r2, r3]
    cmp r2, r1
    ble .L_cd8
    mvn r1, #0x0
    mov r2, #0x0
    bl func_ov002_0227b0b8
    ldr r1, _LIT15
    cmp r0, r1
    addle sp, sp, #0x10
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cd8:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ce4:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cf0:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_d28
    cmp r8, #0x0
    beq .L_d28
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT11
    ldr r0, [r0, r2]
    cmp r6, r0
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d28:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d34:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_dc4
    cmp r8, #0x0
    beq .L_dc4
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbf50
    cmp r0, #0x0
    bne .L_dc4
    ldrh r2, [sl, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT11
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, r6
    addle sp, sp, #0x10
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [sl]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_022806a4
    bl func_ov002_021afb74
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    cmp r0, r6
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_dc4:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_dd0:
    sub r1, r2, #0x6c
    rsb r0, r4, #0x1
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    addne sp, sp, #0x10
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_df0:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_e24
    cmp r8, #0x0
    beq .L_e24
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbf50
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e24:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e30:
    rsb r0, r4, #0x1
    cmp r7, r0
    cmpeq r8, #0x0
    bne .L_1004
    ldr r0, [sp, #0x8]
    ldr r2, _LIT1
    and r3, r0, #0x1
    mov r0, #0x14
    mul r8, r3, r2
    mul r7, r5, r0
    ldr r2, _LIT11
    add r0, r2, r8
    add r0, r0, r7
    ldr r2, [r0, #0x30]
    mov r0, r4
    mov r3, r2, lsl #0x13
    mov r2, #0x0
    mov r5, r3, lsr #0x13
    bl func_ov002_022536e8
    cmp r0, #0x2
    addlt sp, sp, #0x10
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r5
    bl func_0202f9e8
    cmp r0, #0x0
    beq .L_eb0
    ldr r0, _LIT12
    add sp, sp, #0x10
    add r0, r0, r8
    ldrh r0, [r7, r0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_eb0:
    cmp r6, r9
    blt .L_1004
    ldr r0, _LIT16
    cmp r9, r0
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT17
    mov r0, r4
    bl func_ov002_021bbd14
    cmp r0, #0x0
    beq .L_1004
    ldrh r2, [sl, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT18
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r3, r2, r0
    ldr r1, [r1, r3]
    mov r2, #0x0
    cmp r1, #0x0
    bls .L_1004
    ldr fp, _LIT19
    ldr r0, _LIT11
    sub r8, fp, #0x2f
    add r0, r0, r3
    sub r6, fp, #0x2d
    rsb r4, fp, #0x2900
    add r0, r0, #0x120
    sub r7, fp, #0x2e
    mov r5, r4
    add r3, fp, #0x550
    mov r9, r8
    mov sl, r6
.L_f3c:
    ldr ip, [r0]
    mov ip, ip, lsl #0x13
    cmp fp, ip, lsr #0x13
    mov ip, ip, lsr #0x13
    bcc .L_f7c
    cmp ip, fp
    bcs .L_fe8
    cmp ip, sl
    bhi .L_ff4
    cmp ip, r9
    bcc .L_ff4
    cmp ip, r8
    cmpne ip, r7
    cmpne ip, r6
    beq .L_fe8
    b .L_ff4
.L_f7c:
    cmp ip, r5
    bhi .L_fe0
    cmp ip, r4
    beq .L_fe8
    b .L_ff4
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a2
_LIT3: .word 0x00001636
_LIT4: .word 0x00001404
_LIT5: .word 0x00001243
_LIT6: .word 0x00001907
_LIT7: .word 0x000017b5
_LIT8: .word 0x00001805
_LIT9: .word 0x00001aa2
_LIT10: .word 0x00001b28
_LIT11: .word data_ov002_022cf16c
_LIT12: .word data_ov002_022cf1a4
_LIT13: .word func_0202eac8
_LIT14: .word 0x000005dc
_LIT15: .word 0x00000bb8
_LIT16: .word 0x00000708
_LIT17: .word 0x000012f3
_LIT18: .word data_ov002_022cf178
_LIT19: .word 0x000013b5
.L_fe0:
    cmp ip, r3
    bne .L_ff4
.L_fe8:
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ff4:
    add r2, r2, #0x1
    cmp r2, r1
    add r0, r0, #0x4
    bcc .L_f3c
.L_1004:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1010:
    rsb r0, r4, #0x1
    cmp r7, r0
    cmpeq r8, #0x0
    bne .L_1048
    cmp r6, r9
    blt .L_1048
    mov r0, r4
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021bc0d4
    cmp r0, #0x0
    addne sp, sp, #0x10
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1048:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1054:
    rsb r0, r4, #0x1
    cmp r7, r0
    cmpeq r8, #0x0
    bne .L_10c0
    ldrh r0, [sl, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT11
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, r6
    addle sp, sp, #0x10
    movle r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r6, r9
    addle sp, sp, #0x10
    movle r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r1, #0x5
    bl func_ov002_021c3c50
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x10
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10c0:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10cc:
    rsb r6, r4, #0x1
    mov r1, #0x1
    mov r0, r6
    mov r2, r1
    bl func_ov002_021bc0d4
    cmp r0, #0x2
    addlt sp, sp, #0x10
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r5, #0x0
    mov r0, r4
    mov r1, r6
    sub r2, r5, #0x1
    mov r3, #0x1
    str r5, [sp]
    bl func_ov002_02280b74
    mov r5, r0
    mov r0, r4
    bl func_ov002_02280ad8
    cmp r5, r0
    movlt r0, #0x1
    add sp, sp, #0x10
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_112c:
    cmp r8, #0x0
    rsbeq r0, r4, #0x1
    cmpeq r7, r0
    bne .L_1340
    ldr r1, [sp, #0x8]
    mov r0, sl
    mov r2, r9
    bl func_ov002_022575c8
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT20
    add sp, sp, #0x10
    cmp r6, r0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1174:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_1340
    cmp r6, r9
    addlt sp, sp, #0x10
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r1, #0x1
    mov r2, r1
    bl func_ov002_021bc0d4
    cmp r0, #0x1
    ble .L_1340
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11b0:
    cmp r8, #0x0
    rsbeq r0, r4, #0x1
    cmpeq r7, r0
    bne .L_1340
    ldr r0, [sp, #0x8]
    mov r1, r5
    bl func_ov002_021b9ecc
    ldr r1, _LIT21
    cmp r0, r1
    addne sp, sp, #0x10
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [sl]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_022536e8
    cmp r0, #0x0
    beq .L_121c
    cmp r6, #0xaf0
    bgt .L_1210
    cmp r6, r9
    addge sp, sp, #0x10
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1210:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_121c:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1228:
    rsb r1, r4, #0x1
    cmp r7, r1
    bne .L_1340
    ldr r0, _LIT1
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT22
    ldr r0, [r0, r2]
    mov r0, r0, lsr #0x11
    tst r0, #0x1
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    bl func_ov002_02280980
    cmp r0, #0x0
    bge .L_1340
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1278:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_1298
    sub r0, r6, #0x1f4
    cmp r0, r9
    addle sp, sp, #0x10
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1298:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12a4:
    rsb r0, r4, #0x1
    cmp r7, r0
    cmpeq r8, #0x0
    bne .L_12c4
    cmp r6, r9
    addgt sp, sp, #0x10
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12c4:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12d0:
    ldrh r1, [sl, #0x2]
    mov r0, sl
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02257ab8
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x10
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12fc:
    rsb r0, r4, #0x1
    cmp r7, r0
    bne .L_1334
    ldr r0, [sp, #0x8]
    mov r1, r5
    bl func_ov002_021b9ecc
    ldr r1, _LIT23
    cmp r0, r1
    cmpeq r8, #0x0
    bne .L_1334
    cmp r6, r9
    addgt sp, sp, #0x10
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1334:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1340:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT20: .word 0x0000076c
_LIT21: .word 0x000018f6
_LIT22: .word data_ov002_022cf288
_LIT23: .word 0x0000194d
