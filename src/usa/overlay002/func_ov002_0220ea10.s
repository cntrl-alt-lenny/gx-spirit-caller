; func_ov002_0220ea10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0a0
        .extern data_ov002_022cf0a4
        .extern data_ov002_022cf0a8
        .extern data_ov002_022d0170
        .extern func_0202b854
        .extern func_0202b89c
        .extern func_0202b8cc
        .extern func_0202e1e0
        .extern func_0202e204
        .extern func_0202e2a4
        .extern func_0202ea74
        .extern func_ov002_021b3538
        .extern func_ov002_021b4190
        .extern func_ov002_021bbb78
        .extern func_ov002_021bbc24
        .extern func_ov002_021bbdcc
        .extern func_ov002_021bbe70
        .extern func_ov002_021bbf20
        .extern func_ov002_021bce20
        .extern func_ov002_021bd284
        .extern func_ov002_021c31f4
        .extern func_ov002_021c8390
        .global func_ov002_0220ea10
        .arm
func_ov002_0220ea10:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh ip, [r6, #0x8]
    ldrh r4, [r6, #0x2]
    mov r5, r1
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5]
    mov r1, r4, lsl #0x11
    ldrh r2, [r6]
    ldr r3, _LIT0
    mov r4, r4, lsl #0x1f
    mov r1, r1, lsr #0x1f
    cmp r2, r3
    eor r4, r1, r4, lsr #0x1f
    and ip, ip, #0x1
    bgt .L_5f0
    cmp r2, r3
    bge .L_1064
    ldr r1, _LIT1
    cmp r2, r1
    bgt .L_34c
    bge .L_b44
    ldr r3, _LIT2
    cmp r2, r3
    bgt .L_210
    bge .L_c3c
    ldr r1, _LIT3
    cmp r2, r1
    bgt .L_178
    bge .L_dfc
    sub r3, r1, #0xdf
    cmp r2, r3
    bgt .L_c4
    mov r0, r3
    cmp r2, r0
    bge .L_db0
    sub r0, r1, #0x170
    cmp r2, r0
    bgt .L_b4
    bge .L_b38
    ldr r0, _LIT4
    cmp r2, r0
    beq .L_d18
    ldmia sp!, {r4, r5, r6, pc}
.L_b4:
    sub r0, r1, #0x10c
    cmp r2, r0
    beq .L_d2c
    ldmia sp!, {r4, r5, r6, pc}
.L_c4:
    sub r3, r1, #0x32
    cmp r2, r3
    bgt .L_154
    bge .L_eb4
    sub r1, r1, #0xc4
    sub r1, r2, r1
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r4, r5, r6, pc}
    b .L_afc
    b .L_b08
    b .L_b14
    b .L_b20
    b .L_b2c
    b .L_e40
    b .L_e4c
    b .L_e58
    b .L_e64
    b .L_d00
_LIT0: .word 0x0000170b
_LIT1: .word 0x00001455
_LIT2: .word 0x00001322
_LIT3: .word 0x000011bc
_LIT4: .word 0x00000fff
_LIT5: .word 0x00001190
_LIT6: .word 0x00001578
_LIT7: .word 0x000015ee
_LIT8: .word 0x0000191d
_LIT9: .word 0x00001ae0
_LIT10: .word func_0202ea74
_LIT11: .word 0x0000ffff
_LIT12: .word 0xfffffa24
_LIT13: .word 0x00000bb8
_LIT14: .word 0x00000868
_LIT15: .word data_ov002_022cf098
_LIT16: .word data_ov002_022cd314
.L_154:
    ldr r0, _LIT5
    cmp r2, r0
    bgt .L_168
    beq .L_ff4
    ldmia sp!, {r4, r5, r6, pc}
.L_168:
    add r0, r0, #0x16
    cmp r2, r0
    beq .L_db0
    ldmia sp!, {r4, r5, r6, pc}
.L_178:
    add r6, r1, #0xe6
    cmp r2, r6
    bgt .L_1c0
    mov r3, r6
    cmp r2, r3
    bge .L_b44
    add r3, r1, #0x13
    cmp r2, r3
    bgt .L_1b0
    bge .L_e9c
    add r0, r1, #0xd
    cmp r2, r0
    beq .L_ecc
    ldmia sp!, {r4, r5, r6, pc}
.L_1b0:
    add r0, r1, #0xde
    cmp r2, r0
    beq .L_fd4
    ldmia sp!, {r4, r5, r6, pc}
