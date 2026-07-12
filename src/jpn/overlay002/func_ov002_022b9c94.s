; func_ov002_022b9c94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ccf60
        .extern data_020cd380
        .extern data_ov002_022ccc30
        .extern data_ov002_022ccee4
        .extern data_ov002_022cd314
        .extern data_ov002_022cd348
        .extern data_ov002_022cd35c
        .extern data_ov002_022cd360
        .extern data_ov002_022cd36c
        .extern data_ov002_022cd65c
        .extern data_ov002_022cf08c
        .extern data_ov002_022d1330
        .extern data_ov002_022d1a18
        .extern data_ov002_022d281c
        .extern func_02021174
        .extern func_02021278
        .extern func_02021428
        .extern func_0202160c
        .extern func_0202165c
        .extern func_020221e0
        .extern func_020371b8
        .extern func_020a9698
        .extern func_020b377c
        .extern func_ov002_021c4bbc
        .extern func_ov002_021c7e68
        .extern func_ov002_022a61e8
        .extern func_ov002_022b3640
        .extern func_ov002_022b9310
        .extern func_ov002_022b9434
        .extern func_ov002_022bda78
        .global func_ov002_022b9c94
        .arm
func_ov002_022b9c94:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x13c
    str r0, [sp, #0x4]
    ldr r0, [r0, #0xc60]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_17b8
    b .L_810
    b .L_f7c
    b .L_fac
    b .L_13d8
    b .L_16d0
    b .L_1704
    b .L_172c
.L_810:
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
    blt .L_17b8
    ldr r0, [sp, #0x4]
    add r0, r0, #0xc00
    ldrh r0, [r0, #0x68]
    mov r1, r0, lsl #0x1f
    ldr r0, [sp, #0x50]
    cmp r0, r1, lsr #0x1f
    ldrne r0, _LIT1
    movne r4, r6
    ldrne r7, [r0, #0x20]
    bne .L_890
    ldr r0, _LIT1
    ldr r4, [sp, #0x50]
    ldr r7, [r0, #0x1c]
.L_890:
    mov r0, r5
    mov r1, r4
    mov r2, r7
    mov r3, #0x0
    bl func_ov002_022a61e8
    str r0, [sp, #0x54]
    ldr r0, [r0, #0xc]
    mov r3, r4
    str r0, [sp, #0x48]
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x48]
    mov r2, #0x1
    str r7, [sp]
    bl func_ov002_022b9310
    mov r4, r0
    ldr r0, [sp, #0x4]
    ldrsh r1, [r4]
    ldr r0, [r0, #0xc34]
    cmp r0, r1
    bne .L_17b8
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
    bge .L_948
    add r0, r0, #0x500
    cmp r3, r0
    movge r1, #0x1
.L_948:
    ldr r2, [sp, #0x4]
    ldr r0, [sp, #0x50]
    ldr r3, _LIT4
    add r0, r2, r0, lsl #0x2
    str r1, [r0, #0xd64]
    ldrb r2, [r4, #0x16]
    mov r1, #0x0
.L_964:
    ldrsh r0, [r3]
    cmp r0, r2
    bne .L_998
    ldrsh r2, [r3, #0x2]
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x50]
    add r1, r1, r0, lsl #0x2
    str r2, [r1, #0xd5c]
    ldr r0, [r1, #0xd64]
    add r0, r3, r0, lsl #0x1
    ldrsh r0, [r0, #0x4]
    str r0, [r1, #0xd6c]
    b .L_9a8
.L_998:
    add r1, r1, #0x1
    cmp r1, #0x12
    add r3, r3, #0x18
    blt .L_964
.L_9a8:
    ldr r0, _LIT5
    bl func_02021174
    ldr r1, [sp, #0x4]
    str r0, [r1, #0x8]
    bl func_02021428
    mov r0, #0x0
    ldr r1, _LIT1
    str r0, [sp, #0x44]
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    beq .L_9e8
    ldr r0, [sp, #0x44]
    str r0, [sp, #0x8]
    orr r0, r0, #0x1
    str r0, [sp, #0x44]
    b .L_b20
.L_9e8:
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
    bl func_ov002_022a61e8
    str r0, [sp, #0x54]
    ldrsb r0, [r0]
    cmp r0, #0x0
    moveq r0, #0xfe0
    streq r0, [sp, #0x8]
    beq .L_a44
    ldr r0, [sp, #0x54]
    ldr r0, [r0, #0xc]
    str r0, [sp, #0x8]
.L_a44:
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x8]
    mov r3, r6
    mov r2, #0x1
    str r4, [sp]
    bl func_ov002_022b9310
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
    bne .L_aa8
    ldr r0, _LIT6
    ldr r0, [r0, r6]
    cmp r0, #0x0
    ldrne r0, _LIT7
    ldrne r2, [r0, r6]
.L_aa8:
    ldr r0, _LIT8
    cmp r2, r0
    movge r2, #0x2
    bge .L_ac8
    sub r0, r0, #0x4b0
    cmp r2, r0
    movge r2, #0x1
    movlt r2, #0x0
.L_ac8:
    ldr r0, [sp, #0x4]
    ldr r3, _LIT4
    add r0, r0, r1, lsl #0x2
    str r2, [r0, #0xd64]
    ldrb r2, [r4, #0x16]
    mov r5, #0x0
.L_ae0:
    ldrsh r0, [r3]
    cmp r0, r2
    bne .L_b10
    ldr r0, [sp, #0x4]
    ldrsh r2, [r3, #0x2]
    add r1, r0, r1, lsl #0x2
    str r2, [r1, #0xd5c]
    ldr r0, [r1, #0xd64]
    add r0, r3, r0, lsl #0x1
    ldrsh r0, [r0, #0x4]
    str r0, [r1, #0xd6c]
    b .L_b20
.L_b10:
    add r3, r3, #0x18
    add r5, r5, #0x1
    cmp r5, #0x12
    blt .L_ae0
.L_b20:
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
.L_b60:
    ldr r0, [sp, #0x4]
    mov r1, #0x3
    ldr r0, [r0, #0x8]
    mov r2, sl
    bl func_0202160c
    mov r5, r0
    ldr r0, [sp, #0x4]
    cmp sl, #0x2
    ldr r7, [r0, #0xc80]
    ldr r8, [r0, #0xc84]
    ldr r9, [r0, #0xc88]
    bne .L_c64
    ldr r0, [sp, #0x6c]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_c38
    ldr r0, [sp, #0x54]
    mov r6, #0x0
    ldrh r0, [r0, #0xa]
    mov r1, #0x0
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    ldrne r6, [sp, #0x58]
    mov r0, r5
    mov r2, r6
    bl func_0202165c
    ldrsh r2, [r4, #0x2]
    mov r0, r5
    mov r1, #0xe
    bl func_0202165c
    ldrsh r2, [r4, #0x4]
    mov r0, r5
    mov r1, #0xf
    bl func_0202165c
    ldrsh r2, [r4, #0x12]
    mov r0, r5
    mov r1, #0xa
    bl func_0202165c
    ldrb r2, [r4, #0x17]
    mov r0, r5
    mov r1, #0xd
    bl func_0202165c
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
.L_c38:
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
    b .L_c94
.L_c64:
    ldr r0, [fp, #0x34]
    mov r2, #0x0
    cmp r0, #0x0
    ldrne r2, [sp, #0x60]
    mov r0, r5
    mov r1, #0x0
    bl func_0202165c
    cmp sl, #0x0
    ldreq r0, [sp, #0x64]
    sub r9, r9, #0x1a
    movne r0, #0x20
    add r7, r7, r0
.L_c94:
    mov r2, r7
    mov r0, r5
    mov r1, #0x3
    bl func_0202165c
    mov r2, r8
    mov r0, r5
    mov r1, #0x4
    bl func_0202165c
    mov r0, r5
    mov r2, r9
    mov r1, #0x5
    bl func_0202165c
    add sl, sl, #0x1
    add fp, fp, #0x38
    cmp sl, #0x2
    ble .L_b60
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
    bne .L_d10
    cmp r3, #0x0
    ble .L_d18
.L_d10:
    mov r2, #0x1
    b .L_d1c
.L_d18:
    mov r2, #0x0
.L_d1c:
    ldr r0, [sp, #0x4]
    ldr r1, _LIT1
    str r2, [r0, #0xd48]
    ldr r0, [r1, #0x90]
    cmp r0, #0x0
    bne .L_d40
    ldr r0, [sp, #0x88]
    cmp r0, #0x0
    ble .L_d48
.L_d40:
    mov r1, #0x1
    b .L_d4c
.L_d48:
    mov r1, #0x0
.L_d4c:
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
    bne .L_e0c
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
    beq .L_e4c
    ldr r1, [sp, #0x44]
    orr r1, r1, #0x10
    str r1, [sp, #0x44]
    b .L_e4c
.L_e0c:
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
.L_e4c:
    ldr r2, _LIT9
    ldr r1, [sp, #0x18]
    ldr r1, [r2, r1]
    cmp r1, #0x0
    bne .L_e7c
    ldr r1, [sp, #0x50]
    add r2, sp, #0x84
    ldr r1, [r2, r1, lsl #0x2]
    cmp r1, #0x0
    ldrgt r1, [sp, #0x44]
    orrgt r1, r1, #0x20
    strgt r1, [sp, #0x44]
.L_e7c:
    mov r1, #0x38
    mul r2, r0, r1
    ldr r1, _LIT9
    ldr r1, [r1, r2]
    cmp r1, #0x0
    bne .L_eac
    add r1, sp, #0x84
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    ldrgt r0, [sp, #0x44]
    orrgt r0, r0, #0x40
    strgt r0, [sp, #0x44]
.L_eac:
    ldr r1, [sp, #0x44]
    mov r0, #0x12
    bl func_020221e0
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
    bl func_020221e0
    ldr r0, [sp, #0x4]
    ldr r8, _LIT10
    add r0, r0, #0xd4
    add r4, r0, #0x800
    ldr r0, [sp, #0x4]
    ldr r7, _LIT0
    mov r5, #0x0
    add r6, r0, #0xc00
.L_f08:
    ldrh r1, [r6, #0x68]
    ldr r0, [r7, #0x4]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_f2c
    cmp r5, #0x0
    ldreq r2, [sp, #0x48]
    ldrne r2, [sp, #0x8]
    b .L_f38
.L_f2c:
    cmp r5, #0x0
    ldreq r2, [sp, #0x8]
    ldrne r2, [sp, #0x48]
.L_f38:
    mov r0, r4
    mov r1, r8
    bl func_020a9698
    add r5, r5, #0x1
    cmp r5, #0x2
    add r4, r4, #0x28
    blt .L_f08
    ldr r0, [sp, #0x4]
    mov r2, #0x1
    str r2, [r0, #0xd3c]
    mov r1, #0x0
    str r1, [r0, #0xd44]
    str r1, [r0, #0xd50]
    str r1, [r0, #0xd54]
    str r2, [r0, #0xc60]
    str r1, [r0, #0xc64]
    b .L_17b8
.L_f7c:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0xf
    blt .L_17b8
    ldr r0, _LIT11
    mov r2, #0x0
    str r2, [r0, #0x4]
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    str r1, [r0, #0xc60]
    str r2, [r0, #0xc64]
    b .L_17b8
.L_fac:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x21
    blt .L_17b8
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
    bl func_02021174
    ldr r1, [sp, #0x4]
    str r0, [r1, #0xc]
    bl func_02021428
    mov r5, #0x0
    mov r1, #0x5
    add r3, sp, #0xfc
    add r2, sp, #0xd0
.L_1010:
    add r0, r1, #0x10
    str r1, [r3, r5, lsl #0x2]
    add r1, r1, #0x1
    str r0, [r2, r5, lsl #0x2]
    cmp r1, #0x9
    add r5, r5, #0x1
    ble .L_1010
    mov r1, #0xa
    mov r0, #0x1a
    str r0, [r2, r5, lsl #0x2]
    str r1, [r3, r5, lsl #0x2]
    add r5, r5, #0x1
    mov r3, #0x0
    add r2, sp, #0xfc
    add r0, sp, #0xd0
.L_104c:
    add r1, r3, #0x10
    str r3, [r2, r5, lsl #0x2]
    add r3, r3, #0x1
    str r1, [r0, r5, lsl #0x2]
    cmp r3, #0x4
    add r5, r5, #0x1
    ble .L_104c
    mov r0, #0x0
    str r0, [sp, #0x30]
    str r0, [sp, #0x1c]
.L_1074:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_1094
    ldr r0, [sp, #0x40]
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x38]
    str r0, [sp, #0x14]
    b .L_10a4
.L_1094:
    ldr r0, [sp, #0x3c]
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x34]
    str r0, [sp, #0x14]
.L_10a4:
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x14]
    add r2, sp, #0xa4
    mov r4, #0x0
    bl func_ov002_021c4bbc
    mov r9, r4
    add r7, sp, #0x128
    mov r8, r9
.L_10c4:
    cmp r5, #0x0
    mov r6, #0x0
    ble .L_1190
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    and fp, r0, #0x1
.L_10dc:
    cmp r4, #0xa
    bge .L_1190
    add r0, sp, #0xfc
    ldr sl, [r0, r6, lsl #0x2]
    ldr r0, _LIT2
    mov r1, r9
    mov r2, sl
    mov r3, #0x0
    bl func_ov002_022a61e8
    ldrsb r0, [r0]
    cmp r0, #0x0
    beq .L_1184
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0x14]
    add r0, sp, #0xa4
    mov r3, r9
    str sl, [sp]
    bl func_ov002_021c7e68
    cmp r0, #0x1
    bne .L_1184
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
.L_1184:
    add r6, r6, #0x1
    cmp r6, r5
    blt .L_10dc
.L_1190:
    add r8, r8, #0xf
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_10c4
    mov r0, #0x0
    ldr ip, _LIT13
    ldr r8, _LIT14
    str r0, [sp, #0x2c]
    add r1, sp, #0x128
    mov lr, #0x14
.L_11b8:
    ldr r0, [sp, #0x2c]
    mov r3, #0x0
    sub r0, r4, r0
    sub r2, r0, #0x1
    cmp r2, #0x0
    mov r7, r3
    ble .L_1260
    mov r6, r1
.L_11d8:
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
    bls .L_1250
    mov fp, r7, lsl #0x1
    add r9, r1, r7, lsl #0x1
    ldrh sl, [r1, fp]
    ldrh r0, [r9, #0x2]
    mov r3, #0x1
    strh r0, [r1, fp]
    strh sl, [r9, #0x2]
.L_1250:
    add r6, r6, #0x2
    add r7, r7, #0x1
    cmp r7, r2
    blt .L_11d8
.L_1260:
    ldr r0, [sp, #0x2c]
    cmp r3, #0x0
    add r0, r0, #0x1
    str r0, [sp, #0x2c]
    bne .L_11b8
    mov sl, #0x0
    mvn r0, #0x35
    add r9, sp, #0x128
    mov r8, sl
    mov fp, sl
    str r0, [sp, #0x68]
.L_128c:
    cmp sl, r4
    bge .L_1388
    ldr r0, [sp, #0x4]
    ldr r2, [sp, #0x1c]
    ldr r0, [r0, #0xc]
    mov r1, #0x3
    add r2, sl, r2
    bl func_0202160c
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
    bne .L_12f4
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    ldreq r0, [sp, #0x68]
    movne r0, #0x36
    b .L_1304
.L_12f4:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    moveq r0, #0x36
    ldrne r0, [sp, #0x68]
.L_1304:
    cmp r4, #0x5
    add r7, r7, r0
    strle r8, [sp, #0x28]
    ble .L_1324
    mov r0, fp
    mov r1, r4
    bl func_020b377c
    str r0, [sp, #0x28]
.L_1324:
    mov r2, r7
    mov r0, r6
    mov r1, #0x3
    bl func_0202165c
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x28]
    add r2, r1, r0
    mov r0, r6
    mov r1, #0x4
    bl func_0202165c
    ldr r0, [sp, #0x20]
    mov r1, #0x5
    sub r2, r0, #0xe
    mov r0, r6
    bl func_0202165c
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x1
    bl func_0202165c
    ldrh r2, [r9]
    mov r0, r6
    mov r1, #0xd
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x18
    bl func_0202165c
.L_1388:
    add r8, r8, #0x10
    add fp, fp, #0x50
    add r9, r9, #0x2
    add sl, sl, #0x1
    cmp sl, #0xa
    blt .L_128c
    ldr r0, [sp, #0x30]
    add r0, r0, #0x1
    str r0, [sp, #0x30]
    cmp r0, #0x2
    ldr r0, [sp, #0x1c]
    add r0, r0, #0xa
    str r0, [sp, #0x1c]
    blt .L_1074
    ldr r0, [sp, #0x4]
    mov r1, #0x3
    str r1, [r0, #0xc60]
    mov r1, #0x0
    str r1, [r0, #0xc64]
    b .L_17b8
.L_13d8:
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
.L_142c:
    cmp r7, #0x0
    bne .L_1444
    cmp r6, r9
    moveq sl, r5
    movne sl, r3
    b .L_1450
.L_1444:
    cmp r4, r9
    moveq sl, r5
    movne sl, r1
.L_1450:
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
    blt .L_142c
    ldr r1, [sp, #0x4]
    ldr r1, [r1, #0xc64]
    cmp r1, #0xc
    bne .L_14d8
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
    bl func_ov002_022bda78
.L_14d8:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x1b
    bne .L_1538
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xd40]
    cmp r0, #0x0
    beq .L_1538
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
    bl func_ov002_022bda78
.L_1538:
    ldr r0, [sp, #0x4]
    mov r1, r6
    ldr r2, [r0, #0xc64]
    sub r2, r2, #0xc
    bl func_ov002_022b9434
    cmp r0, #0x0
    beq .L_1570
    ldr r0, [sp, #0x4]
    mvn r1, #0x0
    add r0, r0, r6, lsl #0x2
    ldr r0, [r0, #0xd6c]
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_1570:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xd40]
    cmp r0, #0x0
    beq .L_15b8
    ldr r0, [sp, #0x4]
    mov r1, r4
    ldr r2, [r0, #0xc64]
    sub r2, r2, #0x1b
    bl func_ov002_022b9434
    cmp r0, #0x0
    beq .L_15b8
    ldr r0, [sp, #0x4]
    mvn r1, #0x0
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xd6c]
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_15b8:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0xf
    bne .L_1608
    ldr r0, [sp, #0x4]
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xd48]
    cmp r0, #0x0
    bne .L_1608
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
    bl func_ov002_022bda78
.L_1608:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x1b
    bne .L_1634
    add r1, sp, #0x74
    ldr r2, [r1, r4, lsl #0x2]
    ldr r0, _LIT11
    mov r1, r4
    rsb r2, r2, #0x0
    mov r3, #0x4
    bl func_ov002_022b3640
.L_1634:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x2a
    bne .L_1660
    add r1, sp, #0x74
    ldr r2, [r1, r6, lsl #0x2]
    ldr r0, _LIT11
    mov r1, r6
    rsb r2, r2, #0x0
    mov r3, #0x4
    bl func_ov002_022b3640
.L_1660:
    ldr r0, _LIT1
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_1680
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x54
    b .L_168c
.L_1680:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x72
.L_168c:
    movge r0, #0x1
    movlt r0, #0x0
    cmp r0, #0x0
    beq .L_17b8
    ldr r0, _LIT11
    mov r1, #0x0
    str r1, [r0, #0x60]
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc]
    bl func_02021278
    ldr r0, [sp, #0x4]
    mov r2, #0x0
    str r2, [r0, #0xc]
    mov r1, #0x4
    str r1, [r0, #0xc60]
    str r2, [r0, #0xc64]
    b .L_17b8
.L_16d0:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0x15
    blt .L_17b8
    ldr r0, _LIT11
    mov r1, #0x1
    str r1, [r0, #0x4]
    ldr r0, [sp, #0x4]
    mov r1, #0x5
    str r1, [r0, #0xc60]
    mov r1, #0x0
    str r1, [r0, #0xc64]
    b .L_17b8
.L_1704:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc64]
    cmp r0, #0xf
    blt .L_17b8
    ldr r0, [sp, #0x4]
    mov r1, #0x6
    str r1, [r0, #0xc60]
    mov r1, #0x0
    str r1, [r0, #0xc64]
    b .L_17b8
.L_172c:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0x8]
    bl func_02021278
    ldr r1, _LIT1
    ldr r0, [sp, #0x4]
    mov r2, #0x0
    str r2, [r0, #0x8]
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_1768
    ldr r0, [r1, #0x58]
    cmp r0, #0x0
    ldreq r0, [r1, #0x90]
    cmpeq r0, #0x0
    bne .L_1778
.L_1768:
    ldr r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [r0, #0xd3c]
    b .L_1790
.L_1778:
    mov r0, #0x14
    mov r1, #0x0
    bl func_020221e0
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    str r1, [r0, #0xd44]
.L_1790:
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
.L_17b8:
    ldr r0, [sp, #0x4]
    ldr r1, [r0, #0xc64]
    mov r0, #0x1
    add r2, r1, #0x1
    ldr r1, [sp, #0x4]
    str r2, [r1, #0xc64]
    add sp, sp, #0x13c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word data_ov002_022cd314
_LIT2: .word data_ov002_022d1330
_LIT3: .word data_ov002_022cd35c
_LIT4: .word data_ov002_022ccc30+0x104
_LIT5: .word data_020cd380
_LIT6: .word data_ov002_022cd348
_LIT7: .word data_ov002_022cd360
_LIT8: .word 0x000009c4
_LIT9: .word data_ov002_022cd36c
_LIT10: .word data_ov002_022ccee4
_LIT11: .word data_ov002_022d1a18
_LIT12: .word data_020ccf60
_LIT13: .word data_ov002_022cf08c
_LIT14: .word 0x00000868
_LIT15: .word data_ov002_022d281c
