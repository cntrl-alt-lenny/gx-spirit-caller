; func_ov003_021cd6a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov003_021cf580
        .extern func_0201e790
        .extern func_02034734
        .extern func_020a9828
        .extern func_ov003_021cecbc
        .global func_ov003_021cd6a0
        .arm
func_ov003_021cd6a0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x40
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_1628
    b .L_1628
    b .L_1628
    b .L_97c
    b .L_a38
    b .L_b9c
    b .L_d30
    b .L_109c
    b .L_1160
    b .L_12f0
    b .L_1580
.L_97c:
    mov r0, #0x0
    mov r9, r4
    str r0, [sp, #0x30]
    mov fp, #0xa4
    mov r5, r0
.L_990:
    ldr r0, [sp, #0x30]
    mov r8, #0x0
    cmp r0, #0x0
    moveq r6, #0x2
    moveq r7, #0x1
    movne r6, #0x1
    movne r7, #0x0
    mov sl, #0x58
.L_9b0:
    ldr r1, [r4, #0xc]
    rsb r0, sl, #0x100
    mul r2, r1, r0
    mov r0, r2, asr #0x3
    add r0, r2, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    rsb r0, r0, #0x118
    stmia sp, {r0, fp}
    str r5, [sp, #0x8]
    str r5, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r9, r7, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r1, r6
    mov r3, r5
    bl func_ov003_021cecbc
    cmp r7, #0x0
    add r8, r8, #0x1
    addne r7, r7, #0x1
    add sl, sl, #0x38
    cmp r8, #0x3
    blt .L_9b0
    ldr r0, [sp, #0x30]
    add r9, r9, #0x6c
    add r0, r0, #0x1
    str r0, [sp, #0x30]
    cmp r0, #0x2
    blt .L_990
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a38:
    mov r0, #0x0
    mov r7, r4
    str r0, [sp, #0x2c]
.L_a44:
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    bne .L_a68
    ldr r0, [r4, #0x10]
    mov r9, #0x2
    str r9, [sp, #0x38]
    str r0, [sp, #0x34]
    mov sl, #0x1
    b .L_ac8
.L_a68:
    ldr r0, _LIT0
    mov sl, #0x0
    ldr r3, [r0, #0x38]
    ldr r2, _LIT1
    mov r0, r3, lsr #0x1f
    smull r1, r5, r2, r3
    add r5, r3, r5
    add r5, r0, r5, asr #0x4
    mov r2, #0x1e
    smull r0, r1, r2, r5
    str sl, [sp, #0x38]
    subs r5, r3, r0
    mov r9, #0x1
    bne .L_ac0
    bl func_020a9828
    ldr r2, _LIT2
    mov r3, #0x3
    smull r1, r5, r2, r0
    add r5, r5, r0, lsr #0x1f
    smull r1, r2, r3, r5
    sub r5, r0, r1
    str r5, [r4, #0x14]
.L_ac0:
    ldr r0, [r4, #0x14]
    str r0, [sp, #0x34]
.L_ac8:
    mov r6, #0x0
    mov r8, #0x70
    mov fp, #0xa4
    mov r5, r6
.L_ad8:
    stmia sp, {r8, fp}
    mov r0, #0x1
    str r0, [sp, #0x8]
    str r5, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r7, sl, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r1, r9
    mov r3, r5
    bl func_ov003_021cecbc
    cmp sl, #0x0
    add r6, r6, #0x1
    addne sl, sl, #0x1
    add r8, r8, #0x38
    cmp r6, #0x3
    blt .L_ad8
    ldr r0, [sp, #0x34]
    mov r1, #0x38
    mul r1, r0, r1
    add r0, r1, #0x70
    str r0, [sp]
    mov r0, #0xa4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, #0x2000
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x38]
    mov r3, #0x40
    str r3, [sp, #0x14]
    add r0, r7, r0, lsl #0x2
    ldr r2, [r0, #0xd4]
    mov r0, r4
    mov r1, r9
    sub r3, r3, #0x41
    bl func_ov003_021cecbc
    ldr r0, [sp, #0x2c]
    add r7, r7, #0x6c
    add r0, r0, #0x1
    str r0, [sp, #0x2c]
    cmp r0, #0x2
    blt .L_a44
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b9c:
    mov r0, #0x0
    mov r7, r4
    str r0, [sp, #0x28]
.L_ba8:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_bd0
    ldr r0, [r4, #0x10]
    mov r9, #0x2
    str r0, [sp, #0x18]
    mov r0, #0x3
    mov sl, #0x1
    str r0, [sp, #0x1c]
    b .L_c5c
.L_bd0:
    ldr r0, [r4, #0x14]
    mov r9, #0x1
    str r9, [sp, #0x1c]
    str r0, [sp, #0x18]
    mov sl, #0x0
    bl func_02034734
    cmp r0, #0x0
    beq .L_c5c
    ldr r0, _LIT3
    ldr r0, [r0, #0x54]
    cmp r0, #0x0
    bne .L_c5c
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, [r0, #0x38]
    mov r2, #0x1e
    smull r0, r5, r1, r3
    add r5, r3, r5
    mov r0, r3, lsr #0x1f
    add r5, r0, r5, asr #0x4
    smull r0, r1, r2, r5
    subs r5, r3, r0
    mov r0, sl
    str r0, [sp, #0x1c]
    bne .L_c54
    bl func_020a9828
    ldr r2, _LIT2
    mov r3, #0x3
    smull r1, r5, r2, r0
    add r5, r5, r0, lsr #0x1f
    smull r1, r2, r3, r5
    sub r5, r0, r1
    str r5, [r4, #0x14]
.L_c54:
    ldr r0, [r4, #0x14]
    str r0, [sp, #0x18]
.L_c5c:
    mov r6, #0x0
    mov r8, #0x70
    mov fp, #0xa4
    mov r5, r6
.L_c6c:
    stmia sp, {r8, fp}
    mov r0, #0x1
    str r0, [sp, #0x8]
    str r5, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r7, sl, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r1, r9
    mov r3, r5
    bl func_ov003_021cecbc
    cmp sl, #0x0
    add r6, r6, #0x1
    addne sl, sl, #0x1
    add r8, r8, #0x38
    cmp r6, #0x3
    blt .L_c6c
    ldr r0, [sp, #0x18]
    mov r1, #0x38
    mul r1, r0, r1
    add r0, r1, #0x70
    str r0, [sp]
    mov r0, #0xa4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, #0x2000
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x1c]
    mov r3, #0x40
    str r3, [sp, #0x14]
    add r0, r7, r0, lsl #0x2
    ldr r2, [r0, #0xd4]
    mov r0, r4
    mov r1, r9
    sub r3, r3, #0x41
    bl func_ov003_021cecbc
    ldr r0, [sp, #0x28]
    add r7, r7, #0x6c
    add r0, r0, #0x1
    str r0, [sp, #0x28]
    cmp r0, #0x2
    blt .L_ba8
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d30:
    mov r7, r4
    mov r5, #0x0
.L_d38:
    bl func_02034734
    cmp r0, #0x0
    beq .L_e94
    ldr r0, _LIT3
    ldr r0, [r0, #0x54]
    cmp r0, #0x0
    bne .L_e94
    cmp r5, #0x0
    bne .L_d70
    ldr r2, [r4, #0x10]
    mov r6, #0x2
    mov r7, #0x1
    mov fp, #0x3
    b .L_dcc
.L_d70:
    ldr r0, _LIT0
    mov r7, #0x0
    ldr r3, [r0, #0x38]
    ldr r2, _LIT1
    mov r0, r3, lsr #0x1f
    smull r1, r6, r2, r3
    add r6, r3, r6
    add r6, r0, r6, asr #0x4
    mov r2, #0x1e
    smull r0, r1, r2, r6
    mov fp, r7
    subs r6, r3, r0
    mov r6, #0x1
    bne .L_dc8
    bl func_020a9828
    ldr r2, _LIT2
    mov r3, #0x3
    smull r1, r8, r2, r0
    add r8, r8, r0, lsr #0x1f
    smull r1, r2, r3, r8
    sub r8, r0, r1
    str r8, [r4, #0x14]
.L_dc8:
    ldr r2, [r4, #0x14]
.L_dcc:
    mov r0, #0x38
    mul r1, r2, r0
    mov r0, #0x6c
    mla r9, r5, r0, r4
    mvn r0, #0x0
    add sl, r1, #0x70
    mov r5, #0x0
    mov r8, #0x70
    add fp, r9, fp, lsl #0x2
    str r0, [sp, #0x3c]
.L_df4:
    str r8, [sp]
    mov r0, #0xa4
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r9, r7, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r1, r6
    mov r3, #0x0
    bl func_ov003_021cecbc
    cmp r7, #0x0
    str sl, [sp]
    mov r0, #0xa4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, #0x2000
    str r0, [sp, #0x10]
    mov r0, #0x40
    str r0, [sp, #0x14]
    ldr r2, [fp, #0xd4]
    ldr r3, [sp, #0x3c]
    mov r0, r4
    mov r1, r6
    addne r7, r7, #0x1
    bl func_ov003_021cecbc
    add r5, r5, #0x1
    add r8, r8, #0x38
    cmp r5, #0x3
    blt .L_df4
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e94:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_eac
    cmp r0, #0x1
    beq .L_ff8
    b .L_1084
.L_eac:
    cmp r5, #0x0
    ldrne fp, [r4, #0x14]
    movne r9, #0x1
    movne sl, #0x0
    bne .L_ecc
    ldr fp, [r4, #0x10]
    mov r9, #0x2
    mov sl, #0x1
.L_ecc:
    mov r0, #0x38
    mul r0, fp, r0
    add r0, r0, #0x70
    rsb r0, r0, #0xa8
    str r0, [sp, #0x20]
    mov r6, #0x0
    mov r8, #0x70
.L_ee8:
    cmp r6, fp
    bne .L_f64
    ldr r1, [r4, #0xc]
    mov r0, r4
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1c
    add r1, r2, r1, ror #0x1c
    rsb r2, r1, #0x10
    ldr r1, [sp, #0x20]
    mov r3, #0x0
    mul r2, r1, r2
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    mov r1, r1, asr #0x4
    rsb r1, r1, #0xa8
    str r1, [sp]
    mov r1, #0xa4
    str r1, [sp, #0x4]
    mov r1, #0x1
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r1, #0x3400
    str r1, [sp, #0x10]
    mov r1, #0xa0
    str r1, [sp, #0x14]
    add r2, r7, sl, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r1, r9
    bl func_ov003_021cecbc
    b .L_fdc
.L_f64:
    ldr r0, [r4, #0xc]
    cmp r5, #0x0
    mov r1, r0, lsr #0x1f
    beq .L_f8c
    rsb r0, r1, r0, lsl #0x1c
    add r1, r1, r0, ror #0x1c
    mov r0, #0xc
    mul r0, r1, r0
    rsb r0, r0, #0xa4
    b .L_f9c
.L_f8c:
    rsb r0, r1, r0, lsl #0x1c
    add r0, r1, r0, ror #0x1c
    mov r0, r0, lsl #0x2
    add r0, r0, #0xa4
.L_f9c:
    str r8, [sp]
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r7, sl, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r1, r9
    mov r3, #0x0
    bl func_ov003_021cecbc
.L_fdc:
    add r6, r6, #0x1
    cmp sl, #0x0
    addne sl, sl, #0x1
    add r8, r8, #0x38
    cmp r6, #0x3
    blt .L_ee8
    b .L_1084
.L_ff8:
    cmp r5, #0x0
    movne r1, #0x1
    movne r0, #0x0
    bne .L_1014
    ldr r0, [r4, #0x10]
    mov r1, #0x2
    add r0, r0, #0x1
.L_1014:
    cmp r5, #0x0
    movne r3, #0xa4
    bne .L_104c
    ldr r2, [r4, #0xc]
    mov r6, #0x84
    mov r3, r2, lsr #0x1f
    rsb r2, r3, r2, lsl #0x1c
    add r2, r3, r2, ror #0x1c
    rsb r2, r2, #0x10
    mul r3, r2, r6
    mov r2, r3, asr #0x3
    add r2, r3, r2, lsr #0x1c
    mov r2, r2, asr #0x4
    add r3, r2, #0x20
.L_104c:
    mov r2, #0xa8
    stmia sp, {r2, r3}
    mov r2, #0x1
    str r2, [sp, #0x8]
    mov r3, #0x0
    str r3, [sp, #0xc]
    mov r2, #0x3400
    str r2, [sp, #0x10]
    mov r2, #0xa0
    add r0, r7, r0, lsl #0x2
    str r2, [sp, #0x14]
    ldr r2, [r0, #0xf4]
    mov r0, r4
    bl func_ov003_021cecbc
.L_1084:
    add r5, r5, #0x1
    cmp r5, #0x2
    add r7, r7, #0x6c
    blt .L_d38
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_109c:
    mov r6, r4
    mov r5, #0x0
    mvn fp, #0x0
.L_10a8:
    cmp r5, #0x0
    bne .L_10cc
    ldr r0, _LIT3
    mov r7, #0x2
    ldr r0, [r0, #0x44]
    mov sl, #0x4
    add r8, r0, #0x1
    mov r9, #0x0
    b .L_1104
.L_10cc:
    ldr r0, _LIT3
    mov r7, #0x1
    ldr r0, [r0, #0x48]
    mov sl, #0x88
    add r8, r0, #0x4
    mov r9, fp
    bl func_02034734
    cmp r0, #0x0
    beq .L_1104
    ldr r0, _LIT3
    ldr r0, [r0, #0x54]
    cmp r0, #0x0
    moveq r8, #0x0
    moveq r9, r8
.L_1104:
    add sl, sl, #0x1c
    mov r0, #0xa8
    stmia sp, {r0, sl}
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r6, r8, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r1, r7
    mov r3, r9
    mov r0, r4
    bl func_ov003_021cecbc
    add r5, r5, #0x1
    add r6, r6, #0x6c
    cmp r5, #0x2
    blt .L_10a8
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1160:
    ldr r0, _LIT3
    ldr r0, [r0, #0x50]
    cmp r0, #0x0
    beq .L_1204
    ble .L_118c
    mov r0, #0x0
    str r0, [sp, #0x38]
    mov r0, #0x4
    mov r6, #0x2
    str r0, [sp, #0x34]
    b .L_11a0
.L_118c:
    bge .L_11a0
    mov r6, #0x1
    mov r0, #0x88
    str r6, [sp, #0x38]
    str r0, [sp, #0x34]
.L_11a0:
    ldr r0, [sp, #0x38]
    mov r1, #0x6c
    mul r5, r0, r1
    add r7, r4, #0xc0
    ldr r0, [r7, r5]
    bl func_0201e790
    cmp r0, #0x0
    beq .L_1204
    mov r0, #0xa8
    str r0, [sp]
    ldr r0, [sp, #0x34]
    mov r3, #0x80
    add r0, r0, #0x1c
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, #0x2800
    str r0, [sp, #0x10]
    str r3, [sp, #0x14]
    ldr r2, [r7, r5]
    mov r0, r4
    mov r1, r6
    sub r3, r3, #0x81
    bl func_ov003_021cecbc
.L_1204:
    mov r9, #0x0
    mov sl, r4
    mov r8, #0xa8
    mov r7, #0x1
    mov r6, r9
    mov fp, #0x3400
    mvn r5, #0x0
.L_1220:
    cmp r9, #0x0
    bne .L_126c
    ldr r2, _LIT3
    mov r1, #0x2
    ldr r2, [r2, #0x50]
    mov r0, #0x20
    cmp r2, r5
    bne .L_125c
    ldr r2, [r4, #0xc]
    mov r0, #0x6
    mul r3, r2, r0
    mov r0, r3, asr #0x2
    add r0, r3, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    add r0, r0, #0x20
.L_125c:
    ldr r2, _LIT3
    ldr r2, [r2, #0x44]
    add r2, r2, #0x1
    b .L_12ac
.L_126c:
    ldr r2, _LIT3
    mov r1, #0x1
    ldr r2, [r2, #0x50]
    mov r0, #0xa4
    cmp r2, #0x1
    bne .L_12a0
    ldr r2, [r4, #0xc]
    mov r0, #0x6
    mul r3, r2, r0
    mov r0, r3, asr #0x2
    add r0, r3, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    rsb r0, r0, #0xa4
.L_12a0:
    ldr r2, _LIT3
    ldr r2, [r2, #0x48]
    add r2, r2, #0x1
.L_12ac:
    str r8, [sp]
    stmib sp, {r0, r7}
    str r6, [sp, #0xc]
    str fp, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, sl, r2, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r3, r6
    bl func_ov003_021cecbc
    add r9, r9, #0x1
    add sl, sl, #0x6c
    cmp r9, #0x2
    blt .L_1220
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12f0:
    mov r7, r4
    mov r5, #0x0
.L_12f8:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_1318
    cmp r0, #0x1
    beq .L_1398
    cmp r0, #0x2
    beq .L_141c
    b .L_1568
.L_1318:
    cmp r5, #0x0
    bne .L_133c
    ldr r0, _LIT3
    mov r1, #0x2
    ldr r0, [r0, #0x44]
    mov r6, #0x4
    add r2, r0, #0x1
    mov r3, #0x0
    b .L_1354
.L_133c:
    ldr r0, _LIT3
    mov r6, #0x88
    ldr r0, [r0, #0x48]
    sub r3, r6, #0x89
    add r2, r0, #0x7
    mov r1, #0x1
.L_1354:
    mov r0, #0xa8
    str r0, [sp]
    add r0, r6, #0x1c
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r0, r7, r2, lsl #0x2
    ldr r2, [r0, #0xf4]
    mov r0, r4
    bl func_ov003_021cecbc
    b .L_1568
.L_1398:
    cmp r5, #0x0
    movne r1, #0x1
    movne r2, #0x0
    movne r3, #0xa4
    bne .L_13e0
    ldr r0, [r4, #0xc]
    ldr r3, [r4, #0x10]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1c
    add r1, r1, r0, ror #0x1c
    mov r0, #0x84
    mul r2, r1, r0
    mov r0, r2, asr #0x3
    add r0, r2, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    add r2, r3, #0x1
    add r3, r0, #0x20
    mov r1, #0x2
.L_13e0:
    mov r0, #0xa8
    stmia sp, {r0, r3}
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r3, #0x0
    str r3, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r0, r7, r2, lsl #0x2
    ldr r2, [r0, #0xf4]
    mov r0, r4
    bl func_ov003_021cecbc
    b .L_1568
.L_141c:
    cmp r5, #0x0
    ldrne fp, [r4, #0x14]
    movne r9, #0x1
    movne sl, #0x0
    bne .L_143c
    ldr fp, [r4, #0x10]
    mov r9, #0x2
    mov sl, #0x1
.L_143c:
    mov r0, #0x38
    mul r0, fp, r0
    add r0, r0, #0x70
    rsb r0, r0, #0xa8
    str r0, [sp, #0x24]
    mov r6, #0x0
    mov r8, #0x70
.L_1458:
    cmp r6, fp
    bne .L_14d0
    ldr r1, [r4, #0xc]
    mov r0, r4
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1c
    add r2, r2, r1, ror #0x1c
    ldr r1, [sp, #0x24]
    mov r3, #0x0
    mul r2, r1, r2
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    mov r1, r1, asr #0x4
    rsb r1, r1, #0xa8
    str r1, [sp]
    mov r1, #0xa4
    str r1, [sp, #0x4]
    mov r1, #0x1
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r1, #0x3400
    str r1, [sp, #0x10]
    mov r1, #0xa0
    str r1, [sp, #0x14]
    add r2, r7, sl, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r1, r9
    bl func_ov003_021cecbc
    b .L_1550
.L_14d0:
    ldr r0, [r4, #0xc]
    cmp r5, #0x0
    mov r1, r0, lsr #0x1f
    beq .L_14fc
    rsb r0, r1, r0, lsl #0x1c
    add r0, r1, r0, ror #0x1c
    rsb r1, r0, #0x10
    mov r0, #0xc
    mul r0, r1, r0
    rsb r0, r0, #0xa4
    b .L_1510
.L_14fc:
    rsb r0, r1, r0, lsl #0x1c
    add r0, r1, r0, ror #0x1c
    rsb r0, r0, #0x10
    mov r0, r0, lsl #0x2
    add r0, r0, #0xa4
.L_1510:
    str r8, [sp]
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x3400
    str r0, [sp, #0x10]
    mov r0, #0xa0
    str r0, [sp, #0x14]
    add r2, r7, sl, lsl #0x2
    ldr r2, [r2, #0xf4]
    mov r0, r4
    mov r1, r9
    mov r3, #0x0
    bl func_ov003_021cecbc
.L_1550:
    add r6, r6, #0x1
    cmp sl, #0x0
    addne sl, sl, #0x1
    add r8, r8, #0x38
    cmp r6, #0x3
    blt .L_1458
.L_1568:
    add r5, r5, #0x1
    cmp r5, #0x2
    add r7, r7, #0x6c
    blt .L_12f8
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1580:
    ldr r0, _LIT3
    ldr r0, [r0, #0x50]
    cmp r0, #0x1
    bne .L_15ac
    ldr r0, _LIT3
    mov r3, #0x0
    ldr r0, [r0, #0x44]
    mov r1, #0x2
    add r0, r0, #0x1
    mov r2, #0x4
    b .L_15c4
.L_15ac:
    ldr r0, _LIT3
    mov r3, #0x1
    ldr r0, [r0, #0x48]
    mov r1, r3
    add r0, r0, #0x1
    mov r2, #0x88
.L_15c4:
    ldr r5, [r4, #0xc]
    mov r6, #0x6c
    rsb r7, r5, #0x10
    mov r5, #0x70
    mul r8, r7, r5
    mov r5, r8, asr #0x3
    add r5, r8, r5, lsr #0x1c
    mov r5, r5, asr #0x4
    rsb r7, r5, #0x118
    mla r5, r3, r6, r4
    str r7, [sp]
    add r2, r2, #0x1c
    str r2, [sp, #0x4]
    mov r2, #0x1
    str r2, [sp, #0x8]
    mov r3, #0x0
    str r3, [sp, #0xc]
    mov r2, #0x3400
    str r2, [sp, #0x10]
    mov r2, #0xa0
    str r2, [sp, #0x14]
    add r0, r5, r0, lsl #0x2
    ldr r2, [r0, #0xf4]
    mov r0, r4
    bl func_ov003_021cecbc
.L_1628:
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02103fcc
_LIT1: .word 0x88888889
_LIT2: .word 0x55555556
_LIT3: .word data_ov003_021cf580