.L_1c0:
    sub r6, r3, #0x39
    cmp r2, r6
    bgt .L_1ec
    sub r3, r3, #0x39
    cmp r2, r3
    bge .L_edc
    add r0, r1, #0x12c
    cmp r2, r0
    moveq r0, #0x190
    streq r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1ec:
    sub r0, r3, #0x21
    cmp r2, r0
    bgt .L_200
    beq .L_ee8
    ldmia sp!, {r4, r5, r6, pc}
.L_200:
    sub r0, r3, #0x1b
    cmp r2, r0
    beq .L_f08
    ldmia sp!, {r4, r5, r6, pc}
.L_210:
    add ip, r3, #0xff
    cmp r2, ip
    bgt .L_2b4
    mov r1, ip
    cmp r2, r1
    bge .L_f54
    add r1, r3, #0x59
    cmp r2, r1
    bgt .L_270
    bge .L_c3c
    add r1, r3, #0x4e
    cmp r2, r1
    bgt .L_260
    mov r0, r1
    cmp r2, r0
    bge .L_be0
    add r0, r3, #0x33
    cmp r2, r0
    beq .L_db0
    ldmia sp!, {r4, r5, r6, pc}
.L_260:
    add r1, r3, #0x58
    cmp r2, r1
    beq .L_b5c
    ldmia sp!, {r4, r5, r6, pc}
.L_270:
    add r0, r3, #0xce
    cmp r2, r0
    bgt .L_290
    bge .L_e70
    add r0, r3, #0x86
    cmp r2, r0
    beq .L_db0
    ldmia sp!, {r4, r5, r6, pc}
.L_290:
    add r0, r3, #0xd1
    cmp r2, r0
    bgt .L_2a4
    beq .L_e70
    ldmia sp!, {r4, r5, r6, pc}
.L_2a4:
    add r0, r3, #0xfd
    cmp r2, r0
    beq .L_c4c
    ldmia sp!, {r4, r5, r6, pc}
.L_2b4:
    add ip, r3, #0x12c
    cmp r2, ip
    bgt .L_304
    add r3, r3, #0x12c
    cmp r2, r3
    bge .L_1014
    sub r3, r1, #0x20
    cmp r2, r3
    bgt .L_2f4
    mov r0, r3
    cmp r2, r0
    bge .L_db0
    sub r0, r1, #0x29
    cmp r2, r0
    beq .L_b38
    ldmia sp!, {r4, r5, r6, pc}
.L_2f4:
    sub r1, r1, #0xa
    cmp r2, r1
    beq .L_e10
    ldmia sp!, {r4, r5, r6, pc}
.L_304:
    sub r0, r1, #0x5
    cmp r2, r0
    bgt .L_324
    bge .L_b44
    sub r0, r1, #0x6
    cmp r2, r0
    beq .L_1014
    ldmia sp!, {r4, r5, r6, pc}
.L_324:
    sub r0, r1, #0x4
    cmp r2, r0
    bgt .L_338
    beq .L_b44
    ldmia sp!, {r4, r5, r6, pc}
.L_338:
    sub r0, r1, #0x1
    cmp r2, r0
    moveq r0, #0x320
    streq r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_34c:
    sub ip, r3, #0x170
    cmp r2, ip
    bgt .L_49c
    sub r3, r3, #0x170
    cmp r2, r3
    bge .L_f70
    add r3, r1, #0xb1
    cmp r2, r3
    bgt .L_404
    mov r0, r3
    cmp r2, r0
    bge .L_cd8
    add r0, r1, #0x5d
    cmp r2, r0
    bgt .L_3c0
    bge .L_db0
    add r0, r1, #0xb
    cmp r2, r0
    bgt .L_3b0
    bge .L_dfc
    add r0, r1, #0x4
    cmp r2, r0
    moveq r0, #0xc8
    streq r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_3b0:
    add r0, r1, #0x12
    cmp r2, r0
    beq .L_b44
    ldmia sp!, {r4, r5, r6, pc}
.L_3c0:
    add r0, r1, #0x91
    cmp r2, r0
    bgt .L_3e0
    bge .L_c60
    add r0, r1, #0x8b
    cmp r2, r0
    beq .L_de8
    ldmia sp!, {r4, r5, r6, pc}
.L_3e0:
    add r0, r1, #0x98
    cmp r2, r0
    bgt .L_3f4
    beq .L_cd8
    ldmia sp!, {r4, r5, r6, pc}
.L_3f4:
    add r0, r1, #0x9e
    cmp r2, r0
    beq .L_b50
    ldmia sp!, {r4, r5, r6, pc}
.L_404:
    add r3, r1, #0x110
    cmp r2, r3
    bgt .L_450
    mov r0, r3
    cmp r2, r0
    bge .L_db0
    add r0, r1, #0xcb
    cmp r2, r0
    bgt .L_440
    bge .L_db0
    add r0, r1, #0xc6
    cmp r2, r0
    moveq r0, #0xfa0
    streq r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_440:
    add r0, r1, #0xd0
    cmp r2, r0
    beq .L_db0
    ldmia sp!, {r4, r5, r6, pc}
