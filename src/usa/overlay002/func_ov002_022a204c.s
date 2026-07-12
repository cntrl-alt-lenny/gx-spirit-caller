; func_ov002_022a204c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov002_022d008c
        .extern data_ov002_022d0e4c
        .extern func_02006160
        .extern func_02006178
        .extern func_020b377c
        .extern func_ov002_021afa10
        .extern func_ov002_021afae4
        .extern func_ov002_021afe6c
        .extern func_ov002_021afeb0
        .extern func_ov002_022476f0
        .extern func_ov002_0226b300
        .extern func_ov002_0229f2a4
        .extern func_ov002_0229f678
        .extern func_ov002_0229f894
        .extern func_ov002_022a0fec
        .extern func_ov002_022a15ec
        .extern func_ov002_022a1674
        .extern func_ov002_022a1760
        .extern func_ov002_022a1898
        .extern func_ov002_022a1d50
        .extern func_ov002_022a2790
        .extern func_ov002_022abeec
        .extern func_ov002_022b0308
        .extern func_ov002_022b1f04
        .global func_ov002_022a204c
        .arm
func_ov002_022a204c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    str r1, [r4, #0x18]
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_8d8
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    bne .L_8d8
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr ip, [r0]
    ldr r3, [r0]
    and ip, ip, #0x1f00
    mov lr, ip, lsr #0x8
    bic ip, r3, #0x1f00
    bic r3, lr, #0xc
    orr r3, ip, r3, lsl #0x8
    str r3, [r0]
    ldrh r3, [r0, #0x4a]
    bic r3, r3, #0x3f
    orr r3, r3, #0x3f
    strh r3, [r0, #0x4a]
    ldr ip, [r0]
    ldr r3, [r0]
    and ip, ip, #0xe000
    mov lr, ip, lsr #0xd
    bic ip, r3, #0xe000
    bic r3, lr, #0x2
    orr r3, ip, r3, lsl #0xd
    str r3, [r0]
    str r1, [r2, #0xd0]
    str r1, [r4]
    ldr r0, [r4, #0x70]
    cmp r0, #0x0
    beq .L_860
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x70]
.L_860:
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq .L_878
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x68]
.L_878:
    ldr r0, [r4, #0x4]
    cmp r0, #0xd
    bne .L_89c
    ldr r3, [r4, #0x8]
    mov r0, r4
    mov r1, #0x20
    mov r2, #0x0
    bl func_ov002_0229f894
    ldmia sp!, {r4, r5, r6, pc}
.L_89c:
    cmp r0, #0xb
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r4, #0x24]
    mov r5, #0x0
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
.L_8b4:
    add r0, r4, r5, lsl #0x1
    ldrh r0, [r0, #0x94]
    sub r0, r0, #0x4
    bl func_ov002_022b0308
    ldr r0, [r4, #0x24]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_8b4
    ldmia sp!, {r4, r5, r6, pc}
.L_8d8:
    ldr r0, [r4, #0x194]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_908
    add r6, r4, #0x198
.L_8ec:
    mov r0, r6
    bl func_ov002_0229f2a4
    ldr r0, [r4, #0x194]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x20
    blt .L_8ec
.L_908:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_934
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    movgt r1, #0x1
    ldr r0, [r4, #0x38]
    movle r1, #0x0
    sub r0, r0, r1
    str r0, [r4, #0x38]
    b .L_9bc
.L_934:
    mov r0, r4
    bl func_ov002_022a1674
    cmp r0, #0x0
    beq .L_994
    ldr r0, [r4, #0x4]
    cmp r0, #0xb
    ldr r0, [r4, #0x38]
    bne .L_95c
    cmp r0, #0xc
    b .L_960
.L_95c:
    cmp r0, #0x10
.L_960:
    movlt r1, #0x1
    ldr r0, [r4, #0x38]
    movge r1, #0x0
    add r0, r0, r1
    str r0, [r4, #0x38]
    mov r0, r4
    bl func_ov002_022a1760
    cmp r0, #0x0
    beq .L_9bc
    ldr r0, _LIT1
    mov r1, #0x2
    str r1, [r0, #0xd0]
    b .L_9bc
.L_994:
    ldr r0, [r4, #0x38]
    ldr r1, [r4, #0x38]
    cmp r0, #0x4
    movgt r2, #0x1
    movle r2, #0x0
    sub r1, r1, r2
    str r1, [r4, #0x38]
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0xd0]
.L_9bc:
    ldr r0, [r4, #0x4]
    cmp r0, #0xc
    beq .L_9d4
    cmp r0, #0x20
    beq .L_9ec
    b .L_a04
.L_9d4:
    bl func_ov002_0226b300
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_ov002_0229f678
    ldmia sp!, {r4, r5, r6, pc}
.L_9ec:
    bl func_ov002_022476f0
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_ov002_0229f678
    ldmia sp!, {r4, r5, r6, pc}
.L_a04:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd4]
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r0, #0x0
    bne .L_a78
    mov r0, r4
    bl func_ov002_022a15ec
    cmp r0, #0x0
    beq .L_a60
    bl func_02006178
    cmp r0, #0x0
    bne .L_a48
    bl func_02006160
    cmp r0, #0x0
    beq .L_a60
.L_a48:
    ldr r1, _LIT1
    mov r2, #0x2
    mov r0, r4
    str r2, [r1, #0xd0]
    bl func_ov002_022a1898
    b .L_a78
.L_a60:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd0]
    cmp r0, #0x2
    bne .L_a78
    mov r0, r4
    bl func_ov002_022a1d50
.L_a78:
    ldr r0, [r4, #0x4]
    cmp r0, #0xd
    addls pc, pc, r0, lsl #0x2
    b .L_d88
    b .L_ac8
    b .L_ac8
    b .L_ac8
    b .L_b5c
    b .L_ac8
    b .L_b5c
    b .L_b5c
    b .L_ac8
    b .L_ac8
    b .L_b5c
    b .L_c40
    b .L_ac0
    b .L_d88
    b .L_ac8
.L_ac0:
    mov r0, r4
    bl func_ov002_022b1f04
.L_ac8:
    ldr r6, [r4, #0x194]
    mov ip, #0x0
    cmp r6, #0x0
    ble .L_d88
    mov r0, #0x1
    mov r2, ip
.L_ae0:
    add r1, r4, ip, lsl #0x5
    ldr r5, [r1, #0x198]
    mov r3, r2
    cmp r5, #0x0
    ldrne r1, [r1, #0x1b0]
    cmpne r1, #0x0
    movne r3, r0
    cmp r3, #0x0
    beq .L_b4c
    cmp r5, #0x0
    addne r0, r4, ip, lsl #0x5
    ldrne r0, [r0, #0x1b0]
    cmpne r0, #0x0
    beq .L_b24
    cmp r0, #0x10
    movlt r0, #0x1
    blt .L_b28
.L_b24:
    mov r0, #0x0
.L_b28:
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r4, ip, lsl #0x5
    ldr r2, [r0, #0x1b4]
    ldr r1, _LIT2
    mov r0, r4
    str r2, [r1, #0xd44]
    bl func_ov002_0229f678
    ldmia sp!, {r4, r5, r6, pc}
.L_b4c:
    add ip, ip, #0x1
    cmp ip, r6
    blt .L_ae0
    b .L_d88
.L_b5c:
    ldr r6, [r4, #0x194]
    mov ip, #0x0
    cmp r6, #0x0
    ble .L_d88
    mov r0, #0x1
    mov r2, ip
.L_b74:
    add r1, r4, ip, lsl #0x5
    ldr r5, [r1, #0x198]
    mov r3, r2
    cmp r5, #0x0
    ldrne r1, [r1, #0x1b0]
    cmpne r1, #0x0
    movne r3, r0
    cmp r3, #0x0
    beq .L_c30
    cmp r5, #0x0
    addne r0, r4, ip, lsl #0x5
    ldrne r0, [r0, #0x1b0]
    cmpne r0, #0x0
    beq .L_bb8
    cmp r0, #0x10
    movlt r0, #0x1
    blt .L_bbc
.L_bb8:
    mov r0, #0x0
.L_bbc:
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp ip, #0x0
    beq .L_be0
    cmp ip, #0x1
    beq .L_c04
    cmp ip, #0x2
    beq .L_c10
    ldmia sp!, {r4, r5, r6, pc}
.L_be0:
    ldr r1, [r4, #0x24]
    ldr r0, [r4, #0x20]
    add r0, r0, r1
    sub r0, r0, #0x1
    bl func_020b377c
    mov r0, r4
    str r1, [r4, #0x20]
    bl func_ov002_022a0fec
    ldmia sp!, {r4, r5, r6, pc}
.L_c04:
    mov r0, r4
    bl func_ov002_022a2790
    ldmia sp!, {r4, r5, r6, pc}
.L_c10:
    ldr r0, [r4, #0x20]
    ldr r1, [r4, #0x24]
    add r0, r0, #0x1
    bl func_020b377c
    mov r0, r4
    str r1, [r4, #0x20]
    bl func_ov002_022a0fec
    ldmia sp!, {r4, r5, r6, pc}
.L_c30:
    add ip, ip, #0x1
    cmp ip, r6
    blt .L_b74
    b .L_d88
.L_c40:
    ldr r6, [r4, #0x194]
    mov ip, #0x0
    cmp r6, #0x0
    ble .L_d88
    mov r0, #0x1
    mov r2, ip
.L_c58:
    add r1, r4, ip, lsl #0x5
    ldr r5, [r1, #0x198]
    mov r3, r2
    cmp r5, #0x0
    ldrne r1, [r1, #0x1b0]
    cmpne r1, #0x0
    movne r3, r0
    cmp r3, #0x0
    beq .L_d7c
    cmp r5, #0x0
    addne r0, r4, ip, lsl #0x5
    ldrne r0, [r0, #0x1b0]
    cmpne r0, #0x0
    beq .L_c9c
    cmp r0, #0x10
    movlt r0, #0x1
    blt .L_ca0
.L_c9c:
    mov r0, #0x0
.L_ca0:
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp ip, #0x0
    beq .L_cc4
    cmp ip, #0x1
    beq .L_d18
    cmp ip, #0x2
    beq .L_d24
    ldmia sp!, {r4, r5, r6, pc}
.L_cc4:
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0x20]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    and r0, r0, #0xf0
    mov r0, r0, asr #0x4
    and r0, r0, #0xff
    sub r1, r1, r0
    str r1, [r4, #0x20]
    ldr r0, [r4, #0x8]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    and r0, r0, #0xf
    cmp r1, r0
    movle r1, r0
    mov r0, r4
    str r1, [r4, #0x20]
    bl func_ov002_022a0fec
    ldmia sp!, {r4, r5, r6, pc}
.L_d18:
    mov r0, r4
    bl func_ov002_022a2790
    ldmia sp!, {r4, r5, r6, pc}
.L_d24:
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0x20]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    and r0, r0, #0xf0
    mov r0, r0, asr #0x4
    and r0, r0, #0xff
    add r2, r1, r0
    str r2, [r4, #0x20]
    ldr r0, [r4, #0x8]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r1, r0, #0xff
    cmp r2, r1
    movle r1, r2
    mov r0, r4
    str r1, [r4, #0x20]
    bl func_ov002_022a0fec
    ldmia sp!, {r4, r5, r6, pc}
.L_d7c:
    add ip, ip, #0x1
    cmp ip, r6
    blt .L_c58
.L_d88:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldr r6, [r4, #0x194]
    mov ip, #0x0
    cmp r6, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
    mov r0, #0x1
    mov r2, ip
.L_dac:
    add r1, r4, ip, lsl #0x5
    ldr r5, [r1, #0x198]
    mov r3, r2
    cmp r5, #0x0
    ldrne r1, [r1, #0x1b0]
    cmpne r1, #0x0
    movne r3, r0
    cmp r3, #0x0
    beq .L_edc
    cmp r5, #0x0
    addne r0, r4, ip, lsl #0x5
    ldrne r0, [r0, #0x1b0]
    cmpne r0, #0x0
    beq .L_df0
    cmp r0, #0x10
    movlt r0, #0x1
    blt .L_df4
.L_df0:
    mov r0, #0x0
.L_df4:
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp ip, #0x0
    beq .L_e14
    cmp ip, #0x1
    cmpne ip, #0x2
    beq .L_e20
    ldmia sp!, {r4, r5, r6, pc}
.L_e14:
    mov r0, r4
    bl func_ov002_022a2790
    ldmia sp!, {r4, r5, r6, pc}
.L_e20:
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022abeec
    mov r1, #0x0
    str r1, [r4, #0x60]
    cmp r0, #0x0
    beq .L_e50
    bl func_ov002_021afeb0
    ldr r0, [r4, #0x4c]
    sub r0, r0, #0x1
    str r0, [r4, #0x4c]
    b .L_ecc
.L_e50:
    bl func_ov002_021afa10
    ldr r1, [r4, #0x4c]
    cmp r1, r0
    bge .L_ecc
    ldr r2, [r4, #0x68]
    ldr r0, [r4, #0x20]
    add r1, r1, #0x1
    ldr r0, [r2, r0, lsl #0x2]
    str r1, [r4, #0x4c]
    bl func_ov002_021afe6c
    bl func_ov002_021afa10
    ldr r1, [r4, #0x4c]
    cmp r1, r0
    bne .L_e9c
    mov r0, #0x0
    str r0, [r4, #0x14]
    mov r0, #0x1
    str r0, [r4, #0x60]
    b .L_ecc
.L_e9c:
    ldr r0, [r4, #0x20]
    add r5, r0, #0x1
    bl func_ov002_021afae4
    cmp r5, r0
    bge .L_ecc
    mov r0, r4
    mov r1, r5
    bl func_ov002_022abeec
    cmp r0, #0x0
    ldreq r0, [r4, #0x20]
    addeq r0, r0, #0x1
    streq r0, [r4, #0x20]
.L_ecc:
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a0fec
    ldmia sp!, {r4, r5, r6, pc}
.L_edc:
    add ip, ip, #0x1
    cmp ip, r6
    blt .L_dac
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x04001000
_LIT1: .word data_ov002_022d0e4c
_LIT2: .word data_ov002_022d008c
