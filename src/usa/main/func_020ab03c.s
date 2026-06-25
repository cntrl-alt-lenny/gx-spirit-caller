; func_020ab03c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c35e0
        .extern data_020c3660
        .extern data_020c3788
        .extern data_020c378d
        .extern data_02102754
        .extern data_0210275c
        .extern func_020a6bd4
        .extern func_020b1094
        .extern func_020b22ac
        .extern func_020b2884
        .extern func_020b29c0
        .extern func_020b2ae8
        .extern func_020b2ff0
        .extern func_020b32dc
        .global func_020ab03c
        .arm
func_020ab03c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xa8
    ldr r4, [sp, #0xd0]
    mov sl, #0x0
    str r4, [sp, #0xd0]
    str r0, [sp]
    add r6, sp, #0x80
    mov r9, r1
    mov r8, r2
    str r3, [sp, #0x4]
    mov r4, sl
    str sl, [sp, #0x2c]
    mov r5, #0x1
    mov r0, #0x4
.L_38:
    strh sl, [r6]
    strh sl, [r6, #0x2]
    strh sl, [r6, #0x4]
    strh sl, [r6, #0x6]
    add r6, r6, #0x8
    subs r0, r0, #0x1
    bne .L_38
    mov r0, #0x0
    str r0, [sp, #0x28]
    strh sl, [r6]
    strh sl, [r6, #0x2]
    ldr r2, [sp, #0x28]
    ldr r1, [sp, #0xd0]
    strh sl, [r6, #0x4]
    str r2, [r1]
    mov r1, r2
    mov r0, r8
    str r1, [sp, #0x24]
    str r1, [sp, #0x20]
    str r1, [sp, #0x1c]
    str r1, [sp, #0x18]
    str r1, [sp, #0x10]
    str r1, [sp, #0xc]
    str r1, [sp, #0x8]
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    ldr r7, _LIT0
    add r0, sp, #0x4d
    mov r6, #0x4
.L_b0:
    ldrb r3, [r7]
    ldrb r2, [r7, #0x1]
    add r7, r7, #0x2
    strb r3, [r0]
    strb r2, [r0, #0x1]
    add r0, r0, #0x2
    subs r6, r6, #0x1
    bne .L_b0
    ldrb r3, [r7]
    ldr r2, _LIT1
    strb r3, [r0]
    ldrb r3, [r2, #0x1]
    ldrb r0, [r2, #0x2]
    ldrb r6, [r2]
    strb r3, [sp, #0x31]
    strb r0, [sp, #0x32]
    ldrb r3, [r2, #0x3]
    ldrb r0, [r2, #0x4]
    strb r6, [sp, #0x30]
    strb r3, [sp, #0x33]
    strb r0, [sp, #0x34]
    b .L_df4
.L_108:
    cmp r5, #0x100
    bgt .L_180
    bge .L_888
    cmp r5, #0x20
    bgt .L_164
    bge .L_75c
    cmp r5, #0x8
    bgt .L_158
    cmp r5, #0x0
    addge pc, pc, r5, lsl #0x2
    b .L_df4
    b .L_df4
    b .L_1c4
    b .L_5a8
    b .L_df4
    b .L_658
    b .L_df4
    b .L_df4
    b .L_df4
    b .L_680
.L_158:
    cmp r5, #0x10
    beq .L_724
    b .L_df4
.L_164:
    cmp r5, #0x40
    bgt .L_174
    beq .L_7e8
    b .L_df4
.L_174:
    cmp r5, #0x80
    beq .L_834
    b .L_df4
.L_180:
    cmp r5, #0x2000
    bgt .L_1a8
    bge .L_3dc
    cmp r5, #0x200
    bgt .L_19c
    beq .L_8e8
    b .L_df4
.L_19c:
    cmp r5, #0x400
    beq .L_910
    b .L_df4
.L_1a8:
    cmp r5, #0x4000
    bgt .L_1b8
    beq .L_2e4
    b .L_df4
.L_1b8:
    cmp r5, #0x8000
    beq .L_988
    b .L_df4
.L_1c4:
    cmp r1, #0x0
    blt .L_1d4
    cmp r1, #0x80
    blt .L_1dc
.L_1d4:
    mov r0, #0x0
    b .L_1ec
.L_1dc:
    mov r2, r1, lsl #0x1
    ldr r0, _LIT2
    ldrh r0, [r0, r2]
    and r0, r0, #0x100
.L_1ec:
    cmp r0, #0x0
    beq .L_218
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    mov r1, r0
    ldr r0, [sp, #0x2c]
    add r0, r0, #0x1
    str r0, [sp, #0x2c]
    b .L_df4
.L_218:
    cmp r1, #0x0
    blt .L_228
    cmp r1, #0x80
    blt .L_230
.L_228:
    mov r0, r1
    b .L_238
.L_230:
    ldr r0, _LIT3
    ldrb r0, [r0, r1]
.L_238:
    cmp r0, #0x49
    bgt .L_264
    bge .L_29c
    cmp r0, #0x2d
    bgt .L_2dc
    cmp r0, #0x2b
    blt .L_2dc
    beq .L_278
    cmp r0, #0x2d
    beq .L_270
    b .L_2dc
.L_264:
    cmp r0, #0x4e
    beq .L_2bc
    b .L_2dc
.L_270:
    mov r0, #0x1
    str r0, [sp, #0x28]
.L_278:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    mov r0, #0x1
    str r0, [sp, #0x18]
    b .L_df4
.L_29c:
    add r4, r4, #0x1
    mov r0, r8
    mov r1, #0x0
    mov r2, r1
    blx r9
    mov r1, r0
    mov r5, #0x4000
    b .L_df4
.L_2bc:
    add r4, r4, #0x1
    mov r0, r8
    mov r1, #0x0
    mov r2, r1
    blx r9
    mov r1, r0
    mov r5, #0x2000
    b .L_df4
.L_2dc:
    mov r5, #0x2
    b .L_df4
.L_2e4:
    mov r5, #0x1
    add r7, sp, #0x4d
    add r0, sp, #0x76
    mov r6, #0x4
.L_2f4:
    ldrb r3, [r7]
    ldrb r2, [r7, #0x1]
    add r7, r7, #0x2
    strb r3, [r0]
    strb r2, [r0, #0x1]
    add r0, r0, #0x2
    subs r6, r6, #0x1
    bne .L_2f4
    ldrb r2, [r7]
    add r6, sp, #0x77
    ldr r7, _LIT3
    strb r2, [r0]
    b .L_348
.L_328:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r6, r6, #0x1
    add r5, r5, #0x1
    add r4, r4, #0x1
    blx r9
    mov r1, r0
.L_348:
    cmp r5, #0x8
    bge .L_378
    cmp r1, #0x0
    blt .L_360
    cmp r1, #0x80
    blt .L_368
.L_360:
    mov r2, r1
    b .L_36c
.L_368:
    ldrb r2, [r7, r1]
.L_36c:
    ldrsb r0, [r6]
    cmp r0, r2
    beq .L_328
.L_378:
    cmp r5, #0x3
    cmpne r5, #0x8
    bne .L_3d4
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_3a8
    ldr r1, _LIT4
    mov r0, #0x0
    ldr r1, [r1]
    bl func_020b32dc
    bl func_020b2ff0
    b .L_3b4
.L_3a8:
    ldr r0, _LIT4
    ldr r0, [r0]
    bl func_020b2ff0
.L_3b4:
    ldr r2, [sp, #0x2c]
    add r3, r2, r5
    ldr r2, [sp, #0x18]
    add r3, r2, r3
    ldr r2, [sp, #0x4]
    add sp, sp, #0xa8
    str r3, [r2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3d4:
    mov r5, #0x1000
    b .L_df4
.L_3dc:
    ldrb r3, [sp, #0x30]
    ldrb r0, [sp, #0x32]
    ldrb r2, [sp, #0x31]
    strb r3, [sp, #0x40]
    strb r0, [sp, #0x42]
    ldrb r3, [sp, #0x33]
    ldrb r0, [sp, #0x34]
    strb r2, [sp, #0x41]
    mov r5, #0x1
    strb r0, [sp, #0x44]
    mov r6, #0x0
    add r2, sp, #0x56
    strb r3, [sp, #0x43]
    mov r0, #0x8
.L_414:
    strb r6, [r2]
    strb r6, [r2, #0x1]
    strb r6, [r2, #0x2]
    strb r6, [r2, #0x3]
    add r2, r2, #0x4
    subs r0, r0, #0x1
    bne .L_414
    add r7, sp, #0x41
    b .L_458
.L_438:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r7, r7, #0x1
    add r5, r5, #0x1
    add r4, r4, #0x1
    blx r9
    mov r1, r0
.L_458:
    cmp r5, #0x4
    bge .L_48c
    cmp r1, #0x0
    blt .L_470
    cmp r1, #0x80
    blt .L_478
.L_470:
    mov r2, r1
    b .L_480
.L_478:
    ldr r0, _LIT3
    ldrb r2, [r0, r1]
.L_480:
    ldrsb r0, [r7]
    cmp r0, r2
    beq .L_438
.L_48c:
    sub r0, r5, #0x3
    cmp r0, #0x1
    bhi .L_5a0
    cmp r5, #0x4
    bne .L_544
    ldr r7, _LIT2
    b .L_4cc
.L_4a8:
    add r0, sp, #0x56
    strb r1, [r0, r6]
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r6, r6, #0x1
    add r4, r4, #0x1
    blx r9
    mov r1, r0
.L_4cc:
    cmp r6, #0x20
    bge .L_534
    cmp r1, #0x0
    blt .L_4e4
    cmp r1, #0x80
    blt .L_4ec
.L_4e4:
    mov r0, #0x0
    b .L_4f8
.L_4ec:
    mov r0, r1, lsl #0x1
    ldrh r0, [r7, r0]
    and r0, r0, #0x8
.L_4f8:
    cmp r0, #0x0
    bne .L_4a8
    cmp r1, #0x0
    blt .L_510
    cmp r1, #0x80
    blt .L_518
.L_510:
    mov r0, #0x0
    b .L_524
.L_518:
    mov r0, r1, lsl #0x1
    ldrh r0, [r7, r0]
    and r0, r0, #0x1
.L_524:
    cmp r0, #0x0
    bne .L_4a8
    cmp r1, #0x2e
    beq .L_4a8
.L_534:
    cmp r1, #0x29
    movne r5, #0x1000
    bne .L_df4
    add r6, r6, #0x1
.L_544:
    add r0, sp, #0x56
    mov r1, #0x0
    strb r1, [r0, r6]
    ldr r1, [sp, #0x28]
    cmp r1, #0x0
    beq .L_578
    bl func_020a6bd4
    mov r2, r0
    mov r0, #0x0
    mov r3, r1
    mov r1, r0
    bl func_020b22ac
    b .L_57c
.L_578:
    bl func_020a6bd4
.L_57c:
    ldr r2, [sp, #0x2c]
    add r2, r2, r5
    add r3, r6, r2
    ldr r2, [sp, #0x18]
    add r3, r2, r3
    ldr r2, [sp, #0x4]
    add sp, sp, #0xa8
    str r3, [r2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5a0:
    mov r5, #0x1000
    b .L_df4
.L_5a8:
    cmp r1, #0x2e
    bne .L_5d0
    mov r5, #0x10
    add r4, r4, #0x1
    mov r0, r8
    mov r1, #0x0
    mov r2, r1
    blx r9
    mov r1, r0
    b .L_df4
.L_5d0:
    cmp r1, #0x0
    blt .L_5e0
    cmp r1, #0x80
    blt .L_5e8
.L_5e0:
    mov r0, #0x0
    b .L_5f8
.L_5e8:
    mov r2, r1, lsl #0x1
    ldr r0, _LIT2
    ldrh r0, [r0, r2]
    and r0, r0, #0x8
.L_5f8:
    cmp r0, #0x0
    moveq r5, #0x1000
    beq .L_df4
    cmp r1, #0x30
    bne .L_650
    add r4, r4, #0x1
    mov r0, r8
    mov r1, #0x0
    mov r2, r1
    blx r9
    cmp r0, #0x0
    mov r1, r0
    blt .L_63c
    cmp r0, #0x80
    bge .L_63c
    ldr r2, _LIT3
    ldrb r0, [r2, r0]
.L_63c:
    cmp r0, #0x58
    moveq r5, #0x8000
    moveq sl, #0x1
    movne r5, #0x4
    b .L_df4
.L_650:
    mov r5, #0x8
    b .L_df4
.L_658:
    cmp r1, #0x30
    movne r5, #0x8
    bne .L_df4
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_680:
    cmp r1, #0x0
    blt .L_690
    cmp r1, #0x80
    blt .L_698
.L_690:
    mov r0, #0x0
    b .L_6a8
.L_698:
    mov r2, r1, lsl #0x1
    ldr r0, _LIT2
    ldrh r0, [r0, r2]
    and r0, r0, #0x8
.L_6a8:
    cmp r0, #0x0
    bne .L_6dc
    cmp r1, #0x2e
    movne r5, #0x40
    bne .L_df4
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    mov r5, #0x20
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_6dc:
    ldrb r2, [sp, #0x84]
    cmp r2, #0x14
    ldrcs r0, [sp, #0x1c]
    addcs r0, r0, #0x1
    strcs r0, [sp, #0x1c]
    bcs .L_708
    add r0, r2, #0x1
    strb r0, [sp, #0x84]
    add r0, sp, #0x80
    add r0, r0, r2
    strb r1, [r0, #0x5]
.L_708:
    add r4, r4, #0x1
    mov r0, r8
    mov r1, #0x0
    mov r2, r1
    blx r9
    mov r1, r0
    b .L_df4
.L_724:
    cmp r1, #0x0
    blt .L_734
    cmp r1, #0x80
    blt .L_73c
.L_734:
    mov r0, #0x0
    b .L_74c
.L_73c:
    mov r2, r1, lsl #0x1
    ldr r0, _LIT2
    ldrh r0, [r0, r2]
    and r0, r0, #0x8
.L_74c:
    cmp r0, #0x0
    moveq r5, #0x1000
    movne r5, #0x20
    b .L_df4
.L_75c:
    cmp r1, #0x0
    blt .L_76c
    cmp r1, #0x80
    blt .L_774
.L_76c:
    mov r0, #0x0
    b .L_784
.L_774:
    mov r2, r1, lsl #0x1
    ldr r0, _LIT2
    ldrh r0, [r0, r2]
    and r0, r0, #0x8
.L_784:
    cmp r0, #0x0
    moveq r5, #0x40
    beq .L_df4
    ldrb r3, [sp, #0x84]
    cmp r3, #0x14
    bcs .L_7cc
    cmp r1, #0x30
    cmpeq r3, #0x0
    beq .L_7c0
    ldrb r2, [sp, #0x84]
    add r0, sp, #0x80
    add r0, r0, r3
    add r2, r2, #0x1
    strb r2, [sp, #0x84]
    strb r1, [r0, #0x5]
.L_7c0:
    ldr r0, [sp, #0x1c]
    sub r0, r0, #0x1
    str r0, [sp, #0x1c]
.L_7cc:
    add r4, r4, #0x1
    mov r0, r8
    mov r1, #0x0
    mov r2, r1
    blx r9
    mov r1, r0
    b .L_df4
.L_7e8:
    cmp r1, #0x0
    blt .L_7f8
    cmp r1, #0x80
    blt .L_800
.L_7f8:
    mov r0, r1
    b .L_808
.L_800:
    ldr r0, _LIT3
    ldrb r0, [r0, r1]
.L_808:
    cmp r0, #0x45
    movne r5, #0x800
    bne .L_df4
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    mov r5, #0x80
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_834:
    cmp r1, #0x2b
    bne .L_858
    add r4, r4, #0x1
    mov r0, r8
    mov r1, #0x0
    mov r2, r1
    blx r9
    mov r1, r0
    b .L_880
.L_858:
    cmp r1, #0x2d
    bne .L_880
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    mov r0, #0x1
    str r0, [sp, #0x24]
.L_880:
    mov r5, #0x100
    b .L_df4
.L_888:
    cmp r1, #0x0
    blt .L_898
    cmp r1, #0x80
    blt .L_8a0
.L_898:
    mov r0, #0x0
    b .L_8b0
.L_8a0:
    mov r2, r1, lsl #0x1
    ldr r0, _LIT2
    ldrh r0, [r0, r2]
    and r0, r0, #0x8
.L_8b0:
    cmp r0, #0x0
    moveq r5, #0x1000
    beq .L_df4
    cmp r1, #0x30
    movne r5, #0x400
    bne .L_df4
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    mov r5, #0x200
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_8e8:
    cmp r1, #0x30
    movne r5, #0x400
    bne .L_df4
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_910:
    cmp r1, #0x0
    blt .L_920
    cmp r1, #0x80
    blt .L_928
.L_920:
    mov r0, #0x0
    b .L_938
.L_928:
    mov r2, r1, lsl #0x1
    ldr r0, _LIT2
    ldrh r0, [r0, r2]
    and r0, r0, #0x8
.L_938:
    cmp r0, #0x0
    moveq r5, #0x800
    beq .L_df4
    ldr r0, [sp, #0x20]
    sub r2, r1, #0x30
    mov r1, #0xa
    mla r0, r1, r0, r2
    ldr r1, _LIT5
    str r0, [sp, #0x20]
    cmp r0, r1
    ldrgt r0, [sp, #0xd0]
    movgt r1, #0x1
    strgt r1, [r0]
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_988:
    cmp sl, #0x20
    bgt .L_9d8
    bge .L_cac
    cmp sl, #0x8
    bgt .L_9cc
    cmp sl, #0x0
    addge pc, pc, sl, lsl #0x2
    b .L_df4
    b .L_df4
    b .L_9fc
    b .L_a4c
    b .L_df4
    b .L_a74
    b .L_df4
    b .L_df4
    b .L_df4
    b .L_b84
.L_9cc:
    cmp sl, #0x10
    beq .L_c60
    b .L_df4
.L_9d8:
    cmp sl, #0x80
    bgt .L_9f0
    bge .L_d54
    cmp sl, #0x40
    beq .L_cf4
    b .L_df4
.L_9f0:
    cmp sl, #0x100
    beq .L_d7c
    b .L_df4
.L_9fc:
    mov r1, #0x0
    add r0, sp, #0x45
    str r0, [sp, #0x14]
    strb r1, [r0]
    strb r1, [r0, #0x1]
    strb r1, [r0, #0x2]
    strb r1, [r0, #0x3]
    strb r1, [r0, #0x4]
    strb r1, [r0, #0x5]
    strb r1, [r0, #0x6]
    strb r1, [r0, #0x7]
    mov r0, r8
    mov r2, r1
    str r1, [sp, #0x8]
    mov fp, r1
    mov sl, #0x2
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_a4c:
    cmp r1, #0x30
    movne sl, #0x4
    bne .L_df4
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_a74:
    cmp r1, #0x0
    blt .L_a84
    cmp r1, #0x80
    blt .L_a8c
.L_a84:
    mov r0, #0x0
    b .L_a9c
.L_a8c:
    mov r2, r1, lsl #0x1
    ldr r0, _LIT2
    ldrh r0, [r0, r2]
    and r0, r0, #0x400
.L_a9c:
    cmp r0, #0x0
    bne .L_ad0
    cmp r1, #0x2e
    movne sl, #0x10
    bne .L_df4
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    mov sl, #0x8
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_ad0:
    ldr r2, [sp, #0x8]
    mov r0, #0xe
    cmp r2, r0
    bcs .L_b68
    mov r0, r2
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x14]
    add r2, fp, fp, lsr #0x1f
    cmp r1, #0x0
    ldrb r0, [r0, r2, asr #0x1]
    blt .L_b10
    cmp r1, #0x80
    bge .L_b10
    ldr r2, _LIT3
    ldrb r1, [r2, r1]
.L_b10:
    cmp r1, #0x41
    subge r1, r1, #0x37
    sublt r1, r1, #0x30
    mov r2, fp, lsr #0x1f
    and r3, r1, #0xff
    rsb r1, r2, fp, lsl #0x1f
    adds r1, r2, r1, ror #0x1f
    moveq r1, r3, lsl #0x4
    add r2, fp, fp, lsr #0x1f
    orrne r0, r0, r3
    andeq r1, r1, #0xff
    orreq r0, r0, r1
    ldr r1, [sp, #0x14]
    add fp, fp, #0x1
    strb r0, [r1, r2, asr #0x1]
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_b68:
    add r4, r4, #0x1
    mov r0, r8
    mov r1, #0x0
    mov r2, r1
    blx r9
    mov r1, r0
    b .L_df4
.L_b84:
    cmp r1, #0x0
    blt .L_b94
    cmp r1, #0x80
    blt .L_b9c
.L_b94:
    mov r0, #0x0
    b .L_bac
.L_b9c:
    mov r2, r1, lsl #0x1
    ldr r0, _LIT2
    ldrh r0, [r0, r2]
    and r0, r0, #0x400
.L_bac:
    cmp r0, #0x0
    moveq sl, #0x10
    beq .L_df4
    ldr r2, [sp, #0x8]
    mov r0, #0xe
    cmp r2, r0
    bcs .L_c44
    ldr r0, [sp, #0x14]
    add r2, fp, fp, lsr #0x1f
    cmp r1, #0x0
    ldrb r0, [r0, r2, asr #0x1]
    blt .L_bec
    cmp r1, #0x80
    bge .L_bec
    ldr r2, _LIT3
    ldrb r1, [r2, r1]
.L_bec:
    cmp r1, #0x41
    subge r1, r1, #0x37
    sublt r1, r1, #0x30
    mov r2, fp, lsr #0x1f
    and r3, r1, #0xff
    rsb r1, r2, fp, lsl #0x1f
    adds r1, r2, r1, ror #0x1f
    moveq r1, r3, lsl #0x4
    add r2, fp, fp, lsr #0x1f
    orrne r0, r0, r3
    andeq r1, r1, #0xff
    orreq r0, r0, r1
    ldr r1, [sp, #0x14]
    add fp, fp, #0x1
    strb r0, [r1, r2, asr #0x1]
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_c44:
    add r4, r4, #0x1
    mov r0, r8
    mov r1, #0x0
    mov r2, r1
    blx r9
    mov r1, r0
    b .L_df4
.L_c60:
    cmp r1, #0x0
    blt .L_c70
    cmp r1, #0x80
    blt .L_c78
.L_c70:
    mov r0, r1
    b .L_c80
.L_c78:
    ldr r0, _LIT3
    ldrb r0, [r0, r1]
.L_c80:
    cmp r0, #0x50
    movne r5, #0x800
    bne .L_df4
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    mov sl, #0x20
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_cac:
    cmp r1, #0x2d
    moveq r0, #0x1
    streq r0, [sp, #0xc]
    beq .L_cd4
    cmp r1, #0x2b
    beq .L_cd4
    mov r0, r8
    mov r2, #0x1
    blx r9
    sub r4, r4, #0x1
.L_cd4:
    mov sl, #0x40
    add r4, r4, #0x1
    mov r0, r8
    mov r1, #0x0
    mov r2, r1
    blx r9
    mov r1, r0
    b .L_df4
.L_cf4:
    cmp r1, #0x0
    blt .L_d04
    cmp r1, #0x80
    blt .L_d0c
.L_d04:
    mov r0, #0x0
    b .L_d1c
.L_d0c:
    mov r2, r1, lsl #0x1
    ldr r0, _LIT2
    ldrh r0, [r0, r2]
    and r0, r0, #0x8
.L_d1c:
    cmp r0, #0x0
    moveq r5, #0x1000
    beq .L_df4
    cmp r1, #0x30
    movne sl, #0x100
    bne .L_df4
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    mov sl, #0x80
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_d54:
    cmp r1, #0x30
    movne sl, #0x100
    bne .L_df4
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r4, r4, #0x1
    blx r9
    mov r1, r0
    b .L_df4
.L_d7c:
    cmp r1, #0x0
    blt .L_d8c
    cmp r1, #0x80
    blt .L_d94
.L_d8c:
    mov r0, #0x0
    b .L_da4
.L_d94:
    mov r2, r1, lsl #0x1
    ldr r0, _LIT2
    ldrh r0, [r0, r2]
    and r0, r0, #0x8
.L_da4:
    cmp r0, #0x0
    moveq r5, #0x800
    beq .L_df4
    ldr r0, [sp, #0x10]
    sub r2, r1, #0x30
    mov r1, #0xa
    mla r0, r1, r0, r2
    str r0, [sp, #0x10]
    ldr r1, _LIT5
    ldr r0, [sp, #0x20]
    add r4, r4, #0x1
    cmp r0, r1
    ldrgt r0, [sp, #0xd0]
    movgt r1, #0x1
    strgt r1, [r0]
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    mov r1, r0
.L_df4:
    ldr r0, [sp]
    cmp r4, r0
    bgt .L_e14
    mvn r0, #0x0
    cmp r1, r0
    beq .L_e14
    tst r5, #0x1800
    beq .L_108
.L_e14:
    cmp r5, #0x8000
    beq .L_e30
    ldr r0, _LIT6
    tst r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    b .L_e54
.L_e30:
    sub r0, r4, #0x1
    cmp r0, #0x2
    ble .L_e48
    ldr r0, _LIT7
    tst sl, r0
    bne .L_e50
.L_e48:
    mov r0, #0x1
    b .L_e54
.L_e50:
    mov r0, #0x0
.L_e54:
    cmp r0, #0x0
    movne r2, #0x0
    ldrne r0, [sp, #0x4]
    bne .L_e74
    ldr r0, [sp, #0x2c]
    sub r2, r4, #0x1
    add r2, r2, r0
    ldr r0, [sp, #0x4]
.L_e74:
    str r2, [r0]
    mov r0, r8
    mov r2, #0x1
    blx r9
    cmp sl, #0x0
    bne .L_1078
    ldr r0, [sp, #0x24]
    ldrb r2, [sp, #0x84]
    cmp r0, #0x0
    ldrne r0, [sp, #0x20]
    rsbne r0, r0, #0x0
    strne r0, [sp, #0x20]
    add r0, sp, #0x85
    add r1, r0, r2
    b .L_ebc
.L_eb0:
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x1
    str r0, [sp, #0x1c]
.L_ebc:
    cmp r2, #0x0
    sub r2, r2, #0x1
    beq .L_ed4
    ldrb r0, [r1, #-1]!
    cmp r0, #0x30
    beq .L_eb0
.L_ed4:
    add r0, r2, #0x1
    strb r0, [sp, #0x84]
    ands r2, r0, #0xff
    bne .L_ef8
    add r1, r2, #0x1
    strb r1, [sp, #0x84]
    add r0, sp, #0x85
    mov r1, #0x30
    strb r1, [r0, r2]
.L_ef8:
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x1c]
    mov r2, #0x8000
    add r0, r1, r0
    rsb r2, r2, #0x0
    str r0, [sp, #0x20]
    cmp r0, r2
    blt .L_f20
    cmp r0, r2, lsr #0x11
    ble .L_f2c
.L_f20:
    ldr r0, [sp, #0xd0]
    mov r1, #0x1
    str r1, [r0]
.L_f2c:
    ldr r0, [sp, #0xd0]
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_f88
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    movne r0, #0x0
    addne sp, sp, #0xa8
    movne r1, r0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldreq r1, _LIT8
    addeq sp, sp, #0xa8
    ldmeqia r1, {r0, r1}
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT8
    mov r0, #0x0
    ldmia r1, {r2, r3}
    mov r1, r0
    bl func_020b22ac
    add sp, sp, #0xa8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f88:
    ldr r1, [sp, #0x20]
    add r0, sp, #0x80
    strh r1, [sp, #0x82]
    bl func_020b1094
    mov r4, r0
    mov r6, r1
    mov r0, #0x0
    mov r1, r0
    mov r2, r4
    mov r3, r6
    bl func_020b2ae8
    beq .L_1008
    mov r0, r4
    mov r1, r6
    mov r2, #0x0
    mov r3, #0x100000
    bl func_020b29c0
    bcs .L_1008
    ldr r0, [sp, #0xd0]
    mov r1, #0x1
    str r1, [r0]
    b .L_1034
_LIT0: .word data_020c378d
_LIT1: .word data_020c3788
_LIT2: .word data_020c3660
_LIT3: .word data_020c35e0
_LIT4: .word data_02102754
_LIT5: .word 0x00007fff
_LIT6: .word 0x00000e2c
_LIT7: .word 0x0000018e
_LIT8: .word data_0210275c
_LIT9: .word 0x7fefffff
.L_1008:
    ldr r3, _LIT9
    mov r0, r4
    mov r1, r6
    mvn r2, #0x0
    bl func_020b2884
    bls .L_1034
    ldr r0, [sp, #0xd0]
    mov r2, #0x1
    ldr r1, _LIT8
    str r2, [r0]
    ldmia r1, {r4, r6}
.L_1034:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_1068
    ldr r0, _LIT6
    tst r5, r0
    beq .L_1068
    mov r0, #0x0
    mov r1, r0
    mov r2, r4
    mov r3, r6
    bl func_020b22ac
    mov r4, r0
    mov r6, r1
.L_1068:
    add sp, sp, #0xa8
    mov r0, r4
    mov r1, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1078:
    ldr r0, [sp, #0xc]
    add r4, sp, #0x38
    cmp r0, #0x0
    ldrne r0, [sp, #0x10]
    ldrb r3, [sp, #0x45]
    rsbne r0, r0, #0x0
    strne r0, [sp, #0x10]
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x8]
    mov r2, #0x0
    add r0, r1, r0, lsl #0x2
    str r0, [sp, #0x10]
    mov r1, #0x80
    b .L_10c0
.L_10b0:
    ldr r0, [sp, #0x10]
    add r2, r2, #0x1
    sub r0, r0, #0x1
    str r0, [sp, #0x10]
.L_10c0:
    cmp r2, #0x4
    bcs .L_10d0
    tst r3, r1, asr r2
    beq .L_10b0
.L_10d0:
    adds r5, r2, #0x1
    beq .L_111c
    add r0, sp, #0x4c
    add r3, sp, #0x45
    str r0, [sp, #0x14]
    mov r1, #0x0
    cmp r0, r3
    bcc .L_111c
    rsb r6, r5, #0x8
.L_10f4:
    ldr r0, [sp, #0x14]
    ldrb r0, [r0]
    orr r2, r1, r0, lsl r5
    mov r1, r0, asr r6
    ldr r0, [sp, #0x14]
    and r1, r1, #0xff
    strb r2, [r0], #-1
    str r0, [sp, #0x14]
    cmp r0, r3
    bcs .L_10f4
.L_111c:
    mov r2, #0x0
    mov r6, r2
    strb r2, [r4]
    strb r2, [r4, #0x1]
    strb r2, [r4, #0x2]
    strb r2, [r4, #0x3]
    strb r2, [r4, #0x4]
    strb r2, [r4, #0x5]
    strb r2, [r4, #0x6]
    strb r2, [r4, #0x7]
    mov r3, #0xc
    mov r7, #0x1
    mov r0, #0xff
    add r1, sp, #0x45
.L_1154:
    add r5, r2, #0x8
    cmp r5, #0x34
    ldrb r5, [r1, r6]
    rsbhi r8, r2, #0x34
    and fp, r3, #0x7
    andhi r5, r5, r0, lsl r8
    andhi r5, r5, #0xff
    mov r8, r5, asr fp
    and r9, r8, #0xff
    ldrb sl, [r4, r7]
    rsb r8, fp, #0x8
    mov r5, r5, lsl r8
    orr r9, sl, r9
    strb r9, [r4, r7]
    add r7, r7, #0x1
    add r2, r2, #0x8
    ldrb r8, [r4, r7]
    and r5, r5, #0xff
    cmp r2, #0x34
    orr r5, r8, r5
    strb r5, [r4, r7]
    add r3, r3, #0x8
    add r6, r6, #0x1
    bcc .L_1154
    ldr r0, [sp, #0x10]
    mov r1, #0x800
    add r0, r0, #0xfe
    add r2, r0, #0x300
    rsb r1, r1, #0x0
    tst r2, r1
    beq .L_11ec
    ldr r2, [sp, #0xd0]
    mov r3, #0x1
    mov r0, #0x0
    add sp, sp, #0xa8
    mov r1, r0
    str r3, [r2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11ec:
    ldrb r0, [r4, #0x1]
    mov r2, r2, lsl #0x15
    ldrb r1, [r4]
    orr r0, r0, r2, lsr #0x11
    strb r0, [r4, #0x1]
    ldr r0, [sp, #0x28]
    orr r1, r1, r2, lsr #0x19
    cmp r0, #0x0
    andne r0, r1, #0xff
    strb r1, [r4]
    orrne r0, r0, #0x80
    strneb r0, [r4]
    mov r3, #0x0
.L_1220:
    rsb r1, r3, #0x7
    ldrb r2, [r4, r3]
    ldrb r0, [r4, r1]
    strb r0, [r4, r3]
    add r3, r3, #0x1
    strb r2, [r4, r1]
    cmp r3, #0x4
    blt .L_1220
    ldmia r4, {r0, r1}
    add sp, sp, #0xa8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
