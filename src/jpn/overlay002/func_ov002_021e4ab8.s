; func_ov002_021e4ab8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce4a8
        .extern data_ov002_022ce4aa
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern data_ov002_022d0170
        .extern data_ov002_022d0d8c
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_0202e3d8
        .extern func_02031084
        .extern func_ov002_021b03e8
        .extern func_ov002_021b0b74
        .extern func_ov002_021b1378
        .extern func_ov002_021b1490
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b3694
        .extern func_ov002_021b3784
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b9064
        .extern func_ov002_021b9af4
        .extern func_ov002_021b9d20
        .extern func_ov002_021b9dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bb364
        .extern func_ov002_021bd630
        .extern func_ov002_021c3a04
        .extern func_ov002_021c3a80
        .extern func_ov002_021c8860
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5a90
        .extern func_ov002_021d6344
        .extern func_ov002_021d6780
        .extern func_ov002_021d8814
        .extern func_ov002_021d90f0
        .extern func_ov002_021de390
        .extern func_ov002_021de4a8
        .extern func_ov002_021deb3c
        .extern func_ov002_021df53c
        .extern func_ov002_021df590
        .extern func_ov002_021df5e4
        .extern func_ov002_021df848
        .extern func_ov002_021e050c
        .extern func_ov002_021e2a2c
        .extern func_ov002_021e2ca4
        .extern func_ov002_021e2d48
        .extern func_ov002_021e2fc4
        .extern func_ov002_021e372c
        .extern func_ov002_021fd838
        .extern func_ov002_021fea18
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_0223df90
        .extern func_ov002_02256e50
        .extern func_ov002_02256f44
        .extern func_ov002_02257564
        .extern func_ov002_02257c14
        .extern func_ov002_0226b168
        .global func_ov002_021e4ab8
        .arm