.L_450:
    ldr r3, _LIT6
    cmp r2, r3
    bgt .L_470
    bge .L_ea8
    sub r0, r3, #0x4
    cmp r2, r0
    beq .L_d8c
    ldmia sp!, {r4, r5, r6, pc}
.L_470:
    add r1, r3, #0xe
    cmp r2, r1
    bgt .L_48c
    mov r0, r1
    cmp r2, r0
    beq .L_db0
    ldmia sp!, {r4, r5, r6, pc}
.L_48c:
    add r1, r3, #0x14
    cmp r2, r1
    beq .L_dd8
    ldmia sp!, {r4, r5, r6, pc}
.L_49c:
    sub ip, r3, #0x71
    cmp r2, ip
    bgt .L_548
    bge .L_ec0
    add ip, r1, #0x1c8
    cmp r2, ip
    bgt .L_4f4
    add r1, r1, #0x1c8
    cmp r2, r1
    bge .L_f2c
    ldr r1, _LIT7
    cmp r2, r1
    bgt .L_4e4
    bge .L_f88
    sub r1, r1, #0x7
    cmp r2, r1
    beq .L_c74
    ldmia sp!, {r4, r5, r6, pc}
.L_4e4:
    add r0, r1, #0x6
    cmp r2, r0
    beq .L_fa0
    ldmia sp!, {r4, r5, r6, pc}
.L_4f4:
    sub ip, r3, #0xd4
    cmp r2, ip
    bgt .L_51c
    mov r1, ip
    cmp r2, r1
    bge .L_dc4
    sub r1, r3, #0xe4
    cmp r2, r1
    beq .L_da0
    ldmia sp!, {r4, r5, r6, pc}
.L_51c:
    sub ip, r3, #0xcc
    cmp r2, ip
    bgt .L_538
    mov r1, ip
    cmp r2, r1
    beq .L_1284
    ldmia sp!, {r4, r5, r6, pc}
.L_538:
    add r0, r1, #0x1ec
    cmp r2, r0
    beq .L_1034
    ldmia sp!, {r4, r5, r6, pc}
.L_548:
    sub ip, r3, #0x2f
    cmp r2, ip
    bgt .L_5a4
    bge .L_11dc
    add ip, r1, #0x270
    cmp r2, ip
    bgt .L_580
    mov r0, ip
    cmp r2, r0
    bge .L_11bc
    sub r0, r3, #0x6b
    cmp r2, r0
    beq .L_ca8
    ldmia sp!, {r4, r5, r6, pc}
.L_580:
    sub r1, r3, #0x3f
    cmp r2, r1
    bgt .L_594
    beq .L_11cc
    ldmia sp!, {r4, r5, r6, pc}
.L_594:
    sub r0, r3, #0x31
    cmp r2, r0
    beq .L_bb0
    ldmia sp!, {r4, r5, r6, pc}
.L_5a4:
    sub ip, r3, #0x11
    cmp r2, ip
    bgt .L_5cc
    mov r0, ip
    cmp r2, r0
    bge .L_dfc
    add r0, r1, #0x2a0
    cmp r2, r0
    beq .L_c3c
    ldmia sp!, {r4, r5, r6, pc}
.L_5cc:
    sub r1, r3, #0xd
    cmp r2, r1
    bgt .L_5e0
    beq .L_11ec
    ldmia sp!, {r4, r5, r6, pc}
.L_5e0:
    sub r0, r3, #0x9
    cmp r2, r0
    beq .L_de8
    ldmia sp!, {r4, r5, r6, pc}
.L_5f0:
    ldr r1, _LIT8
    cmp r2, r1
    bgt .L_88c
    bge .L_d4c
    add lr, r3, #0xbc
    cmp r2, lr
    bgt .L_760
    mov ip, lr
    cmp r2, ip
    bge .L_10b4
    add ip, r3, #0x57
    cmp r2, ip
    bgt .L_6c8
    bge .L_db0
    add ip, r3, #0x43
    cmp r2, ip
    bgt .L_670
    mov r1, ip
    cmp r2, r1
    bge .L_1314
    add r1, r3, #0x3f
    cmp r2, r1
    bgt .L_660
    bge .L_1154
    add r1, r3, #0x34
    cmp r2, r1
    beq .L_12a4
    ldmia sp!, {r4, r5, r6, pc}
.L_660:
    add r0, r3, #0x40
    cmp r2, r0
    beq .L_1154
    ldmia sp!, {r4, r5, r6, pc}
