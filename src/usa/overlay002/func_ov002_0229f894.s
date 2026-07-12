; func_ov002_0229f894 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104dcc
        .extern data_02104e6c
        .extern data_ov002_022cbb2c
        .extern data_ov002_022cd65c
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern data_ov002_022d0170
        .extern data_ov002_022d0d84
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d19bc
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_02011730
        .extern func_0201d428
        .extern func_0201e564
        .extern func_02034734
        .extern func_0208c7c8
        .extern func_0208dd64
        .extern func_0208deac
        .extern func_0208dfb8
        .extern func_02094410
        .extern func_ov002_021afae4
        .extern func_ov002_0229ef78
        .extern func_ov002_022a03a0
        .extern func_ov002_022a0544
        .extern func_ov002_022a06e4
        .extern func_ov002_022a085c
        .extern func_ov002_022a09b4
        .extern func_ov002_022a0b0c
        .extern func_ov002_022a0c00
        .extern func_ov002_022a0d50
        .extern func_ov002_022a0fec
        .extern func_ov002_022a1760
        .extern func_ov002_022ae884
        .extern func_ov002_022b1434
        .global func_ov002_0229f894
        .arm
func_ov002_0229f894:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x30
    mov r4, r0
    mov r5, r2
    cmp r1, #0x2
    bne .L_6c
    ldr r0, _LIT0
    ldr r0, [r0, #0x38]
    cmp r0, #0x2
    moveq r2, #0x1
    movne r2, #0x0
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    subs r0, r2, r0
    bpl .L_48
    cmp r3, #0x3
    bcc .L_58
.L_48:
    cmp r0, #0x0
    bgt .L_6c
    cmp r3, #0x2
    bcs .L_6c
.L_58:
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0xd44]
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_6c:
    mov r0, #0x1
    stmia r4, {r0, r1, r3}
    mov r1, #0x0
    str r1, [r4, #0x10]
    str r1, [r4, #0x38]
    str r1, [r4, #0x44]
    str r1, [r4, #0x40]
    str r1, [r4, #0x20]
    sub r0, r1, #0x1
    str r0, [r4, #0x14]
    str r1, [r4, #0x24]
    str r1, [r4, #0x28]
    str r1, [r4, #0x4c]
    str r1, [r4, #0xc]
    str r1, [r4, #0x50]
    str r1, [r4, #0x54]
    str r1, [r4, #0x208]
    str r0, [r4, #0x20c]
    strb r1, [r4, #0x21c]
    str r1, [r4, #0x234]
    ldr r0, _LIT2
    ldr r1, _LIT2
    ldr r2, [r0, #0xd4]
    mov r0, #0x0
    cmp r2, #0x10
    movlt r2, #0x10
    str r2, [r1, #0xd4]
    bl func_0208c7c8
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0]
    sub r1, r0, #0xc
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    blt .L_10c
    cmp r0, #0xb
    bne .L_128
.L_10c:
    ldr r1, _LIT4
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1]
    b .L_13c
.L_128:
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0xe90
    orr r0, r0, #0x1000
    strh r0, [r1]
.L_13c:
    bl func_0208dd64
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094410
    bl func_0208dfb8
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    ldr r0, _LIT5
    mov r1, #0x0
    str r1, [r0]
    sub r1, r0, #0xe
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0xf90
    orr r0, r0, #0x1000
    strh r0, [r1]
    bl func_0208deac
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    mov r1, r5
    mov r0, r4
    bl func_ov002_022a0d50
    mov r0, #0x1
    str r0, [r4, #0x48]
    mov r0, #0x0
    str r0, [r4, #0x194]
    sub r0, r0, #0x1
    str r0, [r4, #0x1c]
    ldr r0, [r4, #0x4]
    cmp r0, #0x20
    addls pc, pc, r0, lsl #0x2
    b .L_a80
    b .L_260
    b .L_2a8
    b .L_2a8
    b .L_828
    b .L_434
    b .L_55c
    b .L_610
    b .L_3a8
    b .L_33c
    b .L_6c4
    b .L_76c
    b .L_8fc
    b .L_4c4
    b .L_260
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_a80
    b .L_548
.L_260:
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x4
    bl func_ov002_022a03a0
    ldr r1, _LIT6
    mov r0, #0x1
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x198
    mov r1, #0xe
    mov r3, #0x0
    bl func_ov002_0229ef78
    mov r0, #0x1
    str r0, [r4, #0x194]
    mov r0, #0x0
    str r0, [r4, #0x14]
    b .L_a80
.L_2a8:
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x4
    bl func_ov002_022a03a0
    ldr r0, [r4, #0x4]
    ldr r1, _LIT6
    cmp r0, #0x2
    str r1, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    moveq r3, #0x1
    movne r3, #0x0
    ldr r2, [r4, #0x30]
    add r0, r4, #0x198
    add r3, r3, #0x2
    mov r1, #0xa
    bl func_ov002_0229ef78
    ldr r0, [r4, #0x4]
    ldr r1, _LIT7
    cmp r0, #0x2
    str r1, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    moveq r3, #0x1
    movne r3, #0x0
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    add r3, r3, #0x4
    mov r1, #0x12
    bl func_ov002_0229ef78
    mov r0, #0x2
    str r0, [r4, #0x194]
    mov r0, #0x0
    str r0, [r4, #0x14]
    mov r0, #0x1
    str r0, [r4, #0x1c]
    b .L_a80
.L_33c:
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x4
    bl func_ov002_022a03a0
    ldr r1, _LIT6
    mov r0, #0x1
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x198
    mov r1, #0xa
    mov r3, #0x7
    bl func_ov002_0229ef78
    ldr r1, _LIT7
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    mov r1, #0x12
    mov r3, #0x8
    bl func_ov002_0229ef78
    mov r0, #0x2
    str r0, [r4, #0x194]
    mov r0, #0x0
    str r0, [r4, #0x14]
    b .L_a80
.L_3a8:
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x5
    bl func_ov002_022a03a0
    ldr r1, _LIT6
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x198
    mov r1, #0xa
    mov r3, #0x6
    bl func_ov002_0229ef78
    ldr r1, _LIT7
    mov r0, #0x1
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    mov r1, #0x12
    mov r3, #0x6
    bl func_ov002_0229ef78
    mov r0, #0x2
    str r0, [r4, #0x194]
    mov r0, #0x0
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x8]
    ldr r1, _LIT8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0xe
    ldrh r0, [r1, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    str r0, [r4, #0x10]
    b .L_a80
.L_434:
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x5
    bl func_ov002_022a03a0
    mov r0, r4
    bl func_ov002_022a0544
    mov r8, #0x0
    ldr sl, _LIT9
    mov r9, #0x4
    add r6, r4, #0x198
    mov r7, r8
    mov r5, #0xf
.L_464:
    ldr r0, [r4, #0x8]
    mov r0, r0, lsr r8
    tst r0, #0x1
    beq .L_4b0
    stmia sp, {r7, r8}
    ldr r0, [r4, #0x194]
    ldr r2, [r4, #0x30]
    mov r1, r9
    mov r3, r5
    add r0, r6, r0, lsl #0x5
    bl func_ov002_0229ef78
    ldr r0, [sl]
    cmp r8, r0
    ldreq r0, [r4, #0x194]
    streq r0, [r4, #0x1c]
    streq r0, [r4, #0x14]
    ldr r0, [r4, #0x194]
    add r0, r0, #0x1
    str r0, [r4, #0x194]
.L_4b0:
    add r8, r8, #0x1
    cmp r8, #0x7
    add r9, r9, #0x4
    blt .L_464
    b .L_a80
.L_4c4:
    add r0, sp, #0x8
    bl func_0201d428
    ldr r0, _LIT10
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r1, [sp, #0x20]
    ldr r5, _LIT6
    bic r1, r1, #0x1c000
    orr r3, r1, #0x1c000
    mvn r6, #0x0
    ldrh r2, [sp, #0x1c]
    str r0, [sp, #0x8]
    str r6, [sp, #0x10]
    bic r0, r2, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x1c]
    ldrh r0, [sp, #0x1c]
    mov r2, #0x400
    str r5, [sp, #0x14]
    orr r1, r0, #0x10
    add r0, sp, #0x8
    str r3, [sp, #0x20]
    strh r2, [sp, #0x18]
    strh r1, [sp, #0x1c]
    bl func_0201e564
    ldr r0, [sp, #0x8]
    bl func_02006e00
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x4
    bl func_ov002_022a03a0
    b .L_a80
.L_548:
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x1
    bl func_ov002_022a03a0
    b .L_a80
.L_55c:
    mov r0, #0x14
    str r0, [r4, #0x24]
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0xa
    bl func_ov002_022a03a0
    mov r0, r4
    bl func_ov002_022a06e4
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022a0fec
    ldr r1, _LIT7
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x30]
    add r0, r4, #0x198
    add r2, r1, #0x6
    mov r1, #0x7
    mov r3, #0x10
    bl func_ov002_0229ef78
    ldr r0, _LIT11
    mov r3, #0x0
    stmia sp, {r0, r3}
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    mov r1, #0xe
    add r2, r2, #0x6
    bl func_ov002_0229ef78
    ldr r1, _LIT12
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1d8
    mov r1, #0x15
    mov r3, #0x11
    add r2, r2, #0x6
    bl func_ov002_0229ef78
    mov r0, #0x3
    str r0, [r4, #0x194]
    mov r0, #0x1
    str r0, [r4, #0x14]
    str r0, [r4, #0x40]
    b .L_a80
.L_610:
    mov r0, #0x6
    str r0, [r4, #0x24]
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x8
    bl func_ov002_022a03a0
    mov r0, r4
    bl func_ov002_022a085c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022a0fec
    ldr r1, _LIT6
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x30]
    add r0, r4, #0x198
    add r2, r1, #0x4
    mov r1, #0x7
    mov r3, #0x10
    bl func_ov002_0229ef78
    ldr r0, _LIT7
    mov r3, #0x0
    stmia sp, {r0, r3}
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    mov r1, #0xe
    add r2, r2, #0x4
    bl func_ov002_0229ef78
    ldr r1, _LIT11
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1d8
    mov r1, #0x15
    mov r3, #0x11
    add r2, r2, #0x4
    bl func_ov002_0229ef78
    mov r0, #0x3
    str r0, [r4, #0x194]
    mov r0, #0x1
    str r0, [r4, #0x14]
    str r0, [r4, #0x40]
    b .L_a80
.L_6c4:
    mov r0, #0x6
    str r0, [r4, #0x24]
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x7
    bl func_ov002_022a03a0
    mov r0, r4
    bl func_ov002_022a09b4
    ldr r1, _LIT6
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x30]
    add r0, r4, #0x198
    add r2, r1, #0x3
    mov r1, #0x7
    mov r3, #0x10
    bl func_ov002_0229ef78
    ldr r0, _LIT7
    mov r3, #0x0
    stmia sp, {r0, r3}
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    mov r1, #0xe
    add r2, r2, #0x3
    bl func_ov002_0229ef78
    ldr r1, _LIT11
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1d8
    mov r1, #0x15
    mov r3, #0x11
    add r2, r2, #0x3
    bl func_ov002_0229ef78
    mov r0, #0x3
    str r0, [r4, #0x194]
    mov r0, #0x1
    str r0, [r4, #0x14]
    str r0, [r4, #0x40]
    b .L_a80
.L_76c:
    ldr r1, [r4, #0x8]
    mov r0, r4
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    and r1, r1, #0xf
    str r1, [r4, #0x20]
    ldr r1, [r4, #0x30]
    add r1, r1, #0x7
    bl func_ov002_022a03a0
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a0fec
    ldr r1, _LIT6
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x30]
    add r0, r4, #0x198
    add r2, r1, #0x3
    mov r1, #0x7
    mov r3, #0x10
    bl func_ov002_0229ef78
    ldr r0, _LIT7
    mov r3, #0x0
    stmia sp, {r0, r3}
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    mov r1, #0xe
    add r2, r2, #0x3
    bl func_ov002_0229ef78
    ldr r1, _LIT11
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1d8
    mov r1, #0x15
    mov r3, #0x11
    add r2, r2, #0x3
    bl func_ov002_0229ef78
    mov r0, #0x3
    str r0, [r4, #0x194]
    mov r0, #0x1
    str r0, [r4, #0x14]
    str r0, [r4, #0x40]
    b .L_a80
.L_828:
    bl func_ov002_021afae4
    str r0, [r4, #0x24]
    mov r0, r4
    bl func_ov002_022a0b0c
    ldr r1, [r4, #0x30]
    mov r5, r0
    add r1, r1, #0x8
    mov r0, r4
    add r1, r1, r5
    bl func_ov002_022a03a0
    mov r0, r4
    mov r1, r5
    bl func_ov002_022a0c00
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022a0fec
    ldr r1, _LIT6
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x198
    add r2, r2, #0x4
    mov r1, #0x7
    mov r3, #0x10
    add r2, r2, r5
    bl func_ov002_0229ef78
    ldr r0, _LIT7
    mov r3, #0x0
    stmia sp, {r0, r3}
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    add r2, r2, #0x4
    mov r1, #0xe
    add r2, r2, r5
    bl func_ov002_0229ef78
    ldr r1, _LIT11
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1d8
    add r2, r2, #0x4
    mov r1, #0x15
    mov r3, #0x11
    add r2, r2, r5
    bl func_ov002_0229ef78
    mov r0, #0x3
    str r0, [r4, #0x194]
    mov r0, #0x1
    str r0, [r4, #0x14]
    str r0, [r4, #0x40]
    b .L_a80
.L_8fc:
    bl func_02011730
    cmp r0, #0x0
    bne .L_918
    ldr r0, _LIT1
    ldr r0, [r0, #0xd04]
    cmp r0, #0x3
    bne .L_934
.L_918:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd00]
    cmp r0, #0x1
    movne r0, #0x0
    addne sp, sp, #0x30
    strne r0, [r4]
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_934:
    ldr r0, _LIT13
    ldr r1, _LIT14
    ldr r0, [r0, #0x4]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    bne .L_96c
    ldr r0, _LIT15
    ldr r0, [r0, #0xe64]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    addeq sp, sp, #0x30
    streq r0, [r4]
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_96c:
    ldr r7, _LIT16
    ldr r3, _LIT17
    ldrh r0, [r7]
    add r2, r3, #0x99
    sub r5, r7, #0x48
    bic r0, r0, #0x3f00
    orr r0, r0, #0x3f00
    strh r0, [r7]
    ldrh r6, [r7, #0x2]
    mov r0, r4
    mov r1, #0x0
    bic r6, r6, #0x3f
    orr r6, r6, #0x3b
    strh r6, [r7, #0x2]
    strh r3, [r7, #-6]
    strh r2, [r7, #-2]
    ldr r3, [r5]
    ldr r2, [r5]
    and r3, r3, #0xe000
    mov r6, r3, lsr #0xd
    bic r3, r2, #0xe000
    orr r2, r6, #0x2
    orr r2, r3, r2, lsl #0xd
    str r2, [r5]
    bl func_ov002_022a03a0
    mov r0, r4
    bl func_ov002_022b1434
    add r1, r4, #0x94
    mov r0, #0x0
    mov r2, #0x100
    bl func_02094410
    ldr r1, _LIT18
    mov r0, #0x1
    str r1, [sp]
    str r0, [sp, #0x4]
    add r0, r4, #0x198
    mov r1, #0xd
    mov r2, #0x14
    mov r3, #0x9
    bl func_ov002_0229ef78
    mov r0, #0x1
    str r0, [r4, #0x194]
    mov r0, #0x0
    str r0, [r4, #0x14]
    str r0, [r4, #0x8]
    bl func_02034734
    cmp r0, #0x2
    bne .L_a74
    ldr r0, _LIT19
    ldr r1, _LIT20
    ldrh r3, [r0, #0x68]
    ldr r5, [r1, #0xa5c]
    mov r2, #0x0
    add r3, r5, r3
    str r3, [r1, #0xa5c]
    ldrh r3, [r0, #0x6a]
    ldr r5, [r1, #0xa54]
    add r3, r5, r3
    str r3, [r1, #0xa54]
    ldrh r3, [r0, #0x6c]
    ldr r5, [r1, #0xa60]
    add r3, r5, r3
    str r3, [r1, #0xa60]
    strh r2, [r0, #0x68]
    strh r2, [r0, #0x6a]
    strh r2, [r0, #0x6c]
.L_a74:
    ldr r1, _LIT21
    ldr r0, _LIT2
    str r1, [r0, #0xdc]
.L_a80:
    mov r0, r4
    bl func_ov002_022a1760
    cmp r0, #0x0
    addeq sp, sp, #0x30
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT0
    mov r1, #0x1
    bl func_ov002_022ae884
    ldr r0, _LIT2
    mov r1, #0x2
    str r1, [r0, #0xd0]
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d19bc
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022d0e4c
_LIT3: .word 0x04001018
_LIT4: .word 0x0400100c
_LIT5: .word 0x0400101c
_LIT6: .word 0x0000a040
_LIT7: .word 0x0000ac40
_LIT8: .word data_ov002_022d0170
_LIT9: .word data_ov002_022d0d84
_LIT10: .word data_ov002_022cbb2c
_LIT11: .word 0x0000b840
_LIT12: .word 0x0000c440
_LIT13: .word data_ov002_022cd65c
_LIT14: .word data_ov002_022cd664
_LIT15: .word data_02103fcc
_LIT16: .word 0x04001048
_LIT17: .word 0x000010de
_LIT18: .word 0x0000d040
_LIT19: .word data_02104dcc
_LIT20: .word data_02104e6c
_LIT21: .word 0x00000708
