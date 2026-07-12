; func_ov002_0223e12c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b0ac
        .extern func_0202b798
        .extern func_ov002_021ae320
        .extern func_ov002_0229cd4c
        .global func_ov002_0223e12c
        .arm
func_ov002_0223e12c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x200
    mov r4, r0
    ldrh r3, [r4]
    ldr r2, _LIT0
    cmp r3, r2
    bgt .L_844
    bge .L_1118
    ldr r1, _LIT1
    cmp r3, r1
    bgt .L_478
    bge .L_1178
    ldr r0, _LIT2
    cmp r3, r0
    bgt .L_24c
    bge .L_1170
    sub r1, r0, #0x78
    cmp r3, r1
    bgt .L_160
    sub r1, r0, #0x7b
    cmp r3, r1
    blt .L_68
    subne r0, r0, #0x78
    cmpne r3, r0
    beq .L_1120
    b .L_1360
.L_68:
    ldr r1, _LIT3
    cmp r3, r1
    bgt .L_dc
    bge .L_1140
    ldr r1, _LIT4
    cmp r3, r1
    bgt .L_ac
    bge .L_1118
    sub r0, r1, #0x24
    cmp r3, r0
    bgt .L_9c
    beq .L_1110
    b .L_1360
.L_9c:
    sub r0, r1, #0x19
    cmp r3, r0
    beq .L_1108
    b .L_1360
.L_ac:
    add r0, r1, #0xc8
    cmp r3, r0
    bgt .L_cc
    bge .L_1138
    add r0, r1, #0x68
    cmp r3, r0
    beq .L_1110
    b .L_1360
.L_cc:
    add r0, r1, #0xe5
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_dc:
    add r0, r1, #0xac
    cmp r3, r0
    bgt .L_134
    bge .L_1168
    add r0, r1, #0x48
    cmp r3, r0
    bgt .L_124
    bge .L_1150
    add r0, r1, #0x20
    cmp r3, r0
    bgt .L_1360
    add r0, r1, #0x1f
    cmp r3, r0
    blt .L_1360
    addne r0, r1, #0x20
    cmpne r3, r0
    beq .L_1148
    b .L_1360
.L_124:
    add r0, r1, #0x6f
    cmp r3, r0
    beq .L_1160
    b .L_1360
.L_134:
    add r0, r1, #0xd8
    cmp r3, r0
    bgt .L_154
    bge .L_1180
    add r0, r1, #0xc8
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_154:
    cmp r3, #0x1280
    beq .L_1158
    b .L_1360
.L_160:
    sub r1, r0, #0x39
    cmp r3, r1
    bgt .L_1dc
    bge .L_1178
    sub r1, r0, #0x6e
    cmp r3, r1
    bgt .L_1ac
    bge .L_1110
    sub r1, r0, #0x72
    cmp r3, r1
    bgt .L_19c
    sub r0, r0, #0x72
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_19c:
    sub r0, r0, #0x6f
    cmp r3, r0
    beq .L_1118
    b .L_1360
.L_1ac:
    sub r1, r0, #0x53
    cmp r3, r1
    bgt .L_1cc
    bge .L_1158
    sub r0, r0, #0x64
    cmp r3, r0
    beq .L_10d4
    b .L_1360
.L_1cc:
    sub r0, r0, #0x41
    cmp r3, r0
    beq .L_10e8
    b .L_1360
.L_1dc:
    sub r1, r0, #0x11
    cmp r3, r1
    bgt .L_21c
    bge .L_1140
    sub r1, r0, #0x1a
    cmp r3, r1
    bgt .L_20c
    bge .L_11a0
    sub r0, r0, #0x2b
    cmp r3, r0
    beq .L_1170
    b .L_1360
.L_20c:
    sub r0, r0, #0x16
    cmp r3, r0
    beq .L_1110
    b .L_1360
.L_21c:
    sub r1, r0, #0xa
    cmp r3, r1
    bgt .L_23c
    bge .L_11b0
    sub r0, r0, #0xb
    cmp r3, r0
    beq .L_11a8
    b .L_1360
.L_23c:
    sub r0, r0, #0x4
    cmp r3, r0
    beq .L_1148
    b .L_1360
