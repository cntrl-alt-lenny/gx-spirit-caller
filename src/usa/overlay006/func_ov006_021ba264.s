; func_ov006_021ba264 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104acc
        .extern data_ov000_021b1c4c
        .extern data_ov006_021cbfd4
        .extern data_ov006_021cc358
        .extern data_ov006_021cc468
        .extern data_ov006_0224f328
        .extern data_ov006_0225ca3c
        .extern data_ov006_0225dd50
        .extern data_ov006_0225de1c
        .extern data_ov006_0225df48
        .extern data_ov006_0225dfe0
        .extern func_020060f4
        .extern func_02006148
        .extern func_02006160
        .extern func_02006178
        .extern func_0202bacc
        .extern func_0202bb00
        .extern func_02034734
        .extern func_02034768
        .extern func_02036540
        .extern func_020371b8
        .extern func_ov005_021aa3f0
        .extern func_ov006_021b6c1c
        .extern func_ov006_021b6e18
        .extern func_ov006_021b6e50
        .extern func_ov006_021b7bac
        .extern func_ov006_021b7be0
        .extern func_ov006_021bb848
        .extern func_ov006_021bbcb4
        .extern func_ov006_021bbd70
        .extern func_ov006_021bbfc0
        .extern func_ov006_021bc350
        .extern func_ov006_021bca88
        .extern func_ov006_021bcdd0
        .extern func_ov006_021bd5b0
        .extern func_ov006_021bd5f4
        .extern func_ov006_021bd6c0
        .extern func_ov006_021bd7a0
        .extern func_ov006_021bdbd0
        .extern func_ov006_021bdcc8
        .extern func_ov006_021be3c4
        .extern func_ov006_021be44c
        .extern func_ov006_021be48c
        .extern func_ov006_021be4ac
        .extern func_ov006_021be5e8
        .extern func_ov006_021be76c
        .extern func_ov006_021be7b8
        .extern func_ov006_021be83c
        .extern func_ov006_021bf348
        .extern func_ov006_021bf4d8
        .extern func_ov006_021bf738
        .extern func_ov006_021c0b08
        .extern func_ov006_021c0cbc
        .extern func_ov006_021c154c
        .extern func_ov006_021c1558
        .extern func_ov006_021c156c
        .extern func_ov006_021c694c
        .extern func_ov006_021c6a20
        .extern func_ov006_021c6a28
        .extern func_ov006_021c6aa0
        .extern func_ov006_021c6ab4
        .extern func_ov006_021c6ac8
        .extern func_ov006_021c7478
        .extern func_ov006_021c7bfc
        .extern func_ov006_021c7f5c
        .extern func_ov006_021c9df0
        .extern func_ov006_021ca294
        .extern func_ov006_021cab2c
        .extern func_ov006_021cac28
        .extern func_ov006_021cac98
        .extern func_ov006_021cacb0
        .global func_ov006_021ba264
        .arm
func_ov006_021ba264:
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
    bl func_ov006_021be7b8
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
    bl func_020371b8
