; func_ov002_0227f03c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022cdc78
        .extern data_ov002_022cdc88
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_0202b8c0
        .extern func_0202b8f0
        .extern func_0202b920
        .extern func_0202b9b0
        .extern func_0202e234
        .extern func_ov002_021b00d0
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021bbeac
        .extern func_ov002_021bbf50
        .extern func_ov002_021bc22c
        .extern func_ov002_021bd364
        .extern func_ov002_021be2d8
        .extern func_ov002_021c3008
        .extern func_ov002_021c3ae4
        .extern func_ov002_021c3c50
        .extern func_ov002_0227af30
        .extern func_ov002_0227e76c
        .extern func_ov002_0227e784
        .extern func_ov002_0227e7e8
        .extern func_ov002_0227e88c
        .extern func_ov002_0227e9d4
        .extern func_ov002_0227ecb4
        .extern func_ov002_0227edc4
        .extern func_ov002_0227ee34
        .extern func_ov002_022815a4
        .extern func_ov002_02281920
        .extern func_ov002_02281994
        .global func_ov002_0227f03c
        .arm
func_ov002_0227f03c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    ldr r2, _LIT0
    mov r8, r0
    ldr r5, [r2, #0xc]
    mov r4, r1
    cmp r5, #0x0
    addeq sp, sp, #0x34
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT1
    bl func_ov002_02281920
    cmp r0, #0x0
    beq .L_b60
    ldr r1, _LIT2
    mov r0, r8
    bl func_ov002_02281920
    cmp r0, #0x0
    beq .L_97c
    ldr r0, _LIT3
    cmp r4, r0
    addne r0, r0, #0x2d
    cmpne r4, r0
    bne .L_97c
    ldr r0, _LIT4
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT5
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT6
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_97c:
    ldr r1, _LIT8
    cmp r4, r1
    bgt .L_9e4
    bge .L_aec
    sub r0, r1, #0x51
    cmp r4, r0
    bgt .L_9c0
    bge .L_aec
    ldr r0, _LIT9
    cmp r4, r0
    bgt .L_9b0
    beq .L_a38
    b .L_b60
.L_9b0:
    ldr r0, _LIT10
    cmp r4, r0
    beq .L_a38
    b .L_b60
.L_9c0:
    sub r0, r1, #0x26
    cmp r4, r0
    bgt .L_9d4
    beq .L_b20
    b .L_b60
.L_9d4:
    sub r0, r1, #0xc
    cmp r4, r0
    beq .L_aa0
    b .L_b60
.L_9e4:
    add r0, r1, #0x2b
    cmp r4, r0
    bgt .L_a18
    bge .L_aec
    add r0, r1, #0x7
    cmp r4, r0
    bgt .L_a08
    beq .L_b20
    b .L_b60
.L_a08:
    add r0, r1, #0x1e
    cmp r4, r0
    beq .L_a38
    b .L_b60
.L_a18:
    add r0, r1, #0x42
    cmp r4, r0
    bgt .L_a2c
    beq .L_aec
    b .L_b60
.L_a2c:
    ldr r0, _LIT11
    cmp r4, r0
    bne .L_b60
.L_a38:
    ldr r0, _LIT4
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT5
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT6
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    bl func_ov002_0227e784
    cmp r0, #0x0
    blt .L_b60
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_aa0:
    ldr r0, _LIT5
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT6
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    bl func_ov002_0227ecb4
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_aec:
    ldr r1, _LIT9
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT10
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    blt .L_b60
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b20:
    ldr r1, _LIT9
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT10
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    bl func_ov002_0227ecb4
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b60:
    ldr r2, _LIT12
    cmp r4, r2
    bgt .L_d6c
    bge .L_19b4
    ldr r1, _LIT13
    cmp r4, r1
    bgt .L_ca0
    bge .L_f60
    sub r0, r1, #0x93
    cmp r4, r0
    bgt .L_be8
    bge .L_f60
    ldr r2, _LIT14
    cmp r4, r2
    bgt .L_bc4
    bge .L_12cc
    ldr r0, _LIT9
    cmp r4, r0
    bgt .L_bb4
    beq .L_f44
    b .L_1bf8
.L_bb4:
    add r0, r0, #0x36
    cmp r4, r0
    beq .L_1068
    b .L_1bf8
.L_bc4:
    add r0, r2, #0x66
    cmp r4, r0
    bgt .L_bd8
    beq .L_14c0
    b .L_1bf8
.L_bd8:
    add r0, r2, #0x6e
    cmp r4, r0
    beq .L_1068
    b .L_1bf8
.L_be8:
    sub r0, r1, #0x1b
    cmp r4, r0
    bgt .L_c70
    bge .L_19b4
    sub r0, r1, #0x84
    cmp r4, r0
    bgt .L_c0c
    beq .L_1170
    b .L_1bf8
.L_c0c:
    sub r0, r1, #0x4e
    sub r0, r4, r0
    cmp r0, #0x13
    addls pc, pc, r0, lsl #0x2
    b .L_1bf8
    b .L_12f8
    b .L_1bf8
    b .L_1bf8
    b .L_1bf8
    b .L_1860
    b .L_1bf8
    b .L_1860
    b .L_1bf8
    b .L_1bf8
    b .L_1bf8
    b .L_1bf8
    b .L_1bf8
    b .L_1274
    b .L_1860
    b .L_1bf8
    b .L_1860
    b .L_1860
    b .L_1bf8
    b .L_1bf8
    b .L_1860
.L_c70:
    ldr r0, _LIT15
    cmp r4, r0
    bgt .L_c90
    bge .L_f60
    sub r0, r0, #0x1
    cmp r4, r0
    beq .L_fa8
    b .L_1bf8
.L_c90:
    add r0, r0, #0x13
    cmp r4, r0
    beq .L_100c
    b .L_1bf8
.L_ca0:
    sub r0, r2, #0x6a
    cmp r4, r0
    bgt .L_d08
    bge .L_10e4
    add r0, r1, #0xe9
    cmp r4, r0
    bgt .L_ce4
    bge .L_10e4
    add r0, r1, #0x70
    cmp r4, r0
    bgt .L_cd4
    beq .L_12f8
    b .L_1bf8
.L_cd4:
    add r0, r1, #0xc8
    cmp r4, r0
    beq .L_159c
    b .L_1bf8
.L_ce4:
    add r0, r1, #0xf7
    cmp r4, r0
    bgt .L_cf8
    beq .L_16a4
    b .L_1bf8
.L_cf8:
    rsb r0, r1, #0x2800
    cmp r4, r0
    beq .L_10e4
    b .L_1bf8
.L_d08:
    sub r0, r2, #0x67
    cmp r4, r0
    bgt .L_d3c
    bge .L_10e4
    add r0, r1, #0x108
    cmp r4, r0
    bgt .L_d2c
    beq .L_10e4
    b .L_1bf8
.L_d2c:
    sub r0, r2, #0x68
    cmp r4, r0
    beq .L_10e4
    b .L_1bf8
.L_d3c:
    sub r0, r2, #0x1e
    cmp r4, r0
    bgt .L_d5c
    bge .L_1ad8
    sub r0, r2, #0x5e
    cmp r4, r0
    beq .L_10e4
    b .L_1bf8
.L_d5c:
    sub r0, r2, #0x1c
    cmp r4, r0
    beq .L_1ad8
    b .L_1bf8
.L_d6c:
    ldr r0, _LIT16
    cmp r4, r0
    bgt .L_e60
    bge .L_1860
    add r1, r2, #0xa2
    cmp r4, r1
    bgt .L_df4
    bge .L_1568
    add r1, r2, #0x41
    cmp r4, r1
    bgt .L_dc8
    bge .L_1860
    sub r1, r0, #0x2d0
    cmp r4, r1
    bgt .L_db8
    sub r0, r0, #0x2d0
    cmp r4, r0
    beq .L_100c
    b .L_1bf8
.L_db8:
    add r0, r2, #0x34
    cmp r4, r0
    beq .L_19b4
    b .L_1bf8
.L_dc8:
    sub r1, r0, #0x2b4
    cmp r4, r1
    bgt .L_de4
    sub r0, r0, #0x2b4
    cmp r4, r0
    beq .L_19b4
    b .L_1bf8
.L_de4:
    add r0, r2, #0x74
    cmp r4, r0
    beq .L_1644
    b .L_1bf8
.L_df4:
    ldr r2, _LIT17
    cmp r4, r2
    bgt .L_e28
    bge .L_1068
    sub r0, r2, #0x9c
    cmp r4, r0
    bgt .L_e18
    beq .L_159c
    b .L_1bf8
.L_e18:
    sub r0, r2, #0x26
    cmp r4, r0
    beq .L_17f0
    b .L_1bf8
.L_e28:
    add r1, r2, #0xd4
    cmp r4, r1
    bgt .L_e50
    mov r0, r1
    cmp r4, r0
    bge .L_131c
    add r0, r2, #0x33
    cmp r4, r0
    beq .L_19b4
    b .L_1bf8
.L_e50:
    sub r0, r0, #0x9f
    cmp r4, r0
    beq .L_19b4
    b .L_1bf8
.L_e60:
    ldr r1, _LIT18
    cmp r4, r1
    bgt .L_ee4
    bge .L_1ad8
    sub r3, r1, #0xb2
    cmp r4, r3
    bgt .L_eb4
    mov r2, r3
    cmp r4, r2
    bge .L_1ad8
    add r2, r0, #0x1
    cmp r4, r2
    bgt .L_ea4
    add r0, r0, #0x1
    cmp r4, r0
    beq .L_1860
    b .L_1bf8
.L_ea4:
    sub r0, r1, #0xe6
    cmp r4, r0
    beq .L_1a24
    b .L_1bf8
.L_eb4:
    sub r0, r1, #0x1d
    cmp r4, r0
    bgt .L_ed4
    bge .L_1848
    sub r0, r1, #0x2b
    cmp r4, r0
    beq .L_17c0
    b .L_1bf8
.L_ed4:
    sub r0, r1, #0x3
    cmp r4, r0
    beq .L_1860
    b .L_1bf8
.L_ee4:
    ldr r1, _LIT19
    cmp r4, r1
    bgt .L_f18
    bge .L_1ad8
    sub r0, r1, #0xf1
    cmp r4, r0
    bgt .L_f08
    beq .L_181c
    b .L_1bf8
.L_f08:
    sub r0, r1, #0xd7
    cmp r4, r0
    beq .L_1860
    b .L_1bf8
.L_f18:
    add r0, r1, #0x6f
    cmp r4, r0
    bgt .L_f38
    bge .L_1bbc
    add r0, r1, #0x6e
    cmp r4, r0
    beq .L_1bbc
    b .L_1bf8
.L_f38:
    cmp r4, #0x1a80
    beq .L_1ad8
    b .L_1bf8
.L_f44:
    ldr r1, _LIT20
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f60:
    ldr r0, _LIT21
    ldr r1, [r0, #0xcec]
    cmp r1, r8
    bne .L_1bf8
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x3
    bhi .L_1bf8
    rsb r0, r8, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x0
    bne .L_1bf8
    ldr r1, _LIT22
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fa8:
    ldr r1, _LIT23
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT9
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT10
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT24
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_100c:
    subs r6, r5, #0x1
    bmi .L_1068
    ldr r0, _LIT25
    ldr r9, _LIT26
    add r7, r0, r6, lsl #0x2
.L_1020:
    mov r0, r6
    bl func_ov002_0227e76c
    cmp r0, #0x0
    bne .L_105c
    ldr r1, [r7]
    ldr r2, [r9, #0x10]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    addeq sp, sp, #0x34
    moveq r0, r6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_105c:
    sub r7, r7, #0x4
    subs r6, r6, #0x1
    bpl .L_1020
.L_1068:
    cmp r5, #0x0
    mov r9, #0x0
    ble .L_1bf8
    ldr r7, _LIT25
    mov r6, r9
.L_107c:
    mov r0, r9
    bl func_ov002_0227e76c
    cmp r0, #0x0
    bne .L_10d0
    ldr r0, [r7]
    mov r1, r6
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_022815a4
    cmp r0, #0x0
    addne sp, sp, #0x34
    movne r0, r9
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b9b0
    cmp r0, #0x3
    addlt sp, sp, #0x34
    movlt r0, r9
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10d0:
    add r9, r9, #0x1
    cmp r9, r5
    add r7, r7, #0x4
    blt .L_107c
    b .L_1bf8
.L_10e4:
    mvn r6, #0x0
    mov r7, r6
    cmp r5, #0x0
    mov r4, #0x0
    ble .L_1164
    ldr r8, _LIT25
.L_10fc:
    mov r0, r4
    bl func_ov002_0227e76c
    cmp r0, #0x0
    bne .L_1154
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202b8f0
    mov r9, r0
    mov r0, sl
    bl func_0202b920
    cmp r9, r0
    mov r0, sl
    ble .L_1140
    bl func_0202b8f0
    b .L_1144
.L_1140:
    bl func_0202b920
.L_1144:
    cmp r6, #0x0
    cmpge r0, r6
    movlt r6, r0
    movlt r7, r4
.L_1154:
    add r4, r4, #0x1
    cmp r4, r5
    add r8, r8, #0x4
    blt .L_10fc
.L_1164:
    add sp, sp, #0x34
    mov r0, r7
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1170:
    mov r0, r8
    add r1, r2, #0x1dc
    bl func_ov002_02281920
    cmp r0, #0x0
    bne .L_11c0
    ldr r1, _LIT27
    mov r0, r8
    bl func_ov002_02281920
    cmp r0, #0x0
    bne .L_11c0
    ldr r1, _LIT28
    mov r0, r8
    bl func_ov002_02281920
    cmp r0, #0x0
    bne .L_11c0
    ldr r1, _LIT29
    mov r0, r8
    bl func_ov002_02281920
    cmp r0, #0x0
    beq .L_1218
.L_11c0:
    cmp r5, #0x0
    mov r7, #0x0
    ble .L_1218
    ldr r6, _LIT25
.L_11d0:
    mov r0, r7
    bl func_ov002_0227e76c
    cmp r0, #0x0
    ldreq r0, [r6]
    moveq r1, r0, lsl #0x12
    cmpeq r8, r1, lsr #0x1f
    bne .L_1208
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    addne sp, sp, #0x34
    movne r0, r7
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1208:
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    blt .L_11d0
.L_1218:
    cmp r5, #0x0
    mov r9, #0x0
    ble .L_125c
    ldr r6, _LIT25
    rsb r7, r8, #0x1
.L_122c:
    mov r0, r9
    bl func_ov002_0227e76c
    cmp r0, #0x0
    bne .L_124c
    ldr r0, [r6]
    mov r0, r0, lsl #0x12
    cmp r7, r0, lsr #0x1f
    bne .L_125c
.L_124c:
    add r9, r9, #0x1
    cmp r9, r5
    add r6, r6, #0x4
    blt .L_122c
.L_125c:
    mov r5, r9
    cmp r9, #0x0
    bne .L_1bf8
    add sp, sp, #0x34
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1274:
    sub r0, r1, #0x20
    bl func_ov002_021bb068
    cmp r0, #0x0
    bne .L_1bf8
    cmp r5, #0x0
    mov r7, #0x0
    ble .L_1bf8
    ldr r6, _LIT25
.L_1294:
    mov r0, r7
    bl func_ov002_0227e76c
    cmp r0, #0x0
    ldreq r0, [r6]
    moveq r0, r0, lsl #0x13
    cmpeq r4, r0, lsr #0x13
    addeq sp, sp, #0x34
    moveq r0, r7
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    blt .L_1294
    b .L_1bf8
.L_12cc:
    sub r0, r2, #0xff
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT30
    bl func_ov002_0227e784
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12f8:
    mov r0, r5
    bl func_ov002_021b00d0
    mov r4, r0
    bl func_ov002_0227e76c
    cmp r0, #0x0
    bne .L_12f8
    add sp, sp, #0x34
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_131c:
    and r3, r8, #0x1
    sub r0, r2, #0xdd0
    mul r1, r3, r0
    ldr r0, _LIT31
    mov r6, #0x0
    ldr r0, [r0, r1]
    mov sl, r6
    cmp r0, #0x0
    bls .L_137c
    ldr r0, _LIT32
    add r9, r0, r1
    add r7, r9, #0x120
.L_134c:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8c0
    cmp r0, #0x6
    moveq r6, #0x1
    beq .L_137c
    ldr r0, [r9, #0xc]
    add sl, sl, #0x1
    cmp sl, r0
    add r7, r7, #0x4
    bcc .L_134c
.L_137c:
    cmp r6, #0x0
    bne .L_1bf8
    cmp r5, #0x0
    mov r7, #0x0
    ble .L_1bf8
    ldr r6, _LIT25
.L_1394:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8c0
    cmp r0, #0x6
    addeq sp, sp, #0x34
    moveq r0, r7
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    blt .L_1394
    b .L_1bf8
_LIT0: .word data_ov002_022cdc78
_LIT1: .word 0x00000fbb
_LIT2: .word 0x00001645
_LIT3: .word 0x00001315
_LIT4: .word 0x00000fb7
_LIT5: .word 0x00000fb8
_LIT6: .word 0x00000fb9
_LIT7: .word 0x00000fba
_LIT8: .word 0x0000133b
_LIT9: .word 0x00000fd6
_LIT10: .word 0x000011e4
_LIT11: .word 0x00001796
_LIT12: .word 0x000014ee
_LIT13: .word 0x0000137d
_LIT14: .word 0x000010e4
_LIT15: .word 0x00001366
_LIT16: .word 0x000017e5
_LIT17: .word 0x00001638
_LIT18: .word 0x000018f7
_LIT19: .word 0x00001a10
_LIT20: .word 0x000019a3
_LIT21: .word data_ov002_022d016c
_LIT22: .word 0x00001388
_LIT23: .word 0x000011d8
_LIT24: .word 0x00001331
_LIT25: .word data_ov002_022cdc88
_LIT26: .word data_ov002_022cd524
_LIT27: .word 0x000019f5
_LIT28: .word 0x00001712
_LIT29: .word 0x000017be
_LIT30: .word 0x00001477
_LIT31: .word data_ov002_022cf178
_LIT32: .word data_ov002_022cf16c
_LIT33: .word 0x000018fc
_LIT34: .word 0x000018fd
_LIT35: .word 0x000014f0
_LIT36: .word 0x00001386
_LIT37: .word 0x00001387
_LIT38: .word 0x000016cb
_LIT39: .word 0x000016e4
_LIT40: .word 0x0000169c
_LIT41: .word 0x000012be
_LIT42: .word 0x00001562
_LIT43: .word 0x000019cb
_LIT44: .word 0x000016f9
_LIT45: .word 0x0000197f
_LIT46: .word 0x000019fd
_LIT47: .word 0x00001a61
_LIT48: .word 0x000019fe
_LIT49: .word 0x00000fbe
_LIT50: .word 0x000018c5
_LIT51: .word 0x000018c3
_LIT52: .word 0x00001152
_LIT53: .word 0x0000179c
_LIT54: .word 0x00000ff8
_LIT55: .word 0x000017dd
_LIT56: .word 0x000017d9
_LIT57: .word 0x000012ac
_LIT58: .word 0x00001439
_LIT59: .word 0x000019bc
_LIT60: .word 0x00001870
_LIT61: .word 0x000017e8
.L_14c0:
    mov r0, r8
    add r1, r1, #0x8c
    bl func_ov002_02281994
    cmp r0, #0x0
    beq .L_1508
    ldr r1, _LIT33
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT34
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1508:
    rsb r6, r8, #0x1
    mov r0, r6
    bl func_ov002_021bbf50
    cmp r0, #0x0
    beq .L_1538
    ldr r1, _LIT33
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1538:
    mov r0, r6
    mov r1, #0x1
    bl func_ov002_021bc22c
    cmp r0, #0x0
    beq .L_1bf8
    ldr r1, _LIT34
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1568:
    mov r0, r8
    sub r1, r2, #0x86
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT35
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_159c:
    ldr r1, _LIT36
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT37
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT22
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT38
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT39
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT40
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    bl func_ov002_0227e7e8
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1644:
    mov r0, r8
    sub r1, r2, #0x230
    bl func_ov002_02281920
    cmp r0, #0x0
    beq .L_1688
    ldr r1, _LIT41
    mov r0, r8
    bl func_ov002_02281994
    cmp r0, #0x0
    bne .L_1bf8
    ldr r1, _LIT41
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1688:
    ldr r1, _LIT42
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_16a4:
    ldr r0, _LIT4
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT5
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT6
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT2
    mov r0, r8
    bl func_ov002_02281920
    cmp r0, #0x0
    beq .L_171c
    ldr r0, _LIT1
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_171c:
    ldr r0, _LIT43
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT44
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT45
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT46
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT47
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT48
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT49
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT50
    bl func_ov002_0227e784
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_17c0:
    mov r0, r8
    sub r1, r1, #0x5a0
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    bne .L_1bf8
    ldr r0, _LIT51
    bl func_ov002_0227e784
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_17f0:
    mov r0, r8
    mov r1, #0x16
    bl func_ov002_021bd364
    cmp r0, #0x0
    beq .L_1bf8
    ldr r0, _LIT52
    bl func_ov002_0227e784
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_181c:
    mov r0, r8
    sub r1, r1, #0x274
    bl func_ov002_02281994
    cmp r0, #0x0
    bne .L_1bf8
    ldr r0, _LIT53
    bl func_ov002_0227e784
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1848:
    add r0, r2, #0x40
    bl func_ov002_0227e784
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1860:
    ldr r0, _LIT21
    ldr r0, [r0, #0xcec]
    cmp r0, r8
    beq .L_1bf8
    mov r7, #0x0
    mov sl, r7
    rsb r9, r8, #0x1
    mov r6, #0x1
.L_1880:
    mov r0, r9
    mov r1, sl
    mov r2, r6
    bl func_ov002_021be2d8
    cmp r0, #0x0
    add sl, sl, #0x1
    addne r7, r7, #0x1
    cmp sl, #0x5
    blt .L_1880
    cmp r7, #0x0
    bne .L_1bf8
    ldr r1, _LIT54
    mov r0, r8
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    beq .L_18d4
    ldr r0, _LIT55
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18d4:
    ldr r0, _LIT56
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT57
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT58
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT59
    mov r0, r8
    bl func_ov002_02281994
    cmp r0, #0x0
    beq .L_194c
    ldr r1, _LIT60
    mov r0, r8
    bl func_ov002_02281994
    cmp r0, #0x0
    bne .L_194c
    ldr r0, _LIT60
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_194c:
    ldr r0, _LIT59
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    mov r1, #0x7
    bl func_ov002_021c3c50
    cmp r0, #0x0
    beq .L_1bf8
    ldr r0, _LIT61
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT62
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT63
    bl func_ov002_0227e784
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19b4:
    cmp r5, #0x0
    mov r7, #0x0
    ble .L_1bf8
    ldr r6, _LIT25
    mov r9, r7
.L_19c8:
    mov r0, r7
    bl func_ov002_0227e76c
    cmp r0, #0x0
    bne .L_1a10
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202b9b0
    cmp r0, #0x3
    blt .L_1a10
    mov r0, sl
    mov r1, r9
    bl func_ov002_022815a4
    cmp r0, #0x0
    addeq sp, sp, #0x34
    moveq r0, r7
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a10:
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    blt .L_19c8
    b .L_1bf8
.L_1a24:
    mov r0, r8
    sub r2, r1, #0xe6
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1aac
    ldr r0, _LIT64
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT65
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT66
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT67
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT20
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1aac:
    mov r0, r8
    bl func_ov002_0227e88c
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    bl func_ov002_0227e7e8
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1ad8:
    ldr r1, _LIT68
    mov r0, r8
    bl func_ov002_0227edc4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    bl func_ov002_021bbeac
    ldr r1, _LIT69
    and r2, r8, #0x1
    mul r3, r2, r1
    ldr r1, _LIT31
    ldr r1, [r1, r3]
    add r0, r1, r0
    cmp r0, #0x1
    bhi .L_1b2c
    ldr r0, _LIT70
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b2c:
    ldr r1, _LIT45
    mov r0, r8
    bl func_ov002_021c3008
    cmp r0, #0x0
    beq .L_1b68
    ldr r0, _LIT71
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT46
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b68:
    ldr r1, _LIT72
    mov r0, r8
    bl func_ov002_02281994
    cmp r0, #0x0
    bne .L_1b90
    mov r0, #0x1a80
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b90:
    mov r0, r8
    bl func_ov002_0227e9d4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x1a80
    bl func_ov002_0227e784
    cmp r0, #0x0
    blt .L_1bf8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1bbc:
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021bd364
    cmp r0, #0x0
    beq .L_1be4
    ldr r0, _LIT73
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1be4:
    ldr r0, _LIT74
    bl func_ov002_0227e784
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1bf8:
    mov r9, #0x0
    mov r7, r9
    cmp r5, #0x0
    ble .L_1c48
    ldr r6, _LIT25
.L_1c0c:
    mov r0, r7
    bl func_ov002_0227e76c
    cmp r0, #0x0
    bne .L_1c38
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    movne r9, #0x1
    bne .L_1c48
.L_1c38:
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    blt .L_1c0c
.L_1c48:
    cmp r9, #0x0
    bne .L_1c68
    mov r0, r8
    bl func_ov002_0227e7e8
    cmp r0, #0x0
    blt .L_1e64
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c68:
    mov fp, #0x0
    ldr r1, _LIT15
    sub r0, fp, #0x1
    cmp r4, r1
    str r0, [sp]
    addne r0, r1, #0x17
    cmpne r4, r0
    addne r0, r1, #0x280
    mov r2, fp
    cmpne r4, r0
    moveq r2, #0x1
    str fp, [sp, #0x4]
    cmp r2, #0x0
    bne .L_1dbc
    mov r6, #0x0
    rsb r9, r8, #0x1
    mov r7, r6
    add r8, sp, #0x8
.L_1cb0:
    mov r0, r9
    mov r1, r7
    mov r2, r8
    bl func_ov002_0227af30
    ldr r0, [sp, #0x1c]
    add r7, r7, #0x1
    cmp r6, r0
    movlt r6, r0
    ldr r0, [sp, #0x20]
    cmp fp, r0
    movlt fp, r0
    cmp r7, #0x5
    blt .L_1cb0
    cmp r5, #0x0
    mov r9, #0x0
    ble .L_1da8
    ldr r8, _LIT25
.L_1cf4:
    mov r0, r9
    bl func_ov002_0227e76c
    cmp r0, #0x0
    bne .L_1d98
    mov r0, r4
    mov r1, r9
    bl func_ov002_0227ee34
    cmp r0, #0x0
    bne .L_1d98
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202b8f0
    mov sl, r0
    mov r0, r7
    bl func_0202b920
    cmp sl, r0
    mov r0, r7
    ble .L_1d4c
    bl func_0202b8f0
    b .L_1d50
.L_1d4c:
    bl func_0202b920
.L_1d50:
    mov sl, r0
    ldr r0, [sp, #0x4]
    cmp r0, sl
    bge .L_1d98
    mov r0, r7
    bl func_0202b8f0
    cmp r6, r0
    ble .L_1d90
    mov r0, r7
    bl func_0202b8f0
    cmp fp, r0
    blt .L_1d90
    mov r0, r7
    bl func_0202b920
    cmp r6, r0
    bgt .L_1d98
.L_1d90:
    str sl, [sp, #0x4]
    str r9, [sp]
.L_1d98:
    add r9, r9, #0x1
    cmp r9, r5
    add r8, r8, #0x4
    blt .L_1cf4
.L_1da8:
    ldr r0, [sp]
    mvn r1, #0x0
    cmp r0, r1
    addgt sp, sp, #0x34
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1dbc:
    mov r9, #0x0
    mov r8, r9
    cmp r5, #0x0
    mvn sl, #0x0
    ble .L_1e50
    ldr r7, _LIT25
    ldr r6, _LIT0
.L_1dd8:
    mov r0, r8
    bl func_ov002_0227e76c
    cmp r0, #0x0
    bne .L_1e40
    mov r0, r4
    mov r1, r8
    bl func_ov002_0227ee34
    cmp r0, #0x0
    bne .L_1e40
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    add r1, r6, r8, lsl #0x1
    add r1, r1, #0x400
    ldrh r1, [r1, #0x10]
    mov r0, r0, lsl #0x2
    cmp r1, #0xd
    beq .L_1e30
    cmp r1, #0xe
    addeq r0, r0, #0x1
    b .L_1e34
.L_1e30:
    add r0, r0, #0x2
.L_1e34:
    cmp r9, r0
    movlt r9, r0
    movlt sl, r8
.L_1e40:
    add r8, r8, #0x1
    cmp r8, r5
    add r7, r7, #0x4
    blt .L_1dd8
.L_1e50:
    mvn r0, #0x0
    cmp sl, r0
    addgt sp, sp, #0x34
    movgt r0, sl
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e64:
    mov r4, #0x0
    mov r6, r4
    cmp r5, #0x0
    ble .L_1e90
.L_1e74:
    mov r0, r6
    bl func_ov002_0227e76c
    cmp r0, #0x0
    add r6, r6, #0x1
    addeq r4, r4, #0x1
    cmp r6, r5
    blt .L_1e74
.L_1e90:
    cmp r4, #0x0
    addeq sp, sp, #0x34
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    bl func_ov002_021b00d0
    mov r6, r0
    cmp r5, #0x0
    mov r4, #0x0
    ble .L_1ee0
.L_1eb8:
    mov r0, r4
    bl func_ov002_0227e76c
    cmp r0, #0x0
    bne .L_1ed4
    cmp r6, #0x0
    sub r6, r6, #0x1
    beq .L_1ee0
.L_1ed4:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_1eb8
.L_1ee0:
    mov r0, r4
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT62: .word 0x00001873
_LIT63: .word 0x00001874
_LIT64: .word 0x00001a7e
_LIT65: .word 0x00001a7f
_LIT66: .word 0x000019a5
_LIT67: .word 0x000019a4
_LIT68: .word 0x000018f6
_LIT69: .word 0x00000868
_LIT70: .word 0x000018f9
_LIT71: .word 0x0000194d
_LIT72: .word 0x000012e5
_LIT73: .word 0x00001ab1
_LIT74: .word 0x00001a4e
