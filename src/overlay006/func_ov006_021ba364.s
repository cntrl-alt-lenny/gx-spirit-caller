; func_ov006_021ba364 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104bac
        .extern data_ov000_021b1d4c
        .extern data_ov006_021cc0f4
        .extern data_ov006_021cc478
        .extern data_ov006_021cc588
        .extern data_ov006_0224f448
        .extern data_ov006_0225cb5c
        .extern data_ov006_0225de70
        .extern data_ov006_0225df3c
        .extern data_ov006_0225e068
        .extern data_ov006_0225e100
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02006194
        .extern func_0202bb20
        .extern func_0202bb54
        .extern func_02034784
        .extern func_020347b8
        .extern func_02036590
        .extern func_02037208
        .extern func_ov005_021aa4d0
        .extern func_ov006_021b6d1c
        .extern func_ov006_021b6f18
        .extern func_ov006_021b6f50
        .extern func_ov006_021b7cac
        .extern func_ov006_021b7ce0
        .extern func_ov006_021bb954
        .extern func_ov006_021bbdc0
        .extern func_ov006_021bbe7c
        .extern func_ov006_021bc0cc
        .extern func_ov006_021bc45c
        .extern func_ov006_021bcb94
        .extern func_ov006_021bcedc
        .extern func_ov006_021bd6bc
        .extern func_ov006_021bd700
        .extern func_ov006_021bd7cc
        .extern func_ov006_021bd8ac
        .extern func_ov006_021bdcdc
        .extern func_ov006_021bddd4
        .extern func_ov006_021be4d0
        .extern func_ov006_021be558
        .extern func_ov006_021be598
        .extern func_ov006_021be5b8
        .extern func_ov006_021be6f4
        .extern func_ov006_021be878
        .extern func_ov006_021be8c4
        .extern func_ov006_021be948
        .extern func_ov006_021bf454
        .extern func_ov006_021bf5e4
        .extern func_ov006_021bf844
        .extern func_ov006_021c0c14
        .extern func_ov006_021c0dc8
        .extern func_ov006_021c1658
        .extern func_ov006_021c1664
        .extern func_ov006_021c1678
        .extern func_ov006_021c6a58
        .extern func_ov006_021c6b2c
        .extern func_ov006_021c6b34
        .extern func_ov006_021c6bac
        .extern func_ov006_021c6bc0
        .extern func_ov006_021c6bd4
        .extern func_ov006_021c7584
        .extern func_ov006_021c7d08
        .extern func_ov006_021c8068
        .extern func_ov006_021c9efc
        .extern func_ov006_021ca3a0
        .extern func_ov006_021cac38
        .extern func_ov006_021cad34
        .extern func_ov006_021cada4
        .extern func_ov006_021cadbc
        .global func_ov006_021ba364
        .arm
