; func_ov002_0229f9a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104eac
        .extern data_02104f4c
        .extern data_ov002_022cbc20
        .extern data_ov002_022cd73c
        .extern data_ov002_022cd744
        .extern data_ov002_022d016c
        .extern data_ov002_022d0250
        .extern data_ov002_022d0e64
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d1a9c
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201174c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02034784
        .extern func_0208c8b0
        .extern func_0208de4c
        .extern func_0208df94
        .extern func_0208e0a0
        .extern func_02094504
        .extern func_ov002_021afbc4
        .extern func_ov002_0229f088
        .extern func_ov002_022a04b0
        .extern func_ov002_022a0654
        .extern func_ov002_022a07f4
        .extern func_ov002_022a096c
        .extern func_ov002_022a0ac4
        .extern func_ov002_022a0c1c
        .extern func_ov002_022a0d10
        .extern func_ov002_022a0e60
        .extern func_ov002_022a10fc
        .extern func_ov002_022a1870
        .extern func_ov002_022ae9c0
        .extern func_ov002_022b1570
        .global func_ov002_0229f9a4
        .arm
func_ov002_0229f9a4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x30
    mov r4, r0
    mov r5, r2
    cmp r1, #0x2
    bne .L_6bc
    ldr r0, _LIT0
    ldr r0, [r0, #0x38]
    cmp r0, #0x2
    moveq r2, #0x1
    movne r2, #0x0
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    subs r0, r2, r0
    bpl .L_698
    cmp r3, #0x3
    bcc .L_6a8
.L_698:
    cmp r0, #0x0
    bgt .L_6bc
    cmp r3, #0x2
    bcs .L_6bc
.L_6a8:
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0xd44]
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_6bc:
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
    bl func_0208c8b0
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0]
    sub r1, r0, #0xc
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    blt .L_75c
    cmp r0, #0xb
    bne .L_778
.L_75c:
    ldr r1, _LIT4
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1]
    b .L_78c
.L_778:
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0xe90
    orr r0, r0, #0x1000
    strh r0, [r1]