.L_24c:
    add r2, r0, #0xaf
    cmp r3, r2
    bgt .L_374
    mov r1, r2
    cmp r3, r1
    bge .L_1170
    add r1, r0, #0x51
    cmp r3, r1
    bgt .L_304
    bge .L_11d0
    add r1, r0, #0x2a
    cmp r3, r1
    bgt .L_2b0
    bge .L_11c8
    add r1, r0, #0xe
    cmp r3, r1
    bgt .L_2a0
    add r0, r0, #0xe
    cmp r3, r0
    beq .L_11c0
    b .L_1360
.L_2a0:
    add r0, r0, #0x26
    cmp r3, r0
    beq .L_1178
    b .L_1360
.L_2b0:
    add r1, r0, #0x4f
    cmp r3, r1
    bgt .L_2f4
    bge .L_1148
    add r0, r0, #0x2d
    sub r0, r3, r0
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_1360
    b .L_11a8
    b .L_11b0
    b .L_1360
    b .L_1360
    b .L_11d0
    b .L_1360
    b .L_1360
    b .L_11b8
.L_2f4:
    ldr r0, _LIT5
    cmp r3, r0
    beq .L_11d0
    b .L_1360
.L_304:
    add r1, r0, #0x80
    cmp r3, r1
    bgt .L_344
    bge .L_11d8
    add r1, r0, #0x67
    cmp r3, r1
    bgt .L_334
    bge .L_11e0
    add r0, r0, #0x66
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_334:
    add r0, r0, #0x68
    cmp r3, r0
    beq .L_11e8
    b .L_1360
.L_344:
    add r1, r0, #0x91
    cmp r3, r1
    bgt .L_364
    bge .L_1148
    add r0, r0, #0x8c
    cmp r3, r0
    beq .L_1158
    b .L_1360
.L_364:
    add r0, r0, #0xa2
    cmp r3, r0
    beq .L_1118
    b .L_1360
.L_374:
    sub r2, r1, #0x64
    cmp r3, r2
    bgt .L_400
    bge .L_1290
    add r2, r0, #0xed
    cmp r3, r2
    bgt .L_3c8
    mov r1, r2
    cmp r3, r1
    bge .L_10b4
    add r1, r0, #0xb4
    cmp r3, r1
    bgt .L_3b8
    add r0, r0, #0xb4
    cmp r3, r0
    beq .L_1230
    b .L_1360
.L_3b8:
    add r0, r0, #0xe7
    cmp r3, r0
    beq .L_1130
    b .L_1360
.L_3c8:
    add r2, r0, #0xf4
    cmp r3, r2
    bgt .L_3f0
    mov r1, r2
    cmp r3, r1
    bge .L_1318
    add r0, r0, #0xef
    cmp r3, r0
    beq .L_11f0
    b .L_1360
.L_3f0:
    sub r0, r1, #0x68
    cmp r3, r0
    beq .L_1338
    b .L_1360
.L_400:
    add r2, r0, #0x124
    cmp r3, r2
    bgt .L_448
    bge .L_1190
    add r2, r0, #0x110
    cmp r3, r2
    bgt .L_438
    add r0, r0, #0x110
    cmp r3, r0
    bge .L_1198
    sub r0, r1, #0x5c
    cmp r3, r0
    beq .L_10f0
    b .L_1360
.L_438:
    sub r0, r1, #0x54
    cmp r3, r0
    beq .L_1310
    b .L_1360
.L_448:
    sub r0, r1, #0x2b
    cmp r3, r0
    bgt .L_468
    bge .L_12b0
    sub r0, r1, #0x38
    cmp r3, r0
    beq .L_1118
    b .L_1360
.L_468:
    sub r0, r1, #0x8
    cmp r3, r0
    beq .L_1148
    b .L_1360
.L_478:
    add r0, r1, #0xc5
    cmp r3, r0
    bgt .L_660
    bge .L_11d0
    add r0, r1, #0x5d
    cmp r3, r0
    bgt .L_57c
    bge .L_1340
    add r0, r1, #0x24
    cmp r3, r0
    bgt .L_50c
    bge .L_10f0
    add r0, r1, #0x10
    cmp r3, r0
    bgt .L_4dc
    bge .L_10f8
    add r0, r1, #0x5
    cmp r3, r0
    bgt .L_4cc
    beq .L_1320
    b .L_1360
.L_4cc:
    add r0, r1, #0xf
    cmp r3, r0
    beq .L_11f8
    b .L_1360
