; func_ov002_0226f4dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern data_ov002_022d0250
        .extern func_0202e234
        .extern func_ov002_021b98c4
        .extern func_ov002_021b9aa8
        .extern func_ov002_021bb068
        .extern func_ov002_021bb90c
        .extern func_ov002_021bb91c
        .extern func_ov002_021bb950
        .extern func_ov002_021bbe8c
        .extern func_ov002_021bbf50
        .extern func_ov002_021bc618
        .extern func_ov002_021bcd80
        .extern func_ov002_021bd85c
        .extern func_ov002_021c38c4
        .extern func_ov002_021c9be8
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca3f0
        .extern func_ov002_0226d6f4
        .extern func_ov002_0226d784
        .extern func_ov002_0226d864
        .extern func_ov002_0226d95c
        .extern func_ov002_0226d9e4
        .extern func_ov002_0226daec
        .extern func_ov002_0226db7c
        .extern func_ov002_0226dbb0
        .extern func_ov002_0226dd10
        .extern func_ov002_0226de80
        .extern func_ov002_0226df10
        .extern func_ov002_0226df90
        .extern func_ov002_0226e038
        .extern func_ov002_0226e0ec
        .extern func_ov002_0226e580
        .extern func_ov002_0226e6e0
        .extern func_ov002_0226ead0
        .global func_ov002_0226f4dc
        .arm
func_ov002_0226f4dc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    ldr r1, _LIT0
    mov r2, r6, lsl #0x2
    ldrh r1, [r1, r2]
    mov r7, r0
    mov r5, #0x0
    mov r0, r1, lsl #0x13
    movs r4, r0, lsr #0x13
    moveq r0, r5
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    bl func_0202e234
    cmp r0, #0x0
    moveq r0, r5
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    mvn r1, #0x0
    bl func_ov002_021bd85c
    cmp r0, #0x0
    beq .L_9f4
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r7, r0
    ldreq r0, _LIT2
    moveq r1, #0x10
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_9f4:
    mov r0, r7
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    bne .L_a24
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r7, r0
    ldreq r0, _LIT2
    moveq r1, #0x11
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a24:
    mov r0, r7
    mov r1, r4
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    moveq r0, r5
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r3, _LIT3
    cmp r4, r3
    bgt .L_ad4
    bge .L_b90
    ldr r2, _LIT4
    cmp r4, r2
    bgt .L_aa4
    bge .L_b60
    ldr r1, _LIT5
    cmp r4, r1
    bgt .L_a7c
    bge .L_b60
    ldr r0, _LIT6
    cmp r4, r0
    beq .L_b60
    b .L_bd4
.L_a7c:
    add r0, r1, #0x328
    cmp r4, r0
    bgt .L_bd4
    sub r0, r2, #0x48
    cmp r4, r0
    blt .L_bd4
    addne r0, r1, #0x328
    cmpne r4, r0
    beq .L_b60
    b .L_bd4
.L_aa4:
    sub r0, r3, #0x18
    cmp r4, r0
    bgt .L_ac4
    bge .L_b60
    add r0, r2, #0x1
    cmp r4, r0
    beq .L_b60
    b .L_bd4
.L_ac4:
    sub r0, r3, #0x17
    cmp r4, r0
    beq .L_b60
    b .L_bd4
.L_ad4:
    add r0, r3, #0x104
    cmp r4, r0
    bgt .L_b34
    bge .L_b60
    ldr r1, _LIT7
    cmp r4, r1
    bgt .L_b24
    bge .L_b60
    sub r0, r1, #0xff
    cmp r4, r0
    bgt .L_bd4
    add r0, r3, #0x1
    cmp r4, r0
    blt .L_bd4
    subne r0, r1, #0x100
    cmpne r4, r0
    subne r0, r1, #0xff
    cmpne r4, r0
    beq .L_b90
    b .L_bd4
.L_b24:
    add r0, r1, #0x1
    cmp r4, r0
    beq .L_b60
    b .L_bd4
.L_b34:
    ldr r0, _LIT8
    cmp r4, r0
    bgt .L_b54
    bge .L_b60
    sub r0, r0, #0x1
    cmp r4, r0
    beq .L_b60
    b .L_bd4