.L_78c:
    bl func_0208de4c
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094504
    bl func_0208e0a0
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
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
    bl func_0208df94
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    mov r1, r5
    mov r0, r4
    bl func_ov002_022a0e60
    mov r0, #0x1
    str r0, [r4, #0x48]
    mov r0, #0x0
    str r0, [r4, #0x194]
    sub r0, r0, #0x1
    str r0, [r4, #0x1c]
    ldr r0, [r4, #0x4]
    cmp r0, #0x20
    addls pc, pc, r0, lsl #0x2
    b .L_10d0
    b .L_8b0
    b .L_8f8
    b .L_8f8
    b .L_e78
    b .L_a84
    b .L_bac
    b .L_c60
    b .L_9f8
    b .L_98c
    b .L_d14
    b .L_dbc
    b .L_f4c
    b .L_b14
    b .L_8b0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_10d0
    b .L_b98
.L_8b0:
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x4
    bl func_ov002_022a04b0
    ldr r1, _LIT6
    mov r0, #0x1
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x198
    mov r1, #0xe
    mov r3, #0x0
    bl func_ov002_0229f088
    mov r0, #0x1
    str r0, [r4, #0x194]
    mov r0, #0x0
    str r0, [r4, #0x14]
    b .L_10d0
.L_8f8:
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x4
    bl func_ov002_022a04b0
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
    bl func_ov002_0229f088
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
    bl func_ov002_0229f088
    mov r0, #0x2
    str r0, [r4, #0x194]
    mov r0, #0x0
    str r0, [r4, #0x14]
    mov r0, #0x1
    str r0, [r4, #0x1c]
    b .L_10d0
.L_98c:
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x4
    bl func_ov002_022a04b0
    ldr r1, _LIT6
    mov r0, #0x1
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x198
    mov r1, #0xa
    mov r3, #0x7
    bl func_ov002_0229f088
    ldr r1, _LIT7
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    mov r1, #0x12
    mov r3, #0x8
    bl func_ov002_0229f088
    mov r0, #0x2
    str r0, [r4, #0x194]
    mov r0, #0x0
    str r0, [r4, #0x14]
    b .L_10d0
.L_9f8:
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x5
    bl func_ov002_022a04b0
    ldr r1, _LIT6
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x198
    mov r1, #0xa
    mov r3, #0x6
    bl func_ov002_0229f088
    ldr r1, _LIT7
    mov r0, #0x1
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    mov r1, #0x12
    mov r3, #0x6
    bl func_ov002_0229f088
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
    b .L_10d0
.L_a84:
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x5
    bl func_ov002_022a04b0
    mov r0, r4
    bl func_ov002_022a0654
    mov r8, #0x0
    ldr sl, _LIT9
    mov r9, #0x4
    add r6, r4, #0x198
    mov r7, r8
    mov r5, #0xf
.L_ab4:
    ldr r0, [r4, #0x8]
    mov r0, r0, lsr r8
    tst r0, #0x1
    beq .L_b00
    stmia sp, {r7, r8}
    ldr r0, [r4, #0x194]
    ldr r2, [r4, #0x30]
    mov r1, r9
    mov r3, r5
    add r0, r6, r0, lsl #0x5
    bl func_ov002_0229f088
    ldr r0, [sl]
    cmp r8, r0
    ldreq r0, [r4, #0x194]
    streq r0, [r4, #0x1c]
    streq r0, [r4, #0x14]
    ldr r0, [r4, #0x194]
    add r0, r0, #0x1
    str r0, [r4, #0x194]
.L_b00:
    add r8, r8, #0x1
    cmp r8, #0x7
    add r9, r9, #0x4
    blt .L_ab4
    b .L_10d0
.L_b14:
    add r0, sp, #0x8
    bl func_0201d47c
    ldr r0, _LIT10
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
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
    bl func_0201e5b8
    ldr r0, [sp, #0x8]
    bl func_02006e1c
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x4
    bl func_ov002_022a04b0
    b .L_10d0
.L_b98:
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x1
    bl func_ov002_022a04b0
    b .L_10d0
.L_bac:
    mov r0, #0x14
    str r0, [r4, #0x24]
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0xa
    bl func_ov002_022a04b0
    mov r0, r4
    bl func_ov002_022a07f4
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022a10fc
    ldr r1, _LIT7
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x30]
    add r0, r4, #0x198
    add r2, r1, #0x6
    mov r1, #0x7
    mov r3, #0x10
    bl func_ov002_0229f088
    ldr r0, _LIT11
    mov r3, #0x0
    stmia sp, {r0, r3}
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    mov r1, #0xe
    add r2, r2, #0x6
    bl func_ov002_0229f088
    ldr r1, _LIT12
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1d8
    mov r1, #0x15
    mov r3, #0x11
    add r2, r2, #0x6
    bl func_ov002_0229f088
    mov r0, #0x3
    str r0, [r4, #0x194]
    mov r0, #0x1
    str r0, [r4, #0x14]
    str r0, [r4, #0x40]
    b .L_10d0
.L_c60:
    mov r0, #0x6
    str r0, [r4, #0x24]
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x8
    bl func_ov002_022a04b0
    mov r0, r4
    bl func_ov002_022a096c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022a10fc
    ldr r1, _LIT6
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x30]
    add r0, r4, #0x198
    add r2, r1, #0x4
    mov r1, #0x7
    mov r3, #0x10
    bl func_ov002_0229f088
    ldr r0, _LIT7
    mov r3, #0x0
    stmia sp, {r0, r3}
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    mov r1, #0xe
    add r2, r2, #0x4
    bl func_ov002_0229f088
    ldr r1, _LIT11
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1d8
    mov r1, #0x15
    mov r3, #0x11
    add r2, r2, #0x4
    bl func_ov002_0229f088
    mov r0, #0x3
    str r0, [r4, #0x194]
    mov r0, #0x1
    str r0, [r4, #0x14]
    str r0, [r4, #0x40]
    b .L_10d0
.L_d14:
    mov r0, #0x6
    str r0, [r4, #0x24]
    ldr r1, [r4, #0x30]
    mov r0, r4
    add r1, r1, #0x7
    bl func_ov002_022a04b0
    mov r0, r4
    bl func_ov002_022a0ac4
    ldr r1, _LIT6
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x30]
    add r0, r4, #0x198
    add r2, r1, #0x3
    mov r1, #0x7
    mov r3, #0x10
    bl func_ov002_0229f088
    ldr r0, _LIT7
    mov r3, #0x0
    stmia sp, {r0, r3}
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    mov r1, #0xe
    add r2, r2, #0x3
    bl func_ov002_0229f088
    ldr r1, _LIT11
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1d8
    mov r1, #0x15
    mov r3, #0x11
    add r2, r2, #0x3
    bl func_ov002_0229f088
    mov r0, #0x3
    str r0, [r4, #0x194]
    mov r0, #0x1
    str r0, [r4, #0x14]
    str r0, [r4, #0x40]
    b .L_10d0
.L_dbc:
    ldr r1, [r4, #0x8]
    mov r0, r4
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    and r1, r1, #0xf
    str r1, [r4, #0x20]
    ldr r1, [r4, #0x30]
    add r1, r1, #0x7
    bl func_ov002_022a04b0
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a10fc
    ldr r1, _LIT6
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x30]
    add r0, r4, #0x198
    add r2, r1, #0x3
    mov r1, #0x7
    mov r3, #0x10
    bl func_ov002_0229f088
    ldr r0, _LIT7
    mov r3, #0x0
    stmia sp, {r0, r3}
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    mov r1, #0xe
    add r2, r2, #0x3
    bl func_ov002_0229f088
    ldr r1, _LIT11
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1d8
    mov r1, #0x15
    mov r3, #0x11
    add r2, r2, #0x3
    bl func_ov002_0229f088
    mov r0, #0x3
    str r0, [r4, #0x194]
    mov r0, #0x1
    str r0, [r4, #0x14]
    str r0, [r4, #0x40]
    b .L_10d0
.L_e78:
    bl func_ov002_021afbc4
    str r0, [r4, #0x24]
    mov r0, r4
    bl func_ov002_022a0c1c
    ldr r1, [r4, #0x30]
    mov r5, r0
    add r1, r1, #0x8
    mov r0, r4
    add r1, r1, r5
    bl func_ov002_022a04b0
    mov r0, r4
    mov r1, r5
    bl func_ov002_022a0d10
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022a10fc
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
    bl func_ov002_0229f088
    ldr r0, _LIT7
    mov r3, #0x0
    stmia sp, {r0, r3}
    ldr r2, [r4, #0x30]
    add r0, r4, #0x1b8
    add r2, r2, #0x4
    mov r1, #0xe
    add r2, r2, r5
    bl func_ov002_0229f088
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
    bl func_ov002_0229f088
    mov r0, #0x3
    str r0, [r4, #0x194]
    mov r0, #0x1
    str r0, [r4, #0x14]
    str r0, [r4, #0x40]
    b .L_10d0
.L_f4c:
    bl func_0201174c
    cmp r0, #0x0
    bne .L_f68
    ldr r0, _LIT1
    ldr r0, [r0, #0xd04]
    cmp r0, #0x3
    bne .L_f84
.L_f68:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd00]
    cmp r0, #0x1
    movne r0, #0x0
    addne sp, sp, #0x30
    strne r0, [r4]
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_f84:
    ldr r0, _LIT13
    ldr r1, _LIT14
    ldr r0, [r0, #0x4]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    bne .L_fbc
    ldr r0, _LIT15
    ldr r0, [r0, #0xe64]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    addeq sp, sp, #0x30
    streq r0, [r4]
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_fbc:
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
    bl func_ov002_022a04b0
    mov r0, r4
    bl func_ov002_022b1570
    add r1, r4, #0x94
    mov r0, #0x0
    mov r2, #0x100
    bl func_02094504
    ldr r1, _LIT18
    mov r0, #0x1
    str r1, [sp]
    str r0, [sp, #0x4]
    add r0, r4, #0x198
    mov r1, #0xd
    mov r2, #0x14
    mov r3, #0x9
    bl func_ov002_0229f088
    mov r0, #0x1
    str r0, [r4, #0x194]
    mov r0, #0x0
    str r0, [r4, #0x14]
    str r0, [r4, #0x8]
    bl func_02034784
    cmp r0, #0x2
    bne .L_10c4
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
.L_10c4:
    ldr r1, _LIT21
    ldr r0, _LIT2
    str r1, [r0, #0xdc]
.L_10d0:
    mov r0, r4
    bl func_ov002_022a1870
    cmp r0, #0x0
    addeq sp, sp, #0x30
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT0
    mov r1, #0x1
    bl func_ov002_022ae9c0
    ldr r0, _LIT2
    mov r1, #0x2
    str r1, [r0, #0xd0]
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d1a9c
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022d0f2c
_LIT3: .word 0x04001018
_LIT4: .word 0x0400100c
_LIT5: .word 0x0400101c
_LIT6: .word 0x0000a040
_LIT7: .word 0x0000ac40
_LIT8: .word data_ov002_022d0250
_LIT9: .word data_ov002_022d0e64
_LIT10: .word data_ov002_022cbc20
_LIT11: .word 0x0000b840
_LIT12: .word 0x0000c440
_LIT13: .word data_ov002_022cd73c
_LIT14: .word data_ov002_022cd744
_LIT15: .word data_021040ac
_LIT16: .word 0x04001048
_LIT17: .word 0x000010de
_LIT18: .word 0x0000d040
_LIT19: .word data_02104eac
_LIT20: .word data_02104f4c
_LIT21: .word 0x00000708