.L_4dc:
    add r0, r1, #0x1f
    cmp r3, r0
    bgt .L_4fc
    bge .L_1100
    add r0, r1, #0x18
    cmp r3, r0
    beq .L_1328
    b .L_1360
.L_4fc:
    add r0, r1, #0x21
    cmp r3, r0
    beq .L_1100
    b .L_1360
.L_50c:
    add r0, r1, #0x46
    cmp r3, r0
    bgt .L_54c
    bge .L_1128
    add r0, r1, #0x2c
    cmp r3, r0
    bgt .L_53c
    bge .L_11a8
    add r0, r1, #0x27
    cmp r3, r0
    beq .L_1158
    b .L_1360
.L_53c:
    add r0, r1, #0x35
    cmp r3, r0
    beq .L_1330
    b .L_1360
.L_54c:
    add r0, r1, #0x53
    cmp r3, r0
    bgt .L_56c
    bge .L_1158
    add r0, r1, #0x4c
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_56c:
    add r0, r1, #0x55
    cmp r3, r0
    beq .L_1158
    b .L_1360
.L_57c:
    add r0, r1, #0x7b
    cmp r3, r0
    bgt .L_5f0
    bge .L_11d0
    add r0, r1, #0x67
    cmp r3, r0
    bgt .L_5c0
    bge .L_1250
    add r0, r1, #0x5f
    cmp r3, r0
    bgt .L_5b0
    beq .L_1148
    b .L_1360
.L_5b0:
    add r0, r1, #0x65
    cmp r3, r0
    beq .L_1148
    b .L_1360
.L_5c0:
    add r0, r1, #0x6d
    cmp r3, r0
    bgt .L_5e0
    bge .L_1348
    add r0, r1, #0x68
    cmp r3, r0
    beq .L_1270
    b .L_1360
.L_5e0:
    add r0, r1, #0x7a
    cmp r3, r0
    beq .L_1148
    b .L_1360
.L_5f0:
    add r0, r1, #0x9d
    cmp r3, r0
    bgt .L_630
    bge .L_1100
    add r0, r1, #0x85
    cmp r3, r0
    bgt .L_620
    bge .L_1158
    add r0, r1, #0x83
    cmp r3, r0
    beq .L_1150
    b .L_1360
.L_620:
    add r0, r1, #0x96
    cmp r3, r0
    beq .L_12d0
    b .L_1360
.L_630:
    add r0, r1, #0xae
    cmp r3, r0
    bgt .L_650
    bge .L_1340
    add r0, r1, #0xab
    cmp r3, r0
    beq .L_1158
    b .L_1360
.L_650:
    add r0, r1, #0xc4
    cmp r3, r0
    beq .L_1118
    b .L_1360
.L_660:
    add r0, r1, #0x170
    cmp r3, r0
    bgt .L_754
    bge .L_11d0
    sub r0, r2, #0xee
    cmp r3, r0
    bgt .L_6e4
    bge .L_1128
    ldr r1, _LIT6
    cmp r3, r1
    bgt .L_6b4
    bge .L_1148
    sub r0, r1, #0x35
    cmp r3, r0
    bgt .L_6a4
    beq .L_1158
    b .L_1360
.L_6a4:
    sub r0, r1, #0x34
    cmp r3, r0
    beq .L_1348
    b .L_1360
.L_6b4:
    add r0, r1, #0xe
    cmp r3, r0
    bgt .L_6d4
    bge .L_1190
    add r0, r1, #0xd
    cmp r3, r0
    beq .L_1150
    b .L_1360
.L_6d4:
    add r0, r1, #0xf
    cmp r3, r0
    beq .L_1158
    b .L_1360
.L_6e4:
    sub r0, r2, #0xc7
    cmp r3, r0
    bgt .L_724
    bge .L_1340
    sub r0, r2, #0xe2
    cmp r3, r0
    bgt .L_714
    bge .L_1100
    sub r0, r2, #0xe8
    cmp r3, r0
    beq .L_1150
    b .L_1360
.L_714:
    add r0, r1, #0x128
    cmp r3, r0
    beq .L_1160
    b .L_1360
.L_724:
    sub r0, r2, #0xbb
    cmp r3, r0
    bgt .L_744
    bge .L_1340
    sub r0, r2, #0xbe
    cmp r3, r0
    beq .L_11d8
    b .L_1360