.L_b54:
    add r0, r0, #0x1
    cmp r4, r0
    bne .L_bd4
.L_b60:
    ldr r0, _LIT2
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x2
    cmpne r0, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT2
    ldr r0, [r0, #0xcec]
    cmp r0, r7
    beq .L_c08
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_b90:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9aa8
    cmp r0, #0x0
    bge .L_bd4
    ldr r0, _LIT2
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x2
    cmpne r0, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT2
    ldr r0, [r0, #0xcec]
    cmp r0, r7
    beq .L_c08
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_bd4:
    mov r0, r7
    mov r1, r4
    bl func_ov002_021c9be8
    cmp r0, #0x0
    bne .L_c08
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r7, r0
    ldreq r0, _LIT2
    moveq r1, #0x17
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c08:
    ldr r0, _LIT9
    cmp r4, r0
    bgt .L_eb8
    bge .L_118c
    ldr r1, _LIT10
    cmp r4, r1
    bgt .L_d88
    bge .L_1460
    ldr r0, _LIT11
    cmp r4, r0
    bgt .L_cdc
    bge .L_1114
    ldr r2, _LIT6
    cmp r4, r2
    bgt .L_c94
    bge .L_12e0
    sub r1, r0, #0x2b0
    cmp r4, r1
    bgt .L_c84
    sub r0, r0, #0x2b0
    cmp r4, r0
    bge .L_12c8
    ldr r1, _LIT12
    cmp r4, r1
    bgt .L_15bc
    sub r0, r1, #0x1
    cmp r4, r0
    blt .L_15bc
    cmpne r4, r1
    beq .L_12c8
    b .L_15bc
.L_c84:
    sub r0, r2, #0x12
    cmp r4, r0
    beq .L_130c
    b .L_15bc
.L_c94:
    sub r1, r0, #0x1a
    cmp r4, r1
    bgt .L_ccc
    add r1, r2, #0x150
    cmp r4, r1
    blt .L_cbc
    subne r0, r0, #0x1a
    cmpne r4, r0
    beq .L_1460
    b .L_15bc
.L_cbc:
    sub r0, r0, #0x1c
    cmp r4, r0
    beq .L_1460
    b .L_15bc
.L_ccc:
    sub r0, r0, #0xd
    cmp r4, r0
    beq .L_12e0
    b .L_15bc
.L_cdc:
    sub r2, r1, #0xe4
    cmp r4, r2
    bgt .L_d24
    sub r1, r1, #0xe4
    cmp r4, r1
    bge .L_1334
    add r1, r0, #0xf1
    cmp r4, r1
    bgt .L_d14
    bge .L_1320
    add r0, r0, #0xc
    cmp r4, r0
    beq .L_1460
    b .L_15bc
.L_d14:
    add r0, r0, #0x150
    cmp r4, r0
    beq .L_1368
    b .L_15bc
.L_d24:
    sub r2, r1, #0xc6
    cmp r4, r2
    bgt .L_d4c
    mov r0, r2
    cmp r4, r0
    bge .L_1334
    sub r0, r1, #0xc7
    cmp r4, r0
    beq .L_1334
    b .L_15bc
.L_d4c:
    sub r1, r1, #0xc2
    cmp r4, r1
    bgt .L_d78
    add r0, r0, #0x1ec
    subs r0, r4, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_15bc
    b .L_1334
    b .L_1334
    b .L_1334
    b .L_1100
.L_d78:
    ldr r0, _LIT13
    cmp r4, r0
    beq .L_137c
    b .L_15bc
.L_d88:
    sub r2, r0, #0x100
    cmp r4, r2
    bgt .L_e24
    sub r0, r0, #0x100
    cmp r4, r0
    bge .L_1334
    add r0, r1, #0xaf
    cmp r4, r0
    bgt .L_de0
    bge .L_1448
    add r0, r1, #0x67
    cmp r4, r0
    bgt .L_dd0
    bge .L_1448
    add r0, r1, #0x2e
    cmp r4, r0
    beq .L_13a4
    b .L_15bc
.L_dd0:
    add r0, r1, #0x6a
    cmp r4, r0
    beq .L_1448
    b .L_15bc
.L_de0:
    ldr r1, _LIT14
    cmp r4, r1
    bgt .L_e00
    bge .L_1148
    sub r0, r1, #0x52
    cmp r4, r0
    beq .L_1448
    b .L_15bc
.L_e00:
    add r0, r1, #0x79
    cmp r4, r0
    bgt .L_e14
    beq .L_1334
    b .L_15bc
.L_e14:
    add r0, r1, #0x7a
    cmp r4, r0
    beq .L_1334
    b .L_15bc
.L_e24:
    sub r2, r0, #0xe3
    cmp r4, r2
    bgt .L_e6c
    mov r1, r2
    cmp r4, r1
    bge .L_1350
    sub r1, r0, #0xfe
    cmp r4, r1
    bgt .L_e5c
    bge .L_1350
    sub r0, r0, #0xff
    cmp r4, r0
    beq .L_1334
    b .L_15bc
.L_e5c:
    sub r0, r0, #0xfc
    cmp r4, r0
    beq .L_1350
    b .L_15bc
.L_e6c:
    sub r2, r0, #0x5b
    cmp r4, r2
    bgt .L_e94
    mov r1, r2
    cmp r4, r1
    bge .L_13e8
    sub r0, r0, #0x6f
    cmp r4, r0
    beq .L_13e8
    b .L_15bc
.L_e94:
    add r0, r1, #0x278
    cmp r4, r0
    bgt .L_ea8
    beq .L_13e8
    b .L_15bc
.L_ea8:
    add r0, r1, #0x27c
    cmp r4, r0
    beq .L_1400
    b .L_15bc
.L_eb8:
    add r1, r0, #0x1dc
    cmp r4, r1
    bgt .L_fe0
    bge .L_13b8
    rsb r1, r0, #0x30c0
    cmp r4, r1
    bgt .L_f5c
    bge .L_1244
    add r1, r0, #0xce
    cmp r4, r1
    bgt .L_f18
    bge .L_1430
    add r1, r0, #0x3f
    cmp r4, r1
    bgt .L_f08
    bge .L_11e0
    add r0, r0, #0x1
    cmp r4, r0
    beq .L_118c
    b .L_15bc
.L_f08:
    add r0, r0, #0xcd
    cmp r4, r0
    beq .L_13e8
    b .L_15bc
.L_f18:
    add r1, r0, #0xf2
    cmp r4, r1
    bgt .L_f38
    bge .L_13e8
    add r0, r0, #0xed
    cmp r4, r0
    beq .L_1334
    b .L_15bc
.L_f38:
    ldr r0, _LIT15
    cmp r4, r0
    bgt .L_f4c
    beq .L_13e8
    b .L_15bc
.L_f4c:
    add r0, r0, #0xe
    cmp r4, r0
    beq .L_1210
    b .L_15bc
.L_f5c:
    ldr r1, _LIT16
    cmp r4, r1
    bgt .L_f9c
    bge .L_1274
    sub r0, r1, #0x18
    cmp r4, r0
    bgt .L_f8c
    bge .L_1448
    sub r0, r1, #0x19
    cmp r4, r0
    beq .L_1448
    b .L_15bc
.L_f8c:
    sub r0, r1, #0x1
    cmp r4, r0
    beq .L_1274
    b .L_15bc
.L_f9c:
    add r0, r1, #0x2
    cmp r4, r0
    bgt .L_fbc
    bge .L_1274
    add r0, r1, #0x1
    cmp r4, r0
    beq .L_1274
    b .L_15bc
.L_fbc:
    add r0, r1, #0x16
    cmp r4, r0
    bgt .L_fd0
    beq .L_13e8
    b .L_15bc
.L_fd0:
    add r0, r1, #0x20
    cmp r4, r0
    beq .L_13e8
    b .L_15bc
.L_fe0:
    ldr r0, _LIT17
    cmp r4, r0
    bgt .L_107c
    bge .L_13e8
    sub r1, r0, #0x4e
    cmp r4, r1
    bgt .L_1030
    bge .L_128c
    sub r1, r0, #0x53
    cmp r4, r1
    bgt .L_1020
    bge .L_1400
    sub r0, r0, #0x54
    cmp r4, r0
    beq .L_13b8
    b .L_15bc
.L_1020:
    sub r0, r0, #0x52
    cmp r4, r0
    beq .L_13d0
    b .L_15bc
.L_1030:
    sub r1, r0, #0x2e
    cmp r4, r1
    bgt .L_1050
    bge .L_1334
    sub r0, r0, #0x30
    cmp r4, r0
    beq .L_13b8
    b .L_15bc
.L_1050:
    sub r1, r0, #0x8
    cmp r4, r1
    bgt .L_106c
    sub r0, r0, #0x8
    cmp r4, r0
    beq .L_13e8
    b .L_15bc
.L_106c:
    sub r0, r0, #0x1
    cmp r4, r0
    beq .L_13e8
    b .L_15bc
.L_107c:
    add r1, r0, #0x77
    cmp r4, r1
    bgt .L_10bc
    bge .L_1448
    add r1, r0, #0x75
    cmp r4, r1
    bgt .L_10ac
    bge .L_1448
    add r0, r0, #0x6d
    cmp r4, r0
    beq .L_1418
    b .L_15bc
.L_10ac:
    add r0, r0, #0x76
    cmp r4, r0
    beq .L_1448
    b .L_15bc
.L_10bc:
    add r1, r0, #0x154
    cmp r4, r1
    bgt .L_10dc
    bge .L_1448
    add r0, r0, #0x9a
    cmp r4, r0
    beq .L_12b4
    b .L_15bc
.L_10dc:
    ldr r0, _LIT8
    cmp r4, r0
    bgt .L_10f0
    beq .L_1448
    b .L_15bc
.L_10f0:
    add r0, r0, #0x1
    cmp r4, r0
    beq .L_1448
    b .L_15bc
.L_1100:
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_1114:
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_15bc
    mov r0, r7
    bl func_ov002_021bbf50
    mov r4, r0
    rsb r0, r7, #0x1
    bl func_ov002_021bbf50
    add r1, r4, #0x1
    cmp r1, r0
    orrlt r5, r5, #0x4
    b .L_15bc
.L_1148:
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_15bc
    ldr r0, _LIT18
    and r1, r7, #0x1
    mul r2, r1, r0
    ldr r0, _LIT19
    ldr r0, [r0, r2]
    cmp r0, #0x1
    bhi .L_15bc
    ldr r1, _LIT20
    mov r0, r7
    bl func_ov002_021bb90c
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_118c:
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_15bc
    ldr r0, _LIT21
    bl func_ov002_021bb91c
    cmp r0, #0x0
    beq .L_15bc
    ldr r0, _LIT22
    bl func_ov002_021bb068
    mov r1, #0x1f4
    mul r1, r0, r1
    ldr r0, _LIT18
    and r2, r7, #0x1
    mul r3, r2, r0
    ldr r2, _LIT23
    add r0, r1, #0x1f4
    ldr r1, [r2, r3]
    cmp r1, r0
    orrgt r5, r5, #0x4
    b .L_15bc
.L_11e0:
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_15bc
    ldr r0, _LIT18
    and r1, r7, #0x1
    mul r2, r1, r0
    ldr r0, _LIT19
    ldr r0, [r0, r2]
    cmp r0, #0x1
    orrhi r5, r5, #0x4
    b .L_15bc
.L_1210:
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_15bc
    mov r0, r7
    bl func_ov002_021bbf50
    cmp r0, #0x0
    bne .L_15bc
    rsb r0, r7, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_1244:
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_15bc
    ldr r0, _LIT18
    and r1, r7, #0x1
    mul r2, r1, r0
    ldr r0, _LIT19
    ldr r0, [r0, r2]
    cmp r0, #0x1
    orreq r5, r5, #0x4
    b .L_15bc
.L_1274:
    mov r0, r7
    mov r1, r4
    bl func_ov002_0226df10
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_128c:
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_15bc
    mov r0, r7
    mov r1, r4
    bl func_ov002_021bb950
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_12b4:
    mov r0, r7
    bl func_ov002_0226e038
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_12c8:
    mov r0, r7
    mov r1, r4
    bl func_ov002_0226d6f4
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_12e0:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b98c4
    cmp r0, #0x0
    blt .L_15bc
    mov r0, r7
    mov r1, r4
    bl func_ov002_0226d784
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_130c:
    mov r0, r7
    bl func_ov002_0226dbb0
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_1320:
    mov r0, r7
    bl func_ov002_0226dd10
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_1334:
    mov r1, r4, lsl #0x10
    mov r0, r7
    mov r1, r1, lsr #0x10
    bl func_ov002_0226e580
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_1350:
    mov r0, r7
    mov r1, r4
    bl func_ov002_0226e6e0
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_1368:
    mov r0, r7
    bl func_ov002_0226de80
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_137c:
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_15bc
    ldr r1, _LIT24
    mov r0, r7
    bl func_ov002_021bb90c
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_13a4:
    mov r0, r7
    bl func_ov002_0226df90
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_13b8:
    mov r0, r7
    mov r1, r4
    bl func_ov002_0226d9e4
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_13d0:
    mov r0, r7
    mov r1, r4
    bl func_ov002_0226db7c
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_13e8:
    mov r0, r7
    mov r1, r4
    bl func_ov002_0226d784
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_1400:
    mov r0, r7
    mov r1, r4
    bl func_ov002_0226d864
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_1418:
    mov r0, r7
    mov r1, r4
    bl func_ov002_0226d95c
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_1430:
    mov r0, r7
    mov r1, r4
    bl func_ov002_0226daec
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_1448:
    mov r0, r7
    mov r1, r4
    bl func_ov002_0226e0ec
    cmp r0, #0x0
    orrne r5, r5, #0x4
    b .L_15bc
.L_1460:
    mov r0, r7
    bl func_ov002_021bbe8c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c38c4
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_1550
    b .L_14a8
    b .L_14a8
    b .L_14a8
    b .L_14a8
    b .L_14a8
    b .L_14e0
    b .L_14e0
.L_14a8:
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    bne .L_14d8
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r7, r0
    bne .L_15bc
    ldr r0, _LIT2
    mov r1, #0xb
    str r1, [r0, #0xd80]
    b .L_15bc
.L_14d8:
    orr r5, r5, #0x4
    b .L_15bc
.L_14e0:
    mov r0, r7
    mvn r1, #0x0
    bl func_ov002_021bcd80
    cmp r0, #0x1
    bge .L_1514
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r7, r0
    bne .L_15bc
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd80]
    b .L_15bc
.L_1514:
    mov r0, r7
    mov r1, #0x1
    bl func_ov002_0226ead0
    cmp r0, #0x0
    bne .L_1548
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r7, r0
    bne .L_15bc
    ldr r0, _LIT2
    mov r1, #0xb
    str r1, [r0, #0xd80]
    b .L_15bc
.L_1548:
    orr r5, r5, #0x4
    b .L_15bc
.L_1550:
    mov r0, r7
    mvn r1, #0x0
    bl func_ov002_021bcd80
    cmp r0, #0x2
    bge .L_1584
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r7, r0
    bne .L_15bc
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd80]
    b .L_15bc
.L_1584:
    mov r0, r7
    mov r1, #0x1
    bl func_ov002_0226ead0
    cmp r0, #0x0
    bne .L_15b8
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r7, r0
    bne .L_15bc
    ldr r0, _LIT2
    mov r1, #0xb
    str r1, [r0, #0xd80]
    b .L_15bc
.L_15b8:
    orr r5, r5, #0x4
.L_15bc:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d0250
_LIT1: .word data_ov002_022cd73c
_LIT2: .word data_ov002_022d016c
_LIT3: .word 0x0000196b
_LIT4: .word 0x000015f9
_LIT5: .word 0x0000128c
_LIT6: .word 0x0000112e
_LIT7: .word 0x00001a6d
_LIT8: .word 0x00001b4d
_LIT9: .word 0x000017c7
_LIT10: .word 0x0000154a
_LIT11: .word 0x00001299
_LIT12: .word 0x00000fdf
_LIT13: .word 0x000014fc
_LIT14: .word 0x0000164c
_LIT15: .word 0x000018e8
_LIT16: .word 0x0000196c
_LIT17: .word 0x000019f8
_LIT18: .word 0x00000868
_LIT19: .word data_ov002_022cf178
_LIT20: .word 0x0000165e
_LIT21: .word 0x000017bf
_LIT22: .word 0x0000132c
_LIT23: .word data_ov002_022cf16c
_LIT24: .word 0x00001414