.L_80:
    str sl, [r9, #0x6c]
.L_84:
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq .L_bc
    mov r0, r9
    bl func_ov006_021bdcc8
    cmp r0, #0x0
    beq .L_1298
    mov r0, r9
    bl func_ov006_021be4ac
    mov r0, r9
    bl func_ov006_021be5e8
    mov r7, #0x1
    str r7, [sp, #0xc]
    b .L_1298
.L_bc:
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_4b8
    ldr r0, _LIT2
    bl func_ov006_021c7478
    cmp r0, #0x0
    beq .L_1298
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
    bl func_ov006_021bd5b0
    ldr r1, [r4, #0x20]
    mov r2, r0
    mov r0, r1, lsl #0x1f
    mov r3, r0, lsr #0x1f
    ldr r0, _LIT3
    ldr r1, [r9, #0x50]
    bl func_ov006_021b6c1c
    mov r1, #0x2
    str r1, [r9, #0x88]
    str r0, [r9, #0x8c]
    b .L_48c
.L_23c:
    mov r0, r9
    bl func_ov006_021bd5b0
    ldr r1, [r4, #0x20]
    mov r2, r0
    mov r0, r1, lsl #0x1f
    mov r3, r0, lsr #0x1f
    ldr r0, _LIT3
    ldr r1, [r9, #0x50]
    bl func_ov006_021b6c1c
    mov r1, #0x3
    str r1, [r9, #0x88]
    str r0, [r9, #0x8c]
    b .L_48c
.L_270:
    ldr r0, _LIT2
    mov r1, #0x1
    bl func_ov006_021c7f5c
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    bl func_ov006_021b7bac
    cmp r4, r0
    beq .L_48c
    mov r0, #0x4
    str r0, [r9, #0x88]
    str r4, [r9, #0x8c]
    b .L_48c
.L_2a4:
    ldr r0, _LIT2
    mov r1, #0x2
    bl func_ov006_021c7f5c
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x0
    bl func_ov006_021b7be0
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
    bl func_ov006_021c7f5c
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x1
    bl func_ov006_021b7be0
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
    bl func_ov006_021c7f5c
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x2
    bl func_ov006_021b7be0
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
    bl func_ov006_021c7f5c
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x3
    bl func_ov006_021b7be0
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
    bl func_ov006_021c7f5c
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x4
    bl func_ov006_021b7be0
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
    bl func_ov006_021c7f5c
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x5
    bl func_ov006_021b7be0
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
    bl func_ov006_021c7f5c
    mov r4, r0
    ldr r1, [r9, #0x50]
    ldr r0, _LIT3
    mov r2, #0x6
    bl func_ov006_021b7be0
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
    bl func_ov006_021b6e18
    mov r2, r0
    ldr r1, [r9, #0x50]
    mov r0, r9
    bl func_ov006_021bd5f4
    cmp r0, #0x0
    movne r7, #0x1
.L_48c:
    cmp r7, #0x0
    beq .L_4ac
    mov r0, r9
    bl func_ov006_021be4ac
    mov r0, r9
    bl func_ov006_021be5e8
    mov r0, #0x1
    str r0, [sp, #0xc]
.L_4ac:
    ldr r0, _LIT2
    bl func_ov006_021c7bfc
    b .L_1298
.L_4b8:
    ldr r0, _LIT4
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_564
    ldr r0, _LIT4
    bl func_ov006_021c9df0
    cmp r0, #0x0
    beq .L_1298
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
    bl func_ov006_021ca294
    mov r0, #0x0
    str r0, [r9, #0x44]
    add sp, sp, #0x5c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_53c:
    ldr r0, _LIT4
    bl func_ov006_021ca294
    mov r0, #0x2
    str r0, [r9, #0x44]
    add sp, sp, #0x5c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_558:
    ldr r0, _LIT4
    bl func_ov006_021ca294
    b .L_1298
.L_564:
    ldr r0, _LIT5
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_628
    ldr r0, _LIT5
    bl func_ov006_021cab2c
    cmp r0, #0x0
    beq .L_1298
    add r0, sp, #0x1c
    add r1, sp, #0x18
    bl func_020060f4
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
    bl func_ov006_021be83c
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
    bl func_ov006_021cac98
    b .L_1298
.L_628:
    ldr r0, [r9, #0x7c]
    cmp r0, #0x0
    beq .L_1298
    bl func_02006178
    cmp r0, #0x0
    bne .L_64c
    bl func_02006160
    cmp r0, #0x0
    beq .L_9e0
.L_64c:
    add r0, sp, #0x14
    add r1, sp, #0x10
    bl func_020060f4
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
    bl func_ov005_021aa3f0
    ldr r0, [fp, #0x4]
    str r0, [r5, #0x8]
    ldr r0, [fp, #0x10]
    str r0, [r5, #0x4]
    ldr r0, [r5, #0x8]
    cmp r0, r4
    ldr r0, [fp, #0x18]
    movne r7, #0x1
    cmp r0, #0x0
    bne .L_1298
.L_6ac:
    mov r1, #0x0
    add r0, sp, #0x44
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x10]
    mov r0, r9
    mov r3, #0x1
    bl func_ov006_021be83c
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
    bl func_02006148
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
    bl func_02006160
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
    bl func_ov006_021bb848
    cmp r0, #0x0
    addne sp, sp, #0x5c
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_894:
    bl func_02006148
    cmp r0, #0x0
    beq .L_1298
    ldr r0, [r9, #0x40]
    cmp r0, #0x3
    bhi .L_1298
    ldr r0, [sp, #0x44]
    cmp r0, #0x2
    bne .L_970
    ldr r1, [r9, #0x50]
    cmp r1, #0x4
    beq .L_970
    mov r0, r9
    bl func_ov006_021bd5b0
    movs r2, r0
    bmi .L_1298
    ldr r0, [r5, #0x20]
    ldr r1, [r9, #0x50]
    mov r3, r0, lsl #0x1f
    ldr r0, _LIT3
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6c1c
    mov r4, r0
    ldr r0, _LIT3
    ldr r1, [r9, #0x50]
    mov r2, r4
    bl func_ov006_021b6e50
    cmp r0, #0x0
    ble .L_1298
    mov r0, #0x38
    mov r1, #0x0
    bl func_02036540
    mov r0, #0x83
    sub r1, r0, #0x84
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r2, [r5, #0x20]
    ldr r0, _LIT5
    mov r2, r2, lsl #0x1f
    ldr r1, [r9, #0x50]
    mov r2, r2, lsr #0x1f
    bl func_ov006_021cacb0
    ldr r1, [r5, #0x4]
    ldr r0, _LIT5
    stmia sp, {r1, r4}
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x10]
    ldr r3, [r5]
    sub r1, r1, #0x10
    sub r2, r2, #0x10
    bl func_ov006_021cac28
    ldr r0, [r9, #0x50]
    str r0, [r9, #0x58]
    b .L_1298
.L_970:
    cmp r0, #0x3
    bne .L_1298
    mov r0, #0x38
    mov r1, #0x0
    bl func_02036540
    mov r0, #0x83
    sub r1, r0, #0x84
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, _LIT5
    ldr r1, [r9, #0x50]
    mov r2, #0x1
    bl func_ov006_021cacb0
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
    bl func_ov006_021cac28
    ldr r0, [sp, #0x48]
    str r0, [r9, #0x58]
    b .L_1298
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
    bl func_ov006_021bb848
    cmp r0, #0x0
    addne sp, sp, #0x5c
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mvn r0, #0x0
    str r0, [r9, #0x54]
    b .L_1298
.L_a74:
    cmp r1, #0x0
    beq .L_ae0
    ldr r0, [r9, #0x48]
    cmp r0, #0x1
    bne .L_ae0
    ldr r0, [r9, #0x40]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1298
    b .L_aa8
    b .L_aa8
    b .L_aa8
    b .L_aa8
.L_aa8:
    ldr r1, [r9, #0x50]
    mov r0, r9
    bl func_ov006_021bd6c0
    mov r7, r0
    mov r0, r9
    bl func_ov006_021bd7a0
    cmp r0, #0x0
    beq .L_1298
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_1298
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
    bl func_020371b8
    ldr r1, [r9, #0x5c]
    mov r0, r9
    str r1, [r9, #0x50]
    bl func_ov006_021bbcb4
    mov r0, r9
    bl func_ov006_021be4ac
    mov r0, r9
    bl func_ov006_021be5e8
    mov r0, r9
    mov r7, #0x1
    bl func_ov006_021c0b08
    mov r1, #0x0
    mov r0, r9
    mov r2, r7
    mov r3, r1
    str r1, [sp]
    bl func_ov006_021bc350
    b .L_1298
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
    bl func_ov006_021be3c4
    cmp r0, #0x0
    mov r2, #0x0
    mov r3, #0x1
    beq .L_ba0
    mov r0, #0x46
    sub r1, r0, #0x47
    bl func_020371b8
    b .L_1298
.L_ba0:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    b .L_1298
.L_bb0:
    mov r0, r9
    bl func_ov006_021be44c
    cmp r0, #0x0
    mov r2, #0x0
    mov r3, #0x1
    beq .L_bd8
    mov r0, #0x46
    sub r1, r0, #0x47
    bl func_020371b8
    b .L_1298
.L_bd8:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    b .L_1298
.L_be8:
    mov r0, r9
    bl func_ov006_021be48c
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_1298
.L_c08:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
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
    bl func_020371b8
    mov r0, r9
    bl func_ov006_021bdbd0
    mov r0, r9
    bl func_ov006_021be4ac
    mov r0, r9
    bl func_ov006_021be5e8
    mov r7, #0x1
    b .L_1298
.L_c6c:
    tst r4, #0x400
    beq .L_ca0
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r9, #0x48]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9, #0x48]
    b .L_1298
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
    bl func_020371b8
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
    bl func_ov006_021bbcb4
    mov r0, r9
    bl func_ov006_021be4ac
    mov r0, r9
    bl func_ov006_021be5e8
    mov r0, r9
    mov r7, #0x1
    bl func_ov006_021c0b08
    ldr r0, [r9, #0x40]
    cmp r0, #0x5
    bne .L_da4
    mov r0, r9
    bl func_ov006_021bf348
.L_da4:
    mov r1, #0x0
    mov r0, r9
    mov r3, r1
    mov r2, #0x1
    str r1, [sp]
    bl func_ov006_021bc350
    b .L_1298
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
    bl func_020371b8
    tst r4, #0x200
    beq .L_e10
    ldr r0, _LIT9
    bl func_ov006_021c6ac8
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT9
    movne r1, #0x0
    bl func_ov006_021c6ab4
    b .L_1298
.L_e10:
    tst r4, #0x100
    beq .L_1298
    ldr r0, _LIT10
    bl func_ov006_021c156c
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT10
    movne r1, #0x0
    bl func_ov006_021c1558
    b .L_1298
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
    bl func_020371b8
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
    b .L_1298
.L_ef4:
    tst r5, #0x10
    beq .L_1298
    ldr r0, [r9, #0x4c]
    add r0, r0, #0x1
    str r0, [r9, #0x4c]
    cmp r0, r2
    strgt r1, [r9, #0x4c]
    b .L_1298
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
    bl func_020371b8
    mov r0, #0x1
    str r0, [r9, #0x48]
    b .L_1298
_LIT0: .word data_02104acc
_LIT1: .word data_ov000_021b1c4c
_LIT2: .word data_ov006_0225de1c
_LIT3: .word data_ov006_0224f328
_LIT4: .word data_ov006_0225df48
_LIT5: .word data_ov006_0225dfe0
_LIT6: .word data_ov006_021cc468
_LIT7: .word data_ov006_021cc358
_LIT8: .word data_ov006_021cbfd4
_LIT9: .word data_ov006_0225dd50
_LIT10: .word data_ov006_0225ca3c
.L_f78:
    tst r6, #0xf0
    beq .L_1298
    ldr r0, [r9, #0x48]
    cmp r0, #0x1
    bne .L_1298
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
    bl func_ov006_021bd6c0
    mov r7, r0
    tst r6, #0x40
    beq .L_108c
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_1064
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    ldreq r0, [r5, #0x4]
    cmpeq r0, #0x0
    bne .L_100c
    tst r4, #0x40
    beq .L_1258
.L_100c:
    ldr r0, [r5, #0x4]
    subs r0, r0, #0x1
    str r0, [r5, #0x4]
    bpl .L_1258
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    bne .L_103c
    ldr r1, [r5, #0x10]
    sub r0, sl, #0x1
    sub r1, r1, sl
    stmib r5, {r0, r1}
    b .L_105c
.L_103c:
    sub r0, r0, #0x1
    str r0, [r5, #0x8]
    ldr r0, [r5, #0x4]
    add r0, r0, #0x1
    str r0, [r5, #0x4]
    ldr r0, [r9, #0x70]
    orr r0, r0, #0x1
    str r0, [r9, #0x70]
.L_105c:
    mov r7, #0x1
    b .L_1258
.L_1064:
    ldr r0, [r5, #0x4]
    subs r0, r0, #0x1
    str r0, [r5, #0x4]
    bpl .L_1258
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    moveq r0, #0x0
    subne r0, r0, #0x1
    str r0, [r5, #0x4]
    b .L_1258
.L_108c:
    tst r6, #0x80
    ldr r0, [r5, #0x20]
    beq .L_1158
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_1138
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x8]
    sub r0, r0, sl
    cmp r1, r0
    blt .L_10d0
    ldr r1, [r5, #0x4]
    sub r0, sl, #0x1
    cmp r1, r0
    ldreq r0, [sp, #0x8]
    cmpeq r0, #0x0
    beq .L_1258
.L_10d0:
    ldr r0, [r5, #0x4]
    add r0, r0, #0x1
    str r0, [r5, #0x4]
    cmp r0, sl
    blt .L_1258
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x8]
    sub r0, r0, sl
    cmp r1, r0
    blt .L_1108
    mov r0, #0x0
    str r0, [r5, #0x8]
    str r0, [r5, #0x4]
    b .L_1130
.L_1108:
    add r0, r1, #0x1
    str r0, [r5, #0x8]
    ldr r1, [r5, #0x4]
    sub r0, sl, #0x1
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    ldr r2, [r9, #0x70]
    mov r1, #0x1
    orr r0, r2, r1, lsl r0
    str r0, [r9, #0x70]
.L_1130:
    mov r7, #0x1
    b .L_1258
.L_1138:
    ldr r0, [r5, #0x4]
    add r1, r0, #0x1
    str r1, [r5, #0x4]
    ldr r0, [r5, #0x10]
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r5, #0x4]
    b .L_1258
.L_1158:
    mov r1, r0, lsl #0x1f
    movs r1, r1, lsr #0x1f
    beq .L_11a8
    tst r6, #0x20
    beq .L_1184
    ldr r0, [r5]
    subs r0, r0, #0x1
    str r0, [r5]
    movmi r0, #0x9
    strmi r0, [r5]
    b .L_1258
.L_1184:
    tst r6, #0x10
    beq .L_1258
    ldr r0, [r5]
    add r0, r0, #0x1
    str r0, [r5]
    cmp r0, #0xa
    movge r0, #0x0
    strge r0, [r5]
    b .L_1258
.L_11a8:
    tst r6, #0x20
    beq .L_11f0
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    streq r0, [r5, #0x4]
    beq .L_1258
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x4]
    beq .L_1258
    subs r0, r0, sl
    str r0, [r5, #0x8]
    movmi r0, #0x0
    strmi r0, [r5, #0x8]
    mov r7, #0x1
    b .L_1258
.L_11f0:
    tst r6, #0x10
    beq .L_1258
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_1220
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    moveq r0, #0x0
    ldrne r0, [r5, #0x10]
    subne r0, r0, #0x1
    str r0, [r5, #0x4]
    b .L_1258
.L_1220:
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x8]
    sub r0, r0, sl
    cmp r1, r0
    subge r0, sl, #0x1
    strge r0, [r5, #0x4]
    bge .L_1258
    add r1, r1, sl
    str r1, [r5, #0x8]
    ldr r0, [r5, #0x10]
    mov r7, #0x1
    sub r0, r0, sl
    cmp r1, r0
    strge r0, [r5, #0x8]
.L_1258:
    ldr r1, [r5]
    ldr r0, [sp, #0x20]
    cmp r1, r0
    ldreq r1, [r5, #0x4]
    ldreq r0, [sp, #0x24]
    cmpeq r1, r0
    ldreq r1, [r5, #0x8]
    ldreq r0, [sp, #0x28]
    cmpeq r1, r0
    beq .L_1298
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r8, #0x1
.L_1298:
    ldr r0, [r9, #0x40]
    cmp r0, #0x1
    bne .L_1384
    ldr r0, [r9, #0x74]
    cmp r0, #0x0
    beq .L_1384
    mov r0, r9
    bl func_ov006_021be7b8
    cmp r0, #0x0
    bne .L_1384
    ldr r0, _LIT4
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_12ec
    ldr r0, _LIT4
    ldr r0, [r0, #0x4c]
    cmp r0, #0x14
    beq .L_1384
.L_12ec:
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_1310
    ldr r0, _LIT2
    bl func_ov006_021c7bfc
.L_1310:
    ldr r0, _LIT4
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_1334
    ldr r0, _LIT4
    bl func_ov006_021ca294
.L_1334:
    ldr r0, _LIT5
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_134c
    ldr r0, _LIT5
    bl func_ov006_021cac98
.L_134c:
    mov r0, #0x8e
    mov r1, #0x0
    bl func_02036540
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x6
    str r0, [r9, #0x88]
    mov r0, #0x14
    str r0, [r9, #0x8c]
    mov r0, #0x0
    str r0, [r9, #0x90]
.L_1384:
    ldr r0, [r9, #0x40]
    sub r0, r0, #0x1
    cmp r0, #0x1
    bhi .L_13c0
    bl func_02034734
    cmp r0, #0x0
    beq .L_13c0
    bl func_02034768
    cmp r0, #0x0
    bne .L_13c0
    mov r0, #0x3
    str r0, [r9, #0x44]
    add sp, sp, #0x5c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13c0:
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
    beq .L_141c
    ldr r1, [r4, #0x10]
    ldr r0, [r4, #0x8]
    sub r0, r1, r0
    cmp r0, r6
    bge .L_141c
.L_1400:
    ldr r0, [r4, #0x8]
    sub r1, r0, #0x1
    str r1, [r4, #0x8]
    ldr r0, [r4, #0x10]
    sub r0, r0, r1
    cmp r0, r6
    blt .L_1400
.L_141c:
    ldr r1, [r9, #0x50]
    mov r0, r9
    bl func_ov006_021bd5b0
    movs r2, r0
    movmi sl, #0x0
    bmi .L_1450
    ldr r0, [r4, #0x20]
    ldr r1, [r9, #0x50]
    mov r3, r0, lsl #0x1f
    ldr r0, _LIT3
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6c1c
    mov sl, r0
.L_1450:
    mov r0, sl
    bl func_0202bacc
    mov r5, r0
    mov r0, sl
    bl func_0202bb00
    cmp r5, #0x0
    cmpne r0, #0x0
    movne r1, sl
    ldr r0, _LIT10
    moveq r1, #0x0
    bl func_ov006_021c154c
    ldr r0, _LIT9
    bl func_ov006_021c6a20
    cmp r0, #0x0
    bne .L_14b8
    ldr r0, _LIT9
    mov r1, #0x1
    bl func_ov006_021c694c
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    bne .L_14b8
    cmp r5, #0x0
    moveq r1, #0x1
    ldr r0, _LIT9
    movne r1, #0x0
    bl func_ov006_021c6aa0
.L_14b8:
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    bne .L_14e4
    cmp r7, #0x0
    cmpeq r8, #0x0
    beq .L_14e4
    cmp r5, #0x0
    moveq r1, #0x1
    ldr r0, _LIT9
    movne r1, #0x0
    bl func_ov006_021c6aa0
.L_14e4:
    ldr r0, _LIT9
    mov r1, sl
    mov r2, #0x0
    bl func_ov006_021c6a28
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_1520
    ldr r0, [r4, #0x8]
    str r0, [fp, #0x4]
    ldr r0, [r4, #0x10]
    sub r0, r0, r6
    str r0, [fp, #0x8]
    ldr r0, [r4, #0x4]
    str r0, [fp, #0x10]
.L_1520:
    mov r0, r9
    bl func_ov006_021be76c
    mov r0, r9
    bl func_ov006_021bbd70
    mov r1, #0x1
    mov r0, r9
    str r1, [sp]
    mov r2, #0x0
    mov r3, r1
    bl func_ov006_021bc350
    ldr r0, [r9, #0x40]
    cmp r0, #0x1
    bne .L_1564
    mov r0, r9
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov006_021bca88
.L_1564:
    mov r1, #0x1
    mov r0, r9
    mov r2, r1
    bl func_ov006_021bcdd0
    cmp r7, #0x0
    beq .L_1598
    mov r0, r9
    bl func_ov006_021bbfc0
    mov r0, r9
    bl func_ov006_021bf738
    ldr r0, _LIT11
    mov r1, #0x1
    str r1, [r0, #0x1c]
.L_1598:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_15b4
    mov r0, r9
    bl func_ov006_021c0b08
    mov r0, r9
    bl func_ov006_021c0cbc
.L_15b4:
    cmp r7, #0x0
    cmpeq r8, #0x0
    beq .L_15d4
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    bne .L_15d4
    mov r0, r9
    bl func_ov006_021bf4d8
.L_15d4:
    mov r0, #0x0
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT11: .word data_02103fcc