.L_670:
    add ip, r3, #0x4c
    cmp r2, ip
    bgt .L_698
    mov r0, ip
    cmp r2, r0
    bge .L_b80
    add r0, r3, #0x4b
    cmp r2, r0
    beq .L_db0
    ldmia sp!, {r4, r5, r6, pc}
.L_698:
    add ip, r3, #0x4f
    cmp r2, ip
    bgt .L_6b8
    mov r0, ip
    cmp r2, r0
    ldreqh r0, [r6, #0xc]
    streq r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_6b8:
    sub r1, r1, #0x1bc
    cmp r2, r1
    beq .L_126c
    ldmia sp!, {r4, r5, r6, pc}
.L_6c8:
    add ip, r3, #0x88
    cmp r2, ip
    bgt .L_710
    mov r1, ip
    cmp r2, r1
    bge .L_b50
    add r1, r3, #0x65
    cmp r2, r1
    bgt .L_700
    bge .L_1300
    add r0, r3, #0x5c
    cmp r2, r0
    beq .L_12dc
    ldmia sp!, {r4, r5, r6, pc}
.L_700:
    add r0, r3, #0x87
    cmp r2, r0
    beq .L_118c
    ldmia sp!, {r4, r5, r6, pc}
.L_710:
    add r6, r3, #0x90
    cmp r2, r6
    bgt .L_738
    mov r1, r6
    cmp r2, r1
    bge .L_de8
    add r1, r3, #0x89
    cmp r2, r1
    beq .L_1214
    ldmia sp!, {r4, r5, r6, pc}
.L_738:
    add r0, r3, #0x99
    cmp r2, r0
    bgt .L_74c
    beq .L_b44
    ldmia sp!, {r4, r5, r6, pc}
.L_74c:
    sub r0, r1, #0x178
    cmp r2, r0
    moveq r0, #0x2bc
    streq r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_760:
    sub lr, r1, #0x92
    cmp r2, lr
    bgt .L_7f4
    bge .L_1248
    add lr, r3, #0xf9
    cmp r2, lr
    bgt .L_7b0
    bge .L_1224
    sub r0, r1, #0x13c
    cmp r2, r0
    bgt .L_7a0
    bge .L_db0
    add r0, r3, #0xbd
    cmp r2, r0
    beq .L_10ec
    ldmia sp!, {r4, r5, r6, pc}
.L_7a0:
    add r0, r3, #0xf7
    cmp r2, r0
    beq .L_1330
    ldmia sp!, {r4, r5, r6, pc}
.L_7b0:
    sub r3, r1, #0xb4
    cmp r2, r3
    bgt .L_7d0
    bge .L_1378
    sub r0, r1, #0xc8
    cmp r2, r0
    beq .L_d18
    ldmia sp!, {r4, r5, r6, pc}
.L_7d0:
    sub r0, r1, #0xa6
    cmp r2, r0
    bgt .L_7e4
    beq .L_c2c
    ldmia sp!, {r4, r5, r6, pc}
.L_7e4:
    sub r0, r1, #0xa2
    cmp r2, r0
    beq .L_db0
    ldmia sp!, {r4, r5, r6, pc}
.L_7f4:
    sub r0, r1, #0x4c
    cmp r2, r0
    bgt .L_848
    bge .L_1034
    sub r0, r1, #0x66
    cmp r2, r0
    bgt .L_824
    bge .L_db0
    sub r0, r1, #0x67
    cmp r2, r0
    beq .L_d8c
    ldmia sp!, {r4, r5, r6, pc}
.L_824:
    sub r0, r1, #0x55
    cmp r2, r0
    bgt .L_838
    beq .L_1034
    ldmia sp!, {r4, r5, r6, pc}
.L_838:
    sub r0, r1, #0x4d
    cmp r2, r0
    beq .L_1124
    ldmia sp!, {r4, r5, r6, pc}
.L_848:
    sub r0, r1, #0x43
    cmp r2, r0
    bgt .L_868
    bge .L_d18
    sub r0, r1, #0x46
    cmp r2, r0
    beq .L_1314
    ldmia sp!, {r4, r5, r6, pc}
.L_868:
    sub r0, r1, #0x13
    cmp r2, r0
    bgt .L_87c
    beq .L_e20
    ldmia sp!, {r4, r5, r6, pc}
.L_87c:
    sub r0, r1, #0x9
    cmp r2, r0
    beq .L_139c
    ldmia sp!, {r4, r5, r6, pc}
.L_88c:
    cmp r2, #0x1a40
    bgt .L_9c0
    bge .L_1484
    add r3, r1, #0x87
    cmp r2, r3
    bgt .L_934
    bge .L_dfc
    add r3, r1, #0x26
    cmp r2, r3
    bgt .L_8f0
    mov r0, r3
    cmp r2, r0
    bge .L_1034
    add r0, r1, #0xf
    cmp r2, r0
    bgt .L_8e0
    bge .L_13d0
    add r0, r1, #0xc
    cmp r2, r0
    beq .L_d18
    ldmia sp!, {r4, r5, r6, pc}
.L_8e0:
    add r0, r1, #0x1e
    cmp r2, r0
    beq .L_1034
    ldmia sp!, {r4, r5, r6, pc}
.L_8f0:
    add r3, r1, #0x33
    cmp r2, r3
    bgt .L_910
    bge .L_13bc
    add r0, r1, #0x2d
    cmp r2, r0
    beq .L_13f0
    ldmia sp!, {r4, r5, r6, pc}
.L_910:
    add r0, r1, #0x67
    cmp r2, r0
    bgt .L_924
    beq .L_143c
    ldmia sp!, {r4, r5, r6, pc}
.L_924:
    add r0, r1, #0x6a
    cmp r2, r0
    beq .L_1064
    ldmia sp!, {r4, r5, r6, pc}
.L_934:
    add r3, r1, #0xb6
    cmp r2, r3
    bgt .L_97c
    bge .L_1034
    add r3, r1, #0xb1
    cmp r2, r3
    bgt .L_96c
    mov r0, r3
    cmp r2, r0
    bge .L_d6c
    add r0, r1, #0xb0
    cmp r2, r0
    beq .L_b98
    ldmia sp!, {r4, r5, r6, pc}
.L_96c:
    add r1, r1, #0xb2
    cmp r2, r1
    beq .L_145c
    ldmia sp!, {r4, r5, r6, pc}
.L_97c:
    add r0, r1, #0xd3
    cmp r2, r0
    bgt .L_99c
    bge .L_dfc
    add r0, r1, #0xc3
    cmp r2, r0
    beq .L_1064
    ldmia sp!, {r4, r5, r6, pc}
.L_99c:
    add r0, r1, #0xf7
    cmp r2, r0
    bgt .L_9b0
    beq .L_bc4
    ldmia sp!, {r4, r5, r6, pc}
.L_9b0:
    rsb r0, r1, #0x3340
    cmp r2, r0
    beq .L_108c
    ldmia sp!, {r4, r5, r6, pc}
.L_9c0:
    ldr r1, _LIT9
    cmp r2, r1
    bgt .L_a5c
    bge .L_db0
    sub r3, r1, #0x40
    cmp r2, r3
    bgt .L_a18
    mov r0, r3
    cmp r2, r0
    bge .L_dfc
    sub r0, r1, #0x77
    cmp r2, r0
    bgt .L_a08
    bge .L_db0
    sub r0, r1, #0x8f
    cmp r2, r0
    beq .L_d8c
    ldmia sp!, {r4, r5, r6, pc}
.L_a08:
    sub r0, r1, #0x6f
    cmp r2, r0
    beq .L_14cc
    ldmia sp!, {r4, r5, r6, pc}
.L_a18:
    sub r3, r1, #0x33
    cmp r2, r3
    bgt .L_a38
    bge .L_14f4
    sub r0, r1, #0x3e
    cmp r2, r0
    beq .L_cec
    ldmia sp!, {r4, r5, r6, pc}
.L_a38:
    sub r0, r1, #0x30
    cmp r2, r0
    bgt .L_a4c
    beq .L_d8c
    ldmia sp!, {r4, r5, r6, pc}
.L_a4c:
    sub r0, r1, #0x26
    cmp r2, r0
    beq .L_dc4
    ldmia sp!, {r4, r5, r6, pc}
.L_a5c:
    add r3, r1, #0x38
    cmp r2, r3
    bgt .L_ab0
    bge .L_1560
    add r3, r1, #0x18
    cmp r2, r3
    bgt .L_a8c
    bge .L_1540
    add r0, r1, #0x17
    cmp r2, r0
    beq .L_d18
    ldmia sp!, {r4, r5, r6, pc}
.L_a8c:
    add r0, r1, #0x22
    cmp r2, r0
    bgt .L_aa0
    beq .L_b38
    ldmia sp!, {r4, r5, r6, pc}
.L_aa0:
    add r0, r1, #0x23
    cmp r2, r0
    beq .L_db0
    ldmia sp!, {r4, r5, r6, pc}
.L_ab0:
    add r3, r1, #0x4d
    cmp r2, r3
    bgt .L_ad0
    bge .L_1580
    add r1, r1, #0x39
    cmp r2, r1
    beq .L_1570
    ldmia sp!, {r4, r5, r6, pc}
.L_ad0:
    add r3, r1, #0x6f
    cmp r2, r3
    bgt .L_aec
    mov r0, r3
    cmp r2, r0
    beq .L_15b4
    ldmia sp!, {r4, r5, r6, pc}
.L_aec:
    add r1, r1, #0x9f
    cmp r2, r1
    beq .L_e30
    ldmia sp!, {r4, r5, r6, pc}
.L_afc:
    mov r0, #0xc8
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_b08:
    mov r0, #0x1f4
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_b14:
    mov r0, #0x258
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_b20:
    mov r0, #0x320
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_b2c:
    mov r0, #0x3e8
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_b38:
    mov r0, #0x1f4
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_b44:
    mov r0, #0x3e8
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_b50:
    mov r0, #0x7d0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_b5c:
    bl func_ov002_021bbe70
    mov r6, r0
    mov r0, #0x1
    bl func_ov002_021bbe70
    add r1, r6, r0
    mov r0, #0x12c
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_b80:
    mov r0, r4
    bl func_ov002_021bbe70
    mov r1, #0x190
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_b98:
    mov r0, r4
    bl func_ov002_021bbe70
    mov r1, #0x320
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_bb0:
    ldr r1, [r6, #0x14]
    mov r0, #0x1f4
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_bc4:
    ldr r1, _LIT10
    mov r0, r4
    bl func_ov002_021bbf20
    mov r1, #0x3e8
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_be0:
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3538
    ldr r1, _LIT11
    cmp r0, r1
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c8390
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_c2c:
    rsb r0, r4, #0x1
    mov r1, #0x1f4
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_c3c:
    rsb r0, r4, #0x1
    mov r1, #0x3e8
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_c4c:
    mov r1, #0x3e8
    str r1, [r5, r4, lsl #0x2]
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_c60:
    ldrh r1, [r6, #0x8]
    mov r0, #0x3e8
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_c74:
    ldrh r1, [r6, #0xc]
    cmp r1, #0x1
    beq .L_c8c
    cmp r1, #0x2
    beq .L_c98
    ldmia sp!, {r4, r5, r6, pc}
.L_c8c:
    mov r0, #0x4b0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_c98:
    sub r1, r0, #0x320
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_ca8:
    ldrh r0, [r6, #0xa]
    bl func_0202e2a4
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0xa]
    bl func_0202e1e0
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0xa]
    bl func_0202b89c
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_cd8:
    ldr r0, [r6, #0x14]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_cec:
    ldrh r1, [r6, #0x8]
    mov r0, #0x190
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_d00:
    sub r2, r0, #0x3e8
    rsb r1, r4, #0x1
    str r2, [r5, r1, lsl #0x2]
    sub r0, r0, #0x1f4
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_d18:
    ldrh r1, [r6, #0x8]
    rsb r0, r4, #0x1
    rsb r1, r1, #0x0
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_d2c:
    rsb r4, r4, #0x1
    mov r0, r4
    bl func_ov002_021bce20
    mov r1, #0x1f4
    rsb r1, r1, #0x0
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_d4c:
    rsb r4, r4, #0x1
    mov r0, r4
    bl func_ov002_021bbe70
    mov r1, #0x12c
    rsb r1, r1, #0x0
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_d6c:
    rsb r4, r4, #0x1
    mov r0, r4
    bl func_ov002_021bbe70
    mov r1, #0x258
    rsb r1, r1, #0x0
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_d8c:
    mov r1, #0x12c
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_da0:
    sub r1, r0, #0x190
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_db0:
    mov r1, #0x1f4
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_dc4:
    mov r1, #0x258
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_dd8:
    sub r1, r0, #0x2bc
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_de8:
    mov r1, #0x320
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_dfc:
    mov r1, #0x3e8
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_e10:
    sub r1, r0, #0x4b0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_e20:
    ldr r1, _LIT12
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_e30:
    sub r1, r0, #0x7d0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_e40:
    sub r0, r0, #0xc8
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_e4c:
    sub r0, r0, #0x1f4
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_e58:
    sub r0, r0, #0x258
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_e64:
    sub r0, r0, #0x320
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_e70:
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3538
    mov r1, #0x1f4
    and r0, r0, #0xff
    rsb r1, r1, #0x0
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_e9c:
    sub r0, r0, #0x12c
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_ea8:
    sub r0, r0, #0x3e8
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_eb4:
    sub r0, r0, #0x7d0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_ec0:
    sub r0, r0, #0x320
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_ecc:
    ldr r1, _LIT13
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_edc:
    sub r0, r0, #0x12c
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_ee8:
    rsb r4, r4, #0x1
    mov r0, r4
    bl func_ov002_021bbe70
    mov r1, #0x1f4
    rsb r1, r1, #0x0
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_f08:
    ldr r0, _LIT14
    and r1, ip, #0x1
    mul r2, r1, r0
    ldr r1, _LIT15
    sub r0, r0, #0x930
    ldr r1, [r1, r2]
    mul r0, r1, r0
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_f2c:
    rsb r4, r4, #0x1
    ldr r1, _LIT14
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT15
    sub r0, r0, #0x190
    ldr r1, [r1, r3]
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_f54:
    ldrh r1, [r6, #0x8]
    cmp r1, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    sub r1, r0, #0x1f4
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_f70:
    ldrh r2, [r6, #0x8]
    sub r0, r0, #0x12c
    rsb r1, r4, #0x1
    mul r0, r2, r0
    str r0, [r5, r1, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_f88:
    ldrh r2, [r6, #0xa]
    sub r0, r0, #0x3e8
    rsb r1, r4, #0x1
    mul r0, r2, r0
    str r0, [r5, r1, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_fa0:
    rsb r4, r4, #0x1
    mov r0, r4
    bl func_ov002_021bbdcc
    ldr r1, _LIT14
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r2, _LIT15
    sub r1, r1, #0x930
    ldr r2, [r2, r3]
    add r0, r2, r0
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_fd4:
    ldr r1, _LIT16
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c8390
    rsb r1, r0, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_ff4:
    ldrh r0, [r6, #0xc]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x3e8
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1014:
    ldrh r0, [r6, #0xc]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x320
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1034:
    ldr r1, [r6, #0x14]
    ldr r0, _LIT17
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b89c
    rsb r1, r0, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1064:
    ldr r1, [r6, #0x14]
    ldr r0, _LIT17
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b89c
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_108c:
    ldr r1, [r6, #0x14]
    ldr r0, _LIT17
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8cc
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_10b4:
    ldr r1, [r6, #0x14]
    ldr r0, _LIT17
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b89c
    rsb r0, r0, #0x0
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_10ec:
    ldr r1, [r6, #0x14]
    ldr r0, _LIT17
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8cc
    rsb r0, r0, #0x0
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1124:
    ldr r1, [r6, #0x14]
    ldr r0, _LIT17
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8cc
    rsb r1, r0, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1154:
    ldr r1, [r6, #0x14]
    ldr r0, _LIT17
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b854
    mov r1, #0x1f4
    rsb r1, r1, #0x0
    mul r1, r0, r1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_118c:
    ldr r1, [r6, #0x14]
    ldr r0, _LIT17
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b854
    mov r1, #0x12c
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_11bc:
    ldr r1, _LIT18
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_11cc:
    sub r1, r0, #0x2bc
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_11dc:
    ldr r1, _LIT19
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_11ec:
    ldr r2, [r6, #0x14]
    sub r1, r0, #0x190
    mov r0, r2, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mul r1, r0, r1
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1214:
    sub r1, r0, #0x7d0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1224:
    ldr r1, _LIT20
    and r2, ip, #0x1
    mul r3, r2, r1
    ldr r1, _LIT21
    sub r0, r0, #0x64
    ldr r1, [r1, r3]
    mul r0, r1, r0
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1248:
    ldr r1, _LIT20
    and r2, ip, #0x1
    mul r3, r2, r1
    ldr r1, _LIT22
    sub r0, r0, #0x12c
    ldr r1, [r1, r3]
    mul r0, r1, r0
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_126c:
    sub r1, r0, #0x1f4
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    mov r0, #0x1f4
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1284:
    ldrh r1, [r6, #0x2]
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x1
    moveq r0, #0x3e8
    subne r0, r0, #0x7d0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_12a4:
    rsb r6, r4, #0x1
    ldr r1, _LIT20
    and r3, r4, #0x1
    mul r4, r3, r1
    and r2, r6, #0x1
    mul r1, r2, r1
    ldr r3, _LIT23
    ldr r2, [r3, r4]
    ldr r1, [r3, r1]
    subs r1, r2, r1
    movpl r0, r1
    rsb r0, r0, #0x0
    str r0, [r5, r6, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_12dc:
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021bbc24
    mov r1, #0x258
    rsb r1, r1, #0x0
    mul r1, r0, r1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1300:
    ldr r1, _LIT24
    sub r2, r0, #0x3e8
    ldr r0, [r1]
    str r2, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1314:
    ldr r0, [r6, #0x14]
    mov r1, #0x3e8
    mov r0, r0, lsl #0xd
    rsb r1, r1, #0x0
    mov r0, r0, lsr #0x1f
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1330:
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b4190
    mov r1, r0, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, #0x1f4
    mov r2, r2, asr #0x8
    and r0, r0, #0xff
    rsb r1, r1, #0x0
    mul r3, r0, r1
    and r0, r2, #0xff
    mul r1, r0, r1
    str r3, [r5]
    str r1, [r5, #0x4]
    ldmia sp!, {r4, r5, r6, pc}
.L_1378:
    sub r1, r0, #0x3e8
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    streq r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_139c:
    mov r0, r2
    bl func_0202b89c
    ldr r1, [r6, #0x14]
    rsb r2, r0, #0x0
    mov r0, r1, lsl #0x16
    mov r0, r0, lsr #0x1f
    str r2, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_13bc:
    sub r1, r0, #0x320
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_13d0:
    mov r0, r4
    mov r1, #0x16
    bl func_ov002_021bd284
    mvn r1, #0xc7
    mul r1, r0, r1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_13f0:
    ldr r0, _LIT24
    ldr r1, [r0, #0xa8]
    cmp r1, r4
    bne .L_1414
    rsb r2, r4, #0x1
    ldr r1, [r5, r2, lsl #0x2]
    ldr r0, [r0, #0x9c]
    sub r0, r1, r0
    str r0, [r5, r2, lsl #0x2]
.L_1414:
    ldr r0, _LIT24
    ldr r1, [r0, #0xbc]
    cmp r1, r4
    ldmneia sp!, {r4, r5, r6, pc}
    rsb r2, r4, #0x1
    ldr r1, [r5, r2, lsl #0x2]
    ldr r0, [r0, #0xb0]
    sub r0, r1, r0
    str r0, [r5, r2, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_143c:
    mov r0, r4
    mov r1, #0x12
    bl func_ov002_021bbb78
    mvn r1, #0xc7
    mul r1, r0, r1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_145c:
    rsb r4, r4, #0x1
    ldr r1, _LIT20
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT25
    sub r0, r0, #0x64
    ldr r1, [r1, r3]
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1484:
    bl func_ov002_021bce20
    mov r1, #0x1f4
    mul r1, r0, r1
    sub r1, r1, #0x3e8
    str r1, [r5]
    cmp r1, #0x0
    movgt r1, #0x0
    mov r0, #0x1
    str r1, [r5]
    bl func_ov002_021bce20
    mov r1, #0x1f4
    mul r1, r0, r1
    sub r0, r1, #0x3e8
    str r0, [r5, #0x4]
    cmp r0, #0x0
    movgt r0, #0x0
    str r0, [r5, #0x4]
    ldmia sp!, {r4, r5, r6, pc}
.L_14cc:
    rsb r1, r4, #0x1
    ldr r0, _LIT20
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, _LIT26
    mov r0, #0x1f4
    ldr r1, [r1, r2]
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_14f4:
    ldrh r2, [r6, #0x2]
    mov r3, r2, lsl #0x12
    mov r3, r3, lsr #0x1e
    cmp r3, #0x2
    bne .L_1518
    sub r1, r0, #0x3e8
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1518:
    mov r2, r2, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x5
    subeq r0, r1, #0x1e00
    streq r0, [r5, r4, lsl #0x2]
    ldmeqia sp!, {r4, r5, r6, pc}
    sub r1, r0, #0x12c
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1540:
    ldr r1, _LIT27
    sub r0, r0, #0x190
    ldr r2, [r1, #0x484]
    rsb r1, r4, #0x1
    add r2, r2, #0x1
    mul r0, r2, r0
    str r0, [r5, r1, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_1560:
    mov r0, #0x320
    str r0, [r5, #0x4]
    str r0, [r5]
    ldmia sp!, {r4, r5, r6, pc}
.L_1570:
    sub r0, r0, #0x1f4
    str r0, [r5, #0x4]
    str r0, [r5]
    ldmia sp!, {r4, r5, r6, pc}
.L_1580:
    ldrh r1, [r6, #0x2]
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x2
    bne .L_15a4
    sub r1, r0, #0x7d0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_15a4:
    sub r1, r0, #0x1f4
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_15b4:
    ldr r1, _LIT28
    mov r0, r4
    bl func_ov002_021c31f4
    mvn r1, #0xc7
    mul r1, r0, r1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
_LIT17: .word data_ov002_022d0170
_LIT18: .word 0xfffffa24
_LIT19: .word 0xfffff448
_LIT20: .word 0x00000868
_LIT21: .word data_ov002_022cf0a0
_LIT22: .word data_ov002_022cf0a8
_LIT23: .word data_ov002_022cf08c
_LIT24: .word data_ov002_022cd314
_LIT25: .word data_ov002_022cf0a4
_LIT26: .word data_ov002_022cf098
_LIT27: .word data_ov002_022ce1a8
_LIT28: .word func_0202e204