.L_744:
    sub r0, r2, #0xb7
    cmp r3, r0
    beq .L_1198
    b .L_1360
.L_754:
    sub r0, r2, #0x70
    cmp r3, r0
    bgt .L_7d4
    bge .L_1158
    sub r0, r2, #0x86
    cmp r3, r0
    bgt .L_7a4
    bge .L_1350
    sub r0, r2, #0x97
    cmp r3, r0
    bgt .L_794
    bge .L_1128
    sub r0, r2, #0x98
    cmp r3, r0
    beq .L_11d0
    b .L_1360
.L_794:
    sub r0, r2, #0x8b
    cmp r3, r0
    beq .L_1158
    b .L_1360
.L_7a4:
    sub r0, r2, #0x76
    cmp r3, r0
    bgt .L_7c4
    bge .L_11d8
    sub r0, r2, #0x7a
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_7c4:
    add r0, r1, #0x194
    cmp r3, r0
    beq .L_1118
    b .L_1360
.L_7d4:
    sub r0, r2, #0x58
    cmp r3, r0
    bgt .L_814
    bge .L_11d0
    sub r0, r2, #0x5c
    cmp r3, r0
    bgt .L_804
    bge .L_1118
    add r0, r1, #0x1a8
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_804:
    sub r0, r2, #0x5a
    cmp r3, r0
    beq .L_1148
    b .L_1360
.L_814:
    sub r0, r2, #0x24
    cmp r3, r0
    bgt .L_834
    bge .L_1118
    add r0, r1, #0x1b8
    cmp r3, r0
    beq .L_11d0
    b .L_1360
.L_834:
    sub r0, r2, #0x6
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_844:
    ldr r1, _LIT7
    cmp r3, r1
    bgt .L_cb4
    bge .L_1158
    ldr r0, _LIT8
    cmp r3, r0
    bgt .L_a60
    bge .L_1128
    sub ip, r0, #0xe2
    cmp r3, ip
    bgt .L_974
    bge .L_11a8
    add ip, r2, #0x2c
    cmp r3, ip
    bgt .L_8f8
    bge .L_1190
    sub ip, r1, #0x284
    cmp r3, ip
    bgt .L_8c8
    sub r1, r1, #0x284
    cmp r3, r1
    bge .L_1128
    add r1, r2, #0xc
    cmp r3, r1
    bgt .L_8b8
    mov r0, r1
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_8b8:
    sub r0, r0, #0x134
    cmp r3, r0
    beq .L_1340
    b .L_1360
.L_8c8:
    sub r1, r0, #0x11c
    cmp r3, r1
    bgt .L_8e8
    bge .L_1348
    sub r0, r0, #0x120
    cmp r3, r0
    beq .L_11a8
    b .L_1360
.L_8e8:
    add r0, r2, #0x2b
    cmp r3, r0
    beq .L_1178
    b .L_1360
.L_8f8:
    sub r1, r0, #0xf6
    cmp r3, r1
    bgt .L_940
    bge .L_1108
    sub r1, r0, #0xfe
    cmp r3, r1
    bgt .L_930
    sub r0, r0, #0xfe
    cmp r3, r0
    bge .L_11d8
    add r0, r2, #0x33
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_930:
    sub r0, r0, #0xf8
    cmp r3, r0
    beq .L_1110
    b .L_1360
.L_940:
    sub r1, r0, #0xe7
    cmp r3, r1
    bgt .L_964
    sub r0, r0, #0xe7
    cmp r3, r0
    bge .L_1350
    cmp r3, #0x16c0
    beq .L_1148
    b .L_1360
.L_964:
    sub r0, r0, #0xe5
    cmp r3, r0
    beq .L_1350
    b .L_1360
.L_974:
    sub r1, r0, #0x63
    cmp r3, r1
    bgt .L_9f0
    bge .L_1148
    sub r1, r0, #0x98
    cmp r3, r1
    bgt .L_9c0
    bge .L_1188
    sub r1, r0, #0xcd
    cmp r3, r1
    bgt .L_9b0
    sub r0, r0, #0xcd
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_9b0:
    sub r0, r0, #0xa8
    cmp r3, r0
    beq .L_1340
    b .L_1360
