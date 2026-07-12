; func_ov005_021ae49c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_02104e6c
        .extern data_ov005_021b1460
        .extern data_ov005_021b1944
        .extern data_ov005_021b1976
        .extern data_ov005_021b19a8
        .extern data_ov005_021b19b2
        .extern data_ov005_021b1c4c
        .extern data_ov005_021b214c
        .extern func_020371b8
        .extern func_ov005_021aa3f0
        .extern func_ov005_021aadc8
        .extern func_ov005_021aedf4
        .extern func_ov005_021aef88
        .extern func_ov005_021af7e4
        .extern func_ov005_021af9c0
        .extern func_ov005_021b0084
        .extern func_ov005_021b0550
        .extern func_ov005_021b0ef8
        .extern func_ov005_021b0f34
        .extern func_ov005_021b1280
        .global func_ov005_021ae49c
        .arm
func_ov005_021ae49c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r9, r0
    ldr r1, [r9, #0x4]
    ldr r4, _LIT0
    cmp r1, #0x0
    beq .L_1350
    cmp r1, #0x1
    beq .L_1b60
    cmp r1, #0x2
    beq .L_1b80
    b .L_1bcc
.L_1350:
    ldr r1, _LIT1
    ldrh r2, [r1, #0x52]
    cmp r2, #0x0
    beq .L_17f0
    ldrh r2, [r1, #0x56]
    tst r2, #0x80
    beq .L_1424
    ldr r2, [r9, #0x18]
    cmp r2, #0x0
    bne .L_1bcc
    ldr r2, [r9, #0x14]
    cmp r2, #0x5
    bge .L_13a4
    mov r0, #0x38
    add r4, r2, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r9, #0x14]
    bl func_020371b8
    b .L_1bcc
.L_13a4:
    ldr r3, [r9, #0x24]
    ldr r2, [r9, #0x20]
    add r4, r3, #0x6
    cmp r4, r2
    bge .L_13dc
    add r1, r3, #0x1
    str r1, [r9, #0x24]
    bl func_ov005_021af9c0
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_1bcc
.L_13dc:
    ldrh r0, [r1, #0x54]
    cmp r0, #0x0
    beq .L_1bcc
    mov r0, #0x1
    str r0, [r9, #0x18]
    ldr r0, [r9, #0x10]
    mov r2, #0x0
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r9, #0x1c]
    cmp r0, #0x4
    movge r0, #0x3
    strge r0, [r9, #0x1c]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    bl func_020371b8
    b .L_1bcc
.L_1424:
    tst r2, #0x40
    beq .L_14c4
    ldr r1, [r9, #0x18]
    cmp r1, #0x0
    bne .L_1494
    ldr r1, [r9, #0x14]
    cmp r1, #0x0
    ble .L_1464
    mov r0, #0x38
    sub r4, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r9, #0x14]
    bl func_020371b8
    b .L_1bcc
.L_1464:
    ldr r1, [r9, #0x24]
    cmp r1, #0x0
    ble .L_1bcc
    sub r1, r1, #0x1
    str r1, [r9, #0x24]
    bl func_ov005_021af9c0
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_1bcc
.L_1494:
    mov r2, #0x0
    str r2, [r9, #0x18]
    mov r0, #0x5
    str r0, [r9, #0x14]
    ldr r1, [r9, #0x1c]
    mov r0, #0x38
    mov r4, r1, lsl #0x1
    sub r1, r0, #0x39
    mov r3, #0x1
    str r4, [r9, #0x10]
    bl func_020371b8
    b .L_1bcc
.L_14c4:
    tst r2, #0x10
    beq .L_1524
    ldr r0, [r9, #0x18]
    cmp r0, #0x0
    beq .L_14f4
    ldr r0, [r9, #0x1c]
    add r0, r0, #0x1
    str r0, [r9, #0x1c]
    cmp r0, #0x4
    movge r0, #0x0
    strge r0, [r9, #0x1c]
    b .L_150c
.L_14f4:
    ldr r0, [r9, #0x10]
    add r0, r0, #0x1
    str r0, [r9, #0x10]
    cmp r0, #0xa
    movge r0, #0x0
    strge r0, [r9, #0x10]
.L_150c:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_1bcc
.L_1524:
    tst r2, #0x20
    beq .L_157c
    ldr r0, [r9, #0x18]
    cmp r0, #0x0
    beq .L_1550
    ldr r0, [r9, #0x1c]
    subs r0, r0, #0x1
    str r0, [r9, #0x1c]
    movmi r0, #0x3
    strmi r0, [r9, #0x1c]
    b .L_1564
.L_1550:
    ldr r0, [r9, #0x10]
    subs r0, r0, #0x1
    str r0, [r9, #0x10]
    movmi r0, #0x9
    strmi r0, [r9, #0x10]
.L_1564:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_1bcc
.L_157c:
    ldrh r1, [r1, #0x54]
    tst r1, #0x200
    beq .L_15ec
    ldr r0, [r9, #0x3cc]
    cmp r0, #0x3
    moveq r0, #0x0
    streq r0, [r9, #0x3cc]
    ldr r0, [r9, #0x3cc]
    add r0, r0, #0x1
    str r0, [r9, #0x3cc]
    cmp r0, #0x2
    movgt r0, #0x0
    strgt r0, [r9, #0x3cc]
    ldr r1, [r9, #0x3cc]
    mov r0, r9
    bl func_ov005_021af7e4
    mov r1, #0x0
    str r1, [r9, #0x24]
    str r1, [r9, #0x10]
    mov r0, r9
    str r1, [r9, #0x14]
    bl func_ov005_021af9c0
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_1bcc
.L_15ec:
    tst r1, #0x100
    beq .L_1654
    ldr r0, [r9, #0x3cc]
    cmp r0, #0x3
    moveq r0, #0x0
    streq r0, [r9, #0x3cc]
    ldr r0, [r9, #0x3cc]
    subs r0, r0, #0x1
    str r0, [r9, #0x3cc]
    movmi r0, #0x2
    strmi r0, [r9, #0x3cc]
    ldr r1, [r9, #0x3cc]
    mov r0, r9
    bl func_ov005_021af7e4
    mov r1, #0x0
    str r1, [r9, #0x24]
    str r1, [r9, #0x10]
    mov r0, r9
    str r1, [r9, #0x14]
    bl func_ov005_021af9c0
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_1bcc
.L_1654:
    tst r1, #0x400
    beq .L_1680
    ldr r1, [r9, #0x18]
    mov r0, #0x38
    rsb r4, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r9, #0x18]
    bl func_020371b8
    b .L_1bcc
.L_1680:
    tst r1, #0x1
    beq .L_16c4
    ldr r1, [r9, #0x18]
    cmp r1, #0x0
    beq .L_16a4
    ldr r1, [r9, #0x1c]
    bl func_ov005_021b0084
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_16a4:
    ldr r2, [r9, #0x24]
    ldr r1, [r9, #0x14]
    ldr r3, [r9, #0x10]
    add r2, r2, r1
    mov r1, #0xa
    mla r1, r2, r1, r3
    bl func_ov005_021b0550
    b .L_1bcc
.L_16c4:
    tst r1, #0x2
    beq .L_17c4
    ldr r1, [r9, #0x18]
    cmp r1, #0x0
    beq .L_16f4
    mov r0, #0x38
    mov r2, #0x0
    sub r1, r0, #0x39
    mov r3, #0x1
    str r2, [r9, #0x18]
    bl func_020371b8
    b .L_1bcc
.L_16f4:
    ldr r1, [r9, #0x3cc]
    cmp r1, #0x3
    bne .L_1774
    mov r1, #0x0
    bl func_ov005_021af7e4
    mov r1, #0x0
    str r1, [r9, #0x3cc]
    str r1, [r9, #0x24]
    add r6, r9, #0x300
    ldrh r2, [r6, #0xd0]
    ldr r5, _LIT2
    mov r4, #0x5
    mov r0, r2, lsr #0x1f
    smull r2, r3, r5, r2
    add r3, r0, r3, asr #0x1
    str r3, [r9, #0x10]
    ldrh r7, [r6, #0xd0]
    mov r0, r9
    mov r2, r7, lsr #0x1f
    smull r3, r8, r5, r7
    add r8, r2, r8, asr #0x1
    smull r2, r3, r4, r8
    sub r8, r7, r2
    str r8, [r9, #0x14]
    strh r1, [r6, #0xd0]
    bl func_ov005_021af9c0
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_1bcc
.L_1774:
    ldrsb r1, [r9, #0x48]
    cmp r1, #0x0
    beq .L_1788
    bl func_ov005_021aef88
    b .L_1bcc
.L_1788:
    ldr r0, [r9, #0x8]
    mov r2, #0x0
    cmp r0, #0x3
    mov r3, #0x1
    bge .L_17b4
    mov r0, #0x42
    sub r1, r0, #0x43
    bl func_020371b8
    add sp, sp, #0xc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_17b4:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    b .L_1bcc
.L_17c4:
    tst r1, #0x8
    beq .L_1bcc
    mov r3, #0x1
    mov r0, #0x38
    str r3, [r9, #0x18]
    mov r4, #0x3
    sub r1, r0, #0x39
    mov r2, #0x0
    str r4, [r9, #0x1c]
    bl func_020371b8
    b .L_1bcc
.L_17f0:
    ldr r0, _LIT3
    ldrh r3, [r0, #0x8]
    ldrh r1, [r0, #0xa]
    ldrh r2, [r0, #0xc]
    strh r3, [sp]
    strh r1, [sp, #0x2]
    ldrh r1, [r0, #0xe]
    strh r2, [sp, #0x4]
    strh r1, [sp, #0x6]
    ldrh r0, [r0, #0x10]
    strh r0, [sp, #0x8]
    ldr r0, [r9, #0x20]
    cmp r0, #0x6
    ble .L_1844
    mov r0, r4
    bl func_ov005_021aa3f0
    ldr r1, [r4, #0x4]
    mov r0, r4
    str r1, [r9, #0x24]
    bl func_ov005_021aadc8
    str r0, [r9, #0x2c]
.L_1844:
    mov sl, #0x0
    mov r7, #0x1a
    add r4, sp, #0x0
    mov fp, sl
.L_1854:
    mov r0, r7, lsl #0x10
    mov r6, fp
    mov r8, #0x10
    mov r5, r0, lsr #0x10
.L_1864:
    mov r0, r9
    mov r1, r4
    strh r8, [sp]
    strh r5, [sp, #0x2]
    bl func_ov005_021aedf4
    cmp r0, #0x0
    beq .L_18a4
    ldr r1, [r9, #0x24]
    mov r0, #0xa
    add r2, r1, sl
    mla r1, r2, r0, r6
    mov r0, r9
    bl func_ov005_021b0550
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18a4:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r8, r8, #0x15
    blt .L_1864
    add sl, sl, #0x1
    cmp sl, #0x6
    add r7, r7, #0x13
    blt .L_1854
    ldr r5, _LIT4
    mov r6, #0x0
    mov r4, #0xa
.L_18d0:
    add r0, r6, #0x6
    mla r1, r0, r4, r5
    mov r0, r9
    bl func_ov005_021aedf4
    cmp r0, #0x0
    beq .L_18fc
    mov r0, r9
    mov r1, r6
    bl func_ov005_021b0084
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18fc:
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_18d0
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    ldreq r0, [r9, #0x3cc]
    cmpeq r0, #0x3
    bne .L_1a34
    ldr r1, _LIT6
    mov r0, r9
    bl func_ov005_021aedf4
    cmp r0, #0x0
    beq .L_19ac
    mov r0, r9
    mov r1, #0x0
    bl func_ov005_021af7e4
    mov r1, #0x0
    str r1, [r9, #0x3cc]
    str r1, [r9, #0x24]
    add r6, r9, #0x300
    ldrh r2, [r6, #0xd0]
    ldr r5, _LIT2
    mov r4, #0x5
    mov r0, r2, lsr #0x1f
    smull r2, r3, r5, r2
    add r3, r0, r3, asr #0x1
    str r3, [r9, #0x10]
    ldrh r7, [r6, #0xd0]
    mov r0, r9
    mov r2, r7, lsr #0x1f
    smull r3, r8, r5, r7
    add r8, r2, r8, asr #0x1
    smull r2, r3, r4, r8
    sub r8, r7, r2
    str r8, [r9, #0x14]
    strh r1, [r6, #0xd0]
    bl func_ov005_021af9c0
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_19ac:
    ldr r1, _LIT7
    mov r0, r9
    bl func_ov005_021aedf4
    cmp r0, #0x0
    beq .L_1a34
    mov r0, r9
    mov r1, #0x0
    bl func_ov005_021af7e4
    mov r1, #0x0
    str r1, [r9, #0x3cc]
    str r1, [r9, #0x24]
    add r6, r9, #0x300
    ldrh r2, [r6, #0xd0]
    ldr r5, _LIT2
    mov r4, #0x5
    mov r0, r2, lsr #0x1f
    smull r2, r3, r5, r2
    add r3, r0, r3, asr #0x1
    str r3, [r9, #0x10]
    ldrh r7, [r6, #0xd0]
    mov r0, r9
    mov r2, r7, lsr #0x1f
    smull r3, r8, r5, r7
    add r8, r2, r8, asr #0x1
    smull r2, r3, r4, r8
    sub r8, r7, r2
    str r8, [r9, #0x14]
    strh r1, [r6, #0xd0]
    bl func_ov005_021af9c0
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_1a34:
    mov r7, #0x0
    ldr r8, _LIT4
    ldr r4, _LIT5
    mov sl, r7
    mov fp, #0x1
    mov r6, r7
    mvn r5, #0x0
.L_1a50:
    mov r0, r9
    mov r1, r8
    bl func_ov005_021aedf4
    cmp r0, #0x0
    beq .L_1b10
    ldr r1, [r4, #0x4]
    mov r0, sl
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1d
    ldr r1, [r9, #0x3cc]
    bne .L_1ac8
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_1ad4
    b .L_1a98
    b .L_1aa8
    b .L_1ab8
    b .L_1a98
.L_1a98:
    cmp r7, #0x0
    strne r7, [r9, #0x3cc]
    movne r0, fp
    b .L_1ad4
.L_1aa8:
    cmp r7, #0x1
    strne r7, [r9, #0x3cc]
    movne r0, #0x1
    b .L_1ad4
.L_1ab8:
    cmp r7, #0x2
    strne r7, [r9, #0x3cc]
    movne r0, #0x1
    b .L_1ad4
.L_1ac8:
    cmp r1, r7
    strne r7, [r9, #0x3cc]
    movne r0, #0x1
.L_1ad4:
    cmp r0, #0x0
    beq .L_1b10
    ldr r1, [r9, #0x3cc]
    mov r0, r9
    bl func_ov005_021af7e4
    str r6, [r9, #0x24]
    str r6, [r9, #0x10]
    mov r0, r9
    str r6, [r9, #0x14]
    bl func_ov005_021af9c0
    mov r0, #0x56
    mov r1, r5
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_1b10:
    add r8, r8, #0xa
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_1a50
    ldr r1, _LIT8
    mov r0, r9
    bl func_ov005_021aedf4
    cmp r0, #0x0
    beq .L_1bcc
    ldr r0, [r9, #0x8]
    cmp r0, #0x3
    bge .L_1bcc
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0xc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b60:
    ldr r0, _LIT9
    bl func_ov005_021b0f34
    cmp r0, #0x0
    movne r0, #0x2
    strne r0, [r9, #0x4]
    ldr r0, _LIT9
    bl func_ov005_021b1280
    b .L_1bcc
.L_1b80:
    ldr r0, _LIT9
    bl func_ov005_021b0ef8
    cmp r0, #0x0
    beq .L_1bcc
    ldr r0, [r9, #0x8]
    cmp r0, #0x4
    bne .L_1bc4
    ldr r0, _LIT9
    ldr r1, [r0, #0x18]
    and r1, r1, #0xf
    cmp r1, #0x2
    bne .L_1bc4
    ldr r0, [r0, #0x8]
    rsbs r0, r0, #0x1
    addne sp, sp, #0xc
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1bc4:
    mov r0, #0x0
    str r0, [r9, #0x4]
.L_1bcc:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov005_021b1c4c
_LIT1: .word data_02104acc
_LIT2: .word 0x66666667
_LIT3: .word data_ov005_021b1460
_LIT4: .word data_ov005_021b1944
_LIT5: .word data_02104e6c
_LIT6: .word data_ov005_021b19a8
_LIT7: .word data_ov005_021b19b2
_LIT8: .word data_ov005_021b1976
_LIT9: .word data_ov005_021b214c