func_ov006_021ba364:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x5c
    ldr r1, _LIT0
    mov r7, #0x0
    ldrh r4, [r1, #0x54]
    ldrh r5, [r1, #0x56]
    ldrh r6, [r1, #0x58]
    mov r9, r0
    sub r1, r7, #0x1
    str r1, [r9, #0x54]
    ldr r1, [r9, #0x40]
    str r7, [sp, #0xc]
    mov r8, r7
    cmp r1, #0x1
    ldr fp, _LIT1
    bne .L_84
    ldr r1, [r9, #0x74]
    cmp r1, #0x0
    beq .L_84
    bl func_ov006_021be8c4
    movs sl, r0
    bmi .L_80
    cmp sl, #0x14
    bgt .L_80
    ldr r0, [r9, #0x6c]
    cmp sl, r0
    beq .L_80
    mov r0, #0x8e
    sub r1, r0, #0x8f
    mov r2, r7
    mov r3, #0x1
    bl func_02037208
.L_80:
    str sl, [r9, #0x6c]
.L_84:
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq .L_bc
    mov r0, r9
    bl func_ov006_021bddd4
    cmp r0, #0x0
    beq .L_12a4
    mov r0, r9
    bl func_ov006_021be5b8
    mov r0, r9
    bl func_ov006_021be6f4
    mov r7, #0x1
    str r7, [sp, #0xc]
    b .L_12a4
.L_bc:
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_4b8
    ldr r0, _LIT2
    bl func_ov006_021c7584
    cmp r0, #0x0
    beq .L_12a4
    ldr r1, [r9, #0x50]
    ldr r0, _LIT2
    add r4, r9, #0xa0
    ldr r2, [r0, #0x6c]
    mov r3, #0x24
    mla r4, r1, r3, r4
    cmp r2, #0x0
    ldr r0, [r0, #0x74]
    blt .L_48c
    cmp r0, #0x1d
    addls pc, pc, r0, lsl #0x2
    b .L_48c
    b .L_190
    b .L_190
    b .L_190
    b .L_190
    b .L_190
    b .L_190
    b .L_190
    b .L_190
    b .L_190
    b .L_190
    b .L_190
    b .L_190
    b .L_190
    b .L_270
    b .L_2a4
    b .L_2e4
    b .L_324
    b .L_364
    b .L_3a4
    b .L_3e4
    b .L_420
    b .L_460
    b .L_460
    b .L_460
    b .L_460
    b .L_460
    b .L_460
    b .L_460
    b .L_460
    b .L_460
.L_190:
    cmp r2, #0x7
    addls pc, pc, r2, lsl #0x2
    b .L_48c
    b .L_1bc
    b .L_1c4
    b .L_1cc
    b .L_1d4
    b .L_1c4
    b .L_208
    b .L_23c
    b .L_23c
.L_1bc:
    mov r1, #0x0
    b .L_1d8
.L_1c4:
    mov r1, #0x1
    b .L_1d8
.L_1cc:
    mov r1, #0x2
    b .L_1d8
.L_1d4:
    mov r1, #0x3
.L_1d8:
    mov r0, #0x1
    str r0, [r9, #0x88]
    str r1, [r9, #0x8c]
    ldr r0, [r9, #0x50]
    str r0, [r9, #0x90]
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    bne .L_48c
    ldr r0, _LIT2
    ldr r0, [r0, #0x70]
    str r0, [r9, #0x90]
    b .L_48c
.L_208:
    mov r0, r9
    bl func_ov006_021bd6bc
    ldr r1, [r4, #0x20]
    mov r2, r0
    mov r0, r1, lsl #0x1f
    mov r3, r0, lsr #0x1f
    ldr r0, _LIT3
    ldr r1, [r9, #0x50]
    bl func_ov006_021b6d1c
    mov r1, #0x2
    str r1, [r9, #0x88]
    str r0, [r9, #0x8c]
    b .L_48c
.L_23c:
    mov r0, r9
    bl func_ov006_021bd6bc
    ldr r1, [r4, #0x20]
    mov r2, r0
    mov r0, r1, lsl #0x1f
    mov r3, r0, lsr #0x1f
    ldr r0, _LIT3
    ldr r1, [r9, #0x50]
    bl func_ov006_021b6d1c
    mov r1, #0x3
    str r1, [r9, #0x88]
    str r0, [r9, #0x8c]
    b .L_48c
.L_270:
    ldr r0, _LIT2
    mov r1, #0x1
    bl func_ov006_021c8068
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    bl func_ov006_021b7cac
    cmp r4, r0
    beq .L_48c
    mov r0, #0x4
    str r0, [r9, #0x88]
    str r4, [r9, #0x8c]
    b .L_48c
.L_2a4:
    ldr r0, _LIT2
    mov r1, #0x2
    bl func_ov006_021c8068
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x0
    bl func_ov006_021b7ce0
    cmp r4, r0
    beq .L_48c
    mov r0, #0x5
    str r0, [r9, #0x88]
    mov r0, #0x0
    str r0, [r9, #0x8c]
    str r4, [r9, #0x90]
    b .L_48c
.L_2e4:
    ldr r0, _LIT2
    mov r1, #0x3
    bl func_ov006_021c8068
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x1
    bl func_ov006_021b7ce0
    cmp r4, r0
    beq .L_48c
    mov r0, #0x5
    str r0, [r9, #0x88]
    mov r0, #0x1
    str r0, [r9, #0x8c]
    str r4, [r9, #0x90]
    b .L_48c
.L_324:
    ldr r0, _LIT2
    mov r1, #0x4
    bl func_ov006_021c8068
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x2
    bl func_ov006_021b7ce0
    cmp r4, r0
    beq .L_48c
    mov r0, #0x5
    str r0, [r9, #0x88]
    mov r0, #0x2
    str r0, [r9, #0x8c]
    str r4, [r9, #0x90]
    b .L_48c
.L_364:
    ldr r0, _LIT2
    mov r1, #0x5
    bl func_ov006_021c8068
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x3
    bl func_ov006_021b7ce0
    cmp r4, r0
    beq .L_48c
    mov r0, #0x5
    str r0, [r9, #0x88]
    mov r0, #0x3
    str r0, [r9, #0x8c]
    str r4, [r9, #0x90]
    b .L_48c
.L_3a4:
    ldr r0, _LIT2
    mov r1, #0x6
    bl func_ov006_021c8068
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x4
    bl func_ov006_021b7ce0
    cmp r4, r0
    beq .L_48c
    mov r0, #0x5
    str r0, [r9, #0x88]
    mov r0, #0x4
    str r0, [r9, #0x8c]
    str r4, [r9, #0x90]
    b .L_48c
.L_3e4:
    ldr r0, _LIT2
    mov r1, #0x7
    bl func_ov006_021c8068
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x5
    bl func_ov006_021b7ce0
    cmp r4, r0
    beq .L_48c
    mov r0, #0x5
    str r0, [r9, #0x88]
    str r0, [r9, #0x8c]
    str r4, [r9, #0x90]
    b .L_48c
.L_420:
    ldr r0, _LIT2
    mov r1, #0x8
    bl func_ov006_021c8068
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x6
    bl func_ov006_021b7ce0
    cmp r4, r0
    beq .L_48c
    mov r0, #0x5
    str r0, [r9, #0x88]
    mov r0, #0x6
    str r0, [r9, #0x8c]
    str r4, [r9, #0x90]
    b .L_48c
.L_460:
    ldr r3, [r4, #0x20]
    ldr r0, _LIT3
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6f18
    mov r2, r0
    ldr r1, [r9, #0x50]
    mov r0, r9
    bl func_ov006_021bd700
    cmp r0, #0x0
    movne r7, #0x1
.L_48c:
    cmp r7, #0x0
    beq .L_4ac
    mov r0, r9
    bl func_ov006_021be5b8
    mov r0, r9
    bl func_ov006_021be6f4
    mov r0, #0x1
    str r0, [sp, #0xc]
.L_4ac:
    ldr r0, _LIT2
    bl func_ov006_021c7d08
    b .L_12a4
.L_4b8:
    ldr r0, _LIT4
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_564
    ldr r0, _LIT4
    bl func_ov006_021c9efc
    cmp r0, #0x0
    beq .L_12a4
    ldr r0, _LIT4
    ldr r1, [r0, #0x4c]
    ldr r2, [r0, #0x48]
    sub r0, r1, #0x12
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_558
    b .L_518
    b .L_558
    b .L_53c
    b .L_518
    b .L_558
    b .L_518
.L_518:
    cmp r2, #0x0
    bne .L_558
    ldr r0, _LIT4
    bl func_ov006_021ca3a0
    mov r0, #0x0
    str r0, [r9, #0x44]
    add sp, sp, #0x5c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_53c:
    ldr r0, _LIT4
    bl func_ov006_021ca3a0
    mov r0, #0x2
    str r0, [r9, #0x44]
    add sp, sp, #0x5c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_558:
    ldr r0, _LIT4
    bl func_ov006_021ca3a0
    b .L_12a4
.L_564:
    ldr r0, _LIT5
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_628
    ldr r0, _LIT5
    bl func_ov006_021cac38
    cmp r0, #0x0
    beq .L_12a4
    add r0, sp, #0x1c
    add r1, sp, #0x18
    bl func_02006110
    ldr r0, [r9, #0x50]
    mov r3, #0x0
    cmp r0, #0x4
    movne r1, #0x1
    moveq r1, #0x0
    add r0, sp, #0x50
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r2, [sp, #0x18]
    mov r0, r9
    bl func_ov006_021be948
    ldr r0, [sp, #0x50]
    cmp r0, #0x1
    bne .L_5fc
    ldr r1, [sp, #0x54]
    cmp r1, #0xe
    blt .L_5fc
    cmp r1, #0x11
    bgt .L_5fc
    mov r0, #0x1
    str r0, [r9, #0x88]
    sub r0, r1, #0xe
    str r0, [r9, #0x8c]
    ldr r0, [r9, #0x58]
    str r0, [r9, #0x90]
    b .L_61c
.L_5fc:
    cmp r0, #0x4
    bne .L_61c
    mov r0, #0x1
    str r0, [r9, #0x88]
    ldr r0, [r9, #0x50]
    str r0, [r9, #0x8c]
    ldr r0, [r9, #0x58]
    str r0, [r9, #0x90]
.L_61c:
    ldr r0, _LIT5
    bl func_ov006_021cada4
    b .L_12a4
.L_628:
    ldr r0, [r9, #0x7c]
    cmp r0, #0x0
    beq .L_12a4
    bl func_02006194
    cmp r0, #0x0
    bne .L_64c
    bl func_0200617c
    cmp r0, #0x0
    beq .L_9e0
.L_64c:
    add r0, sp, #0x14
    add r1, sp, #0x10
    bl func_02006110
    ldr r1, [r9, #0x50]
    add r2, r9, #0xa0
    mov r0, #0x24
    mla r5, r1, r0, r2
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_6ac
    mov r0, fp
    ldr r4, [r5, #0x8]
    bl func_ov005_021aa4d0
    ldr r0, [fp, #0x4]
    str r0, [r5, #0x8]
    ldr r0, [fp, #0x10]
    str r0, [r5, #0x4]
    ldr r0, [r5, #0x8]
    cmp r0, r4
    ldr r0, [fp, #0x18]
    movne r7, #0x1
    cmp r0, #0x0
    bne .L_12a4
.L_6ac:
    mov r1, #0x0
    add r0, sp, #0x44
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x10]
    mov r0, r9
    mov r3, #0x1
    bl func_ov006_021be948
    cmp r0, #0x0
    beq .L_80c
    ldr r0, [sp, #0x44]
    cmp r0, #0x1
    beq .L_6f0
    cmp r0, #0x2
    beq .L_7dc
    b .L_80c
.L_6f0:
    ldr r4, [sp, #0x48]
    str r4, [r9, #0x54]
    cmp r4, #0x0
    blt .L_784
    cmp r4, #0xd
    bgt .L_784
    cmp r4, #0x0
    cmpne r4, #0x5
    beq .L_784
    ldr r0, [r9, #0x40]
    cmp r0, #0x0
    beq .L_730
    cmp r0, #0x2
    beq .L_73c
    cmp r0, #0x3
    bne .L_748
.L_730:
    ldr r3, _LIT6
    mov r2, #0xc
    b .L_750
.L_73c:
    ldr r3, _LIT7
    mov r2, #0xb
    b .L_750
.L_748:
    ldr r3, _LIT8
    mov r2, #0x3
.L_750:
    cmp r2, #0x0
    mov r1, #0x0
    ble .L_77c
.L_75c:
    ldr r0, [r3, #0x8]
    cmp r0, r4
    streq r1, [r9, #0x4c]
    beq .L_77c
    add r3, r3, #0xc
    add r1, r1, #0x1
    cmp r1, r2
    blt .L_75c
.L_77c:
    mov r0, #0x0
    str r0, [r9, #0x48]
.L_784:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_80c
    ldr r0, [sp, #0x48]
    cmp r0, #0x16
    blt .L_80c
    cmp r0, #0x1d
    bgt .L_80c
    cmp r0, #0x16
    blt .L_7bc
    cmp r0, #0x19
    suble r1, r0, #0x16
    ble .L_7c0
.L_7bc:
    sub r1, r0, #0x1a
.L_7c0:
    ldr r0, [r5, #0x4]
    cmp r1, r0
    str r1, [r5, #0x4]
    mov r0, #0x1
    movne r8, #0x1
    str r0, [r9, #0x48]
    b .L_80c
.L_7dc:
    ldr r2, [sp, #0x48]
    ldr r0, [r5]
    cmp r2, r0
    ldreq r1, [sp, #0x4c]
    ldreq r0, [r5, #0x4]
    cmpeq r1, r0
    str r2, [r5]
    ldr r1, [sp, #0x4c]
    mov r0, #0x1
    str r1, [r5, #0x4]
    movne r8, #0x1
    str r0, [r9, #0x48]
.L_80c:
    bl func_02006164
    cmp r0, #0x0
    beq .L_834
    ldr r0, [sp, #0x44]
    str r0, [r9, #0x94]
    ldr r1, [sp, #0x48]
    ldr r0, [sp, #0x4c]
    str r1, [r9, #0x98]
    str r0, [r9, #0x9c]
    b .L_894
.L_834:
    bl func_0200617c
    cmp r0, #0x0
    beq .L_894
    ldr r1, [sp, #0x44]
    ldr r0, [r9, #0x94]
    cmp r1, r0
    bne .L_870
    ldr r3, [sp, #0x48]
    ldr r2, [sp, #0x4c]
    ldr r0, [r9, #0x9c]
    ldr r1, [r9, #0x98]
    cmp r2, r0
    cmpeq r3, r1
    moveq r0, #0x1
    beq .L_874
.L_870:
    mov r0, #0x0
.L_874:
    cmp r0, #0x0
    beq .L_894
    mov r0, r9
    bl func_ov006_021bb954
    cmp r0, #0x0
    addne sp, sp, #0x5c
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_894:
    bl func_02006164
    cmp r0, #0x0
    beq .L_12a4
    ldr r0, [r9, #0x40]
    cmp r0, #0x3
    bhi .L_12a4
    ldr r0, [sp, #0x44]
    cmp r0, #0x2
    bne .L_970
    ldr r1, [r9, #0x50]
    cmp r1, #0x4
    beq .L_970
    mov r0, r9
    bl func_ov006_021bd6bc
    movs r2, r0
    bmi .L_12a4
    ldr r0, [r5, #0x20]
    ldr r1, [r9, #0x50]
    mov r3, r0, lsl #0x1f
    ldr r0, _LIT3
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    mov r4, r0
    ldr r0, _LIT3
    ldr r1, [r9, #0x50]
    mov r2, r4
    bl func_ov006_021b6f50
    cmp r0, #0x0
    ble .L_12a4
    mov r0, #0x38
    mov r1, #0x0
    bl func_02036590
    mov r0, #0x83
    sub r1, r0, #0x84
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r2, [r5, #0x20]
    ldr r0, _LIT5
    mov r2, r2, lsl #0x1f
    ldr r1, [r9, #0x50]
    mov r2, r2, lsr #0x1f
    bl func_ov006_021cadbc
    ldr r1, [r5, #0x4]
    ldr r0, _LIT5
    stmia sp, {r1, r4}
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x10]
    ldr r3, [r5]
    sub r1, r1, #0x10
    sub r2, r2, #0x10
    bl func_ov006_021cad34
    ldr r0, [r9, #0x50]
    str r0, [r9, #0x58]
    b .L_12a4
.L_970:
    cmp r0, #0x3
    bne .L_12a4
    mov r0, #0x38
    mov r1, #0x0
    bl func_02036590
    mov r0, #0x83
    sub r1, r0, #0x84
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, _LIT5
    ldr r1, [r9, #0x50]
    mov r2, #0x1
    bl func_ov006_021cadbc
    ldr r1, [r5, #0x4]
    ldr r0, _LIT5
    str r1, [sp]
    ldr r1, [sp, #0x4c]
    str r1, [sp, #0x4]
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x10]
    ldr r3, [r5]
    sub r1, r1, #0x10
    sub r2, r2, #0x10
    bl func_ov006_021cad34
    ldr r0, [sp, #0x48]
    str r0, [r9, #0x58]
    b .L_12a4
.L_9e0:
    ands r1, r4, #0x1
    beq .L_a74
    ldr r0, [r9, #0x48]
    cmp r0, #0x0
    bne .L_a74
    ldr r0, [r9, #0x40]
    cmp r0, #0x0
    beq .L_a10
    cmp r0, #0x2
    beq .L_a24
    cmp r0, #0x3
    bne .L_a38
.L_a10:
    ldr r1, [r9, #0x4c]
    ldr r2, _LIT6
    mov r0, #0xc
    mla r0, r1, r0, r2
    b .L_a48
.L_a24:
    ldr r1, [r9, #0x4c]
    ldr r2, _LIT7
    mov r0, #0xc
    mla r0, r1, r0, r2
    b .L_a48
.L_a38:
    ldr r1, [r9, #0x4c]
    ldr r2, _LIT8
    mov r0, #0xc
    mla r0, r1, r0, r2
.L_a48:
    ldr r1, [r0, #0x8]
    mov r0, r9
    str r1, [r9, #0x54]
    bl func_ov006_021bb954
    cmp r0, #0x0
    addne sp, sp, #0x5c
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mvn r0, #0x0
    str r0, [r9, #0x54]
    b .L_12a4
.L_a74:
    cmp r1, #0x0
    beq .L_ae0
    ldr r0, [r9, #0x48]
    cmp r0, #0x1
    bne .L_ae0
    ldr r0, [r9, #0x40]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_12a4
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
.L_aa8:
    ldr r1, [r9, #0x50]
    mov r0, r9
    bl func_ov006_021bd7cc
    mov r7, r0
    mov r0, r9
    bl func_ov006_021bd8ac
    cmp r0, #0x0
    beq .L_12a4
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_12a4
.L_ae0:
    ands r1, r4, #0x2
    beq .L_b50
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    bne .L_b50
    mov r0, #0x91
    sub r1, r0, #0x92
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r9, #0x5c]
    mov r0, r9
    str r1, [r9, #0x50]
    bl func_ov006_021bbdc0
    mov r0, r9
    bl func_ov006_021be5b8
    mov r0, r9
    bl func_ov006_021be6f4
    mov r0, r9
    mov r7, #0x1
    bl func_ov006_021c0c14
    mov r1, #0x0
    mov r0, r9
    mov r2, r7
    mov r3, r1
    str r1, [sp]
    bl func_ov006_021bc45c
    b .L_12a4
.L_b50:
    cmp r1, #0x0
    beq .L_c30
    ldr r0, [r9, #0x40]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_c08
    b .L_b78
    b .L_bb0
    b .L_be8
    b .L_b78
.L_b78:
    mov r0, r9
    bl func_ov006_021be4d0
    cmp r0, #0x0
    mov r2, #0x0
    mov r3, #0x1
    beq .L_ba0
    mov r0, #0x46
    sub r1, r0, #0x47
    bl func_02037208
    b .L_12a4
.L_ba0:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_02037208
    b .L_12a4
.L_bb0:
    mov r0, r9
    bl func_ov006_021be558
    cmp r0, #0x0
    mov r2, #0x0
    mov r3, #0x1
    beq .L_bd8
    mov r0, #0x46
    sub r1, r0, #0x47
    bl func_02037208
    b .L_12a4
.L_bd8:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_02037208
    b .L_12a4
.L_be8:
    mov r0, r9
    bl func_ov006_021be598
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_12a4
.L_c08:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x0
    str r0, [r9, #0x44]
    add sp, sp, #0x5c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c30:
    tst r4, #0x4
    beq .L_c6c
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, r9
    bl func_ov006_021bdcdc
    mov r0, r9
    bl func_ov006_021be5b8
    mov r0, r9
    bl func_ov006_021be6f4
    mov r7, #0x1
    b .L_12a4
.L_c6c:
    tst r4, #0x400
    beq .L_ca0
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r9, #0x48]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9, #0x48]
    b .L_12a4
.L_ca0:
    ands r1, r4, #0x300
    ldrne r0, [r9, #0x40]
    cmpne r0, #0x6
    ldrne r0, [r9, #0x50]
    cmpne r0, #0x4
    beq .L_dc0
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_d28
    b .L_cf8
    b .L_d04
    b .L_d10
    b .L_cf8
    b .L_d28
    b .L_cf8
    b .L_d1c
.L_cf8:
    mov r1, #0x0
    mov r2, #0x3
    b .L_d30
.L_d04:
    mov r1, #0x1
    mov r2, #0x2
    b .L_d30
.L_d10:
    mov r1, #0x0
    mov r2, #0x1
    b .L_d30
.L_d1c:
    mov r1, #0x0
    mov r2, r1
    b .L_d30
.L_d28:
    mov r1, #0x1
    mov r2, #0x3
.L_d30:
    tst r4, #0x200
    beq .L_d50
    ldr r0, [r9, #0x50]
    sub r0, r0, #0x1
    str r0, [r9, #0x50]
    cmp r0, r1
    strlt r2, [r9, #0x50]
    b .L_d6c
.L_d50:
    tst r4, #0x100
    beq .L_d6c
    ldr r0, [r9, #0x50]
    add r0, r0, #0x1
    str r0, [r9, #0x50]
    cmp r0, r2
    strgt r1, [r9, #0x50]
.L_d6c:
    mov r0, r9
    bl func_ov006_021bbdc0
    mov r0, r9
    bl func_ov006_021be5b8
    mov r0, r9
    bl func_ov006_021be6f4
    mov r0, r9
    mov r7, #0x1
    bl func_ov006_021c0c14
    ldr r0, [r9, #0x40]
    cmp r0, #0x5
    bne .L_da4
    mov r0, r9
    bl func_ov006_021bf454
.L_da4:
    mov r1, #0x0
    mov r0, r9
    mov r3, r1
    mov r2, #0x1
    str r1, [sp]
    bl func_ov006_021bc45c
    b .L_12a4
.L_dc0:
    cmp r1, #0x0
    beq .L_e38
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    bne .L_e38
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    tst r4, #0x200
    beq .L_e10
    ldr r0, _LIT9
    bl func_ov006_021c6bd4
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT9
    movne r1, #0x0
    bl func_ov006_021c6bc0
    b .L_12a4
.L_e10:
    tst r4, #0x100
    beq .L_12a4
    ldr r0, _LIT10
    bl func_ov006_021c1678
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT10
    movne r1, #0x0
    bl func_ov006_021c1664
    b .L_12a4
.L_e38:
    tst r5, #0x30
    beq .L_f14
    ldr r0, [r9, #0x48]
    cmp r0, #0x0
    bne .L_f14
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    ldr r0, [r9, #0x40]
    bne .L_e8c
    cmp r0, #0x0
    cmpne r0, #0x3
    moveq r1, #0x1
    moveq r2, #0x3
    movne r1, #0x0
    movne r2, #0x2
    b .L_ed4
.L_e8c:
    cmp r0, #0x0
    beq .L_ea8
    cmp r0, #0x2
    beq .L_eb4
    cmp r0, #0x3
    beq .L_ec0
    b .L_ecc
.L_ea8:
    mov r1, #0x0
    mov r2, #0xb
    b .L_ed4
.L_eb4:
    mov r1, #0x0
    mov r2, #0xa
    b .L_ed4
.L_ec0:
    mov r1, #0x1
    mov r2, #0xb
    b .L_ed4
.L_ecc:
    mov r1, #0x0
    mov r2, #0x2
.L_ed4:
    tst r5, #0x20
    beq .L_ef4
    ldr r0, [r9, #0x4c]
    sub r0, r0, #0x1
    str r0, [r9, #0x4c]
    cmp r0, r1
    strlt r2, [r9, #0x4c]
    b .L_12a4
.L_ef4:
    tst r5, #0x10
    beq .L_12a4
    ldr r0, [r9, #0x4c]
    add r0, r0, #0x1
    str r0, [r9, #0x4c]
    cmp r0, r2
    strgt r1, [r9, #0x4c]
    b .L_12a4
.L_f14:
    ands r0, r4, #0x80
    str r0, [sp, #0x8]
    beq .L_f78
    ldr r0, [r9, #0x48]
    cmp r0, #0x0
    bne .L_f78
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    str r0, [r9, #0x48]
    b .L_12a4
_LIT0: .word data_02104bac
_LIT1: .word data_ov000_021b1d4c
_LIT2: .word data_ov006_0225df3c
_LIT3: .word data_ov006_0224f448
_LIT4: .word data_ov006_0225e068
_LIT5: .word data_ov006_0225e100
_LIT6: .word data_ov006_021cc588
_LIT7: .word data_ov006_021cc478
_LIT8: .word data_ov006_021cc0f4
_LIT9: .word data_ov006_0225de70
_LIT10: .word data_ov006_0225cb5c
.L_f78:
    tst r6, #0xf0
    beq .L_12a4
    ldr r0, [r9, #0x48]
    cmp r0, #0x1
    bne .L_12a4
    ldr r7, [r9, #0x50]
    add r1, r9, #0xa0
    mov r0, #0x24
    mla r5, r7, r0, r1
    mov ip, r5
    ldmia ip!, {r0, r1, r2, r3}
    add sl, sp, #0x20
    stmia sl!, {r0, r1, r2, r3}
    ldmia ip!, {r0, r1, r2, r3}
    stmia sl!, {r0, r1, r2, r3}
    ldr r0, [ip]
    cmp r7, #0x4
    str r0, [sl]
    moveq sl, #0x3
    mov r1, r7
    mov r0, r9
    movne sl, #0x4
    bl func_ov006_021bd7cc
    mov r7, r0
    tst r6, #0x40
    beq .L_1090
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_1068
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    ldreq r0, [r5, #0x4]
    cmpeq r0, #0x0
    bne .L_100c
    tst r4, #0x40
    beq .L_1264
.L_100c:
    ldr r0, [r5, #0x4]
    subs r0, r0, #0x1
    str r0, [r5, #0x4]
    bpl .L_1264
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    bne .L_103c
    ldr r1, [r5, #0x10]
    sub r0, sl, #0x1
    sub r1, r1, sl
    stmib r5, {r0, r1}
    b .L_1060
.L_103c:
    sub r0, r0, #0x1
    str r0, [r5, #0x8]
    ldr r0, [r5, #0x4]
    cmp r7, #0x0
    add r0, r0, #0x1
    str r0, [r5, #0x4]
    ldreq r0, [r9, #0x70]
    orreq r0, r0, #0x1
    streq r0, [r9, #0x70]
.L_1060:
    mov r7, #0x1
    b .L_1264
.L_1068:
    ldr r0, [r5, #0x4]
    subs r0, r0, #0x1
    str r0, [r5, #0x4]
    bpl .L_1264
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    moveq r0, #0x0
    subne r0, r0, #0x1
    str r0, [r5, #0x4]
    b .L_1264
.L_1090:
    tst r6, #0x80
    ldr r0, [r5, #0x20]
    beq .L_1164
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_1144
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x8]
    sub r0, r0, sl
    cmp r1, r0
    blt .L_10d4
    ldr r1, [r5, #0x4]
    sub r0, sl, #0x1
    cmp r1, r0
    ldreq r0, [sp, #0x8]
    cmpeq r0, #0x0
    beq .L_1264
.L_10d4:
    ldr r0, [r5, #0x4]
    add r0, r0, #0x1
    str r0, [r5, #0x4]
    cmp r0, sl
    blt .L_1264
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x8]
    sub r0, r0, sl
    cmp r1, r0
    blt .L_110c
    mov r0, #0x0
    str r0, [r5, #0x8]
    str r0, [r5, #0x4]
    b .L_113c
.L_110c:
    add r0, r1, #0x1
    str r0, [r5, #0x8]
    ldr r0, [r5, #0x4]
    cmp r7, #0x0
    sub r0, r0, #0x1
    str r0, [r5, #0x4]
    bne .L_113c
    ldr r2, [r9, #0x70]
    sub r0, sl, #0x1
    mov r1, #0x1
    orr r0, r2, r1, lsl r0
    str r0, [r9, #0x70]
.L_113c:
    mov r7, #0x1
    b .L_1264
.L_1144:
    ldr r0, [r5, #0x4]
    add r1, r0, #0x1
    str r1, [r5, #0x4]
    ldr r0, [r5, #0x10]
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r5, #0x4]
    b .L_1264
.L_1164:
    mov r1, r0, lsl #0x1f
    movs r1, r1, lsr #0x1f
    beq .L_11b4
    tst r6, #0x20
    beq .L_1190
    ldr r0, [r5]
    subs r0, r0, #0x1
    str r0, [r5]
    movmi r0, #0x9
    strmi r0, [r5]
    b .L_1264
.L_1190:
    tst r6, #0x10
    beq .L_1264
    ldr r0, [r5]
    add r0, r0, #0x1
    str r0, [r5]
    cmp r0, #0xa
    movge r0, #0x0
    strge r0, [r5]
    b .L_1264
.L_11b4:
    tst r6, #0x20
    beq .L_11fc
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    streq r0, [r5, #0x4]
    beq .L_1264
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x4]
    beq .L_1264
    subs r0, r0, sl
    str r0, [r5, #0x8]
    movmi r0, #0x0
    strmi r0, [r5, #0x8]
    mov r7, #0x1
    b .L_1264
.L_11fc:
    tst r6, #0x10
    beq .L_1264
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_122c
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    moveq r0, #0x0
    ldrne r0, [r5, #0x10]
    subne r0, r0, #0x1
    str r0, [r5, #0x4]
    b .L_1264
.L_122c:
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x8]
    sub r0, r0, sl
    cmp r1, r0
    subge r0, sl, #0x1
    strge r0, [r5, #0x4]
    bge .L_1264
    add r1, r1, sl
    str r1, [r5, #0x8]
    ldr r0, [r5, #0x10]
    mov r7, #0x1
    sub r0, r0, sl
    cmp r1, r0
    strge r0, [r5, #0x8]
.L_1264:
    ldr r1, [r5]
    ldr r0, [sp, #0x20]
    cmp r1, r0
    ldreq r1, [r5, #0x4]
    ldreq r0, [sp, #0x24]
    cmpeq r1, r0
    ldreq r1, [r5, #0x8]
    ldreq r0, [sp, #0x28]
    cmpeq r1, r0
    beq .L_12a4
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r8, #0x1
.L_12a4:
    ldr r0, [r9, #0x40]
    cmp r0, #0x1
    bne .L_1390
    ldr r0, [r9, #0x74]
    cmp r0, #0x0
    beq .L_1390
    mov r0, r9
    bl func_ov006_021be8c4
    cmp r0, #0x0
    bne .L_1390
    ldr r0, _LIT4
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_12f8
    ldr r0, _LIT4
    ldr r0, [r0, #0x4c]
    cmp r0, #0x14
    beq .L_1390
.L_12f8:
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_131c
    ldr r0, _LIT2
    bl func_ov006_021c7d08
.L_131c:
    ldr r0, _LIT4
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_1340
    ldr r0, _LIT4
    bl func_ov006_021ca3a0
.L_1340:
    ldr r0, _LIT5
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_1358
    ldr r0, _LIT5
    bl func_ov006_021cada4
.L_1358:
    mov r0, #0x8e
    mov r1, #0x0
    bl func_02036590
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x6
    str r0, [r9, #0x88]
    mov r0, #0x14
    str r0, [r9, #0x8c]
    mov r0, #0x0
    str r0, [r9, #0x90]
.L_1390:
    ldr r0, [r9, #0x40]
    sub r0, r0, #0x1
    cmp r0, #0x1
    bhi .L_13cc
    bl func_02034784
    cmp r0, #0x0
    beq .L_13cc
    bl func_020347b8
    cmp r0, #0x0
    bne .L_13cc
    mov r0, #0x3
    str r0, [r9, #0x44]
    add sp, sp, #0x5c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13cc:
    ldr r2, [r9, #0x50]
    add r1, r9, #0xa0
    mov r0, #0x24
    mla r4, r2, r0, r1
    ldr r0, [r4, #0x20]
    cmp r2, #0x4
    moveq r6, #0x3
    mov r0, r0, lsl #0x1e
    movne r6, #0x4
    movs r0, r0, lsr #0x1f
    beq .L_1428
    ldr r1, [r4, #0x10]
    ldr r0, [r4, #0x8]
    sub r0, r1, r0
    cmp r0, r6
    bge .L_1428
.L_140c:
    ldr r0, [r4, #0x8]
    sub r1, r0, #0x1
    str r1, [r4, #0x8]
    ldr r0, [r4, #0x10]
    sub r0, r0, r1
    cmp r0, r6
    blt .L_140c
.L_1428:
    ldr r1, [r9, #0x50]
    mov r0, r9
    bl func_ov006_021bd6bc
    movs r2, r0
    movmi sl, #0x0
    bmi .L_145c
    ldr r0, [r4, #0x20]
    ldr r1, [r9, #0x50]
    mov r3, r0, lsl #0x1f
    ldr r0, _LIT3
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    mov sl, r0
.L_145c:
    mov r0, sl
    bl func_0202bb20
    mov r5, r0
    mov r0, sl
    bl func_0202bb54
    cmp r5, #0x0
    cmpne r0, #0x0
    movne r1, sl
    ldr r0, _LIT10
    moveq r1, #0x0
    bl func_ov006_021c1658
    ldr r0, _LIT9
    bl func_ov006_021c6b2c
    cmp r0, #0x0
    bne .L_14c4
    ldr r0, _LIT9
    mov r1, #0x1
    bl func_ov006_021c6a58
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    bne .L_14c4
    cmp r5, #0x0
    moveq r1, #0x1
    ldr r0, _LIT9
    movne r1, #0x0
    bl func_ov006_021c6bac
.L_14c4:
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    bne .L_14f0
    cmp r7, #0x0
    cmpeq r8, #0x0
    beq .L_14f0
    cmp r5, #0x0
    moveq r1, #0x1
    ldr r0, _LIT9
    movne r1, #0x0
    bl func_ov006_021c6bac
.L_14f0:
    ldr r0, _LIT9
    mov r1, sl
    mov r2, #0x0
    bl func_ov006_021c6b34
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_152c
    ldr r0, [r4, #0x8]
    str r0, [fp, #0x4]
    ldr r0, [r4, #0x10]
    sub r0, r0, r6
    str r0, [fp, #0x8]
    ldr r0, [r4, #0x4]
    str r0, [fp, #0x10]
.L_152c:
    mov r0, r9
    bl func_ov006_021be878
    mov r0, r9
    bl func_ov006_021bbe7c
    mov r1, #0x1
    mov r0, r9
    str r1, [sp]
    mov r2, #0x0
    mov r3, r1
    bl func_ov006_021bc45c
    ldr r0, [r9, #0x40]
    cmp r0, #0x1
    bne .L_1570
    mov r0, r9
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov006_021bcb94
.L_1570:
    mov r1, #0x1
    mov r0, r9
    mov r2, r1
    bl func_ov006_021bcedc
    cmp r7, #0x0
    beq .L_15a4
    mov r0, r9
    bl func_ov006_021bc0cc
    mov r0, r9
    bl func_ov006_021bf844
    ldr r0, _LIT11
    mov r1, #0x1
    str r1, [r0, #0x1c]
.L_15a4:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_15c0
    mov r0, r9
    bl func_ov006_021c0c14
    mov r0, r9
    bl func_ov006_021c0dc8
.L_15c0:
    cmp r7, #0x0
    cmpeq r8, #0x0
    beq .L_15e0
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    bne .L_15e0
    mov r0, r9
    bl func_ov006_021bf5e4
.L_15e0:
    mov r0, #0x0
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT11: .word data_021040ac