.L_9c0:
    sub r1, r0, #0x86
    cmp r3, r1
    bgt .L_9e0
    bge .L_1348
    sub r0, r0, #0x96
    cmp r3, r0
    beq .L_1150
    b .L_1360
.L_9e0:
    sub r0, r0, #0x64
    cmp r3, r0
    beq .L_1340
    b .L_1360
.L_9f0:
    sub r1, r0, #0x3d
    cmp r3, r1
    bgt .L_a30
    bge .L_1148
    sub r1, r0, #0x53
    cmp r3, r1
    bgt .L_a20
    bge .L_1190
    sub r0, r0, #0x5d
    cmp r3, r0
    beq .L_11d0
    b .L_1360
.L_a20:
    sub r0, r0, #0x4d
    cmp r3, r0
    beq .L_1158
    b .L_1360
.L_a30:
    sub r1, r0, #0x16
    cmp r3, r1
    bgt .L_a50
    bge .L_1118
    sub r0, r0, #0x22
    cmp r3, r0
    beq .L_1348
    b .L_1360
.L_a50:
    sub r0, r0, #0x11
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_a60:
    add r2, r0, #0xb8
    cmp r3, r2
    bgt .L_b64
    mov r1, r2
    cmp r3, r1
    bge .L_1118
    add r1, r0, #0x69
    cmp r3, r1
    bgt .L_af4
    bge .L_1190
    add r1, r0, #0x30
    cmp r3, r1
    bgt .L_ac4
    bge .L_1170
    add r1, r0, #0x8
    cmp r3, r1
    bgt .L_ab4
    add r0, r0, #0x8
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_ab4:
    add r0, r0, #0x2a
    cmp r3, r0
    beq .L_1118
    b .L_1360
.L_ac4:
    add r1, r0, #0x4c
    cmp r3, r1
    bgt .L_ae4
    bge .L_1190
    add r0, r0, #0x46
    cmp r3, r0
    beq .L_12f0
    b .L_1360
.L_ae4:
    add r0, r0, #0x4f
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_af4:
    add r1, r0, #0x9b
    cmp r3, r1
    bgt .L_b34
    bge .L_1158
    add r1, r0, #0x92
    cmp r3, r1
    bgt .L_b24
    bge .L_1130
    add r0, r0, #0x8f
    cmp r3, r0
    beq .L_11d0
    b .L_1360
.L_b24:
    add r0, r0, #0x94
    cmp r3, r0
    beq .L_1158
    b .L_1360
.L_b34:
    add r1, r0, #0xaf
    cmp r3, r1
    bgt .L_b54
    bge .L_1340
    add r0, r0, #0xa3
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_b54:
    add r0, r0, #0xb3
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_b64:
    add r2, r0, #0xe3
    cmp r3, r2
    bgt .L_be8
    mov r1, r2
    cmp r3, r1
    bge .L_1190
    add r1, r0, #0xbe
    cmp r3, r1
    bgt .L_bb8
    bge .L_1108
    add r1, r0, #0xba
    cmp r3, r1
    bgt .L_ba8
    add r0, r0, #0xba
    cmp r3, r0
    beq .L_1148
    b .L_1360
.L_ba8:
    add r0, r0, #0xbb
    cmp r3, r0
    beq .L_1118
    b .L_1360
.L_bb8:
    add r1, r0, #0xda
    cmp r3, r1
    bgt .L_bd8
    bge .L_1190
    add r0, r0, #0xd9
    cmp r3, r0
    beq .L_1150
    b .L_1360
.L_bd8:
    add r0, r0, #0xe0
    cmp r3, r0
    beq .L_11a8
    b .L_1360
.L_be8:
    sub r2, r1, #0x4a
    cmp r3, r2
    bgt .L_c30
    mov r0, r2
    cmp r3, r0
    bge .L_1170
    sub r0, r1, #0x4e
    cmp r3, r0
    bgt .L_c20
    bge .L_1118
    sub r0, r1, #0x4f
    cmp r3, r0
    beq .L_1108
    b .L_1360
.L_c20:
    sub r0, r1, #0x4b
    cmp r3, r0
    beq .L_1148
    b .L_1360
