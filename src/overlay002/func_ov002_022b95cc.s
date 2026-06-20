; func_ov002_022b95cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccfd8
        .extern data_ov002_022ccfec
        .extern data_ov002_022cd73c
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d1410
        .extern data_ov002_022d1af8
        .extern data_ov002_022d28fc
        .extern func_02021660
        .extern func_020216b0
        .extern func_0202224c
        .extern func_0202e310
        .extern func_02037208
        .extern func_02037dc0
        .extern func_020a978c
        .extern func_ov002_022a6324
        .extern func_ov002_022b9420
        .extern func_ov002_022b94b8
        .extern func_ov002_022bdb88
        .global func_ov002_022b95cc
        .arm
func_ov002_022b95cc:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_788
    b .L_38
    b .L_f0
    b .L_22c
    b .L_59c
    b .L_674
    b .L_6a8
    b .L_754
.L_38:
    add r0, r4, #0xc00
    ldrh ip, [r0, #0x68]
    ldr r0, _LIT0
    mov r2, ip, lsl #0x1a
    mov r1, ip, lsl #0x1f
    mov r5, r2, lsr #0x1b
    mov r6, r1, lsr #0x1f
    mov r3, ip, lsl #0x12
    mov r1, r6
    mov r2, r5
    mov r3, r3, lsr #0x18
    strh ip, [sp, #0x4]
    bl func_ov002_022a6324
    ldr r1, _LIT1
    mov r2, #0x0
    str r2, [r1, #0x4]
    ldrsb r1, [r0]
    mov r2, #0x0
    mov r3, r6
    cmp r1, #0x0
    ldrne r0, [r0, #0xc]
    moveq r0, #0xfe0
    str r0, [r4, #0xd14]
    str r2, [r4, #0xd18]
    str r2, [r4, #0xd1c]
    str r5, [sp]
    ldr r1, [r4, #0xd14]
    mov r0, r4
    bl func_ov002_022b94b8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    str r0, [r4, #0xd20]
    mov r1, #0x0
    str r1, [r4, #0xd24]
    str r1, [r4, #0xd28]
    str r1, [r4, #0xd2c]
    ldr r0, [r4, #0xc58]
    cmp r0, #0x2
    moveq r1, #0x1
    str r1, [r4, #0xd30]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_788
.L_f0:
    ldr r0, [r4, #0xc64]
    ldr r5, _LIT2
    cmp r0, #0xf
    blt .L_788
    ldr r0, [r4, #0xc58]
    cmp r0, #0x2
    bne .L_134
    add r0, r4, #0xc00
    ldrh r1, [r0, #0x68]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x1f
    ldr r0, [r0, #0x4]
    mov r1, r1, lsr #0x1f
    cmp r1, r0
    movne r6, #0x1
    moveq r6, #0x0
    b .L_15c
.L_134:
    ldr r0, [r4, #0xd14]
    bl func_0202e310
    cmp r0, #0x0
    beq .L_158
    ldr r0, [r4, #0xd20]
    cmp r0, #0x0
    movne r6, #0x1
    moveq r6, #0x0
    b .L_15c
.L_158:
    mov r6, #0x0
.L_15c:
    ldr r0, [r4, #0xc58]
    cmp r0, #0x2
    moveq r1, #0x41
    beq .L_1bc
    ldr r0, [r4, #0xd14]
    ldr r1, _LIT4
    mov r2, #0x1
    add r1, r0, r1
    cmp r1, #0x2
    ldrhi r1, _LIT5
    addhi r1, r0, r1
    cmphi r1, #0x2
    movhi r2, #0x0
    cmp r2, #0x0
    movne r1, #0x1d
    bne .L_1bc
    bl func_0202e310
    cmp r0, #0x0
    movne r1, #0x10
    bne .L_1bc
    ldr r0, [r4, #0xc58]
    cmp r0, #0x1
    moveq r1, #0x3b
    movne r1, #0x3e
.L_1bc:
    mov r3, #0x0
    mov r0, r5
    mov r2, r6
    str r3, [sp]
    add r3, r4, #0xc80
    bl func_ov002_022bdb88
    ldr r0, [r4, #0xc58]
    cmp r0, #0x2
    bne .L_218
    add r0, r4, #0x124
    ldr r2, [r4, #0xd14]
    ldr r1, _LIT6
    add r0, r0, #0x800
    bl func_020a978c
    add r0, r4, #0x14c
    ldr r1, _LIT7
    add r0, r0, #0x800
    bl func_020a978c
    mov r0, #0x5
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_788
.L_218:
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_788
.L_22c:
    ldr r0, [r4, #0xd14]
    ldr r1, _LIT4
    mov r2, #0x1
    add r1, r0, r1
    cmp r1, #0x2
    ldrhi r1, _LIT5
    addhi r1, r0, r1
    cmphi r1, #0x2
    movhi r2, #0x0
    cmp r2, #0x0
    movne r5, #0x48
    bne .L_27c
    bl func_0202e310
    cmp r0, #0x0
    movne r5, #0x18
    bne .L_27c
    ldr r0, [r4, #0xc58]
    cmp r0, #0x1
    moveq r5, #0x12
    movne r5, #0x18
.L_27c:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x1e
    bne .L_2d8
    ldr r0, [r4, #0xd20]
    cmp r0, #0x0
    beq .L_2d8
    ldr r2, [r4, #0xd14]
    ldr r1, _LIT8
    cmp r2, r1
    addne r0, r1, #0x1
    cmpne r2, r0
    addne r0, r1, #0x2
    cmpne r2, r0
    beq .L_2c4
    ldr r0, _LIT5
    add r0, r2, r0
    cmp r0, #0x2
    bhi .L_2d8
.L_2c4:
    mov r0, #0x4f
    sub r1, r0, #0x50
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_2d8:
    ldr r1, [r4, #0xc64]
    sub r0, r5, #0x10
    cmp r1, r0
    bne .L_33c
    ldr r0, [r4, #0xd20]
    cmp r0, #0x0
    ldrne r2, [r4, #0xd14]
    ldrne r1, _LIT8
    cmpne r2, r1
    addne r0, r1, #0x1
    cmpne r2, r0
    addne r0, r1, #0x2
    cmpne r2, r0
    ldrne r1, _LIT9
    cmpne r2, r1
    addne r0, r1, #0x1
    cmpne r2, r0
    addne r0, r1, #0x2
    cmpne r2, r0
    beq .L_33c
    ldr r0, _LIT10
    mov r1, #0x0
    ldr r0, [r0, #0xd8]
    mov r2, #0xf
    bl func_02037dc0
.L_33c:
    ldr r0, [r4, #0xc64]
    cmp r0, r5
    blt .L_788
    add r1, r4, #0xc00
    ldrh r3, [r1, #0x68]
    mov r0, r4
    mov r2, #0x0
    mov r3, r3, lsl #0x1a
    mov r3, r3, lsr #0x1b
    str r3, [sp]
    ldrh r3, [r1, #0x68]
    ldr r1, [r4, #0xd14]
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    bl func_ov002_022b94b8
    movs r5, r0
    bne .L_3b0
    add r1, r4, #0xc00
    ldrh r3, [r1, #0x68]
    mov r0, r4
    mov r2, #0x1
    mov r3, r3, lsl #0x1a
    mov r3, r3, lsr #0x1b
    str r3, [sp]
    ldrh r3, [r1, #0x68]
    ldr r1, [r4, #0xd14]
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    bl func_ov002_022b9420
.L_3b0:
    cmp r5, #0x0
    mov r2, #0x0
    beq .L_560
    ldr r0, [r4]
    mov r1, #0x1
    bl func_02021660
    ldrsh r2, [r5, #0x14]
    mov r1, #0x6
    mov r6, r0
    bl func_020216b0
    ldrsh r2, [r5, #0x16]
    mov r0, r6
    mov r1, #0x7
    bl func_020216b0
    ldrsh r2, [r5, #0x18]
    mov r0, r6
    mov r1, #0x8
    bl func_020216b0
    ldrsh r2, [r5, #0x1a]
    mov r0, r6
    mov r1, #0x9
    bl func_020216b0
    ldrsh r2, [r5, #0x1c]
    mov r0, r6
    mov r1, #0xa
    bl func_020216b0
    ldrsh r2, [r5, #0x1e]
    mov r0, r6
    mov r1, #0xb
    bl func_020216b0
    ldr r2, [r4, #0xd14]
    ldr r1, _LIT8
    cmp r2, r1
    addne r0, r1, #0x1
    cmpne r2, r0
    addne r0, r1, #0x2
    cmpne r2, r0
    ldrne r1, _LIT9
    cmpne r2, r1
    addne r0, r1, #0x1
    cmpne r2, r0
    addne r0, r1, #0x2
    cmpne r2, r0
    beq .L_474
    mov r0, #0x28
    sub r1, r0, #0x29
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_474:
    ldr r3, [r4, #0xd14]
    ldr r0, _LIT11
    mvn r1, #0x0
    cmp r3, r0
    bgt .L_4d8
    bge .L_518
    ldr r2, _LIT12
    cmp r3, r2
    bgt .L_4a0
    moveq r1, #0x40
    b .L_524
.L_4a0:
    add r0, r2, #0xea
    cmp r3, r0
    bgt .L_524
    add r0, r2, #0xe8
    cmp r3, r0
    blt .L_524
    beq .L_508
    add r0, r2, #0xe9
    cmp r3, r0
    beq .L_510
    add r0, r2, #0xea
    cmp r3, r0
    moveq r1, #0x44
    b .L_524
.L_4d8:
    ldr r0, _LIT13
    cmp r3, r0
    bgt .L_4f8
    bge .L_520
    sub r0, r0, #0x1
    cmp r3, r0
    moveq r1, #0x46
    b .L_524
.L_4f8:
    add r0, r0, #0x1
    cmp r3, r0
    moveq r1, #0x48
    b .L_524
.L_508:
    mov r1, #0x42
    b .L_524
.L_510:
    mov r1, #0x43
    b .L_524
.L_518:
    mov r1, #0x45
    b .L_524
.L_520:
    mov r1, #0x47
.L_524:
    cmp r1, #0x0
    blt .L_540
    ldr r0, _LIT2
    mov r2, #0x0
    add r3, r4, #0xc80
    str r2, [sp]
    bl func_ov002_022bdb88
.L_540:
    mov r0, #0x1
    str r0, [r4, #0xd1c]
    str r0, [r4, #0xd18]
    mov r0, #0x3
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_788
.L_560:
    ldr r0, [r4, #0xc58]
    mvn r1, #0x0
    cmp r0, #0x0
    moveq r0, #0x4c
    movne r0, #0x4d
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    str r0, [r4, #0xd24]
    str r0, [r4, #0xd28]
    mov r0, #0x4
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_788
.L_59c:
    ldr r1, [r4, #0xd14]
    ldr r0, _LIT4
    add r0, r1, r0
    cmp r0, #0x2
    bhi .L_5f0
    ldr r0, [r4, #0xc64]
    cmp r0, #0xe
    bne .L_5d4
    ldr r0, _LIT10
    mov r1, #0x0
    ldr r0, [r0, #0xd8]
    mov r2, #0xf
    bl func_02037dc0
    b .L_5f0
.L_5d4:
    cmp r0, #0x1e
    bne .L_5f0
    mov r0, #0x29
    sub r1, r0, #0x2a
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_5f0:
    ldr r1, [r4, #0xd14]
    ldr r0, _LIT5
    add r0, r1, r0
    cmp r0, #0x2
    bhi .L_638
    ldr r0, [r4, #0xc64]
    cmp r0, #0x1
    bne .L_638
    ldr r0, _LIT10
    mov r1, #0x0
    ldr r0, [r0, #0xd8]
    mov r2, #0xf
    bl func_02037dc0
    mov r0, #0x2f
    sub r1, r0, #0x30
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_638:
    mov r0, #0x1
    bl func_0202224c
    tst r0, #0x2
    bne .L_788
    ldr r0, _LIT10
    mov r1, #0x7f
    ldr r0, [r0, #0xd8]
    mov r2, #0xf
    bl func_02037dc0
    mov r1, #0x0
    str r1, [r4, #0xd18]
    mov r0, #0x6
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_788
.L_674:
    ldr r0, [r4, #0xd14]
    bl func_0202e310
    cmp r0, #0x0
    movne r1, #0x3c
    ldr r0, [r4, #0xc64]
    moveq r1, #0x24
    cmp r0, r1
    blt .L_788
    mov r0, #0x6
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_788
.L_6a8:
    ldr r0, [r4, #0xc64]
    ldr r5, _LIT2
    cmp r0, #0x10
    bne .L_6d4
    mov r0, #0x4d
    mov r3, #0x1
    sub r1, r0, #0x4e
    mov r2, #0x0
    str r3, [r4, #0xd2c]
    bl func_02037208
    b .L_704
.L_6d4:
    cmp r0, #0x3f
    moveq r0, #0x0
    streq r0, [r4, #0xd2c]
    beq .L_704
    cmp r0, #0x4b
    bne .L_704
    mov r0, #0x92
    mov r2, #0x0
    sub r1, r0, #0x93
    mov r3, #0x1
    str r2, [r4, #0xd30]
    bl func_02037208
.L_704:
    mov r1, #0x0
.L_708:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_724
    ldr r0, [r5, #0x4]
    cmp r0, #0x41
    moveq r0, #0x1
    beq .L_738
.L_724:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r5, r5, #0x8
    blt .L_708
    mov r0, #0x0
.L_738:
    cmp r0, #0x0
    bne .L_788
    mov r0, #0x6
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_788
.L_754:
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    str r0, [r4, #0xc54]
    str r0, [r4, #0xd24]
    str r0, [r4, #0xd28]
    str r0, [r4, #0xd2c]
    add sp, sp, #0x8
    str r0, [r4, #0xd30]
    ldmia sp!, {r4, r5, r6, pc}
.L_788:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d1410
_LIT1: .word data_ov002_022d1af8
_LIT2: .word data_ov002_022d28fc
_LIT3: .word data_ov002_022cd73c
_LIT4: .word 0xffffec7a
_LIT5: .word 0xffffe65d
_LIT6: .word data_ov002_022ccfd8
_LIT7: .word data_ov002_022ccfec
_LIT8: .word 0x00001386
_LIT9: .word 0x000019a3
_LIT10: .word data_ov002_022d0f2c
_LIT11: .word 0x0000154b
_LIT12: .word 0x0000129e
_LIT13: .word 0x000019a4
