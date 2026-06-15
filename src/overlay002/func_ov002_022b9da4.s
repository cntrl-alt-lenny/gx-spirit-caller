; func_ov002_022b9da4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020cd040
        .extern data_020cd460
        .extern data_ov002_022cce28
        .extern data_ov002_022ccfd8
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd428
        .extern data_ov002_022cd43c
        .extern data_ov002_022cd440
        .extern data_ov002_022cd44c
        .extern data_ov002_022cd73c
        .extern data_ov002_022cf16c
        .extern data_ov002_022d1410
        .extern data_ov002_022d1af8
        .extern data_ov002_022d28fc
        .extern func_020211c8
        .extern func_020212cc
        .extern func_0202147c
        .extern func_02021660
        .extern func_020216b0
        .extern func_02022234
        .extern func_02037208
        .extern func_020a978c
        .extern func_020b3870
        .extern func_ov002_021c4c9c
        .extern func_ov002_021c7f48
        .extern func_ov002_022a6324
        .extern func_ov002_022b3784
        .extern func_ov002_022b9420
        .extern func_ov002_022b9544
        .extern func_ov002_022bdb88
        .global func_ov002_022b9da4
        .arm
func_ov002_022b9da4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x13c
    str r0, [sp, #0x4]
    ldr r0, [r0, #0xc60]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_19fc
    b .L_a54
    b .L_11c0
    b .L_11f0
    b .L_161c
    b .L_1914
    b .L_1948
    b .L_1970
.L_a54:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0, #0x4]
    ldr r0, [r1]
    ldr r6, [r1, #0x4]
    str r0, [sp, #0x50]
    cmp r2, #0x0
    movne r0, #0x1
    strne r0, [sp, #0xc]
    moveq r0, #0x0
    streq r0, [sp, #0xc]
    ldr r0, [sp, #0x4]
    ldr r5, _LIT2
    ldr r1, [r0, #0xc64]
    ldr r0, [sp, #0xc]
    cmp r1, #0xc
    rsb r0, r0, #0x1
    str r0, [sp, #0x4c]
    blt .L_19fc
    ldr r0, [sp, #0x4]
    add r0, r0, #0xc00
    ldrh r0, [r0, #0x68]
    mov r1, r0, lsl #0x1f
    ldr r0, [sp, #0x50]
    cmp r0, r1, lsr #0x1f
    ldrne r0, _LIT1
    movne r4, r6
    ldrne r7, [r0, #0x20]
    bne .L_ad4
    ldr r0, _LIT1
    ldr r4, [sp, #0x50]
    ldr r7, [r0, #0x1c]
.L_ad4:
    mov r0, r5
    mov r1, r4
    mov r2, r7
    mov r3, #0x0
    bl func_ov002_022a6324
    str r0, [sp, #0x54]
    ldr r0, [r0, #0xc]
    mov r3, r4
    str r0, [sp, #0x48]
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x48]
    mov r2, #0x1
    str r7, [sp]
    bl func_ov002_022b9420
    mov r4, r0
    ldr r0, [sp, #0x4]
    ldrsh r1, [r4]
    ldr r0, [r0, #0xc34]
    cmp r0, r1
    bne .L_19fc
    ldr r1, [sp, #0x4]
    mov r0, #0x14
    str r0, [r1, #0xd5c]
    ldr r1, [sp, #0x50]
    mov r2, #0x38
    mul r2, r1, r2
    ldr r1, [sp, #0x4]
    str r2, [sp, #0x18]
    str r0, [r1, #0xd60]
    ldr r2, [sp, #0x4]
    mov r1, #0x0
    str r1, [r2, #0xd64]
    str r1, [r2, #0xd68]
    mov r7, #0x61
    str r7, [r2, #0xd6c]
    str r7, [r2, #0xd70]
    ldr r3, _LIT3
    ldr r2, [sp, #0x18]
    ldr r3, [r3, r2]
    add r2, r0, #0x9b0
    cmp r3, r2
    movge r1, #0x2
    bge .L_b8c
    add r0, r0, #0x500
    cmp r3, r0
    movge r1, #0x1
.L_b8c:
    ldr r2, [sp, #0x4]
    ldr r0, [sp, #0x50]
    ldr r3, _LIT4
    add r0, r2, r0, lsl #0x2
    str r1, [r0, #0xd64]
    ldrb r2, [r4, #0x16]
    mov r1, #0x0
.L_ba8:
    ldrsh r0, [r3]
    cmp r0, r2
    bne .L_bdc
    ldrsh r2, [r3, #0x2]
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x50]
    add r1, r1, r0, lsl #0x2
    str r2, [r1, #0xd5c]
    ldr r0, [r1, #0xd64]
    add r0, r3, r0, lsl #0x1
    ldrsh r0, [r0, #0x4]
    str r0, [r1, #0xd6c]
    b .L_bec
.L_bdc:
    add r1, r1, #0x1
    cmp r1, #0x12
    add r3, r3, #0x18
    blt .L_ba8
.L_bec:
    ldr r0, _LIT5
    bl func_020211c8
    ldr r1, [sp, #0x4]
    str r0, [r1, #0x8]
    bl func_0202147c
    mov r0, #0x0
    ldr r1, _LIT1
    str r0, [sp, #0x44]
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    beq .L_c2c
    ldr r0, [sp, #0x44]
    str r0, [sp, #0x8]
    orr r0, r0, #0x1
    str r0, [sp, #0x44]
    b .L_d64
.L_c2c:
    ldr r0, [sp, #0x4]
    mov r3, #0x0
    add r0, r0, #0xc00
    ldrh r0, [r0, #0x68]
    mov r2, r0, lsl #0x1f
    ldr r0, [sp, #0x50]
    cmp r0, r2, lsr #0x1f
    ldreq r4, [r1, #0x20]
    movne r6, r0
    ldrne r4, [r1, #0x1c]
    mov r0, r5
    mov r1, r6
    mov r2, r4
    bl func_ov002_022a6324
    str r0, [sp, #0x54]
    ldrsb r0, [r0]
    cmp r0, #0x0
    moveq r0, #0xfe0
    streq r0, [sp, #0x8]
    beq .L_c88
    ldr r0, [sp, #0x54]
    ldr r0, [r0, #0xc]
    str r0, [sp, #0x8]
.L_c88:
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x8]
    mov r3, r6
    mov r2, #0x1
    str r4, [sp]
    bl func_ov002_022b9420
    ldr r1, [sp, #0x4]
    mov r2, #0x38
    add r1, r1, #0xc00
    ldrh r3, [r1, #0x68]
    ldr r1, [sp, #0x50]
    ldr r5, _LIT3
    rsb r1, r1, #0x1
    mul r6, r1, r2
    ldr r2, [sp, #0x50]
    mov r3, r3, lsl #0x1f
    cmp r2, r3, lsr #0x1f
    mov r4, r0
    ldr r2, [r5, r6]
    bne .L_cec
    ldr r0, _LIT6
    ldr r0, [r0, r6]
    cmp r0, #0x0
    ldrne r0, _LIT7
    ldrne r2, [r0, r6]
.L_cec:
    ldr r0, _LIT8
    cmp r2, r0
    movge r2, #0x2
    bge .L_d0c
    sub r0, r0, #0x4b0
    cmp r2, r0
    movge r2, #0x1
    movlt r2, #0x0
.L_d0c:
    ldr r0, [sp, #0x4]
    ldr r3, _LIT4
    add r0, r0, r1, lsl #0x2
    str r2, [r0, #0xd64]
    ldrb r2, [r4, #0x16]
    mov r5, #0x0
.L_d24:
    ldrsh r0, [r3]
    cmp r0, r2
    bne .L_d54
    ldr r0, [sp, #0x4]
    ldrsh r2, [r3, #0x2]
    add r1, r0, r1, lsl #0x2
    str r2, [r1, #0xd5c]
    ldr r0, [r1, #0xd64]
    add r0, r3, r0, lsl #0x1
    ldrsh r0, [r0, #0x4]
    str r0, [r1, #0xd6c]
    b .L_d64
.L_d54:
    add r3, r3, #0x18
    add r5, r5, #0x1
    cmp r5, #0x12
    blt .L_d24
.L_d64:
    mvn r0, #0x1d
    str r0, [sp, #0x5c]
    sub r0, r0, #0x2
    mov sl, #0x0
    str r0, [sp, #0x64]
    mov r0, sl
    orr r0, r0, #0x10
    str r0, [sp, #0x58]
    mov r0, sl
    orr r0, r0, #0x10
    str r0, [sp, #0x60]
    ldr r0, [sp, #0x4]
    ldr fp, _LIT1
    add r0, r0, #0xc00
    str fp, [sp, #0x6c]
    str r0, [sp, #0x70]
.L_da4:
    ldr r0, [sp, #0x4]
    mov r1, #0x3
    ldr r0, [r0, #0x8]
    mov r2, sl
    bl func_02021660
    mov r5, r0
    ldr r0, [sp, #0x4]
    cmp sl, #0x2
    ldr r7, [r0, #0xc80]
    ldr r8, [r0, #0xc84]
    ldr r9, [r0, #0xc88]
    bne .L_ea8
    ldr r0, [sp, #0x6c]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_e7c
    ldr r0, [sp, #0x54]
    mov r6, #0x0
    ldrh r0, [r0, #0xa]
    mov r1, #0x0
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    ldrne r6, [sp, #0x58]
    mov r0, r5
    mov r2, r6
    bl func_020216b0
    ldrsh r2, [r4, #0x2]
    mov r0, r5
    mov r1, #0xe
    bl func_020216b0
    ldrsh r2, [r4, #0x4]
    mov r0, r5
    mov r1, #0xf
    bl func_020216b0
    ldrsh r2, [r4, #0x12]
    mov r0, r5
    mov r1, #0xa
    bl func_020216b0
    ldrb r2, [r4, #0x17]
    mov r0, r5
    mov r1, #0xd
    bl func_020216b0
    ands r0, r6, #0x10
    ldrnesh r1, [r4, #0xc]
    ldreqsh r1, [r4, #0x6]
    cmp r0, #0x0
    add r7, r7, r1
    ldrnesh r1, [r4, #0xe]
    ldreqsh r1, [r4, #0x8]
    cmp r0, #0x0
    ldrnesh r0, [r4, #0x10]
    add r8, r8, r1
    ldreqsh r0, [r4, #0xa]
    add r9, r9, r0
.L_e7c:
    ldr r0, [sp, #0x70]
    sub r9, r9, #0x17
    ldrh r1, [r0, #0x68]
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    moveq r0, #0x1e
    ldrne r0, [sp, #0x5c]
    add r7, r7, r0
    b .L_ed8
.L_ea8:
    ldr r0, [fp, #0x34]
    mov r2, #0x0
    cmp r0, #0x0
    ldrne r2, [sp, #0x60]
    mov r0, r5
    mov r1, #0x0
    bl func_020216b0
    cmp sl, #0x0
    ldreq r0, [sp, #0x64]
    sub r9, r9, #0x1a
    movne r0, #0x20
    add r7, r7, r0
.L_ed8:
    mov r2, r7
    mov r0, r5
    mov r1, #0x3
    bl func_020216b0
    mov r2, r8
    mov r0, r5
    mov r1, #0x4
    bl func_020216b0
    mov r0, r5
    mov r2, r9
    mov r1, #0x5
    bl func_020216b0
    add sl, sl, #0x1
    add fp, fp, #0x38
    cmp sl, #0x2
    ble .L_da4
    ldr r0, [sp, #0x4]
    ldr r2, _LIT1
    ldr r0, [r0, #0xc58]
    ldr r2, [r2, #0x58]
    mov r1, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r0, r1, lsr #0x10
    str r3, [sp, #0x84]
    str r0, [sp, #0x88]
    cmp r2, #0x0
    bne .L_f54
    cmp r3, #0x0
    ble .L_f5c
.L_f54:
    mov r2, #0x1
    b .L_f60
.L_f5c:
    mov r2, #0x0
.L_f60:
    ldr r0, [sp, #0x4]
    ldr r1, _LIT1
    str r2, [r0, #0xd48]
    ldr r0, [r1, #0x90]
    cmp r0, #0x0
    bne .L_f84
    ldr r0, [sp, #0x88]
    cmp r0, #0x0
    ble .L_f8c
.L_f84:
    mov r1, #0x1
    b .L_f90
.L_f8c:
    mov r1, #0x0
.L_f90:
    ldr r0, [sp, #0x4]
    str r1, [r0, #0xd4c]
    mov r1, r0
    ldr r0, [sp, #0x50]
    add r0, r1, r0, lsl #0x2
    ldr r2, [r0, #0xd48]
    ldr r0, [sp, #0xc]
    add r1, r1, r0, lsl #0x2
    ldr r0, [sp, #0x4]
    str r2, [r0, #0xd40]
    ldr r0, [r1, #0xd48]
    ldr r1, [sp, #0x4]
    cmp r0, #0x0
    ldrne r0, [sp, #0x44]
    orrne r0, r0, #0x2
    strne r0, [sp, #0x44]
    ldr r0, [sp, #0x4c]
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0xd48]
    cmp r0, #0x0
    ldrne r0, [sp, #0x44]
    orrne r0, r0, #0x4
    strne r0, [sp, #0x44]
    ldr r0, [sp, #0x4]
    add r0, r0, #0xc00
    ldrh r0, [r0, #0x68]
    mov r1, r0, lsl #0x1f
    ldr r0, [sp, #0x50]
    cmp r0, r1, lsr #0x1f
    bne .L_1050
    ldr r1, [sp, #0x4]
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0xd48]
    ldr r1, [sp, #0x4]
    cmp r0, #0x0
    ldrne r0, [sp, #0x44]
    orrne r0, r0, #0x8
    strne r0, [sp, #0x44]
    ldr r0, [sp, #0x50]
    rsb r0, r0, #0x1
    add r1, r1, r0, lsl #0x2
    ldr r1, [r1, #0xd48]
    cmp r1, #0x0
    beq .L_1090
    ldr r1, [sp, #0x44]
    orr r1, r1, #0x10
    str r1, [sp, #0x44]
    b .L_1090
.L_1050:
    ldr r1, [sp, #0x4]
    rsb r0, r0, #0x1
    add r1, r1, r0, lsl #0x2
    ldr r1, [r1, #0xd48]
    ldr r2, [sp, #0x4]
    cmp r1, #0x0
    ldrne r1, [sp, #0x44]
    orrne r1, r1, #0x8
    strne r1, [sp, #0x44]
    ldr r1, [sp, #0x50]
    add r1, r2, r1, lsl #0x2
    ldr r1, [r1, #0xd48]
    cmp r1, #0x0
    ldrne r1, [sp, #0x44]
    orrne r1, r1, #0x10
    strne r1, [sp, #0x44]
.L_1090:
    ldr r2, _LIT9
    ldr r1, [sp, #0x18]
    ldr r1, [r2, r1]
    cmp r1, #0x0
    bne .L_10c0
    ldr r1, [sp, #0x50]
    add r2, sp, #0x84
    ldr r1, [r2, r1, lsl #0x2]
    cmp r1, #0x0
    ldrgt r1, [sp, #0x44]
    orrgt r1, r1, #0x20
    strgt r1, [sp, #0x44]
.L_10c0:
    mov r1, #0x38
    mul r2, r0, r1
    ldr r1, _LIT9
    ldr r1, [r1, r2]
    cmp r1, #0x0
    bne .L_10f0
    add r1, sp, #0x84
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    ldrgt r0, [sp, #0x44]
    orrgt r0, r0, #0x40
    strgt r0, [sp, #0x44]
.L_10f0:
    ldr r1, [sp, #0x44]
    mov r0, #0x12
    bl func_02022234
    ldr r0, [sp, #0x4]
    add r0, r0, #0xc00
    ldrh r1, [r0, #0x68]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1f
    ldr r0, [r0, #0x4]
    mov r1, r1, lsr #0x1f
    cmp r1, r0
    movne r1, #0x1
    moveq r1, #0x0
    mov r0, #0x13
    bl func_02022234
    ldr r0, [sp, #0x4]
    ldr r8, _LIT10
    add r0, r0, #0xd4
    add r4, r0, #0x800
    ldr r0, [sp, #0x4]
    ldr r7, _LIT0
    mov r5, #0x0
    add r6, r0, #0xc00
.L_114c:
    ldrh r1, [r6, #0x68]
    ldr r0, [r7, #0x4]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_1170
    cmp r5, #0x0
    ldreq r2, [sp, #0x48]
    ldrne r2, [sp, #0x8]
    b .L_117c
.L_1170:
    cmp r5, #0x0
    ldreq r2, [sp, #0x8]
    ldrne r2, [sp, #0x48]
.L_117c:
    mov r0, r4
    mov r1, r8
    bl func_020a978c
    add r5, r5, #0x1
    cmp r5, #0x2
    add r4, r4, #0x28
    blt .L_114c
    ldr r0, [sp, #0x4]
    mov r2, #0x1
    str r2, [r0, #0xd3c]
    mov r1, #0x0
    str r1, [r0, #0xd44]
    str r1, [r0, #0xd50]
    str r1, [r0, #0xd54]
    str r2, [r0, #0xc60]
    str r1, [r0, #0xc64]
    b .L_19fc
.L_11c0:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0xf
    blt .L_19fc
    ldr r0, _LIT11
    mov r2, #0x0
    str r2, [r0, #0x4]
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    str r1, [r0, #0xc60]
    str r2, [r0, #0xc64]
    b .L_19fc
.L_11f0:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x21
    blt .L_19fc
    ldr r0, _LIT11
    mov r2, #0x1
    ldr r1, _LIT1
    str r2, [r0, #0x60]
    ldr r0, [r1]
    str r0, [sp, #0x40]
    ldr r0, [r1, #0x4]
    str r0, [sp, #0x3c]
    ldr r0, [r1, #0x1c]
    str r0, [sp, #0x38]
    ldr r0, [r1, #0x20]
    str r0, [sp, #0x34]
    ldr r0, _LIT12
    bl func_020211c8
    ldr r1, [sp, #0x4]
    str r0, [r1, #0xc]
    bl func_0202147c
    mov r5, #0x0
    mov r1, #0x5
    add r3, sp, #0xfc
    add r2, sp, #0xd0
.L_1254:
    add r0, r1, #0x10
    str r1, [r3, r5, lsl #0x2]
    add r1, r1, #0x1
    str r0, [r2, r5, lsl #0x2]
    cmp r1, #0x9
    add r5, r5, #0x1
    ble .L_1254
    mov r1, #0xa
    mov r0, #0x1a
    str r0, [r2, r5, lsl #0x2]
    str r1, [r3, r5, lsl #0x2]
    add r5, r5, #0x1
    mov r3, #0x0
    add r2, sp, #0xfc
    add r0, sp, #0xd0
.L_1290:
    add r1, r3, #0x10
    str r3, [r2, r5, lsl #0x2]
    add r3, r3, #0x1
    str r1, [r0, r5, lsl #0x2]
    cmp r3, #0x4
    add r5, r5, #0x1
    ble .L_1290
    mov r0, #0x0
    str r0, [sp, #0x30]
    str r0, [sp, #0x1c]
.L_12b8:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_12d8
    ldr r0, [sp, #0x40]
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x38]
    str r0, [sp, #0x14]
    b .L_12e8
.L_12d8:
    ldr r0, [sp, #0x3c]
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x34]
    str r0, [sp, #0x14]
.L_12e8:
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x14]
    add r2, sp, #0xa4
    mov r4, #0x0
    bl func_ov002_021c4c9c
    mov r9, r4
    add r7, sp, #0x128
    mov r8, r9
.L_1308:
    cmp r5, #0x0
    mov r6, #0x0
    ble .L_13d4
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    and fp, r0, #0x1
.L_1320:
    cmp r4, #0xa
    bge .L_13d4
    add r0, sp, #0xfc
    ldr sl, [r0, r6, lsl #0x2]
    ldr r0, _LIT2
    mov r1, r9
    mov r2, sl
    mov r3, #0x0
    bl func_ov002_022a6324
    ldrsb r0, [r0]
    cmp r0, #0x0
    beq .L_13c8
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0x14]
    add r0, sp, #0xa4
    mov r3, r9
    str sl, [sp]
    bl func_ov002_021c7f48
    cmp r0, #0x1
    bne .L_13c8
    ldrh r2, [r7]
    mov r0, sl, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x1
    orr r2, r2, fp
    strh r2, [r7]
    ldrh r2, [r7]
    add r1, sp, #0xd0
    ldr r1, [r1, r6, lsl #0x2]
    mov r0, r0, lsl #0x1b
    bic r2, r2, #0x3e
    orr r0, r2, r0, lsr #0x1a
    add r1, r8, r1
    strh r0, [r7]
    ldrh r0, [r7]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x18
    bic r0, r0, #0x3fc0
    orr r0, r0, r1, lsr #0x12
    add r4, r4, #0x1
    strh r0, [r7], #0x2
.L_13c8:
    add r6, r6, #0x1
    cmp r6, r5
    blt .L_1320
.L_13d4:
    add r8, r8, #0xf
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_1308
    mov r0, #0x0
    ldr ip, _LIT13
    ldr r8, _LIT14
    str r0, [sp, #0x2c]
    add r1, sp, #0x128
    mov lr, #0x14
.L_13fc:
    ldr r0, [sp, #0x2c]
    mov r3, #0x0
    sub r0, r4, r0
    sub r2, r0, #0x1
    cmp r2, #0x0
    mov r7, r3
    ble .L_14a4
    mov r6, r1
.L_141c:
    add r0, r7, #0x1
    mov r0, r0, lsl #0x1
    ldrh r0, [r1, r0]
    ldrh sl, [r6]
    mov r9, r0, lsl #0x1f
    mov r9, r9, lsr #0x1f
    and fp, r9, #0x1
    mov r0, r0, lsl #0x1a
    mov r9, r0, lsr #0x1b
    mla r0, fp, r8, ip
    mla r0, r9, lr, r0
    ldrh r9, [r0, #0x34]
    mov r0, sl, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov sl, sl, lsl #0x1a
    and r0, r0, #0x1
    mov fp, sl, lsr #0x1b
    mla sl, r0, r8, ip
    mov r0, #0x14
    mla r0, fp, r0, sl
    ldrh r0, [r0, #0x34]
    cmp r0, r9
    bls .L_1494
    mov fp, r7, lsl #0x1
    add r9, r1, r7, lsl #0x1
    ldrh sl, [r1, fp]
    ldrh r0, [r9, #0x2]
    mov r3, #0x1
    strh r0, [r1, fp]
    strh sl, [r9, #0x2]
.L_1494:
    add r6, r6, #0x2
    add r7, r7, #0x1
    cmp r7, r2
    blt .L_141c
.L_14a4:
    ldr r0, [sp, #0x2c]
    cmp r3, #0x0
    add r0, r0, #0x1
    str r0, [sp, #0x2c]
    bne .L_13fc
    mov sl, #0x0
    mvn r0, #0x35
    add r9, sp, #0x128
    mov r8, sl
    mov fp, sl
    str r0, [sp, #0x68]
.L_14d0:
    cmp sl, r4
    bge .L_15cc
    ldr r0, [sp, #0x4]
    ldr r2, [sp, #0x1c]
    ldr r0, [r0, #0xc]
    mov r1, #0x3
    add r2, sl, r2
    bl func_02021660
    mov r6, r0
    ldr r0, [sp, #0x4]
    ldr r7, [r0, #0xc80]
    ldr r0, [r0, #0xc84]
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc88]
    str r0, [sp, #0x20]
    ldr r0, _LIT0
    ldr r1, [r0, #0x4]
    ldr r0, [sp, #0x40]
    cmp r0, r1
    bne .L_1538
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    ldreq r0, [sp, #0x68]
    movne r0, #0x36
    b .L_1548
.L_1538:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    moveq r0, #0x36
    ldrne r0, [sp, #0x68]
.L_1548:
    cmp r4, #0x5
    add r7, r7, r0
    strle r8, [sp, #0x28]
    ble .L_1568
    mov r0, fp
    mov r1, r4
    bl func_020b3870
    str r0, [sp, #0x28]
.L_1568:
    mov r2, r7
    mov r0, r6
    mov r1, #0x3
    bl func_020216b0
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x28]
    add r2, r1, r0
    mov r0, r6
    mov r1, #0x4
    bl func_020216b0
    ldr r0, [sp, #0x20]
    mov r1, #0x5
    sub r2, r0, #0xe
    mov r0, r6
    bl func_020216b0
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x1
    bl func_020216b0
    ldrh r2, [r9]
    mov r0, r6
    mov r1, #0xd
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x18
    bl func_020216b0
.L_15cc:
    add r8, r8, #0x10
    add fp, fp, #0x50
    add r9, r9, #0x2
    add sl, sl, #0x1
    cmp sl, #0xa
    blt .L_14d0
    ldr r0, [sp, #0x30]
    add r0, r0, #0x1
    str r0, [sp, #0x30]
    cmp r0, #0x2
    ldr r0, [sp, #0x1c]
    add r0, r0, #0xa
    str r0, [sp, #0x1c]
    blt .L_12b8
    ldr r0, [sp, #0x4]
    mov r1, #0x3
    str r1, [r0, #0xc60]
    mov r1, #0x0
    str r1, [r0, #0xc64]
    b .L_19fc
.L_161c:
    ldr r0, [sp, #0x4]
    ldr r3, _LIT1
    ldr r0, [r0, #0xc58]
    ldr r2, _LIT0
    mov r1, r0, lsr #0x10
    ldr r6, [r3]
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r0, r1, lsr #0x10
    ldr r9, [r2, #0x4]
    str r3, [sp, #0x74]
    mov r3, #0x1
    mov r7, #0x0
    str r0, [sp, #0x78]
    add r8, sp, #0x8c
    rsb r4, r6, #0x1
    mvn r5, #0x0
    mov r1, r3
    add r2, sp, #0x7c
    mov r0, r7
.L_1670:
    cmp r7, #0x0
    bne .L_1688
    cmp r6, r9
    moveq sl, r5
    movne sl, r3
    b .L_1694
.L_1688:
    cmp r4, r9
    moveq sl, r5
    movne sl, r1
.L_1694:
    str sl, [r2, r7, lsl #0x2]
    ldr sl, [sp, #0x4]
    ldr fp, [r2, r7, lsl #0x2]
    ldr sl, [sl, #0xc80]
    add r7, r7, #0x1
    add sl, sl, fp, lsl #0x5
    str sl, [r8]
    ldr sl, [sp, #0x4]
    str r0, [r8, #0x4]
    ldr sl, [sl, #0xc88]
    cmp r7, #0x2
    sub sl, sl, #0x1a
    str sl, [r8, #0x8]
    add r8, r8, #0xc
    blt .L_1670
    ldr r1, [sp, #0x4]
    ldr r1, [r1, #0xc64]
    cmp r1, #0xc
    bne .L_171c
    str r0, [sp]
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x80]
    add r3, r0, r6, lsl #0x2
    ldr r0, [r3, #0xd64]
    add r1, r1, #0x1
    and r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r0, r1, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r1, [r3, #0xd5c]
    ldr r0, _LIT15
    add r3, sp, #0x98
    mov r2, r2, lsr #0x10
    bl func_ov002_022bdb88
.L_171c:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x1b
    bne .L_177c
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xd40]
    cmp r0, #0x0
    beq .L_177c
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x7c]
    add r3, r0, r4, lsl #0x2
    ldr r0, [r3, #0xd64]
    add r1, r1, #0x1
    and r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r0, r1, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r1, [r3, #0xd5c]
    ldr r0, _LIT15
    add r3, sp, #0x8c
    mov r2, r2, lsr #0x10
    bl func_ov002_022bdb88
.L_177c:
    ldr r0, [sp, #0x4]
    mov r1, r6
    ldr r2, [r0, #0xc64]
    sub r2, r2, #0xc
    bl func_ov002_022b9544
    cmp r0, #0x0
    beq .L_17b4
    ldr r0, [sp, #0x4]
    mvn r1, #0x0
    add r0, r0, r6, lsl #0x2
    ldr r0, [r0, #0xd6c]
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_17b4:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xd40]
    cmp r0, #0x0
    beq .L_17fc
    ldr r0, [sp, #0x4]
    mov r1, r4
    ldr r2, [r0, #0xc64]
    sub r2, r2, #0x1b
    bl func_ov002_022b9544
    cmp r0, #0x0
    beq .L_17fc
    ldr r0, [sp, #0x4]
    mvn r1, #0x0
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xd6c]
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_17fc:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0xf
    bne .L_184c
    ldr r0, [sp, #0x4]
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xd48]
    cmp r0, #0x0
    bne .L_184c
    ldr r0, _LIT1
    add r3, sp, #0x98
    ldr r0, [r0, #0x8]
    mov r5, #0x0
    cmp r0, #0x0
    movne r2, #0x1
    ldr r0, _LIT15
    moveq r2, #0x0
    mov r1, #0x13
    str r5, [sp]
    bl func_ov002_022bdb88
.L_184c:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x1b
    bne .L_1878
    add r1, sp, #0x74
    ldr r2, [r1, r4, lsl #0x2]
    ldr r0, _LIT11
    mov r1, r4
    rsb r2, r2, #0x0
    mov r3, #0x4
    bl func_ov002_022b3784
.L_1878:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x2a
    bne .L_18a4
    add r1, sp, #0x74
    ldr r2, [r1, r6, lsl #0x2]
    ldr r0, _LIT11
    mov r1, r6
    rsb r2, r2, #0x0
    mov r3, #0x4
    bl func_ov002_022b3784
.L_18a4:
    ldr r0, _LIT1
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_18c4
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x54
    b .L_18d0
.L_18c4:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x72
.L_18d0:
    movge r0, #0x1
    movlt r0, #0x0
    cmp r0, #0x0
    beq .L_19fc
    ldr r0, _LIT11
    mov r1, #0x0
    str r1, [r0, #0x60]
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc]
    bl func_020212cc
    ldr r0, [sp, #0x4]
    mov r2, #0x0
    str r2, [r0, #0xc]
    mov r1, #0x4
    str r1, [r0, #0xc60]
    str r2, [r0, #0xc64]
    b .L_19fc
.L_1914:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x15
    blt .L_19fc
    ldr r0, _LIT11
    mov r1, #0x1
    str r1, [r0, #0x4]
    ldr r0, [sp, #0x4]
    mov r1, #0x5
    str r1, [r0, #0xc60]
    mov r1, #0x0
    str r1, [r0, #0xc64]
    b .L_19fc
.L_1948:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0xf
    blt .L_19fc
    ldr r0, [sp, #0x4]
    mov r1, #0x6
    str r1, [r0, #0xc60]
    mov r1, #0x0
    str r1, [r0, #0xc64]
    b .L_19fc
.L_1970:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0x8]
    bl func_020212cc
    ldr r1, _LIT1
    ldr r0, [sp, #0x4]
    mov r2, #0x0
    str r2, [r0, #0x8]
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_19ac
    ldr r0, [r1, #0x58]
    cmp r0, #0x0
    ldreq r0, [r1, #0x90]
    cmpeq r0, #0x0
    bne .L_19bc
.L_19ac:
    ldr r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [r0, #0xd3c]
    b .L_19d4
.L_19bc:
    mov r0, #0x14
    mov r1, #0x0
    bl func_02022234
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    str r1, [r0, #0xd44]
.L_19d4:
    ldr r0, [sp, #0x4]
    mov r1, #0xc
    str r1, [r0, #0xcc8]
    mov r1, #0xa
    str r1, [r0, #0xccc]
    ldr r1, [sp, #0x4]
    mov r0, #0x0
    str r0, [r1, #0xc54]
    add sp, sp, #0x13c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19fc:
    ldr r0, [sp, #0x4]
    ldr r1, [r0, #0xc64]
    mov r0, #0x1
    add r2, r1, #0x1
    ldr r1, [sp, #0x4]
    str r2, [r1, #0xc64]
    add sp, sp, #0x13c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd73c
_LIT1: .word data_ov002_022cd3f4
_LIT2: .word data_ov002_022d1410
_LIT3: .word data_ov002_022cd43c
_LIT4: .word data_ov002_022cce28
_LIT5: .word data_020cd460
_LIT6: .word data_ov002_022cd428
_LIT7: .word data_ov002_022cd440
_LIT8: .word 0x000009c4
_LIT9: .word data_ov002_022cd44c
_LIT10: .word data_ov002_022ccfd8
_LIT11: .word data_ov002_022d1af8
_LIT12: .word data_020cd040
_LIT13: .word data_ov002_022cf16c
_LIT14: .word 0x00000868
_LIT15: .word data_ov002_022d28fc