.L_c30:
    sub r2, r1, #0x36
    cmp r3, r2
    bgt .L_ca4
    sub r0, r1, #0x48
    subs r0, r3, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_c98
    b .L_1170
    b .L_1170
    b .L_1360
    b .L_1360
    b .L_1360
    b .L_1170
    b .L_1360
    b .L_1360
    b .L_1148
    b .L_11a8
    b .L_1190
    b .L_1360
    b .L_1360
    b .L_1360
    b .L_1360
    b .L_1360
    b .L_1360
    b .L_1360
    b .L_1190
.L_c98:
    cmp r3, #0x18c0
    beq .L_1170
    b .L_1360
.L_ca4:
    add r0, r0, #0x140
    cmp r3, r0
    beq .L_1160
    b .L_1360
.L_cb4:
    add r0, r1, #0x12c
    cmp r3, r0
    bgt .L_e9c
    bge .L_1340
    add r0, r1, #0xab
    cmp r3, r0
    bgt .L_db8
    bge .L_1128
    add r0, r1, #0x4a
    cmp r3, r0
    bgt .L_d48
    bge .L_1128
    add r0, r1, #0x1c
    cmp r3, r0
    bgt .L_d18
    bge .L_1358
    add r0, r1, #0x5
    cmp r3, r0
    bgt .L_d08
    beq .L_1158
    b .L_1360
.L_d08:
    add r0, r1, #0xa
    cmp r3, r0
    beq .L_1100
    b .L_1360
.L_d18:
    add r0, r1, #0x24
    cmp r3, r0
    bgt .L_d38
    bge .L_11a8
    add r0, r1, #0x22
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_d38:
    add r0, r1, #0x3c
    cmp r3, r0
    beq .L_1158
    b .L_1360
.L_d48:
    add r0, r1, #0x6f
    cmp r3, r0
    bgt .L_d88
    bge .L_1190
    add r0, r1, #0x52
    cmp r3, r0
    bgt .L_d78
    bge .L_1190
    add r0, r1, #0x4e
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_d78:
    add r0, r1, #0x59
    cmp r3, r0
    beq .L_11d0
    b .L_1360
.L_d88:
    add r0, r1, #0xa0
    cmp r3, r0
    bgt .L_da8
    bge .L_1148
    add r0, r1, #0x9a
    cmp r3, r0
    beq .L_11d8
    b .L_1360
.L_da8:
    add r0, r1, #0xa2
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_db8:
    add r0, r1, #0xeb
    cmp r3, r0
    bgt .L_e2c
    bge .L_1118
    add r0, r1, #0xd3
    cmp r3, r0
    bgt .L_dfc
    bge .L_1190
    add r0, r1, #0xbf
    cmp r3, r0
    bgt .L_dec
    beq .L_11d8
    b .L_1360
.L_dec:
    add r0, r1, #0xd2
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_dfc:
    add r0, r1, #0xe8
    cmp r3, r0
    bgt .L_e1c
    bge .L_1158
    add r0, r1, #0xd4
    cmp r3, r0
    beq .L_1188
    b .L_1360
.L_e1c:
    add r0, r1, #0xea
    cmp r3, r0
    beq .L_11d0
    b .L_1360
.L_e2c:
    add r0, r2, #0x3a0
    cmp r3, r0
    bgt .L_e6c
    bge .L_1190
    add r0, r1, #0x100
    cmp r3, r0
    bgt .L_e5c
    bge .L_1118
    add r0, r1, #0xf9
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_e5c:
    add r0, r1, #0x104
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_e6c:
    ldr r0, _LIT9
    cmp r3, r0
    bgt .L_e8c
    bge .L_1340
    sub r0, r0, #0x2
    cmp r3, r0
    beq .L_11d0
    b .L_1360
.L_e8c:
    add r0, r0, #0x14
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_e9c:
    ldr r0, _LIT10
    cmp r3, r0
    bgt .L_f98
    bge .L_1340
    sub r1, r0, #0x4c
    cmp r3, r1
    bgt .L_f28
    bge .L_11d0
    sub r1, r0, #0x5a
    cmp r3, r1
    bgt .L_ef8
    bge .L_1128
    sub r1, r0, #0x7d
    cmp r3, r1
    bgt .L_ee8
    sub r0, r0, #0x7d
    cmp r3, r0
    beq .L_1158
    b .L_1360
.L_ee8:
    sub r0, r0, #0x76
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_ef8:
    sub r1, r0, #0x50
    cmp r3, r1
    bgt .L_f18
    bge .L_11d0
    sub r0, r0, #0x54
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_f18:
    sub r0, r0, #0x4e
    cmp r3, r0
    beq .L_1170
    b .L_1360