func_ov002_021e4ab8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xe8
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r3, [r0, #0x480]
    mov r1, #0x18
    sub r0, r3, #0x1
    mla r4, r0, r1, r2
    cmp r3, #0x1
    subgt r1, r4, #0x18
    strgt r1, [sp, #0x8]
    movle r1, #0x0
    strle r1, [sp, #0x8]
    ldr r1, _LIT0
    ldr r2, [r1, #0x5a4]
    cmp r2, #0x65
    bgt .L_88
    bge .L_22f4
    cmp r2, #0x7
    bgt .L_7c
    cmp r2, #0x0
    addge pc, pc, r2, lsl #0x2
    b .L_25e4
    b .L_a4
    b .L_1cc
    b .L_238
    b .L_27c
    b .L_32c
    b .L_16fc
    b .L_1808
    b .L_1850
.L_7c:
    cmp r2, #0x64
    beq .L_2254
    b .L_25e4
.L_88:
    cmp r2, #0x66
    bgt .L_98
    beq .L_2324
    b .L_25e4
.L_98:
    cmp r2, #0x67
    beq .L_25ac
    b .L_25e4
.L_a4:
    mov r0, #0x0
    str r0, [r1, #0x5d4]
    str r0, [r1, #0x688]
    ldr r0, [r1, #0x480]
    cmp r0, #0x2
    bge .L_d0
    add r0, r2, #0x2
    str r0, [r1, #0x5a4]
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d0:
    mov r0, #0x1e
    bl func_ov002_021e2a2c
    ldr r0, _LIT0
    ldr r0, [r0, #0x480]
    cmp r0, #0x3
    blt .L_1b0
    mov r7, #0x0
    ldr r6, _LIT2
    mov r5, r7
    mov fp, #0x3
.L_f8:
    ldr r1, _LIT3
    ldr r0, _LIT4
    and r2, r7, #0x1
    mla sl, r2, r1, r0
    ldr r0, _LIT5
    mov r8, #0x0
    add r9, sl, #0x30
    sub r4, r0, #0x1
.L_118:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [sl, #0x38]
    cmpne r0, #0x0
    beq .L_190
    ldr r1, [sl, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_190
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9dec
    cmp r0, r4
    ldrne r1, _LIT5
    cmpne r0, r1
    bne .L_190
    mov r0, r7
    mov r1, r8
    mov r2, r6
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_190
    mov r0, r7
    mov r1, r8
    mov r2, r6
    str r5, [sp]
    mov r3, fp
    bl func_ov002_021d58dc
.L_190:
    add r8, r8, #0x1
    cmp r8, #0x5
    add r9, r9, #0x14
    add sl, sl, #0x14
    blt .L_118
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_f8
.L_1b0:
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1cc:
    mov r1, #0x18
    mul r1, r0, r1
    ldr r2, _LIT6
    ldrh r1, [r2, r1]
    mov r2, r1, lsl #0x1a
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    movne r1, #0x8000
    moveq r1, #0x0
    mov r3, r2, lsr #0x1b
    add r2, r0, #0x1
    orr r1, r1, #0x13
    mov r0, r1, lsl #0x10
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d46ac
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_238:
    ldr r1, _LIT7
    ldr r1, [r1, #0xd0c]
    cmp r1, #0x0
    beq .L_260
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r1, r0, lsr #0x10
    mov r0, #0x13
    bl func_ov002_021b1378
.L_260:
    ldr r0, _LIT0
    ldr r1, [r0, #0x480]
    sub r1, r1, #0x1
    str r1, [r0, #0x484]
    ldr r1, [r0, #0x5a4]
    add r1, r1, #0x1
    str r1, [r0, #0x5a4]
.L_27c:
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_2c8
    mov r0, r4
    bl func_ov002_021fea18
    cmp r0, #0x0
    beq .L_2c8
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
.L_2c8:
    ldr r1, _LIT0
    mov r5, #0x0
    ldr r2, [r1, #0x5a4]
    ldr r0, _LIT8
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    str r5, [r1, #0x5ac]
    str r5, [r1, #0x5b0]
    strh r5, [r0, #0xb0]
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_320
.L_300:
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223df90
    ldrh r0, [r4, #0x6]
    add r5, r5, #0x1
    mov r0, r0, lsl #0x18
    cmp r5, r0, lsr #0x18
    blt .L_300
.L_320:
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_32c:
    ldrh r0, [r4, #0x4]
    mov r1, r0, lsl #0x1e
    movs r1, r1, lsr #0x1f
    bne .L_348
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_3d0
.L_348:
    ldrh r2, [r4, #0x2]
    mov r0, r2, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq .L_3b4
    mov r0, r2, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r2, r2, lsl #0x1a
    ldr r3, _LIT4
    ldr r0, _LIT3
    and r1, r1, #0x1
    mla r5, r1, r0, r3
    ldrh r1, [r4, #0x4]
    mov r3, r2, lsr #0x1b
    mov r0, #0x14
    mov r2, r1, lsl #0x11
    mul r0, r3, r0
    add r1, r5, #0x30
    ldr r1, [r1, r0]
    mov r2, r2, lsr #0x17
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    beq .L_3d0
.L_3b4:
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3d0:
    ldr r0, _LIT0
    ldrh r2, [r4, #0x6]
    ldr r1, [r0, #0x5ac]
    mov r0, r2, lsl #0x18
    cmp r1, r0, lsr #0x18
    bge .L_16e0
    ldr r0, _LIT9
    mvn sl, #0x0
    sub r0, r0, #0x1bc
    str r0, [sp, #0x2c]
    ldr r0, _LIT9
    ldr r6, _LIT4
    rsb r0, r0, #0x31c0
    str r0, [sp, #0x30]
    ldr r0, _LIT10
    ldr r5, _LIT3
    sub r0, r0, #0x3c4
    str r0, [sp, #0x4c]
    ldr r0, _LIT10
    sub r0, r0, #0x3c4
    str r0, [sp, #0x50]
    ldr r0, _LIT9
    sub r0, r0, #0x540
    str r0, [sp, #0x60]
    ldr r0, _LIT11
    sub r0, r0, #0x6
    str r0, [sp, #0x5c]
    ldr r0, _LIT12
    sub r0, r0, #0x3e8
    str r0, [sp, #0x48]
    ldr r0, _LIT12
    add r0, r0, #0x1fc
    str r0, [sp, #0x94]
    ldr r0, _LIT11
    add r0, r0, #0x10
    str r0, [sp, #0x6c]
    ldr r0, _LIT12
    sub r0, r0, #0x394
    str r0, [sp, #0x68]
    ldr r0, _LIT12
    sub r0, r0, #0x3e8
    str r0, [sp, #0x44]
    ldr r0, _LIT12
    sub r0, r0, #0x394
    str r0, [sp, #0x64]
    ldr r0, _LIT11
    add r0, r0, #0x6a
    str r0, [sp, #0x70]
    ldr r0, _LIT10
    sub r0, r0, #0x4c
    str r0, [sp, #0x40]
    ldr r0, _LIT11
    add r0, r0, #0x264
    str r0, [sp, #0x88]
    ldr r0, _LIT12
    add r0, r0, #0x160
    str r0, [sp, #0x8c]
    ldr r0, _LIT12
    add r0, r0, #0x160
    str r0, [sp, #0x90]
    add r0, sl, #0x10000
    str r0, [sp, #0x38]
    ldr r0, _LIT10
    sub r0, r0, #0x4c
    str r0, [sp, #0x3c]
    ldr r0, _LIT12
    sub r0, r0, #0xab
    str r0, [sp, #0x74]
    ldr r0, _LIT12
    sub r0, r0, #0xab
    str r0, [sp, #0x78]
    ldr r0, _LIT11
    add r0, r0, #0x1c8
    str r0, [sp, #0x7c]
    ldr r0, _LIT12
    sub r0, r0, #0x230
    str r0, [sp, #0x80]
    ldr r0, _LIT10
    add r0, r0, #0x2c
    str r0, [sp, #0x84]
    ldr r0, _LIT9
    add r0, r0, #0x28
    str r0, [sp, #0x98]
    ldr r0, _LIT11
    sub r0, r0, #0x6
    str r0, [sp, #0x58]
    ldr r0, _LIT9
    sub r0, r0, #0x540
    str r0, [sp, #0x54]
.L_534:
    mov r0, r4
    bl func_ov002_0223dda4
    str r0, [sp, #0xcc]
    and r7, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r8, r0, #0xff
    ldr r0, _LIT0
    cmp r8, #0x4
    ldr r1, [r0, #0x5ac]
    bgt .L_1654
    mov r0, r4
    add r2, sp, #0xcc
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_1654
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9dec
    mov r9, r0
    mov r0, r4
    mov r1, r7
    mov r2, r8
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_16b4
    ldr r0, _LIT0
    ldr r0, [r0, #0x5b0]
    cmp r0, #0x0
    bne .L_1558
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_6b0
    ldr r2, _LIT10
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    beq .L_6b0
    ldr r2, _LIT10
    mov r0, r7
    mov r1, r8
    mov r3, #0x1
    bl func_ov002_021b3694
    mov r1, r0, lsl #0x10
    and r0, r0, #0xff
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    ldr r6, _LIT4
    ldr r2, _LIT3
    and r5, r0, #0x1
    mla r6, r5, r2, r6
    and r1, r1, #0xff
    mov r3, #0x14
    smulbb r2, r1, r3
    add r3, r6, #0x30
    ldr r3, [r3, r2]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_694
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r2, #0x1
    ldr r3, _LIT10
    moveq r2, #0x0
    bl func_ov002_021de390
.L_694:
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6b0:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_78c
    and r0, r7, #0x1
    mla r1, r0, r5, r6
    mov r0, #0x14
    mla r0, r8, r0, r1
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_78c
    mov r0, r7
    mov r1, r8
    bl func_ov002_021c8860
    cmp r0, #0xf
    bne .L_78c
    ldr r1, _LIT11
    mov r0, r7
    mov r2, sl
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_78c
    ldr r1, _LIT11
    mov r0, r7
    bl func_ov002_021df590
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_770
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r2, #0x1
    ldr r3, _LIT10
    moveq r2, #0x0
    bl func_ov002_021de390
.L_770:
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_78c:
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_830
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_830
    and r0, r7, #0x1
    mla r1, r0, r5, r6
    mov r0, #0x14
    mla r0, r8, r0, r1
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_830
    mov r0, r7
    mov r1, r8
    bl func_ov002_021c8860
    cmp r0, #0x7
    bne .L_830
    ldr r1, _LIT9
    mov r0, r7
    bl func_ov002_021bb364
    cmp r0, #0x0
    beq .L_830
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_830
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    ldrh r1, [r4, #0x2]
    mov r0, r0, lsl #0x11
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
.L_830:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_928
    ldr r2, [sp, #0x2c]
    mov r0, r7
    mov r1, r8
    mov r3, #0x0
    bl func_ov002_021b3784
    ldr r1, [sp, #0x38]
    cmp r0, r1
    beq .L_928
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    and r0, r0, #0xff
    mov r1, r1, asr #0x8
    str r0, [sp, #0x14]
    and r0, r0, #0x1
    and fp, r1, #0xff
    mla r1, r0, r5, r6
    mov r0, #0x14
    smulbb r0, fp, r0
    add r1, r1, #0x30
    ldr r3, [r1, r0]
    ldr r0, [sp, #0x14]
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, fp
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    ldrh r1, [r4, #0x2]
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1a
    mov r1, r0, lsr #0x1b
    cmp r1, #0xa
    bhi .L_914
    mov r0, #0x0
    str r0, [sp]
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT11
    mov r3, #0x5
    mov r0, r0, lsl #0x1f
    add r2, r2, #0x2f8
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d58dc
.L_914:
    ldr r0, [sp, #0x14]
    mov r1, fp
    mov r2, #0x5
    mov r3, #0x1
    bl func_ov002_021e2ca4
.L_928:
    ldr r0, [sp, #0x3c]
    cmp r9, r0
    bgt .L_9dc
    ldr r0, [sp, #0x40]
    cmp r9, r0
    bge .L_ff4
    ldr r0, [sp, #0x44]
    cmp r9, r0
    bgt .L_9a4
    ldr r0, [sp, #0x48]
    cmp r9, r0
    bge .L_d3c
    ldr r0, [sp, #0x4c]
    cmp r9, r0
    bgt .L_974
    ldr r0, [sp, #0x50]
    cmp r9, r0
    beq .L_abc
    b .L_14d4
.L_974:
    ldr r0, [sp, #0x54]
    cmp r9, r0
    bgt .L_14d4
    ldr r0, [sp, #0x58]
    cmp r9, r0
    blt .L_14d4
    ldr r0, [sp, #0x5c]
    cmp r9, r0
    ldrne r0, [sp, #0x60]
    cmpne r9, r0
    beq .L_c48
    b .L_14d4
.L_9a4:
    ldr r0, [sp, #0x64]
    cmp r9, r0
    bgt .L_9cc
    ldr r0, [sp, #0x68]
    cmp r9, r0
    bge .L_e30
    ldr r0, [sp, #0x6c]
    cmp r9, r0
    beq .L_d3c
    b .L_14d4
.L_9cc:
    ldr r0, [sp, #0x70]
    cmp r9, r0
    beq .L_e44
    b .L_14d4
.L_9dc:
    ldr r0, [sp, #0x74]
    cmp r9, r0
    bgt .L_a48
    ldr r0, [sp, #0x78]
    cmp r9, r0
    bge .L_11cc
    ldr r0, [sp, #0x7c]
    cmp r9, r0
    bgt .L_a38
    ldr r0, [sp, #0x80]
    subs r0, r9, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_a28
    b .L_1398
    b .L_14d4
    b .L_1398
    b .L_1398
    b .L_1398
    b .L_1398
.L_a28:
    ldr r0, [sp, #0x84]
    cmp r9, r0
    beq .L_1398
    b .L_14d4
.L_a38:
    ldr r0, [sp, #0x88]
    cmp r9, r0
    beq .L_10e0
    b .L_14d4
.L_a48:
    ldr r0, [sp, #0x8c]
    cmp r9, r0
    bgt .L_a70
    ldr r0, [sp, #0x90]
    cmp r9, r0
    bge .L_129c
    ldr r0, _LIT12
    cmp r9, r0
    beq .L_abc
    b .L_14d4
.L_a70:
    ldr r0, [sp, #0x94]
    cmp r9, r0
    beq .L_d3c
    b .L_14d4
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022ce4a8
_LIT2: .word 0x00001ae0
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf08c
_LIT5: .word 0x00001aea
_LIT6: .word data_ov002_022ce4aa
_LIT7: .word data_ov002_022d008c
_LIT8: .word data_ov002_022d0d8c
_LIT9: .word 0x00001a07
_LIT10: .word 0x00001660
_LIT11: .word 0x000014ca
_LIT12: .word 0x000018bd
_LIT13: .word data_ov002_022cf0c2
_LIT14: .word 0xffff803f
.L_abc:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_14d4
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_14d4
    and r1, r7, #0x1
    mul r0, r1, r5
    str r0, [sp, #0xc]
    mov r0, #0x14
    mul fp, r8, r0
    ldr r0, [sp, #0xc]
    add r0, r6, r0
    add r0, r0, fp
    str r0, [sp, #0x10]
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    bne .L_14d4
    mov r0, r7
    mov r1, r8
    bl func_ov002_021bd630
    cmp r0, #0x0
    bne .L_14d4
    ldr r0, [sp, #0x10]
    ldrh r0, [r0, #0x36]
    cmp r0, #0x0
    beq .L_b4c
    mov r0, #0x0
    mov r1, #0xb
    add r2, sl, #0x12c0
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_14d4
.L_b4c:
    ldr r1, _LIT13
    ldr r0, [sp, #0xc]
    add r0, r1, r0
    ldrh r0, [fp, r0]
    cmp r0, #0x0
    bne .L_b80
    mov r2, #0x0
    str r9, [sp]
    mov r0, r7
    mov r1, r8
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_ov002_021d6780
.L_b80:
    mov r2, #0x0
    mov r0, r7
    mov r1, r8
    mov r3, r2
    str r2, [sp]
    bl func_ov002_021d6344
    ldrh r1, [r4, #0x4]
    ldr r3, _LIT4
    mov r0, r7
    orr r1, r1, #0x2
    mov r2, r1, lsl #0x1e
    mov r5, r2, lsr #0x1f
    ldr r2, [sp, #0xc]
    bic r6, r1, #0x4
    mov r5, r5, lsl #0x1f
    orr r1, r6, r5, lsr #0x1d
    strh r1, [r4, #0x4]
    add r2, r3, r2
    ldrh r5, [r4, #0x4]
    add r2, r2, #0x30
    ldr r3, [r2, fp]
    mov r1, r5, lsl #0x1d
    mov r2, r3, lsl #0x2
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x18
    bic r5, r5, #0x8
    mov r1, r1, lsl #0x1f
    orr r5, r5, r1, lsr #0x1c
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov r1, r8
    strh r5, [r4, #0x4]
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8814
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c48:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_14d4
    and r0, r7, #0x1
    mla r3, r0, r5, r6
    mov r0, #0x14
    mul r2, r8, r0
    add r0, r3, r2
    ldr r1, [r0, #0x40]
    ldrh r0, [r0, #0x38]
    mov fp, r1, lsr #0x6
    and fp, fp, #0x1
    mvn fp, fp
    and r0, r0, fp
    mov fp, r1, lsr #0x2
    orr r1, fp, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_14d4
    add r0, r3, #0x30
    ldr r2, [r0, r2]
    mov r0, r7
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r8
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_d20
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r2, #0x1
    ldr r3, _LIT10
    moveq r2, #0x0
    bl func_ov002_021de390
.L_d20:
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d3c:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x17
    bne .L_14d4
    and r0, r7, #0x1
    mla r3, r0, r5, r6
    mov r0, #0x14
    mul r2, r8, r0
    add r0, r3, r2
    ldr r1, [r0, #0x40]
    ldrh r0, [r0, #0x38]
    mov fp, r1, lsr #0x6
    and fp, fp, #0x1
    mvn fp, fp
    and r0, r0, fp
    mov fp, r1, lsr #0x2
    orr r1, fp, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_14d4
    add r0, r3, #0x30
    ldr r2, [r0, r2]
    mov r0, r7
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r8
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_e14
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r2, #0x1
    ldr r3, _LIT10
    moveq r2, #0x0
    bl func_ov002_021de390
.L_e14:
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e30:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9af4
    cmp r0, #0x0
    beq .L_14d4
.L_e44:
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_14d4
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_14d4
    and r0, r7, #0x1
    mla r1, r0, r5, r6
    mov r0, #0x14
    mul r0, r8, r0
    add r2, r1, r0
    ldr r3, [r2, #0x40]
    ldrh r2, [r2, #0x38]
    mov fp, r3, lsr #0x6
    and fp, fp, #0x1
    mvn fp, fp
    and r2, r2, fp
    mov fp, r3, lsr #0x2
    orr r3, fp, r3, lsr #0x1
    and r3, r3, #0x1
    mvn r3, r3
    tst r2, r3
    beq .L_14d4
    add r5, sp, #0xd0
    mov r3, #0x0
    str r3, [r5]
    ldrh r2, [sp, #0xd2]
    add r1, r1, #0x30
    ldr r6, [r1, r0]
    bic r0, r2, #0x3000
    orr r0, r0, #0x1000
    strh r0, [sp, #0xd2]
    ldrh r1, [sp, #0xd2]
    mov r2, r6, lsl #0x2
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r2, lsr #0x18
    str r3, [r5, #0x4]
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0xd2]
    ldrh r1, [sp, #0xd2]
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r6, r6, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r6, lsr #0x1f
    mov r6, r2, lsl #0x10
    mov sl, r6, lsr #0x10
    ldrh fp, [sp, #0xd4]
    ldr r6, _LIT14
    mov sl, sl, lsl #0x17
    and r6, fp, r6
    orr r6, r6, sl, lsr #0x11
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr sl, r1, r0, lsr #0x1a
    mov r0, r7
    mov r1, r8
    str r3, [r5, #0x8]
    str r3, [r5, #0xc]
    str r3, [r5, #0x10]
    str r3, [r5, #0x14]
    strh r9, [sp, #0xd0]
    strh r6, [sp, #0xd4]
    strh sl, [sp, #0xd2]
    bl func_ov002_021df53c
    ldrh r0, [r4, #0x4]
    orr r2, r0, #0x2
    mov r0, r2, lsl #0x1e
    mov r0, r0, lsr #0x1f
    bic r1, r2, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1d
    strh r0, [r4, #0x4]
    ldrh r1, [r4, #0x4]
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1f
    bic r1, r1, #0x8
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r4, #0x4]
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8814
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021de4a8
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ff4:
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_14d4
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_14d4
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x4
    bls .L_1034
    cmp r0, #0xa
    bls .L_14d4
.L_1034:
    and r0, r7, #0x1
    mla r3, r0, r5, r6
    mov r0, #0x14
    mul r2, r8, r0
    add r0, r3, r2
    ldr r1, [r0, #0x40]
    ldrh r0, [r0, #0x38]
    mov fp, r1, lsr #0x6
    and fp, fp, #0x1
    mvn fp, fp
    and r0, r0, fp
    mov fp, r1, lsr #0x2
    orr r1, fp, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_14d4
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_14d4
    add r0, r3, #0x30
    ldr r3, [r0, r2]
    mov r0, r7
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r8
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    ldrh r1, [r4, #0x2]
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
    b .L_14d4
.L_10e0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    beq .L_14d4
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_1120
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_14d4
    cmp r0, #0xa
    bcs .L_14d4
.L_1120:
    and r0, r7, #0x1
    mla r3, r0, r5, r6
    mov r0, #0x14
    mul r2, r8, r0
    add r0, r3, r2
    ldr r1, [r0, #0x40]
    ldrh r0, [r0, #0x38]
    mov fp, r1, lsr #0x6
    and fp, fp, #0x1
    mvn fp, fp
    and r0, r0, fp
    mov fp, r1, lsr #0x2
    orr r1, fp, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_14d4
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_14d4
    add r0, r3, #0x30
    ldr r3, [r0, r2]
    mov r0, r7
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r8
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    ldrh r1, [r4, #0x2]
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
    b .L_14d4
.L_11cc:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    beq .L_14d4
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_14d4
    and r0, r7, #0x1
    mla r3, r0, r5, r6
    mov r0, #0x14
    mul r2, r8, r0
    add r0, r3, r2
    ldr r1, [r0, #0x40]
    ldrh r0, [r0, #0x38]
    mov fp, r1, lsr #0x6
    and fp, fp, #0x1
    mvn fp, fp
    and r0, r0, fp
    mov fp, r1, lsr #0x2
    orr r1, fp, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_14d4
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_14d4
    add r0, r3, #0x30
    ldr r3, [r0, r2]
    mov r0, r7
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r8
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    ldrh r1, [r4, #0x2]
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
    b .L_14d4
.L_129c:
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_14d4
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_12dc
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_14d4
    cmp r0, #0xa
    bcs .L_14d4
.L_12dc:
    and r0, r7, #0x1
    mla r1, r0, r5, r6
    mov r0, #0x14
    mul r0, r8, r0
    add r2, r1, r0
    ldr fp, [r2, #0x3c]
    ldr r3, [sp, #0x98]
    cmp fp, r3
    bne .L_14d4
    ldr r3, [r2, #0x40]
    ldrh r2, [r2, #0x38]
    mov fp, r3, lsr #0x6
    and fp, fp, #0x1
    mvn fp, fp
    and r2, r2, fp
    mov fp, r3, lsr #0x2
    orr r3, fp, r3, lsr #0x1
    and r3, r3, #0x1
    mvn r3, r3
    tst r2, r3
    beq .L_14d4
    ldrh r2, [r4, #0x4]
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1f
    bne .L_14d4
    add r1, r1, #0x30
    ldr r3, [r1, r0]
    mov r0, r7
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r8
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    ldrh r1, [r4, #0x2]
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
    b .L_14d4
.L_1398:
    and r0, r7, #0x1
    mla r2, r0, r5, r6
    mov r0, #0x14
    mul r0, r8, r0
    add r1, r2, r0
    ldr r3, [r1, #0x40]
    ldrh r1, [r1, #0x38]
    mov fp, r3, lsr #0x6
    and fp, fp, #0x1
    mvn fp, fp
    and r1, r1, fp
    mov fp, r3, lsr #0x2
    orr r3, fp, r3, lsr #0x1
    and r3, r3, #0x1
    mvn r3, r3
    tst r1, r3
    beq .L_14d4
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    cmp r1, r7
    beq .L_14d4
    ldr r1, _LIT8
    ldrh r1, [r1, #0xb0]
    cmp r1, #0x0
    bne .L_1440
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r0, r7
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r8
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, r7
    mov r1, r8
    bl func_ov002_0226b168
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1440:
    mov r0, r9
    bl func_ov002_021b9064
    cmp r0, #0x0
    beq .L_14c8
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_14ac
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r2, #0x1
    moveq r2, #0x0
    mov r3, r9
    bl func_ov002_021de390
.L_14ac:
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_14c8:
    ldr r0, _LIT8
    mov r1, #0x0
    strh r1, [r0, #0xb0]
.L_14d4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    beq .L_16b4
    mov r0, r9
    bl func_0202e3d8
    cmp r0, #0x0
    beq .L_16b4
    and r0, r7, #0x1
    mla r1, r0, r5, r6
    mov r0, #0x14
    mla r0, r8, r0, r1
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_16b4
    ldr r1, _LIT11
    mov r0, r7
    add r1, r1, #0x1c4
    mov r2, sl
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_16b4
    mov r0, r7
    mov r1, r9
    bl func_ov002_021df5e4
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5b0]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5b0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1558:
    ldr r1, _LIT11
    mov r0, r7
    add r1, r1, #0x1c4
    mov r2, sl
    bl func_ov002_021bad9c
    ldr r1, _LIT0
    ldr r1, [r1, #0x5b0]
    cmp r1, r0
    bgt .L_16b4
    ldr r0, _LIT8
    ldrh r1, [r0, #0xb0]
    cmp r1, #0x0
    bne .L_15a4
    mov r0, r7
    mov r1, r8
    bl func_ov002_0226b168
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_15a4:
    ldr r0, _LIT15
    bl func_ov002_021b9064
    cmp r0, #0x0
    beq .L_162c
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_1610
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r2, #0x1
    moveq r2, #0x0
    mov r3, r9
    bl func_ov002_021de390
.L_1610:
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_162c:
    ldr r0, _LIT8
    mov r2, #0x0
    strh r2, [r0, #0xb0]
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5b0]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5b0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1654:
    cmp r8, #0xe
    bne .L_16b4
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_16b4
    ldr r0, [sp, #0x30]
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_16b4
    ldr r1, [sp, #0x30]
    mov r0, sl
    bl func_ov002_021df590
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    ldrh r1, [r4, #0x2]
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
.L_16b4:
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0, #0x5ac]
    add r1, r0, #0x1
    ldr r0, _LIT0
    str r1, [r0, #0x5ac]
    str r2, [r0, #0x5b0]
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    cmp r1, r0, lsr #0x18
    blt .L_534
.L_16e0:
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_16fc:
    str r4, [r1, #0x48c]
    mov r0, #0x80
    str r0, [r1, #0x5a8]
    mov r2, #0x0
    str r2, [r1, #0x5ac]
    mov r0, r4
    str r2, [r1, #0x5b0]
    bl func_ov002_021e2d48
    cmp r0, #0x0
    beq .L_1744
    ldr r1, _LIT0
    mov r0, #0x18
    ldr r1, [r1, #0x480]
    mov r2, r4
    mov r3, r0
    sub r1, r1, #0x1
    bl func_ov002_021b1490
    b .L_17ec
.L_1744:
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_17bc
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_17a8
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT16
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r3, [r0, #0x4]
    eor r0, r1, r2, lsr #0x1f
    cmp r3, r0
    bne .L_17a8
    ldrh r0, [r4, #0x4]
    ldr r2, _LIT17
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    mov r1, r0, lsl #0x2
    ldrh r0, [r2, r1]
    orr r0, r0, #0x8000
    strh r0, [r2, r1]
.L_17a8:
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x480]
    sub r1, r1, #0x1
    bl func_ov002_021b0b74
.L_17bc:
    mov r0, r4
    bl func_ov002_021fd838
    cmp r0, #0x0
    bne .L_17ec
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5a8]
    mov r1, #0x7
    str r1, [r0, #0x5a4]
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_17ec:
    ldr r1, _LIT0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1808:
    mov r0, r4
    bl func_ov002_021e2d48
    cmp r0, #0x0
    bne .L_182c
    ldr r1, [sp, #0x8]
    mov r0, r4
    bl func_ov002_02257c14
    ldr r1, _LIT0
    str r0, [r1, #0x5a8]
.L_182c:
    ldr r0, _LIT0
    add sp, sp, #0xe8
    ldr r1, [r0, #0x5a8]
    cmp r1, #0x0
    ldreq r1, [r0, #0x5a4]
    addeq r1, r1, #0x1
    streq r1, [r0, #0x5a4]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1850:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r3, r1, lsr #0x1b
    cmp r3, #0xa
    bhi .L_18f8
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    ldr r0, _LIT3
    and r2, r1, #0x1
    mov r1, #0x14
    mul r0, r2, r0
    ldr r2, _LIT4
    mul r1, r3, r1
    add r2, r2, r0
    add r2, r2, #0x30
    ldr r3, [r2, r1]
    ldrh r5, [r4, #0x4]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov r5, r5, lsl #0x11
    add r2, r2, r3, lsr #0x1f
    cmp r2, r5, lsr #0x17
    bne .L_18f8
    ldr r2, _LIT18
    add r0, r2, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_18f8
    mov r0, r4
    bl func_ov002_021e372c
    cmp r0, #0x0
    beq .L_18f8
    ldrh r0, [r4, #0x2]
    mov r2, #0x3
    mov r3, #0x1
    mov r5, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021e2ca4
.L_18f8:
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_1dfc
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_1dfc
    mov r0, #0x0
    str r0, [sp, #0x28]
.L_1920:
    ldr r0, _LIT7
    ldr r2, _LIT4
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x28]
    ldr r1, _LIT3
    eor r5, r3, r0
    and r0, r5, #0x1
    mla r8, r0, r1, r2
    mov r0, r5, lsl #0x1f
    and r0, r0, #-2147483648
    str r0, [sp, #0x1c]
    orr r0, r0, #0x200000
    str r0, [sp, #0x18]
    ldr r0, _LIT19
    add r9, r8, #0x30
    sub r0, r0, #0xc4
    str r0, [sp, #0x34]
    ldr r0, _LIT19
    rsb sl, r5, #0x1
    sub r0, r0, #0xe0
    str r0, [sp, #0xa0]
    ldr r0, _LIT19
    mov r6, #0x0
    sub r0, r0, #0x23
    str r0, [sp, #0xa8]
    ldr r0, _LIT20
    add r0, r0, #0xde
    str r0, [sp, #0x9c]
    ldr r0, _LIT21
    sub r0, r0, #0x194
    str r0, [sp, #0xa4]
    ldr r0, _LIT19
    add r0, r0, #0x3f
    str r0, [sp, #0xac]
    ldr r0, _LIT19
    add r0, r0, #0x2a4
    str r0, [sp, #0xb4]
    ldr r0, _LIT22
    add r0, r0, #0xbe
    str r0, [sp, #0xc0]
    ldr r0, _LIT22
    add r0, r0, #0xc2
    str r0, [sp, #0xc4]
    ldr r0, _LIT22
    add r0, r0, #0x1e
    str r0, [sp, #0xb0]
    ldr r0, _LIT22
    add r0, r0, #0xc2
    str r0, [sp, #0xb8]
    ldr r0, _LIT22
    add r0, r0, #0xd3
    str r0, [sp, #0xc8]
    ldr r0, _LIT22
    add r0, r0, #0xbe
    str r0, [sp, #0xbc]
.L_19fc:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9dec
    movs r7, r0
    beq .L_1dd4
    ldr r0, [r8, #0x40]
    ldrh r2, [r8, #0x38]
    mov r1, r0, lsr #0x6
    and r1, r1, #0x1
    mvn r1, r1
    and r2, r2, r1
    mov r1, r0, lsr #0x2
    orr r0, r1, r0, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r2, r0
    beq .L_1dd4
    ldrh r3, [r4, #0x4]
    ldr r2, [sp, #0x34]
    mov r0, r5
    mov r3, r3, lsl #0x11
    mov r1, r6
    mov r3, r3, lsr #0x17
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_1dd4
    mov r0, r7
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_1a80
    cmp r6, #0x5
    bge .L_1dd4
    b .L_1a88
.L_1a80:
    cmp r6, #0x4
    ble .L_1dd4
.L_1a88:
    ldr r0, _LIT21
    cmp r7, r0
    bgt .L_1aec
    bge .L_1bd0
    ldr r0, [sp, #0x9c]
    cmp r7, r0
    bgt .L_1ac0
    ldr r0, [sp, #0xa0]
    cmp r7, r0
    bge .L_1b54
    ldr r0, _LIT20
    cmp r7, r0
    beq .L_1b88
    b .L_1d50
.L_1ac0:
    ldr r0, [sp, #0xa4]
    cmp r7, r0
    bgt .L_1adc
    ldr r0, [sp, #0xa8]
    cmp r7, r0
    beq .L_1ca4
    b .L_1d50
.L_1adc:
    ldr r0, [sp, #0xac]
    cmp r7, r0
    beq .L_1bd0
    b .L_1d50
.L_1aec:
    ldr r0, [sp, #0xb0]
    cmp r7, r0
    bgt .L_1b14
    ldr r0, [sp, #0xb4]
    cmp r7, r0
    bge .L_1c68
    ldr r0, _LIT22
    cmp r7, r0
    beq .L_1c1c
    b .L_1d50
.L_1b14:
    ldr r0, [sp, #0xb8]
    cmp r7, r0
    bgt .L_1b44
    ldr r0, [sp, #0xbc]
    cmp r7, r0
    blt .L_1d50
    ldr r0, [sp, #0xc0]
    cmp r7, r0
    ldrne r0, [sp, #0xc4]
    cmpne r7, r0
    beq .L_1d0c
    b .L_1d50
.L_1b44:
    ldr r0, [sp, #0xc8]
    cmp r7, r0
    beq .L_1d0c
    b .L_1d50
.L_1b54:
    ldr r2, [r9]
    mov r0, r5
    mov r3, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    mov r1, r6
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, r5
    mov r1, #0x1f4
    bl func_ov002_021e050c
    b .L_1dd4
.L_1b88:
    ldr r3, [r9]
    mov r0, r5
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r6
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, r7, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, #0xc8
    str r0, [sp]
    mov r0, r5
    mov r1, r6
    mov r3, #0x2
    bl func_ov002_021d58dc
    b .L_1dd4
.L_1bd0:
    ldr r3, [r9]
    mov r0, r5
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r6
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    ldrh r0, [r4, #0x2]
    mov r3, r7
    mov r1, #0x3e8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    movne r2, #0x1
    moveq r2, #0x0
    bl func_ov002_021df848
    b .L_1dd4
.L_1c1c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    bne .L_1dd4
    ldr r3, [r9]
    mov r0, r5
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r6
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    mov r3, r7
    mov r0, sl
    mov r1, #0x190
    mov r2, #0x1
    bl func_ov002_021df848
    b .L_1dd4
.L_1c68:
    ldr r3, [r9]
    mov r0, r5
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r6
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    mov r3, r7
    mov r0, sl
    mov r1, #0x3e8
    mov r2, #0x1
    bl func_ov002_021df848
    b .L_1dd4
.L_1ca4:
    ldrh r0, [r4, #0x2]
    mov r1, r7, lsl #0x10
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x18
    and r2, r0, #0x1000000
    ldr r0, [sp, #0x1c]
    orr r0, r0, r2
    mov r2, r6, lsl #0x10
    orr r0, r0, #0x200000
    and r2, r2, #0x1f0000
    orr r0, r2, r0
    orr r0, r0, r1, lsr #0x10
    ldr r1, [r9]
    mov r2, #0x0
    mov r3, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    b .L_1dd4
.L_1d0c:
    mov r0, r6, lsl #0x10
    and r2, r0, #0x1f0000
    ldr r0, [sp, #0x18]
    mov r1, r7, lsl #0x10
    orr r0, r0, r2
    orr r0, r0, r1, lsr #0x10
    ldr r1, [r9]
    mov r2, #0x0
    mov r3, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    b .L_1dd4
.L_1d50:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9d20
    mov fp, r0
    mov r0, r7
    bl func_02031084
    cmp fp, r0
    bge .L_1dd4
    mov r0, r5
    mov r1, r6
    mov r2, #0x1
    bl func_ov002_021d90f0
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9dec
    ldr r1, _LIT19
    cmp r0, r1
    bne .L_1dd4
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9d20
    add r0, r0, #0x1
    cmp r0, #0x4
    bne .L_1dd4
    ldrh r2, [r4, #0x2]
    mov r0, r5
    mov r1, r6
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    str r2, [sp]
    ldr r2, _LIT19
    mov r3, #0x3
    bl func_ov002_021d58dc
.L_1dd4:
    add r8, r8, #0x14
    add r9, r9, #0x14
    add r6, r6, #0x1
    cmp r6, #0xa
    ble .L_19fc
    ldr r0, [sp, #0x28]
    add r0, r0, #0x1
    str r0, [sp, #0x28]
    cmp r0, #0x2
    blt .L_1920
.L_1dfc:
    ldrh r0, [r4, #0x4]
    mov r1, r0, lsl #0x1e
    movs r1, r1, lsr #0x1f
    bne .L_1f14
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_1e28
    ldrh r1, [r4, #0x18]
    ldr r0, _LIT23
    cmp r1, r0
    beq .L_1f14
.L_1e28:
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_1f14
    mov r0, #0x0
    str r0, [sp, #0x24]
.L_1e40:
    ldr r0, _LIT24
    mov r8, #0x0
    ldr r2, [r0, #0xcec]
    ldr r0, [sp, #0x24]
    ldr r1, _LIT25
    eor r7, r2, r0
    ldr r5, _LIT26
    and r0, r7, #0x1
    mla sl, r0, r5, r1
    ldr fp, _LIT27
    add r9, sl, #0x30
    mov r6, r8
.L_1e70:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1eec
    ldr r1, [sl, #0x40]
    ldrh r2, [sl, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_1eec
    ldrh r2, [r4, #0x4]
    mov r0, r7
    mov r1, r8
    mov r2, r2, lsl #0x11
    mov r3, r2, lsr #0x17
    mov r2, fp
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_1eec
    mov r0, r7
    mov r1, r8
    mov r3, #0x2
    add r2, r5, #0xd30
    str r6, [sp]
    bl func_ov002_021d58dc
.L_1eec:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r9, r9, #0x14
    add sl, sl, #0x14
    ble .L_1e70
    ldr r0, [sp, #0x24]
    add r0, r0, #0x1
    str r0, [sp, #0x24]
    cmp r0, #0x2
    blt .L_1e40
.L_1f14:
    ldrh r2, [r4, #0x4]
    mov r0, r2, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_1f98
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xa
    bhi .L_1f98
    mov r0, r1, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_1f98
    mov r0, r1, lsl #0x1f
    mov r1, r2, lsl #0x11
    ldr r2, _LIT28
    mov r0, r0, lsr #0x1f
    mov r3, r1, lsr #0x17
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_1f98
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT28
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021df5e4
    ldrh r0, [r4, #0x2]
    ldr r3, _LIT28
    mov r1, #0x7d0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_021df848
.L_1f98:
    ldrh r0, [r4]
    bl func_ov002_02256e50
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x1
    bne .L_2090
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_2090
    ldrh r0, [r0, #0x2]
    ldrh r1, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r1, lsr #0x1f
    mov r0, r1, lsr #0x1f
    beq .L_2090
    ldr r1, [sp, #0x8]
    ldrh r1, [r1, #0x4]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    beq .L_2090
    ldr r1, _LIT24
    ldr r1, [r1, #0xd0]
    tst r1, #0x1
    bne .L_2090
    ldr r1, _LIT29
    bl func_ov002_021c3a04
    cmp r0, #0x0
    beq .L_2090
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT29
    mov r0, r0, lsl #0x1f
    mov r6, r0, lsr #0x1f
    mov r0, r6
    bl func_ov002_021c3a80
    mov r5, r0
    ldr r1, _LIT29
    mov r0, r6
    bl func_ov002_021c3a80
    ldr r1, _LIT26
    ldr r2, _LIT25
    and r3, r6, #0x1
    mla r1, r3, r1, r2
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x120]
    add r1, r1, r5, lsl #0x2
    mov r0, r0, lsl #0x2
    ldr r1, [r1, #0x120]
    mov r0, r0, lsr #0x18
    mov r3, r6, lsl #0x1f
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    ldr r0, [sp, #0x8]
    and r3, r3, #-2147483648
    ldrh r2, [r0]
    ldr r0, _LIT30
    mov r1, r1, lsr #0x10
    orr r0, r3, r0
    bl func_ov002_021e2fc4
.L_2090:
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x1
    bne .L_2158
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_2158
    ldr r0, _LIT24
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    bne .L_2158
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT31
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3a04
    cmp r0, #0x0
    beq .L_2158
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT31
    mov r0, r0, lsl #0x1f
    mov r6, r0, lsr #0x1f
    mov r0, r6
    bl func_ov002_021c3a80
    mov r5, r0
    ldr r1, _LIT31
    mov r0, r6
    bl func_ov002_021c3a80
    ldr r1, _LIT26
    ldr r2, _LIT25
    and r3, r6, #0x1
    mla r1, r3, r1, r2
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x120]
    add r1, r1, r5, lsl #0x2
    mov r0, r0, lsl #0x2
    ldr r1, [r1, #0x120]
    mov r0, r0, lsr #0x18
    mov r2, r6, lsl #0x1f
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    ldr r0, _LIT32
    and r2, r2, #-2147483648
    orr r0, r2, r0
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
.L_2158:
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_223c
    ldrh r2, [r4]
    ldr r0, _LIT33
    cmp r2, r0
    bgt .L_21a0
    bge .L_2224
    ldr r0, _LIT34
    cmp r2, r0
    bgt .L_2190
    beq .L_2224
    b .L_223c
.L_2190:
    add r0, r0, #0xc
    cmp r2, r0
    beq .L_2224
    b .L_223c
.L_21a0:
    ldr r0, _LIT35
    cmp r2, r0
    bgt .L_2218
    beq .L_2224
    b .L_223c
_LIT15: .word 0x0000168e
_LIT16: .word data_ov002_022cd65c
_LIT17: .word data_ov002_022d0170
_LIT18: .word data_ov002_022cf0c4
_LIT19: .word 0x000016de
_LIT20: .word 0x00001520
_LIT21: .word 0x0000184f
_LIT22: .word 0x00001964
_LIT23: .word 0x00001975
_LIT24: .word data_ov002_022d008c
_LIT25: .word data_ov002_022cf08c
_LIT26: .word 0x00000868
_LIT27: .word 0x00001596
_LIT28: .word 0x00001379
_LIT29: .word 0x0000190a
_LIT30: .word 0x0050190a
_LIT31: .word 0x00001a28
_LIT32: .word 0x00501a28
_LIT33: .word 0x00001710
_LIT34: .word 0x000012d2
_LIT35: .word 0x00001973
_LIT36: .word data_ov002_022ce1a8
_LIT37: .word data_ov002_022cf0cc
_LIT38: .word data_ov002_022ce4a8
_LIT39: .word 0x00001ae0
.L_2218:
    add r0, r0, #0x184
    cmp r2, r0
    bne .L_223c
.L_2224:
    ldrh r0, [r4, #0x2]
    mov r1, #0xb
    mov r3, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d5a90
.L_223c:
    ldr r0, _LIT36
    mov r1, #0x64
    str r1, [r0, #0x5a4]
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2254:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_22c8
    mov r0, r0, lsl #0x1f
    mov r5, r0, lsr #0x1f
    mov r2, #0x14
    ldr r0, _LIT26
    ldr r3, _LIT37
    and r4, r5, #0x1
    mul r2, r1, r2
    mla r0, r4, r0, r3
    ldr r0, [r2, r0]
    mov r0, r0, lsr #0x1
    tst r0, #0x1
    beq .L_22c8
    cmp r5, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x39
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_22c8:
    bl func_ov002_02256f44
    cmp r0, #0x0
    addne sp, sp, #0xe8
    mov r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT36
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_22f4:
    bl func_ov002_021b03e8
    ldr r1, _LIT36
    ldr r0, [r1, #0x480]
    subs r0, r0, #0x1
    str r0, [r1, #0x480]
    movne r0, #0x1
    strne r0, [r1, #0x5a4]
    addne sp, sp, #0xe8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r1, #0x5a4]
    add r0, r0, #0x1
    str r0, [r1, #0x5a4]
.L_2324:
    ldr r0, _LIT36
    mov r1, #0x1
    str r1, [r0, #0x5d8]
    ldr r0, [r0, #0x488]
    subs r6, r0, #0x1
    bmi .L_23c0
    ldr r1, _LIT38
    mov r0, #0x18
    mla r5, r6, r0, r1
    ldr r4, _LIT25
    ldr r8, _LIT26
    mov r9, #0x0
    mov r7, #0x14
.L_2358:
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_23b4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r3, r2, r8, r4
    mla r3, r1, r7, r3
    ldr r2, [r3, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    ldrneh r2, [r3, #0x38]
    cmpne r2, #0x0
    beq .L_23b4
    ldr r2, [r3, #0x40]
    mov r2, r2, lsr #0x3
    tst r2, #0x1
    beq .L_23b4
    mov r2, r9
    mov r3, r9
    bl func_ov002_021deb3c
.L_23b4:
    sub r5, r5, #0x18
    subs r6, r6, #0x1
    bpl .L_2358
.L_23c0:
    mov r0, #0x0
    str r0, [sp, #0x20]
.L_23c8:
    ldr r0, _LIT24
    ldr fp, _LIT39
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x20]
    ldr r2, _LIT25
    eor r6, r3, r0
    ldr r1, _LIT26
    and r0, r6, #0x1
    mla r9, r0, r1, r2
    mov r0, r6, lsl #0x1f
    and r0, r0, #-2147483648
    add r8, r9, #0x30
    orr sl, r0, #0x200000
    mov r7, #0x0
    add r4, fp, #0xa
    add r5, fp, #0x9
.L_2408:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r9, #0x38]
    cmpne r0, #0x0
    beq .L_24a4
    ldr r1, [r9, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_24a4
    mov r0, r6
    mov r1, r7
    mov r2, fp
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_24a4
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9dec
    cmp r0, fp
    cmpne r0, r5
    cmpne r0, r4
    bne .L_24a4
    ldr r1, [r8]
    mov r2, r7, lsl #0x10
    mov r3, r1, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r3, r3, lsl #0x1
    and r2, r2, #0x1f0000
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r2, sl, r2
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r2, #0x0
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_24a4:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x14
    add r9, r9, #0x14
    blt .L_2408
    ldr r0, [sp, #0x20]
    add r0, r0, #0x1
    str r0, [sp, #0x20]
    cmp r0, #0x2
    blt .L_23c8
    ldr r7, _LIT27
    mov r6, #0x1
    mov r9, #0x0
    sub r5, r7, #0x7e
    add r4, r7, #0x2
    mov fp, r6
.L_24e4:
    ldr r1, _LIT26
    ldr r0, _LIT25
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    mov sl, #0x0
    add r8, r0, #0x30
.L_24fc:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_2574
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b9dec
    cmp r0, r7
    cmpne r0, r4
    bne .L_2538
    mov r0, r9
    mov r1, sl
    mov r2, r7
    mov r3, r6
    bl func_ov002_021d5a90
.L_2538:
    mov r0, r9
    mov r1, sl
    add r2, r7, #0x84
    mov r3, fp
    bl func_ov002_021d5a90
    mov r0, r9
    mov r1, sl
    mov r2, r5
    mov r3, #0x1
    bl func_ov002_021d5a90
    ldr r2, _LIT39
    mov r0, r9
    mov r1, sl
    mov r3, #0x1
    bl func_ov002_021d5a90
.L_2574:
    add r8, r8, #0x14
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_24fc
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_24e4
    ldr r1, _LIT36
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_25ac:
    bl func_ov002_02256f44
    cmp r0, #0x0
    addne sp, sp, #0xe8
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT36
    mov r0, #0x0
    str r0, [r1, #0x5d8]
    ldr r2, [r1, #0x5a4]
    add sp, sp, #0xe8
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_25e4:
    ldr r0, _LIT36
    mov r1, #0x0
    str r1, [r0, #0x5a0]
    mov r0, #0x1
    add sp, sp, #0xe8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
