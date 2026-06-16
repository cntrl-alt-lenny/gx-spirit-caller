; func_ov002_022ab3e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov002_022cd73c
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a8
        .extern data_ov002_022d016c
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d11bc
        .extern data_ov002_022d1410
        .extern data_ov002_022d1910
        .extern func_0202b878
        .extern func_0202b890
        .extern func_0202b8a8
        .extern func_0202b8c0
        .extern func_0202b950
        .extern func_0202b980
        .extern func_0202e234
        .extern func_0208e200
        .extern func_ov002_021b9bd4
        .extern func_ov002_021b9dd4
        .extern func_ov002_021b9e00
        .extern func_ov002_021b9e48
        .extern func_ov002_021b9e90
        .extern func_ov002_021c38c4
        .extern func_ov002_021c4c9c
        .extern func_ov002_021c84f0
        .extern func_ov002_022a6324
        .extern func_ov002_022aaf38
        .extern func_ov002_022aaf8c
        .extern func_ov002_022aafe4
        .extern func_ov002_022ab038
        .extern func_ov002_022ab0a4
        .extern func_ov002_022ab294
        .global func_ov002_022ab3e4
        .arm
func_ov002_022ab3e4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r8, r0
    ldr r0, [r1, #0x4]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1b
    ldrh r5, [r1, #0x90]
    mov r0, r0, lsr #0x1e
    add r0, r0, r0, lsr #0x1f
    movs r0, r0, asr #0x1
    mov r1, r5, lsl #0x1f
    mov r2, r5, lsl #0x1a
    mov r3, r5, lsl #0x12
    movne r7, #0x16
    ldr r0, _LIT2
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    strh r5, [sp, #0x4]
    moveq r7, #0x0
    mov r4, #0x0
    bl func_ov002_022a6324
    cmp r0, #0x0
    ldrnesb r1, [r0]
    cmpne r1, #0x0
    beq .L_b0
    ldrh r2, [r0, #0xa]
    mov r1, r2, lsl #0x11
    strh r2, [sp, #0x2]
    movs r1, r1, lsr #0x1f
    bne .L_ac
    ldr r1, _LIT3
    ldr r1, [r1, #0xd04]
    cmp r1, #0x3
    beq .L_ac
    strh r2, [sp]
    ldrh r2, [sp]
    ldr r1, _LIT4
    ldr r3, [r1, #0x4]
    mov r1, r2, lsl #0x1f
    cmp r3, r1, lsr #0x1f
    bne .L_b0
.L_ac:
    ldr r4, [r0, #0xc]
.L_b0:
    ldr r0, _LIT5
    ldr r0, [r0, #0xd0]
    cmp r0, #0x2
    bne .L_e4
    ldr r0, _LIT6
    ldr r1, [r0, #0x10]
    cmp r1, #0x0
    ble .L_e4
    ldrh r0, [sp, #0x4]
    mov r4, r1
    bic r0, r0, #0x3e
    orr r0, r0, #0x20
    strh r0, [sp, #0x4]
.L_e4:
    ldrh r0, [sp, #0x4]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    sub r0, r0, #0xc
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_124
    b .L_110
    b .L_110
    b .L_110
    b .L_110
.L_110:
    add r1, sp, #0x4
    mov r0, r8
    bl func_ov002_022ab294
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_124:
    cmp r4, #0x1
    ble .L_b14
    mov r5, #0x20
    bl func_0208e200
    mov r1, r7, lsl #0x5
    add r1, r1, #0x1f
    add r6, r0, r1, lsl #0x1
    bl func_0208e200
    ldrh r2, [sp, #0x4]
    add r1, r7, #0x1
    mov r3, r1, lsl #0x5
    mov r1, r2, lsl #0x12
    add r3, r3, #0x1f
    mov r2, r2, lsl #0x1a
    mov r1, r1, lsr #0x18
    add r1, r1, r2, lsr #0x1b
    cmp r1, #0x4
    add r7, r0, r3, lsl #0x1
    ble .L_180
    mov r0, r4
    bl func_0202e234
    cmp r0, #0x0
    beq .L_538
.L_180:
    ldr r0, [r8, #0x20]
    cmp r0, #0x0
    bne .L_1a4
    ldr r1, [r8]
    mov r0, r4, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r1, lsl #0x10
    cmp r2, r0, lsr #0x10
    beq .L_2ec
.L_1a4:
    ldrh r2, [sp, #0x4]
    mov r0, r2, lsl #0x12
    mov r1, r2, lsl #0x1a
    mov r0, r0, lsr #0x18
    add r1, r0, r1, lsr #0x1b
    cmp r1, #0x4
    bgt .L_1fc
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r2, r8, #0x24
    bl func_ov002_021c4c9c
    ldrh r1, [sp, #0x4]
    mov r2, #0x1
    mov r0, r1, lsl #0x12
    mov r9, r1, lsl #0x1f
    mov r3, r1, lsl #0x1a
    mov r1, r0, lsr #0x18
    mov r0, r9, lsr #0x1f
    add r1, r1, r3, lsr #0x1b
    bl func_ov002_021c84f0
    str r0, [r8, #0x50]
    b .L_2bc
.L_1fc:
    mov r0, r4
    str r4, [r8, #0x24]
    bl func_0202b950
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
    mov r0, r4
    str r1, [r8, #0x38]
    bl func_0202b980
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [r8, #0x3c]
    ldr r1, [r8, #0x38]
    mov r0, r4
    str r1, [r8, #0x40]
    ldr r1, [r8, #0x3c]
    str r1, [r8, #0x44]
    bl func_0202b8a8
    mov r1, r0
    str r0, [r8, #0x34]
    mov r0, r4
    str r1, [r8, #0x50]
    bl func_0202b890
    str r0, [r8, #0x2c]
    mov r0, r4
    bl func_0202b878
    str r0, [r8, #0x28]
    ldrh r9, [sp, #0x4]
    mov r0, r9, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    bne .L_2bc
    mov r0, r9, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r3, _LIT7
    ldr r1, _LIT8
    and r2, r0, #0x1
    mla r3, r2, r1, r3
    mov r1, r9, lsl #0x12
    add r2, r3, #0x120
    mov r1, r1, lsr #0x18
    ldr r2, [r2, r1, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c38c4
    str r0, [r8, #0x34]
.L_2bc:
    ldr r1, [r8, #0x38]
    ldr r0, _LIT9
    cmp r1, r0
    movgt r1, r0
    str r1, [r8, #0x38]
    ldr r1, [r8, #0x3c]
    ldr r0, _LIT9
    cmp r1, r0
    movgt r1, r0
    str r1, [r8, #0x3c]
    mov r0, #0x0
    str r0, [r8, #0x20]
.L_2ec:
    ldr r1, [r8, #0x24]
    cmp r1, r4
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x10
    mov r2, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r8
    orr r1, r2, r1, lsr #0x10
    bl func_ov002_022ab0a4
    ldr r1, [r8, #0x3c]
    ldr lr, [r8, #0x38]
    ldr r0, _LIT10
    cmp lr, r1
    movgt r1, lr
    cmp r1, r0
    movge r1, #0x1
    movlt r1, #0x0
    ldr r0, [r8, #0x40]
    add r4, r1, #0x4
    cmp lr, r0
    movgt ip, #0x2
    bgt .L_354
    movlt ip, #0x3
    movge ip, #0x1
.L_354:
    cmp lr, #0x0
    mov r9, #0x0
    bge .L_374
    mov r0, ip, lsl #0xc
    orr r0, r0, #0x9e
    strh r0, [r6], #-2
    add r9, r9, #0x1
    b .L_3b4
.L_374:
    ldr r1, _LIT11
    mov r0, #0xa
.L_37c:
    mov r2, lr, lsr #0x1f
    smull sl, r3, r1, lr
    add r3, r2, r3, asr #0x2
    smull r3, r2, r0, r3
    mov r2, lr
    sub r3, lr, r3
    add r3, r3, #0x91
    orr r3, r3, ip, lsl #0xc
    strh r3, [r6], #-2
    smull r3, lr, r1, r2
    mov r2, r2, lsr #0x1f
    adds lr, r2, lr, asr #0x2
    add r9, r9, #0x1
    bne .L_37c
.L_3b4:
    cmp r9, r4
    add r9, r9, #0x1
    bge .L_3d4
    mov r0, #0x0
.L_3c4:
    cmp r9, r4
    strh r0, [r6], #-2
    add r9, r9, #0x1
    blt .L_3c4
.L_3d4:
    ldr r0, _LIT12
    add r1, r4, #0x1
    strh r0, [r6]
    ldr r0, [r8, #0x44]
    ldr lr, [r8, #0x3c]
    sub r5, r5, r1
    cmp lr, r0
    movgt ip, #0x2
    bgt .L_400
    movlt ip, #0x3
    movge ip, #0x1
.L_400:
    cmp lr, #0x0
    mov r9, #0x0
    bge .L_420
    mov r0, ip, lsl #0xc
    orr r0, r0, #0x9e
    strh r0, [r7], #-2
    add r9, r9, #0x1
    b .L_460
.L_420:
    ldr r1, _LIT11
    mov r0, #0xa
.L_428:
    mov r2, lr, lsr #0x1f
    smull sl, r3, r1, lr
    add r3, r2, r3, asr #0x2
    smull r3, r2, r0, r3
    mov r2, lr
    sub r3, lr, r3
    add r3, r3, #0x91
    orr r3, r3, ip, lsl #0xc
    strh r3, [r7], #-2
    smull r3, lr, r1, r2
    mov r2, r2, lsr #0x1f
    adds lr, r2, lr, asr #0x2
    add r9, r9, #0x1
    bne .L_428
.L_460:
    cmp r9, r4
    add r9, r9, #0x1
    bge .L_480
    mov r0, #0x0
.L_470:
    cmp r9, r4
    strh r0, [r7], #-2
    add r9, r9, #0x1
    blt .L_470
.L_480:
    ldr r0, _LIT13
    strh r0, [r7]
    ldr r1, [r8, #0x50]
    ldr r0, [r8, #0x34]
    cmp r0, r1
    movgt r2, #0x2
    bgt .L_4a4
    movlt r2, #0x3
    movge r2, #0x1
.L_4a4:
    ldr r1, _LIT14
    mov r0, r8
    strh r1, [r6, #-2]
    ldr r1, [r8, #0x34]
    add r1, r1, #0x91
    orr r1, r1, r2, lsl #0xc
    strh r1, [r7, #-2]
    ldr r1, [r8, #0x2c]
    bl func_ov002_022aafe4
    ldr r1, _LIT15
    sub r5, r5, #0x3
    strh r1, [r6, #-6]
    add r0, r1, #0x1
    strh r0, [r6, #-4]
    add r0, r1, #0x2
    strh r0, [r7, #-6]
    add r0, r1, #0x3
    strh r0, [r7, #-4]
    ldr r1, [r8, #0x28]
    sub r6, r6, #0x8
    cmp r1, #0x0
    sub r7, r7, #0x8
    beq .L_62c
    cmp r1, #0x15
    bgt .L_62c
    mov r0, r8
    bl func_ov002_022aaf38
    ldr r2, _LIT16
    sub r5, r5, #0x2
    add r0, r2, #0x1
    strh r2, [r6, #-2]
    strh r0, [r6], #-4
    add r1, r2, #0x2
    add r0, r2, #0x3
    strh r1, [r7, #-2]
    strh r0, [r7], #-4
    b .L_62c
.L_538:
    ldr r1, _LIT17
    cmp r4, r1
    bne .L_5ac
    ldr r0, _LIT18
    ldr r0, [r0, #0x38]
    tst r0, #0x40
    beq .L_5ac
    ldrh r9, [sp, #0x4]
    ldr r0, _LIT19
    sub r2, r1, #0xb00
    mov r1, r9, lsl #0x1f
    mov r3, r9, lsl #0x12
    mov r1, r1, lsr #0x1f
    and r1, r1, #0x1
    mov r9, r9, lsl #0x1a
    mov r3, r3, lsr #0x18
    add r9, r3, r9, lsr #0x1b
    mov r3, #0x14
    mul r3, r9, r3
    mla r0, r1, r2, r0
    ldr r0, [r3, r0]
    cmp r0, #0x0
    beq .L_5ac
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r8
    orr r1, r1, #0x30000
    bl func_ov002_022ab0a4
    b .L_5b8
.L_5ac:
    mov r0, r8
    mov r1, r4
    bl func_ov002_022ab0a4
.L_5b8:
    mov r0, r4
    bl func_0202b890
    mov r1, r0
    mov r0, r8
    bl func_ov002_022aafe4
    ldr r3, _LIT15
    mov r0, r4
    add r1, r3, #0x1
    strh r3, [r6, #-2]
    strh r1, [r6], #-4
    add r2, r3, #0x2
    add r1, r3, #0x3
    strh r2, [r7, #-2]
    strh r1, [r7], #-4
    sub r5, r5, #0x2
    bl func_0202b8c0
    movs r1, r0
    beq .L_62c
    mov r0, r8
    bl func_ov002_022aaf8c
    ldr r2, _LIT16
    sub r5, r5, #0x2
    add r0, r2, #0x1
    strh r2, [r6, #-2]
    strh r0, [r6], #-4
    add r1, r2, #0x2
    add r0, r2, #0x3
    strh r1, [r7, #-2]
    strh r0, [r7], #-4
.L_62c:
    ldrh r0, [sp, #0x4]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_ae8
    mov r0, r0, lsl #0x1f
    mov r2, r0, lsr #0x1f
    ldr r0, _LIT8
    and r3, r2, #0x1
    mov r2, #0x14
    mul r4, r3, r0
    ldr r9, _LIT20
    mul r3, r1, r2
    add r1, r9, r4
    ldrh r1, [r3, r1]
    cmp r1, #0x0
    beq .L_ae8
    ldr r1, [r8]
    ldr ip, _LIT21
    mov r1, r1, lsl #0x10
    cmp ip, r1, lsr #0x10
    mov r2, r1, lsr #0x10
    mov r1, #0x0
    blt .L_6dc
    cmp r2, ip
    bge .L_70c
    sub r9, ip, #0x76
    cmp r2, r9
    bgt .L_6cc
    bge .L_724
    add r0, r0, #0xaf0
    cmp r2, r0
    bgt .L_730
    ldr r0, _LIT22
    cmp r2, r0
    blt .L_730
    addne r0, r0, #0x1
    cmpne r2, r0
    beq .L_70c
    b .L_730
.L_6cc:
    sub r0, ip, #0x5
    cmp r2, r0
    beq .L_70c
    b .L_730
.L_6dc:
    ldr r0, _LIT23
    cmp r2, r0
    bgt .L_6fc
    bge .L_724
    ldr r0, _LIT24
    cmp r2, r0
    beq .L_724
    b .L_730
.L_6fc:
    add r0, r0, #0x9c
    cmp r2, r0
    beq .L_724
    b .L_730
.L_70c:
    ldr r0, _LIT19
    add r0, r0, r4
    ldr r1, [r3, r0]
    cmp r1, #0x0
    addne r1, r1, #0x7
    b .L_730
.L_724:
    ldr r0, _LIT19
    add r0, r0, r4
    ldr r1, [r3, r0]
.L_730:
    cmp r1, #0x0
    beq .L_764
    mov r0, r8
    bl func_ov002_022ab038
    ldr r2, _LIT25
    sub r5, r5, #0x2
    add r0, r2, #0x1
    strh r2, [r6, #-2]
    strh r0, [r6], #-4
    add r1, r2, #0x2
    add r0, r2, #0x3
    strh r1, [r7, #-2]
    strh r0, [r7], #-4
.L_764:
    ldrh r0, [sp, #0x4]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9bd4
    cmp r0, #0x0
    blt .L_818
    ldr r1, _LIT11
    mov r9, r0, lsr #0x1f
    smull r2, r3, r1, r0
    add r3, r9, r3, asr #0x2
    mov r4, #0xa
    smull r2, r3, r4, r3
    sub r3, r0, r2
    add r3, r3, #0x91
    smull r0, r2, r1, r0
    mov r0, r3, lsl #0x10
    ldr r3, _LIT26
    mov r0, r0, lsr #0x10
    strh r3, [r6], #-2
    orr r0, r0, #0x1000
    strh r0, [r7], #-2
    sub r5, r5, #0x1
    adds r2, r9, r2, asr #0x2
    beq .L_818
    mov r0, #0x0
    mov r9, r4
.L_7d4:
    mov r3, r2, lsr #0x1f
    smull r4, sl, r1, r2
    add sl, r3, sl, asr #0x2
    smull r3, r4, r9, sl
    sub sl, r2, r3
    mov r4, r2
    add r2, sl, #0x91
    mov r2, r2, lsl #0x10
    mov sl, r2, lsr #0x10
    smull r3, r2, r1, r4
    mov r3, r4, lsr #0x1f
    strh r0, [r6], #-2
    orr r4, sl, #0x1000
    strh r4, [r7], #-2
    sub r5, r5, #0x1
    adds r2, r3, r2, asr #0x2
    bne .L_7d4
.L_818:
    ldrh r0, [sp, #0x4]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9dd4
    cmp r0, #0x0
    beq .L_8cc
    ldr r1, _LIT11
    mov r9, r0, lsr #0x1f
    smull r2, r3, r1, r0
    add r3, r9, r3, asr #0x2
    mov r4, #0xa
    smull r2, r3, r4, r3
    sub r3, r0, r2
    add r3, r3, #0x91
    smull r0, r2, r1, r0
    mov r0, r3, lsl #0x10
    ldr r3, _LIT27
    mov r0, r0, lsr #0x10
    strh r3, [r6], #-2
    orr r0, r0, #0x1000
    strh r0, [r7], #-2
    sub r5, r5, #0x1
    adds r2, r9, r2, asr #0x2
    beq .L_8cc
    mov r0, #0x0
    mov r9, r4
.L_888:
    mov r3, r2, lsr #0x1f
    smull r4, sl, r1, r2
    add sl, r3, sl, asr #0x2
    smull r3, r4, r9, sl
    sub sl, r2, r3
    mov r4, r2
    add r2, sl, #0x91
    mov r2, r2, lsl #0x10
    mov sl, r2, lsr #0x10
    smull r3, r2, r1, r4
    mov r3, r4, lsr #0x1f
    strh r0, [r6], #-2
    orr r4, sl, #0x1000
    strh r4, [r7], #-2
    sub r5, r5, #0x1
    adds r2, r3, r2, asr #0x2
    bne .L_888
.L_8cc:
    ldrh r0, [sp, #0x4]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9e00
    cmp r0, #0x0
    beq .L_980
    ldr r1, _LIT11
    mov r9, r0, lsr #0x1f
    smull r2, r3, r1, r0
    add r3, r9, r3, asr #0x2
    mov r4, #0xa
    smull r2, r3, r4, r3
    sub r3, r0, r2
    add r3, r3, #0x91
    smull r0, r2, r1, r0
    mov r0, r3, lsl #0x10
    ldr r3, _LIT28
    mov r0, r0, lsr #0x10
    strh r3, [r6], #-2
    orr r0, r0, #0x1000
    strh r0, [r7], #-2
    sub r5, r5, #0x1
    adds r2, r9, r2, asr #0x2
    beq .L_980
    mov r0, #0x0
    mov r9, r4
.L_93c:
    mov r3, r2, lsr #0x1f
    smull r4, sl, r1, r2
    add sl, r3, sl, asr #0x2
    smull r3, r4, r9, sl
    sub sl, r2, r3
    mov r4, r2
    add r2, sl, #0x91
    mov r2, r2, lsl #0x10
    mov sl, r2, lsr #0x10
    smull r3, r2, r1, r4
    mov r3, r4, lsr #0x1f
    strh r0, [r6], #-2
    orr r4, sl, #0x1000
    strh r4, [r7], #-2
    sub r5, r5, #0x1
    adds r2, r3, r2, asr #0x2
    bne .L_93c
.L_980:
    ldrh r0, [sp, #0x4]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9e48
    cmp r0, #0x0
    beq .L_a34
    ldr r1, _LIT11
    mov r9, r0, lsr #0x1f
    smull r2, r3, r1, r0
    add r3, r9, r3, asr #0x2
    mov r4, #0xa
    smull r2, r3, r4, r3
    sub r3, r0, r2
    add r3, r3, #0x91
    smull r0, r2, r1, r0
    mov r0, r3, lsl #0x10
    ldr r3, _LIT29
    mov r0, r0, lsr #0x10
    strh r3, [r6], #-2
    orr r0, r0, #0x1000
    strh r0, [r7], #-2
    sub r5, r5, #0x1
    adds r2, r9, r2, asr #0x2
    beq .L_a34
    mov r0, #0x0
    mov r9, r4
.L_9f0:
    mov r3, r2, lsr #0x1f
    smull r4, sl, r1, r2
    add sl, r3, sl, asr #0x2
    smull r3, r4, r9, sl
    sub sl, r2, r3
    mov r4, r2
    add r2, sl, #0x91
    mov r2, r2, lsl #0x10
    mov sl, r2, lsr #0x10
    smull r3, r2, r1, r4
    mov r3, r4, lsr #0x1f
    strh r0, [r6], #-2
    orr r4, sl, #0x1000
    strh r4, [r7], #-2
    sub r5, r5, #0x1
    adds r2, r3, r2, asr #0x2
    bne .L_9f0
.L_a34:
    ldrh r0, [sp, #0x4]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9e90
    cmp r0, #0x0
    beq .L_ae8
    ldr r1, _LIT11
    mov r9, r0, lsr #0x1f
    smull r2, r3, r1, r0
    add r3, r9, r3, asr #0x2
    mov r4, #0xa
    smull r2, r3, r4, r3
    sub r3, r0, r2
    add r3, r3, #0x91
    smull r0, r2, r1, r0
    mov r0, r3, lsl #0x10
    ldr r3, _LIT30
    mov r0, r0, lsr #0x10
    strh r3, [r6], #-2
    orr r0, r0, #0x1000
    strh r0, [r7], #-2
    sub r5, r5, #0x1
    adds r2, r9, r2, asr #0x2
    beq .L_ae8
    mov r0, #0x0
    mov r9, r4
.L_aa4:
    mov r3, r2, lsr #0x1f
    smull r4, sl, r1, r2
    add sl, r3, sl, asr #0x2
    smull r3, r4, r9, sl
    sub sl, r2, r3
    mov r4, r2
    add r2, sl, #0x91
    mov r2, r2, lsl #0x10
    mov sl, r2, lsr #0x10
    smull r3, r2, r1, r4
    mov r3, r4, lsr #0x1f
    strh r0, [r6], #-2
    orr r4, sl, #0x1000
    strh r4, [r7], #-2
    sub r5, r5, #0x1
    adds r2, r3, r2, asr #0x2
    bne .L_aa4
.L_ae8:
    ldr r0, [r8, #0x1c]
    cmp r0, r5
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, #0x0
    str r5, [r8, #0x1c]
    str r0, [r8, #0x14]
    sub r0, r0, #0x1
    add sp, sp, #0x8
    str r0, [r8, #0x18]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_b14:
    mov r0, r8
    mov r1, #0x0
    bl func_ov002_022ab0a4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov002_022d1910
_LIT2: .word data_ov002_022d1410
_LIT3: .word data_ov002_022d016c
_LIT4: .word data_ov002_022cd73c
_LIT5: .word data_ov002_022d0f2c
_LIT6: .word data_ov002_022d11bc
_LIT7: .word data_ov002_022cf16c
_LIT8: .word 0x00000868
_LIT9: .word 0x0001869f
_LIT10: .word 0x00002710
_LIT11: .word 0x66666667
_LIT12: .word 0x00004089
_LIT13: .word 0x0000408a
_LIT14: .word 0x0000408b
_LIT15: .word 0x00004081
_LIT16: .word 0x0000407d
_LIT17: .word 0x00001368
_LIT18: .word data_021040ac
_LIT19: .word data_ov002_022cf1a8
_LIT20: .word data_ov002_022cf1a4
_LIT21: .word 0x000014d1
_LIT22: .word 0x00001357
_LIT23: .word 0x0000197d
_LIT24: .word 0x0000171f
_LIT25: .word 0x00004085
_LIT26: .word 0x0000408c
_LIT27: .word 0x00004090
_LIT28: .word 0x0000408d
_LIT29: .word 0x0000408e
_LIT30: .word 0x0000408f