.L_f28:
    sub r1, r0, #0x14
    cmp r3, r1
    bgt .L_f68
    bge .L_1128
    sub r1, r0, #0x31
    cmp r3, r1
    bgt .L_f58
    bge .L_11d8
    sub r0, r0, #0x44
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_f58:
    sub r0, r0, #0x2f
    cmp r3, r0
    beq .L_1190
    b .L_1360
.L_f68:
    sub r1, r0, #0x12
    cmp r3, r1
    bgt .L_f88
    bge .L_1128
    sub r0, r0, #0x13
    cmp r3, r0
    beq .L_1128
    b .L_1360
.L_f88:
    sub r0, r0, #0xb
    cmp r3, r0
    beq .L_1340
    b .L_1360
.L_f98:
    add r1, r0, #0x55
    cmp r3, r1
    bgt .L_1044
    bge .L_11d0
    add r1, r0, #0x13
    cmp r3, r1
    bgt .L_1014
    bge .L_1190
    add r1, r0, #0x10
    cmp r3, r1
    bgt .L_1004
    bge .L_11d0
    add r0, r0, #0x8
    cmp r3, r0
    beq .L_1128
    b .L_1360
_LIT0: .word 0x0000166f
_LIT1: .word 0x00001466
_LIT2: .word 0x000012fc
_LIT3: .word 0x0000117b
_LIT4: .word 0x0000101e
_LIT5: .word 0x0000134c
_LIT6: .word 0x0000156c
_LIT7: .word 0x00001909
_LIT8: .word 0x000017b0
_LIT9: .word 0x00001a1e
_LIT10: .word 0x00001aea
.L_1004:
    add r0, r0, #0x11
    cmp r3, r0
    beq .L_1158
    b .L_1360
.L_1014:
    add r1, r0, #0x37
    cmp r3, r1
    bgt .L_1034
    bge .L_1190
    add r0, r0, #0x34
    cmp r3, r0
    beq .L_1118
    b .L_1360
.L_1034:
    add r0, r0, #0x54
    cmp r3, r0
    beq .L_1148
    b .L_1360
.L_1044:
    add r1, r0, #0x64
    cmp r3, r1
    bgt .L_1084
    bge .L_1108
    add r1, r0, #0x58
    cmp r3, r1
    bgt .L_1074
    bge .L_1170
    add r0, r0, #0x57
    cmp r3, r0
    beq .L_1170
    b .L_1360
.L_1074:
    add r0, r0, #0x59
    cmp r3, r0
    beq .L_1170
    b .L_1360
.L_1084:
    add r1, r0, #0x79
    cmp r3, r1
    bgt .L_10a4
    bge .L_1148
    add r0, r0, #0x6d
    cmp r3, r0
    beq .L_11d0
    b .L_1360
.L_10a4:
    add r0, r0, #0x7a
    cmp r3, r0
    beq .L_1148
    b .L_1360
.L_10b4:
    add r0, r0, #0xee
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x45
    bl func_ov002_0229cd4c
    add r1, sp, #0x100
    b .L_1364
