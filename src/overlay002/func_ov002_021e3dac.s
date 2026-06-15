; func_ov002_021e3dac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd4b8
        .extern data_ov002_022cd4cc
        .extern data_ov002_022cd968
        .extern data_ov002_022ce288
        .extern data_ov002_022ce588
        .extern data_ov002_022ce58a
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_0202e234
        .extern func_02031208
        .extern func_ov002_021b04c8
        .extern func_ov002_021b1570
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b9ecc
        .extern func_ov002_021ba0b0
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021df62c
        .extern func_ov002_021e2e38
        .extern func_ov002_021e2e80
        .extern func_ov002_021e35ac
        .extern func_ov002_021e36b8
        .extern func_ov002_021e3968
        .extern func_ov002_021fd81c
        .extern func_ov002_02245100
        .extern func_ov002_02254154
        .extern func_ov002_0225702c
        .extern func_ov002_02257c54
        .extern func_ov002_02257c88
        .extern func_ov002_02257ca8
        .extern func_ov002_02257cdc
        .extern func_ov002_02257db4
        .extern func_ov002_0229cd70
        .global func_ov002_021e3dac
        .arm
func_ov002_021e3dac:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    ldr r0, _LIT0
    ldr r6, _LIT0
    ldr r1, [r0, #0x484]
    ldr r8, [r6, #0x480]
    ldr r2, _LIT1
    mov r0, #0x18
    mla r5, r1, r0, r2
    cmp r1, #0x0
    subgt r4, r5, #0x18
    ldr r0, _LIT1
    sub r7, r8, #0x1
    mov r3, #0x18
    mla r0, r7, r3, r0
    ldr r2, [r6, #0x59c]
    movle r4, #0x0
    str r0, [sp, #0x8]
    cmp r2, #0xe
    addls pc, pc, r2, lsl #0x2
    b .L_1580
    b .L_890
    b .L_8ec
    b .L_c28
    b .L_cb4
    b .L_d58
    b .L_de8
    b .L_e8c
    b .L_1160
    b .L_11c4
    b .L_1580
    b .L_1580
    b .L_1260
    b .L_14d8
    b .L_1524
    b .L_1538
.L_890:
    bl func_ov002_021b04c8
    cmp r0, #0x0
    addne sp, sp, #0x34
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_02254154
    cmp r0, #0x0
    addne sp, sp, #0x34
    mov r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r1, r6
    str r0, [r1, #0x5d8]
    mov r0, #0x0
    str r0, [r1, #0x484]
    str r0, [r1, #0x488]
    bl func_ov002_02245100
    mov r1, r6
    ldr r2, [r1, #0x59c]
    add sp, sp, #0x34
    add r2, r2, #0x1
    str r2, [r1, #0x59c]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8ec:
    mov r0, r5
    bl func_ov002_021e35ac
    cmp r0, #0x0
    beq .L_978
    mov r0, r5
    bl func_ov002_02257db4
    cmp r0, #0x0
    beq .L_954
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0x10
    beq .L_978
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r0, #0x8000
    ldrh r2, [r5, #0x4]
    moveq r0, #0x0
    orr r0, r0, #0x28
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x11
    mov r0, r0, lsr #0x10
    mov r2, r2, lsr #0x17
    mov r3, #0x0
    bl func_ov002_021d479c
    b .L_978
.L_954:
    ldrh r1, [r5, #0x2]
    ldrh r0, [r5, #0x4]
    mov r3, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021df62c
.L_978:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_bec
    mov r6, #0x0
.L_98c:
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, r6, #0x1
    mla r9, r1, r0, r2
    ldr r0, _LIT4
    mov r7, #0x0
    sub r0, r0, #0xfa
    str r0, [sp, #0x10]
    ldr r0, _LIT4
    sub r0, r0, #0xfa
    str r0, [sp, #0xc]
    ldr r0, _LIT4
    sub r0, r0, #0x1c
    str r0, [sp, #0x14]
    ldr r0, _LIT5
    sub fp, r0, #0x62
    ldr r0, _LIT6
    mov r4, fp
    add r0, r0, #0x1e
    str r0, [sp, #0x18]
    ldr r0, _LIT6
    add r0, r0, #0xbe
    str r0, [sp, #0x20]
    ldr r0, _LIT6
    add r0, r0, #0xc2
    str r0, [sp, #0x1c]
    ldr r0, _LIT7
    add r0, r0, #0x1e8
    str r0, [sp, #0x2c]
    ldr r0, _LIT6
    add r0, r0, #0xc2
    str r0, [sp, #0x28]
    ldr r0, _LIT6
    add r0, r0, #0xbe
    str r0, [sp, #0x24]
.L_a18:
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_bd0
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9ecc
    mov r8, r0
    mov sl, #0x0
    bl func_0202e234
    cmp r0, #0x0
    beq .L_a50
    cmp r7, #0x5
    bge .L_bd0
    b .L_a58
.L_a50:
    cmp r7, #0x4
    ble .L_bd0
.L_a58:
    ldrh r0, [r5]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_b34
    mov r0, r8
    bl func_02031208
    cmp r0, #0x0
    movne sl, #0x1
    cmp r8, r4
    bgt .L_ab4
    cmp r8, fp
    bge .L_b04
    ldr r0, [sp, #0xc]
    cmp r8, r0
    bgt .L_aa4
    ldr r0, [sp, #0x10]
    cmp r8, r0
    beq .L_ae4
    b .L_ba4
.L_aa4:
    ldr r0, [sp, #0x14]
    cmp r8, r0
    beq .L_afc
    b .L_ba4
.L_ab4:
    ldr r0, _LIT6
    cmp r8, r0
    bgt .L_ad4
    bge .L_b1c
    ldr r0, _LIT5
    cmp r8, r0
    beq .L_afc
    b .L_ba4
.L_ad4:
    ldr r0, [sp, #0x18]
    cmp r8, r0
    beq .L_b1c
    b .L_ba4
.L_ae4:
    ldrh r0, [r5]
    bl func_0202b8c0
    cmp r0, #0x0
    cmpne r0, #0x5
    moveq sl, #0x1
    b .L_ba4
.L_afc:
    mov sl, #0x1
    b .L_ba4
.L_b04:
    ldrh r1, [r5]
    ldr r0, _LIT8
    cmp r1, r0
    moveq sl, #0x1
    movne sl, #0x0
    b .L_ba4
.L_b1c:
    ldrh r0, [r5]
    bl func_0202b8c0
    cmp r0, #0x0
    moveq sl, #0x1
    movne sl, #0x0
    b .L_ba4
.L_b34:
    ldrh r0, [r5]
    bl func_0202b878
    cmp r0, #0x17
    bne .L_ba4
    ldr r0, [sp, #0x1c]
    cmp r8, r0
    bgt .L_b84
    ldr r0, [sp, #0x20]
    cmp r8, r0
    blt .L_b74
    ldr r0, [sp, #0x24]
    cmp r8, r0
    ldrne r0, [sp, #0x28]
    cmpne r8, r0
    beq .L_b90
    b .L_ba4
.L_b74:
    ldr r0, _LIT7
    cmp r8, r0
    moveq sl, #0x1
    b .L_ba4
.L_b84:
    ldr r0, [sp, #0x2c]
    cmp r8, r0
    bne .L_ba4
.L_b90:
    ldrh r0, [r5]
    bl func_0202b8c0
    cmp r0, #0x1
    moveq sl, #0x1
    movne sl, #0x0
.L_ba4:
    cmp sl, #0x0
    beq .L_bd0
    ldrh r2, [r5, #0x4]
    mov r0, r6
    mov r1, r7
    mov r2, r2, lsl #0x11
    mov r2, r2, lsr #0x17
    str r2, [sp]
    ldr r2, _LIT4
    mov r3, #0x2
    bl func_ov002_021d59cc
.L_bd0:
    add r9, r9, #0x14
    add r7, r7, #0x1
    cmp r7, #0xa
    ble .L_a18
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_98c
.L_bec:
    ldr r0, _LIT9
    ldr r1, _LIT0
    ldr r3, [r0, #0x300]
    mov r2, #0x0
    bic r3, r3, #0x800
    bic r3, r3, #0x2000
    str r3, [r0, #0x300]
    str r2, [r1, #0x5b4]
    str r2, [r1, #0x5b8]
    ldr r2, [r1, #0x59c]
    add sp, sp, #0x34
    add r2, r2, #0x1
    str r2, [r1, #0x59c]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c28:
    str r5, [r6, #0x48c]
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    bne .L_c4c
    mov r0, r5
    bl func_ov002_02257c88
    cmp r0, #0x0
    bne .L_c74
.L_c4c:
    ldrh r2, [r5, #0x2]
    ldr r1, _LIT0
    add sp, sp, #0x34
    orr r2, r2, #0x8000
    strh r2, [r5, #0x2]
    ldr r2, [r1, #0x59c]
    mov r0, #0x1
    add r2, r2, #0x2
    str r2, [r1, #0x59c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c74:
    mov r0, r5
    bl func_ov002_021e2e38
    cmp r0, #0x0
    beq .L_c9c
    mov r0, r6
    ldr r1, [r0, #0x484]
    mov r2, r5
    mov r0, #0x1c
    mov r3, #0x18
    bl func_ov002_021b1570
.L_c9c:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0, #0x59c]
    add r2, r2, #0x1
    str r2, [r0, #0x59c]
    str r1, [r0, #0x5bc]
.L_cb4:
    mov r0, r5
    bl func_ov002_021e2e38
    cmp r0, #0x0
    bne .L_d0c
    mov r0, r5
    mov r1, r4
    bl func_ov002_02257c54
    cmp r0, #0x0
    beq .L_d0c
    movgt r0, #0x1
    movle r0, #0x0
    ldrh r1, [r5, #0x2]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8000
    mov r0, r0, lsl #0x1f
    orr r1, r1, r0, lsr #0x10
    ldr r0, _LIT9
    strh r1, [r5, #0x2]
    ldr r1, [r0, #0x300]
    orr r1, r1, #0x2000
    str r1, [r0, #0x300]
.L_d0c:
    ldr r0, _LIT9
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1f
    beq .L_d4c
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    ldreq r0, _LIT0
    moveq r1, #0x6
    streq r1, [r0, #0x59c]
    beq .L_d4c
    ldr r0, _LIT0
    ldr r1, [r0, #0x59c]
    add r1, r1, #0x1
    str r1, [r0, #0x59c]
.L_d4c:
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d58:
    str r5, [r6, #0x48c]
    ldrh r0, [r5, #0x4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_d7c
    mov r0, r5
    bl func_ov002_02257cdc
    cmp r0, #0x0
    bne .L_da8
.L_d7c:
    ldrh r2, [r5, #0x4]
    ldr r1, _LIT0
    add sp, sp, #0x34
    bic r2, r2, #0x1
    orr r2, r2, #0x1
    strh r2, [r5, #0x4]
    ldr r2, [r1, #0x59c]
    mov r0, #0x1
    add r2, r2, #0x2
    str r2, [r1, #0x59c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_da8:
    mov r0, r5
    bl func_ov002_021e2e38
    cmp r0, #0x0
    beq .L_dd0
    mov r0, r6
    ldr r1, [r0, #0x484]
    mov r2, r5
    mov r0, #0x1a
    mov r3, #0x18
    bl func_ov002_021b1570
.L_dd0:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0, #0x59c]
    add r2, r2, #0x1
    str r2, [r0, #0x59c]
    str r1, [r0, #0x5bc]
.L_de8:
    mov r0, r5
    bl func_ov002_021e2e38
    cmp r0, #0x0
    bne .L_e40
    mov r0, r5
    mov r1, r4
    bl func_ov002_02257ca8
    cmp r0, #0x0
    beq .L_e40
    movgt r0, #0x1
    movle r0, #0x0
    ldrh r1, [r5, #0x4]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r1, r1, r0
    ldr r0, _LIT9
    strh r1, [r5, #0x4]
    ldr r1, [r0, #0x300]
    orr r1, r1, #0x800
    str r1, [r0, #0x300]
.L_e40:
    ldr r0, _LIT9
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    beq .L_e80
    ldrh r0, [r5, #0x4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldreq r0, _LIT0
    moveq r1, #0x6
    streq r1, [r0, #0x59c]
    beq .L_e80
    ldr r0, _LIT0
    ldr r1, [r0, #0x59c]
    add r1, r1, #0x1
    str r1, [r0, #0x59c]
.L_e80:
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e8c:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    beq .L_1034
    ldrh r0, [r5, #0x4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_1034
    ldr r0, _LIT10
    ldr r0, [r0, #0xd0c]
    cmp r0, #0x0
    beq .L_ec8
    mov r2, r5
    mov r0, #0x12
    bl func_ov002_021b1570
.L_ec8:
    ldr r0, _LIT0
    ldr r1, [r0, #0x484]
    add r1, r1, #0x1
    str r1, [r0, #0x484]
    cmp r1, #0x2
    blt .L_1134
    mov r6, #0x0
.L_ee4:
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, r6, #0x1
    mla sl, r1, r0, r2
    ldr r4, _LIT11
    add r9, sl, #0x30
    add r0, r4, #0xd
    mov r7, #0x0
    str r0, [sp, #0x30]
    add fp, r4, #0xc
.L_f0c:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [sl, #0x38]
    cmpne r0, #0x0
    beq .L_1010
    ldr r1, [sl, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_1010
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9ecc
    mov r8, r0
    cmp r8, r4
    beq .L_f64
    cmp r8, fp
    ldrne r0, [sp, #0x30]
    cmpne r8, r0
    beq .L_fbc
    b .L_1010
.L_f64:
    ldrh r0, [r5]
    bl func_0202e234
    cmp r0, #0x0
    bne .L_1010
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_1010
    mov r0, r6
    mov r1, r7
    mov r2, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1010
    mov r1, #0x0
    str r1, [sp]
    mov r0, r6
    mov r1, r7
    mov r2, r4
    mov r3, #0x3
    bl func_ov002_021d59cc
    b .L_1010
.L_fbc:
    ldr r0, _LIT10
    ldr r0, [r0, #0xcec]
    cmp r6, r0
    ldreq r0, _LIT10
    ldreq r0, [r0, #0xcf8]
    cmpeq r0, #0x2
    bne .L_1010
    mov r0, r6
    mov r1, r7
    mov r2, r8
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1010
    mov r0, r8, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, #0x0
    str r0, [sp]
    mov r0, r6
    mov r1, r7
    mov r3, #0x2
    bl func_ov002_021d59cc
.L_1010:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r9, r9, #0x14
    add sl, sl, #0x14
    blt .L_f0c
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_ee4
    b .L_1134
.L_1034:
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_109c
    mov r0, r0, lsl #0x1f
    mov r5, r0, lsr #0x1f
    mov r2, #0x14
    ldr r0, _LIT3
    ldr r3, _LIT12
    and r4, r5, #0x1
    mul r2, r1, r2
    mla r0, r4, r0, r3
    ldr r0, [r2, r0]
    mov r0, r0, lsr #0x1
    tst r0, #0x1
    beq .L_109c
    cmp r5, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x39
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
.L_109c:
    ldr r8, _LIT0
    ldr r0, [r8, #0x480]
    subs r0, r0, #0x1
    str r0, [r8, #0x480]
    bne .L_10ec
    ldr r0, [r8, #0x5d4]
    cmp r0, #0x0
    beq .L_10cc
    mov r0, #0x1
    str r0, [r8, #0x688]
    mov r0, #0x0
    str r0, [r8, #0x68c]
.L_10cc:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x598]
    str r1, [r0, #0x5a0]
    str r1, [r0, #0x5d8]
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10ec:
    ldr r5, [r8, #0x484]
    cmp r5, r0
    bge .L_1134
    ldr r4, _LIT1
    mov r0, #0x18
    mla r6, r5, r0, r4
    mov r9, r0
    mov r7, r0
.L_110c:
    add r0, r5, #0x1
    mla r1, r0, r7, r4
    mov r0, r6
    mov r2, r9
    bl func_ov002_0229cd70
    ldr r0, [r8, #0x480]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x18
    blt .L_110c
.L_1134:
    ldr r1, _LIT0
    ldr r2, [r1, #0x484]
    ldr r0, [r1, #0x480]
    cmp r2, r0
    movlt r0, #0x1
    strlt r0, [r1, #0x59c]
    addlt sp, sp, #0x34
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r1, #0x59c]
    add r0, r0, #0x1
    str r0, [r1, #0x59c]
.L_1160:
    bl func_ov002_0225702c
    cmp r0, #0x0
    addne sp, sp, #0x34
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_021b04c8
    cmp r0, #0x0
    addne sp, sp, #0x34
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    ldr r0, [r1, #0x480]
    cmp r0, #0x2
    bge .L_11ac
    mov r0, #0xb
    str r0, [r1, #0x59c]
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11ac:
    ldr r2, [r1, #0x59c]
    add sp, sp, #0x34
    add r2, r2, #0x1
    str r2, [r1, #0x59c]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11c4:
    ldr r0, [r6, #0x488]
    cmp r0, r8
    bge .L_1244
    mov r7, #0x0
    ldr r9, _LIT13
    mov r8, #0x8000
    mov r5, r7
    mov r4, r3
.L_11e4:
    mul r1, r0, r4
    ldrh r1, [r9, r1]
    mov r2, r1, lsl #0x1a
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    movne r1, r8
    moveq r1, r7
    mov r3, r2, lsr #0x1b
    add r2, r0, #0x1
    orr r1, r1, #0x12
    mov r0, r1, lsl #0x10
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r5
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d479c
    ldr r0, [r6, #0x488]
    add r0, r0, #0x1
    str r0, [r6, #0x488]
    ldr r1, [r6, #0x480]
    cmp r0, r1
    blt .L_11e4
.L_1244:
    ldr r1, _LIT0
    add sp, sp, #0x34
    ldr r2, [r1, #0x59c]
    mov r0, #0x1
    add r2, r2, #0x3
    str r2, [r1, #0x59c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1260:
    cmp r8, #0x10
    bge .L_1580
    bl func_ov002_021e36b8
    cmp r0, #0x0
    beq .L_1580
    ldr r0, [sp, #0x8]
    ldrh r0, [r0]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_14bc
    mov r6, #0x0
    str r6, [sp, #0x4]
.L_1290:
    ldr r0, _LIT10
    ldr r2, _LIT2
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x4]
    ldr r1, _LIT3
    eor r4, r3, r0
    and r0, r4, #0x1
    mla r9, r0, r1, r2
    mov r0, r4, lsl #0x1f
    and r0, r0, #-2147483648
    add sl, r9, #0x30
    orr fp, r0, #0x200000
    mov r5, #0x0
.L_12c4:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9ecc
    ldr r1, _LIT14
    cmp r0, r1
    bne .L_1360
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_1360
    ldr r1, [r9, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_1360
    ldr r2, [sl]
    mov r3, r5, lsl #0x10
    mov r0, r2, lsl #0x2
    mov r1, r0, lsr #0x18
    and r0, r3, #0x1f0000
    orr r3, fp, r0
    orr r7, r3, #0x71
    mov r2, r2, lsl #0x12
    mov r0, r1, lsl #0x1
    add r8, r0, r2, lsr #0x1f
    orr r7, r7, #0x1700
    mov r1, r8, lsl #0x10
    mov r0, r7
    mov r1, r1, lsr #0x10
    mov r2, r6
    bl func_ov002_021fd81c
    cmp r0, #0x0
    beq .L_1360
    mov r2, r8, lsl #0x10
    mov r0, #0x1
    mov r1, r7
    mov r3, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_021e2e80
    add r6, r6, #0x1
.L_1360:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r9, r9, #0x14
    add sl, sl, #0x14
    blt .L_12c4
    ldr r0, _LIT15
    ldr r0, [r0]
    cmp r4, r0
    bne .L_1400
    ldr r0, _LIT16
    bl func_ov002_021ba0b0
    ldr r1, _LIT14
    cmp r0, r1
    bne .L_1400
    ldr r0, _LIT15
    mov r2, r6
    ldr r3, [r0, #0xc4]
    ldr r5, [r0, #0x1c]
    mov r0, r3, lsl #0x2
    mov r5, r5, lsl #0x10
    mov r0, r0, lsr #0x18
    and r5, r5, #0x1f0000
    orr r5, fp, r5
    orr r5, r5, r1
    mov r1, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r7, r0, r1, lsr #0x1f
    mov r1, r7, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    bl func_ov002_021fd81c
    cmp r0, #0x0
    beq .L_1400
    mov r0, r7, lsl #0x10
    mov r1, r5
    mov r3, r6
    mov r2, r0, lsr #0x10
    mov r0, #0x1
    bl func_ov002_021e2e80
    add r6, r6, #0x1
.L_1400:
    ldr r0, _LIT15
    ldr r0, [r0, #0x4]
    cmp r4, r0
    bne .L_148c
    ldr r0, _LIT17
    bl func_ov002_021ba0b0
    ldr r1, _LIT14
    cmp r0, r1
    bne .L_148c
    ldr r0, _LIT15
    mov r2, r6
    ldr r3, [r0, #0xd8]
    ldr r4, [r0, #0x20]
    mov r0, r3, lsl #0x2
    mov r4, r4, lsl #0x10
    mov r0, r0, lsr #0x18
    and r4, r4, #0x1f0000
    orr r4, fp, r4
    orr r4, r4, r1
    mov r1, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r5, r0, r1, lsr #0x1f
    mov r1, r5, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021fd81c
    cmp r0, #0x0
    beq .L_148c
    mov r0, r5, lsl #0x10
    mov r1, r4
    mov r3, r6
    mov r2, r0, lsr #0x10
    mov r0, #0x1
    bl func_ov002_021e2e80
    add r6, r6, #0x1
.L_148c:
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_1290
    cmp r6, #0x0
    beq .L_14bc
    ldr r1, _LIT0
    mov r0, #0x1
    str r0, [r1, #0x59c]
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_14bc:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x67c]
    str r1, [r0, #0x68c]
    ldr r1, [r0, #0x59c]
    add r1, r1, #0x1
    str r1, [r0, #0x59c]
.L_14d8:
    ldr r0, [sp, #0x8]
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021e3968
    cmp r0, #0x0
    beq .L_1518
    ldr r0, _LIT0
    ldr r1, [r0, #0x68c]
    cmp r1, #0x0
    movne r1, #0x1
    strne r1, [r0, #0x59c]
    ldreq r1, [r0, #0x59c]
    addeq r1, r1, #0x1
    streq r1, [r0, #0x59c]
.L_1518:
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1524:
    mov r0, #0x0
    str r0, [r6, #0x67c]
    str r0, [r6, #0x68c]
    add r0, r2, #0x1
    str r0, [r6, #0x59c]
.L_1538:
    ldr r0, [sp, #0x8]
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021e3968
    cmp r0, #0x0
    beq .L_1574
    ldr r0, _LIT0
    ldr r1, [r0, #0x68c]
    cmp r1, #0x0
    movne r1, #0x1
    strne r1, [r0, #0x59c]
    ldreq r1, [r0, #0x59c]
    addeq r1, r1, #0x1
    streq r1, [r0, #0x59c]
.L_1574:
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1580:
    ldr r1, _LIT0
    mov r3, #0x0
    str r3, [r1, #0x598]
    mov r0, #0x1
    str r0, [r1, #0x5a0]
    str r3, [r1, #0x5a4]
    ldr r2, [r1, #0x480]
    str r2, [r1, #0x488]
    str r3, [r1, #0x5d8]
    str r3, [r1, #0x5d4]
    str r3, [r1, #0x688]
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022ce588
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
_LIT4: .word 0x0000161a
_LIT5: .word 0x0000171d
_LIT6: .word 0x00001964
_LIT7: .word 0x0000184f
_LIT8: .word 0x000012ec
_LIT9: .word data_ov002_022cd968
_LIT10: .word data_ov002_022d016c
_LIT11: .word 0x00001ae0
_LIT12: .word data_ov002_022cf1ac
_LIT13: .word data_ov002_022ce58a
_LIT14: .word 0x00001771
_LIT15: .word data_ov002_022cd3f4
_LIT16: .word data_ov002_022cd4b8
_LIT17: .word data_ov002_022cd4cc