.L_10d4:
    ldrh r0, [r4, #0xc]
    cmp r0, #0x2
    moveq r1, #0x8b
    ldrne r1, _LIT11
    b .L_1364
.L_10e8:
    mov r1, #0x44
    b .L_1364
.L_10f0:
    mov r1, #0xf
    b .L_1364
.L_10f8:
    mov r1, #0x10
    b .L_1364
.L_1100:
    mov r1, #0x57
    b .L_1364
.L_1108:
    mov r1, #0x61
    b .L_1364
.L_1110:
    mov r1, #0x5f
    b .L_1364
.L_1118:
    mov r1, #0x62
    b .L_1364
.L_1120:
    mov r1, #0x63
    b .L_1364
.L_1128:
    mov r1, #0x64
    b .L_1364
.L_1130:
    mov r1, #0x65
    b .L_1364
.L_1138:
    mov r1, #0x66
    b .L_1364
.L_1140:
    mov r1, #0x6b
    b .L_1364
.L_1148:
    mov r1, #0x6d
    b .L_1364
.L_1150:
    mov r1, #0x6e
    b .L_1364
.L_1158:
    mov r1, #0x6f
    b .L_1364
.L_1160:
    mov r1, #0x70
    b .L_1364
.L_1168:
    mov r1, #0x76
    b .L_1364
.L_1170:
    mov r1, #0x77
    b .L_1364
.L_1178:
    mov r1, #0x78
    b .L_1364
.L_1180:
    mov r1, #0x7a
    b .L_1364
.L_1188:
    mov r1, #0x7b
    b .L_1364
.L_1190:
    mov r1, #0x7c
    b .L_1364
.L_1198:
    mov r1, #0x7e
    b .L_1364
.L_11a0:
    mov r1, #0x80
    b .L_1364
.L_11a8:
    mov r1, #0x85
    b .L_1364
.L_11b0:
    mov r1, #0x86
    b .L_1364
.L_11b8:
    mov r1, #0x87
    b .L_1364
.L_11c0:
    mov r1, #0x88
    b .L_1364
.L_11c8:
    mov r1, #0x89
    b .L_1364
.L_11d0:
    mov r1, #0x8d
    b .L_1364
.L_11d8:
    mov r1, #0x8e
    b .L_1364
.L_11e0:
    mov r1, #0x8f
    b .L_1364
.L_11e8:
    mov r1, #0x90
    b .L_1364
.L_11f0:
    mov r1, #0x96
    b .L_1364
.L_11f8:
    ldr r0, _LIT12
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x97
    bl func_ov002_0229cd4c
    mov r0, #0x13
    bl func_0202b798
    mov r2, r0
    add r0, sp, #0x100
    add r1, sp, #0x0
    bl func_ov002_0229cd4c
    add r1, sp, #0x100
    b .L_1364
.L_1230:
    mov r0, #0x7
    bl func_0202b798
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x98
    bl func_ov002_0229cd4c
    add r1, sp, #0x100
    b .L_1364
.L_1250:
    mov r0, #0x3
    bl func_0202b798
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x98
    bl func_ov002_0229cd4c
    add r1, sp, #0x100
    b .L_1364
.L_1270:
    mov r0, #0x1
    bl func_0202b798
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x98
    bl func_ov002_0229cd4c
    add r1, sp, #0x100
    b .L_1364
.L_1290:
    add r0, r0, #0xcb
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x99
    bl func_ov002_0229cd4c
    add r1, sp, #0x100
    b .L_1364
.L_12b0:
    sub r0, r1, #0x2d
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x99
    bl func_ov002_0229cd4c
    add r1, sp, #0x100
    b .L_1364
.L_12d0:
    sub r0, r1, #0x52
    bl func_0202b0ac
    mov r2, r0
    ldr r1, _LIT13
    add r0, sp, #0x100
    bl func_ov002_0229cd4c
    add r1, sp, #0x100
    b .L_1364
.L_12f0:
    ldr r0, _LIT14
    bl func_0202b0ac
    mov r2, r0
    ldr r1, _LIT13
    add r0, sp, #0x100
    bl func_ov002_0229cd4c
    add r1, sp, #0x100
    b .L_1364
.L_1310:
    mov r1, #0x9d
    b .L_1364
.L_1318:
    mov r1, #0x9e
    b .L_1364
.L_1320:
    mov r1, #0xa3
    b .L_1364
.L_1328:
    mov r1, #0xa6
    b .L_1364
.L_1330:
    mov r1, #0xa7
    b .L_1364
.L_1338:
    mov r1, #0xa8
    b .L_1364
.L_1340:
    ldr r1, _LIT11
    b .L_1364
.L_1348:
    ldr r1, _LIT15
    b .L_1364
.L_1350:
    ldr r1, _LIT16
    b .L_1364
.L_1358:
    mov r1, #0x95
    b .L_1364
.L_1360:
    ldr r1, _LIT17
.L_1364:
    ldrh r2, [r4, #0x2]
    mov r0, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r0, r0, r2, lsr #0x1f
    bl func_ov002_021ae320
    add sp, sp, #0x200
    ldmia sp!, {r4, pc}
_LIT11: .word 0x00000119
_LIT12: .word 0x00000fbc
_LIT13: .word 0x00000127
_LIT14: .word 0x00000ff8
_LIT15: .word 0x0000011a
_LIT16: .word 0x00000125
_LIT17: .word 0x00000112
