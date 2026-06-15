; func_ov002_0223e21c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b100
        .extern func_0202b7ec
        .extern func_ov002_021ae400
        .extern func_ov002_0229ce5c
        .global func_ov002_0223e21c
        .arm
func_ov002_0223e21c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x200
    mov r4, r0
    ldrh r3, [r4]
    ldr r2, _LIT0
    cmp r3, r2
    bgt .L_b28
    bge .L_13fc
    ldr r1, _LIT1
    cmp r3, r1
    bgt .L_75c
    bge .L_145c
    ldr r0, _LIT2
    cmp r3, r0
    bgt .L_530
    bge .L_1454
    sub r1, r0, #0x78
    cmp r3, r1
    bgt .L_444
    sub r1, r0, #0x7b
    cmp r3, r1
    blt .L_34c
    subne r0, r0, #0x78
    cmpne r3, r0
    beq .L_1404
    b .L_163c
.L_34c:
    ldr r1, _LIT3
    cmp r3, r1
    bgt .L_3c0
    bge .L_1424
    ldr r1, _LIT4
    cmp r3, r1
    bgt .L_390
    bge .L_13fc
    sub r0, r1, #0x24
    cmp r3, r0
    bgt .L_380
    beq .L_13f4
    b .L_163c
.L_380:
    sub r0, r1, #0x19
    cmp r3, r0
    beq .L_13ec
    b .L_163c
.L_390:
    add r0, r1, #0xc8
    cmp r3, r0
    bgt .L_3b0
    bge .L_141c
    add r0, r1, #0x68
    cmp r3, r0
    beq .L_13f4
    b .L_163c
.L_3b0:
    add r0, r1, #0xe5
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_3c0:
    add r0, r1, #0xac
    cmp r3, r0
    bgt .L_418
    bge .L_144c
    add r0, r1, #0x48
    cmp r3, r0
    bgt .L_408
    bge .L_1434
    add r0, r1, #0x20
    cmp r3, r0
    bgt .L_163c
    add r0, r1, #0x1f
    cmp r3, r0
    blt .L_163c
    addne r0, r1, #0x20
    cmpne r3, r0
    beq .L_142c
    b .L_163c
.L_408:
    add r0, r1, #0x6f
    cmp r3, r0
    beq .L_1444
    b .L_163c
.L_418:
    add r0, r1, #0xd8
    cmp r3, r0
    bgt .L_438
    bge .L_1464
    add r0, r1, #0xc8
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_438:
    cmp r3, #0x1280
    beq .L_143c
    b .L_163c
.L_444:
    sub r1, r0, #0x39
    cmp r3, r1
    bgt .L_4c0
    bge .L_145c
    sub r1, r0, #0x6e
    cmp r3, r1
    bgt .L_490
    bge .L_13f4
    sub r1, r0, #0x72
    cmp r3, r1
    bgt .L_480
    sub r0, r0, #0x72
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_480:
    sub r0, r0, #0x6f
    cmp r3, r0
    beq .L_13fc
    b .L_163c
.L_490:
    sub r1, r0, #0x53
    cmp r3, r1
    bgt .L_4b0
    bge .L_143c
    sub r0, r0, #0x64
    cmp r3, r0
    beq .L_13b8
    b .L_163c
.L_4b0:
    sub r0, r0, #0x41
    cmp r3, r0
    beq .L_13cc
    b .L_163c
.L_4c0:
    sub r1, r0, #0x11
    cmp r3, r1
    bgt .L_500
    bge .L_1424
    sub r1, r0, #0x1a
    cmp r3, r1
    bgt .L_4f0
    bge .L_1484
    sub r0, r0, #0x2b
    cmp r3, r0
    beq .L_1454
    b .L_163c
.L_4f0:
    sub r0, r0, #0x16
    cmp r3, r0
    beq .L_13f4
    b .L_163c
.L_500:
    sub r1, r0, #0xa
    cmp r3, r1
    bgt .L_520
    bge .L_1494
    sub r0, r0, #0xb
    cmp r3, r0
    beq .L_148c
    b .L_163c
.L_520:
    sub r0, r0, #0x4
    cmp r3, r0
    beq .L_142c
    b .L_163c
.L_530:
    add r2, r0, #0xaf
    cmp r3, r2
    bgt .L_658
    mov r1, r2
    cmp r3, r1
    bge .L_1454
    add r1, r0, #0x51
    cmp r3, r1
    bgt .L_5e8
    bge .L_14b4
    add r1, r0, #0x2a
    cmp r3, r1
    bgt .L_594
    bge .L_14ac
    add r1, r0, #0xe
    cmp r3, r1
    bgt .L_584
    add r0, r0, #0xe
    cmp r3, r0
    beq .L_14a4
    b .L_163c
.L_584:
    add r0, r0, #0x26
    cmp r3, r0
    beq .L_145c
    b .L_163c
.L_594:
    add r1, r0, #0x4f
    cmp r3, r1
    bgt .L_5d8
    bge .L_142c
    add r0, r0, #0x2d
    sub r0, r3, r0
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_163c
    b .L_148c
    b .L_1494
    b .L_163c
    b .L_163c
    b .L_14b4
    b .L_163c
    b .L_163c
    b .L_149c
.L_5d8:
    ldr r0, _LIT5
    cmp r3, r0
    beq .L_14b4
    b .L_163c
.L_5e8:
    add r1, r0, #0x80
    cmp r3, r1
    bgt .L_628
    bge .L_14bc
    add r1, r0, #0x67
    cmp r3, r1
    bgt .L_618
    bge .L_14c4
    add r0, r0, #0x66
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_618:
    add r0, r0, #0x68
    cmp r3, r0
    beq .L_14cc
    b .L_163c
.L_628:
    add r1, r0, #0x91
    cmp r3, r1
    bgt .L_648
    bge .L_142c
    add r0, r0, #0x8c
    cmp r3, r0
    beq .L_143c
    b .L_163c
.L_648:
    add r0, r0, #0xa2
    cmp r3, r0
    beq .L_13fc
    b .L_163c
.L_658:
    sub r2, r1, #0x64
    cmp r3, r2
    bgt .L_6e4
    bge .L_156c
    add r2, r0, #0xed
    cmp r3, r2
    bgt .L_6ac
    mov r1, r2
    cmp r3, r1
    bge .L_1398
    add r1, r0, #0xb4
    cmp r3, r1
    bgt .L_69c
    add r0, r0, #0xb4
    cmp r3, r0
    beq .L_150c
    b .L_163c
.L_69c:
    add r0, r0, #0xe7
    cmp r3, r0
    beq .L_1414
    b .L_163c
.L_6ac:
    add r2, r0, #0xf4
    cmp r3, r2
    bgt .L_6d4
    mov r1, r2
    cmp r3, r1
    bge .L_15f4
    add r0, r0, #0xef
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_6d4:
    sub r0, r1, #0x68
    cmp r3, r0
    beq .L_1614
    b .L_163c
.L_6e4:
    add r2, r0, #0x124
    cmp r3, r2
    bgt .L_72c
    bge .L_1474
    add r2, r0, #0x110
    cmp r3, r2
    bgt .L_71c
    add r0, r0, #0x110
    cmp r3, r0
    bge .L_147c
    sub r0, r1, #0x5c
    cmp r3, r0
    beq .L_13d4
    b .L_163c
.L_71c:
    sub r0, r1, #0x54
    cmp r3, r0
    beq .L_15ec
    b .L_163c
.L_72c:
    sub r0, r1, #0x2b
    cmp r3, r0
    bgt .L_74c
    bge .L_158c
    sub r0, r1, #0x38
    cmp r3, r0
    beq .L_13fc
    b .L_163c
.L_74c:
    sub r0, r1, #0x8
    cmp r3, r0
    beq .L_142c
    b .L_163c
.L_75c:
    add r0, r1, #0xc5
    cmp r3, r0
    bgt .L_944
    bge .L_14b4
    add r0, r1, #0x5d
    cmp r3, r0
    bgt .L_860
    bge .L_161c
    add r0, r1, #0x24
    cmp r3, r0
    bgt .L_7f0
    bge .L_13d4
    add r0, r1, #0x10
    cmp r3, r0
    bgt .L_7c0
    bge .L_13dc
    add r0, r1, #0x5
    cmp r3, r0
    bgt .L_7b0
    beq .L_15fc
    b .L_163c
.L_7b0:
    add r0, r1, #0xf
    cmp r3, r0
    beq .L_14d4
    b .L_163c
.L_7c0:
    add r0, r1, #0x1f
    cmp r3, r0
    bgt .L_7e0
    bge .L_13e4
    add r0, r1, #0x18
    cmp r3, r0
    beq .L_1604
    b .L_163c
.L_7e0:
    add r0, r1, #0x21
    cmp r3, r0
    beq .L_13e4
    b .L_163c
.L_7f0:
    add r0, r1, #0x46
    cmp r3, r0
    bgt .L_830
    bge .L_140c
    add r0, r1, #0x2c
    cmp r3, r0
    bgt .L_820
    bge .L_148c
    add r0, r1, #0x27
    cmp r3, r0
    beq .L_143c
    b .L_163c
.L_820:
    add r0, r1, #0x35
    cmp r3, r0
    beq .L_160c
    b .L_163c
.L_830:
    add r0, r1, #0x53
    cmp r3, r0
    bgt .L_850
    bge .L_143c
    add r0, r1, #0x4c
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_850:
    add r0, r1, #0x55
    cmp r3, r0
    beq .L_143c
    b .L_163c
.L_860:
    add r0, r1, #0x7b
    cmp r3, r0
    bgt .L_8d4
    bge .L_14b4
    add r0, r1, #0x67
    cmp r3, r0
    bgt .L_8a4
    bge .L_152c
    add r0, r1, #0x5f
    cmp r3, r0
    bgt .L_894
    beq .L_142c
    b .L_163c
.L_894:
    add r0, r1, #0x65
    cmp r3, r0
    beq .L_142c
    b .L_163c
.L_8a4:
    add r0, r1, #0x6d
    cmp r3, r0
    bgt .L_8c4
    bge .L_1624
    add r0, r1, #0x68
    cmp r3, r0
    beq .L_154c
    b .L_163c
.L_8c4:
    add r0, r1, #0x7a
    cmp r3, r0
    beq .L_142c
    b .L_163c
.L_8d4:
    add r0, r1, #0x9d
    cmp r3, r0
    bgt .L_914
    bge .L_13e4
    add r0, r1, #0x85
    cmp r3, r0
    bgt .L_904
    bge .L_143c
    add r0, r1, #0x83
    cmp r3, r0
    beq .L_1434
    b .L_163c
.L_904:
    add r0, r1, #0x96
    cmp r3, r0
    beq .L_15ac
    b .L_163c
.L_914:
    add r0, r1, #0xae
    cmp r3, r0
    bgt .L_934
    bge .L_161c
    add r0, r1, #0xab
    cmp r3, r0
    beq .L_143c
    b .L_163c
.L_934:
    add r0, r1, #0xc4
    cmp r3, r0
    beq .L_13fc
    b .L_163c
.L_944:
    add r0, r1, #0x170
    cmp r3, r0
    bgt .L_a38
    bge .L_14b4
    sub r0, r2, #0xee
    cmp r3, r0
    bgt .L_9c8
    bge .L_140c
    ldr r1, _LIT6
    cmp r3, r1
    bgt .L_998
    bge .L_142c
    sub r0, r1, #0x35
    cmp r3, r0
    bgt .L_988
    beq .L_143c
    b .L_163c
.L_988:
    sub r0, r1, #0x34
    cmp r3, r0
    beq .L_1624
    b .L_163c
.L_998:
    add r0, r1, #0xe
    cmp r3, r0
    bgt .L_9b8
    bge .L_1474
    add r0, r1, #0xd
    cmp r3, r0
    beq .L_1434
    b .L_163c
.L_9b8:
    add r0, r1, #0xf
    cmp r3, r0
    beq .L_143c
    b .L_163c
.L_9c8:
    sub r0, r2, #0xc7
    cmp r3, r0
    bgt .L_a08
    bge .L_161c
    sub r0, r2, #0xe2
    cmp r3, r0
    bgt .L_9f8
    bge .L_13e4
    sub r0, r2, #0xe8
    cmp r3, r0
    beq .L_1434
    b .L_163c
.L_9f8:
    add r0, r1, #0x128
    cmp r3, r0
    beq .L_1444
    b .L_163c
.L_a08:
    sub r0, r2, #0xbb
    cmp r3, r0
    bgt .L_a28
    bge .L_161c
    sub r0, r2, #0xbe
    cmp r3, r0
    beq .L_14bc
    b .L_163c
.L_a28:
    sub r0, r2, #0xb7
    cmp r3, r0
    beq .L_147c
    b .L_163c
.L_a38:
    sub r0, r2, #0x70
    cmp r3, r0
    bgt .L_ab8
    bge .L_143c
    sub r0, r2, #0x86
    cmp r3, r0
    bgt .L_a88
    bge .L_162c
    sub r0, r2, #0x97
    cmp r3, r0
    bgt .L_a78
    bge .L_140c
    sub r0, r2, #0x98
    cmp r3, r0
    beq .L_14b4
    b .L_163c
.L_a78:
    sub r0, r2, #0x8b
    cmp r3, r0
    beq .L_143c
    b .L_163c
.L_a88:
    sub r0, r2, #0x76
    cmp r3, r0
    bgt .L_aa8
    bge .L_14bc
    sub r0, r2, #0x7a
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_aa8:
    add r0, r1, #0x194
    cmp r3, r0
    beq .L_13fc
    b .L_163c
.L_ab8:
    sub r0, r2, #0x58
    cmp r3, r0
    bgt .L_af8
    bge .L_14b4
    sub r0, r2, #0x5c
    cmp r3, r0
    bgt .L_ae8
    bge .L_13fc
    add r0, r1, #0x1a8
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_ae8:
    sub r0, r2, #0x5a
    cmp r3, r0
    beq .L_142c
    b .L_163c
.L_af8:
    sub r0, r2, #0x24
    cmp r3, r0
    bgt .L_b18
    bge .L_13fc
    add r0, r1, #0x1b8
    cmp r3, r0
    beq .L_14b4
    b .L_163c
.L_b18:
    sub r0, r2, #0x6
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_b28:
    ldr r1, _LIT7
    cmp r3, r1
    bgt .L_f98
    bge .L_143c
    ldr r0, _LIT8
    cmp r3, r0
    bgt .L_d44
    bge .L_140c
    sub ip, r0, #0xe2
    cmp r3, ip
    bgt .L_c58
    bge .L_148c
    add ip, r2, #0x2c
    cmp r3, ip
    bgt .L_bdc
    bge .L_1474
    sub ip, r1, #0x284
    cmp r3, ip
    bgt .L_bac
    sub r1, r1, #0x284
    cmp r3, r1
    bge .L_140c
    add r1, r2, #0xc
    cmp r3, r1
    bgt .L_b9c
    mov r0, r1
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_b9c:
    sub r0, r0, #0x134
    cmp r3, r0
    beq .L_161c
    b .L_163c
.L_bac:
    sub r1, r0, #0x11c
    cmp r3, r1
    bgt .L_bcc
    bge .L_1624
    sub r0, r0, #0x120
    cmp r3, r0
    beq .L_148c
    b .L_163c
.L_bcc:
    add r0, r2, #0x2b
    cmp r3, r0
    beq .L_145c
    b .L_163c
.L_bdc:
    sub r1, r0, #0xf6
    cmp r3, r1
    bgt .L_c24
    bge .L_13ec
    sub r1, r0, #0xfe
    cmp r3, r1
    bgt .L_c14
    sub r0, r0, #0xfe
    cmp r3, r0
    bge .L_14bc
    add r0, r2, #0x33
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_c14:
    sub r0, r0, #0xf8
    cmp r3, r0
    beq .L_13f4
    b .L_163c
.L_c24:
    sub r1, r0, #0xe7
    cmp r3, r1
    bgt .L_c48
    sub r0, r0, #0xe7
    cmp r3, r0
    bge .L_162c
    cmp r3, #0x16c0
    beq .L_142c
    b .L_163c
.L_c48:
    sub r0, r0, #0xe5
    cmp r3, r0
    beq .L_162c
    b .L_163c
.L_c58:
    sub r1, r0, #0x63
    cmp r3, r1
    bgt .L_cd4
    bge .L_142c
    sub r1, r0, #0x98
    cmp r3, r1
    bgt .L_ca4
    bge .L_146c
    sub r1, r0, #0xcd
    cmp r3, r1
    bgt .L_c94
    sub r0, r0, #0xcd
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_c94:
    sub r0, r0, #0xa8
    cmp r3, r0
    beq .L_161c
    b .L_163c
.L_ca4:
    sub r1, r0, #0x86
    cmp r3, r1
    bgt .L_cc4
    bge .L_1624
    sub r0, r0, #0x96
    cmp r3, r0
    beq .L_1434
    b .L_163c
.L_cc4:
    sub r0, r0, #0x64
    cmp r3, r0
    beq .L_161c
    b .L_163c
.L_cd4:
    sub r1, r0, #0x3d
    cmp r3, r1
    bgt .L_d14
    bge .L_142c
    sub r1, r0, #0x53
    cmp r3, r1
    bgt .L_d04
    bge .L_1474
    sub r0, r0, #0x5d
    cmp r3, r0
    beq .L_14b4
    b .L_163c
.L_d04:
    sub r0, r0, #0x4d
    cmp r3, r0
    beq .L_143c
    b .L_163c
.L_d14:
    sub r1, r0, #0x16
    cmp r3, r1
    bgt .L_d34
    bge .L_13fc
    sub r0, r0, #0x22
    cmp r3, r0
    beq .L_1624
    b .L_163c
.L_d34:
    sub r0, r0, #0x11
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_d44:
    add r2, r0, #0xb8
    cmp r3, r2
    bgt .L_e48
    mov r1, r2
    cmp r3, r1
    bge .L_13fc
    add r1, r0, #0x69
    cmp r3, r1
    bgt .L_dd8
    bge .L_1474
    add r1, r0, #0x30
    cmp r3, r1
    bgt .L_da8
    bge .L_1454
    add r1, r0, #0x8
    cmp r3, r1
    bgt .L_d98
    add r0, r0, #0x8
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_d98:
    add r0, r0, #0x2a
    cmp r3, r0
    beq .L_13fc
    b .L_163c
.L_da8:
    add r1, r0, #0x4c
    cmp r3, r1
    bgt .L_dc8
    bge .L_1474
    add r0, r0, #0x46
    cmp r3, r0
    beq .L_15cc
    b .L_163c
.L_dc8:
    add r0, r0, #0x4f
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_dd8:
    add r1, r0, #0x9b
    cmp r3, r1
    bgt .L_e18
    bge .L_143c
    add r1, r0, #0x92
    cmp r3, r1
    bgt .L_e08
    bge .L_1414
    add r0, r0, #0x8f
    cmp r3, r0
    beq .L_14b4
    b .L_163c
.L_e08:
    add r0, r0, #0x94
    cmp r3, r0
    beq .L_143c
    b .L_163c
.L_e18:
    add r1, r0, #0xaf
    cmp r3, r1
    bgt .L_e38
    bge .L_161c
    add r0, r0, #0xa3
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_e38:
    add r0, r0, #0xb3
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_e48:
    add r2, r0, #0xe3
    cmp r3, r2
    bgt .L_ecc
    mov r1, r2
    cmp r3, r1
    bge .L_1474
    add r1, r0, #0xbe
    cmp r3, r1
    bgt .L_e9c
    bge .L_13ec
    add r1, r0, #0xba
    cmp r3, r1
    bgt .L_e8c
    add r0, r0, #0xba
    cmp r3, r0
    beq .L_142c
    b .L_163c
.L_e8c:
    add r0, r0, #0xbb
    cmp r3, r0
    beq .L_13fc
    b .L_163c
.L_e9c:
    add r1, r0, #0xda
    cmp r3, r1
    bgt .L_ebc
    bge .L_1474
    add r0, r0, #0xd9
    cmp r3, r0
    beq .L_1434
    b .L_163c
.L_ebc:
    add r0, r0, #0xe0
    cmp r3, r0
    beq .L_148c
    b .L_163c
.L_ecc:
    sub r2, r1, #0x4a
    cmp r3, r2
    bgt .L_f14
    mov r0, r2
    cmp r3, r0
    bge .L_1454
    sub r0, r1, #0x4e
    cmp r3, r0
    bgt .L_f04
    bge .L_13fc
    sub r0, r1, #0x4f
    cmp r3, r0
    beq .L_13ec
    b .L_163c
.L_f04:
    sub r0, r1, #0x4b
    cmp r3, r0
    beq .L_142c
    b .L_163c
.L_f14:
    sub r2, r1, #0x36
    cmp r3, r2
    bgt .L_f88
    sub r0, r1, #0x48
    subs r0, r3, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_f7c
    b .L_1454
    b .L_1454
    b .L_163c
    b .L_163c
    b .L_163c
    b .L_1454
    b .L_163c
    b .L_163c
    b .L_142c
    b .L_148c
    b .L_1474
    b .L_163c
    b .L_163c
    b .L_163c
    b .L_163c
    b .L_163c
    b .L_163c
    b .L_163c
    b .L_1474
.L_f7c:
    cmp r3, #0x18c0
    beq .L_1454
    b .L_163c
.L_f88:
    add r0, r0, #0x140
    cmp r3, r0
    beq .L_1444
    b .L_163c
.L_f98:
    add r0, r1, #0x12c
    cmp r3, r0
    bgt .L_1180
    bge .L_161c
    add r0, r1, #0xab
    cmp r3, r0
    bgt .L_109c
    bge .L_140c
    add r0, r1, #0x4a
    cmp r3, r0
    bgt .L_102c
    bge .L_140c
    add r0, r1, #0x1c
    cmp r3, r0
    bgt .L_ffc
    bge .L_1634
    add r0, r1, #0x5
    cmp r3, r0
    bgt .L_fec
    beq .L_143c
    b .L_163c
.L_fec:
    add r0, r1, #0xa
    cmp r3, r0
    beq .L_13e4
    b .L_163c
.L_ffc:
    add r0, r1, #0x24
    cmp r3, r0
    bgt .L_101c
    bge .L_148c
    add r0, r1, #0x22
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_101c:
    add r0, r1, #0x3c
    cmp r3, r0
    beq .L_143c
    b .L_163c
.L_102c:
    add r0, r1, #0x6f
    cmp r3, r0
    bgt .L_106c
    bge .L_1474
    add r0, r1, #0x52
    cmp r3, r0
    bgt .L_105c
    bge .L_1474
    add r0, r1, #0x4e
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_105c:
    add r0, r1, #0x59
    cmp r3, r0
    beq .L_14b4
    b .L_163c
.L_106c:
    add r0, r1, #0xa0
    cmp r3, r0
    bgt .L_108c
    bge .L_142c
    add r0, r1, #0x9a
    cmp r3, r0
    beq .L_14bc
    b .L_163c
.L_108c:
    add r0, r1, #0xa2
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_109c:
    add r0, r1, #0xeb
    cmp r3, r0
    bgt .L_1110
    bge .L_13fc
    add r0, r1, #0xd3
    cmp r3, r0
    bgt .L_10e0
    bge .L_1474
    add r0, r1, #0xbf
    cmp r3, r0
    bgt .L_10d0
    beq .L_14bc
    b .L_163c
.L_10d0:
    add r0, r1, #0xd2
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_10e0:
    add r0, r1, #0xe8
    cmp r3, r0
    bgt .L_1100
    bge .L_143c
    add r0, r1, #0xd4
    cmp r3, r0
    beq .L_146c
    b .L_163c
.L_1100:
    add r0, r1, #0xea
    cmp r3, r0
    beq .L_14b4
    b .L_163c
.L_1110:
    add r0, r2, #0x3a0
    cmp r3, r0
    bgt .L_1150
    bge .L_1474
    add r0, r1, #0x100
    cmp r3, r0
    bgt .L_1140
    bge .L_13fc
    add r0, r1, #0xf9
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_1140:
    add r0, r1, #0x104
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_1150:
    ldr r0, _LIT9
    cmp r3, r0
    bgt .L_1170
    bge .L_161c
    sub r0, r0, #0x2
    cmp r3, r0
    beq .L_14b4
    b .L_163c
.L_1170:
    add r0, r0, #0x14
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_1180:
    ldr r0, _LIT10
    cmp r3, r0
    bgt .L_127c
    bge .L_161c
    sub r1, r0, #0x4c
    cmp r3, r1
    bgt .L_120c
    bge .L_14b4
    sub r1, r0, #0x5a
    cmp r3, r1
    bgt .L_11dc
    bge .L_140c
    sub r1, r0, #0x7d
    cmp r3, r1
    bgt .L_11cc
    sub r0, r0, #0x7d
    cmp r3, r0
    beq .L_143c
    b .L_163c
.L_11cc:
    sub r0, r0, #0x76
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_11dc:
    sub r1, r0, #0x50
    cmp r3, r1
    bgt .L_11fc
    bge .L_14b4
    sub r0, r0, #0x54
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_11fc:
    sub r0, r0, #0x4e
    cmp r3, r0
    beq .L_1454
    b .L_163c
.L_120c:
    sub r1, r0, #0x14
    cmp r3, r1
    bgt .L_124c
    bge .L_140c
    sub r1, r0, #0x31
    cmp r3, r1
    bgt .L_123c
    bge .L_14bc
    sub r0, r0, #0x44
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_123c:
    sub r0, r0, #0x2f
    cmp r3, r0
    beq .L_1474
    b .L_163c
.L_124c:
    sub r1, r0, #0x12
    cmp r3, r1
    bgt .L_126c
    bge .L_140c
    sub r0, r0, #0x13
    cmp r3, r0
    beq .L_140c
    b .L_163c
.L_126c:
    sub r0, r0, #0xb
    cmp r3, r0
    beq .L_161c
    b .L_163c
.L_127c:
    add r1, r0, #0x55
    cmp r3, r1
    bgt .L_1328
    bge .L_14b4
    add r1, r0, #0x13
    cmp r3, r1
    bgt .L_12f8
    bge .L_1474
    add r1, r0, #0x10
    cmp r3, r1
    bgt .L_12e8
    bge .L_14b4
    add r0, r0, #0x8
    cmp r3, r0
    beq .L_140c
    b .L_163c
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
.L_12e8:
    add r0, r0, #0x11
    cmp r3, r0
    beq .L_143c
    b .L_163c
.L_12f8:
    add r1, r0, #0x37
    cmp r3, r1
    bgt .L_1318
    bge .L_1474
    add r0, r0, #0x34
    cmp r3, r0
    beq .L_13fc
    b .L_163c
.L_1318:
    add r0, r0, #0x54
    cmp r3, r0
    beq .L_142c
    b .L_163c
.L_1328:
    add r1, r0, #0x64
    cmp r3, r1
    bgt .L_1368
    bge .L_13ec
    add r1, r0, #0x58
    cmp r3, r1
    bgt .L_1358
    bge .L_1454
    add r0, r0, #0x57
    cmp r3, r0
    beq .L_1454
    b .L_163c
.L_1358:
    add r0, r0, #0x59
    cmp r3, r0
    beq .L_1454
    b .L_163c
.L_1368:
    add r1, r0, #0x79
    cmp r3, r1
    bgt .L_1388
    bge .L_142c
    add r0, r0, #0x6d
    cmp r3, r0
    beq .L_14b4
    b .L_163c
.L_1388:
    add r0, r0, #0x7a
    cmp r3, r0
    beq .L_142c
    b .L_163c
.L_1398:
    add r0, r0, #0xee
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x45
    bl func_ov002_0229ce5c
    add r1, sp, #0x100
    b .L_1640
.L_13b8:
    ldrh r0, [r4, #0xc]
    cmp r0, #0x2
    moveq r1, #0x8b
    ldrne r1, _LIT11
    b .L_1640
.L_13cc:
    mov r1, #0x44
    b .L_1640
.L_13d4:
    mov r1, #0xf
    b .L_1640
.L_13dc:
    mov r1, #0x10
    b .L_1640
.L_13e4:
    mov r1, #0x57
    b .L_1640
.L_13ec:
    mov r1, #0x61
    b .L_1640
.L_13f4:
    mov r1, #0x5f
    b .L_1640
.L_13fc:
    mov r1, #0x62
    b .L_1640
.L_1404:
    mov r1, #0x63
    b .L_1640
.L_140c:
    mov r1, #0x64
    b .L_1640
.L_1414:
    mov r1, #0x65
    b .L_1640
.L_141c:
    mov r1, #0x66
    b .L_1640
.L_1424:
    mov r1, #0x6b
    b .L_1640
.L_142c:
    mov r1, #0x6d
    b .L_1640
.L_1434:
    mov r1, #0x6e
    b .L_1640
.L_143c:
    mov r1, #0x6f
    b .L_1640
.L_1444:
    mov r1, #0x70
    b .L_1640
.L_144c:
    mov r1, #0x76
    b .L_1640
.L_1454:
    mov r1, #0x77
    b .L_1640
.L_145c:
    mov r1, #0x78
    b .L_1640
.L_1464:
    mov r1, #0x7a
    b .L_1640
.L_146c:
    mov r1, #0x7b
    b .L_1640
.L_1474:
    mov r1, #0x7c
    b .L_1640
.L_147c:
    mov r1, #0x7e
    b .L_1640
.L_1484:
    mov r1, #0x80
    b .L_1640
.L_148c:
    mov r1, #0x85
    b .L_1640
.L_1494:
    mov r1, #0x86
    b .L_1640
.L_149c:
    mov r1, #0x87
    b .L_1640
.L_14a4:
    mov r1, #0x88
    b .L_1640
.L_14ac:
    mov r1, #0x89
    b .L_1640
.L_14b4:
    mov r1, #0x8d
    b .L_1640
.L_14bc:
    mov r1, #0x8e
    b .L_1640
.L_14c4:
    mov r1, #0x8f
    b .L_1640
.L_14cc:
    mov r1, #0x90
    b .L_1640
.L_14d4:
    ldr r0, _LIT12
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x97
    bl func_ov002_0229ce5c
    mov r0, #0x13
    bl func_0202b7ec
    mov r2, r0
    add r0, sp, #0x100
    add r1, sp, #0x0
    bl func_ov002_0229ce5c
    add r1, sp, #0x100
    b .L_1640
.L_150c:
    mov r0, #0x7
    bl func_0202b7ec
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x98
    bl func_ov002_0229ce5c
    add r1, sp, #0x100
    b .L_1640
.L_152c:
    mov r0, #0x3
    bl func_0202b7ec
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x98
    bl func_ov002_0229ce5c
    add r1, sp, #0x100
    b .L_1640
.L_154c:
    mov r0, #0x1
    bl func_0202b7ec
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x98
    bl func_ov002_0229ce5c
    add r1, sp, #0x100
    b .L_1640
.L_156c:
    add r0, r0, #0xcb
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x99
    bl func_ov002_0229ce5c
    add r1, sp, #0x100
    b .L_1640
.L_158c:
    sub r0, r1, #0x2d
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x99
    bl func_ov002_0229ce5c
    add r1, sp, #0x100
    b .L_1640
.L_15ac:
    sub r0, r1, #0x52
    bl func_0202b100
    mov r2, r0
    ldr r1, _LIT13
    add r0, sp, #0x100
    bl func_ov002_0229ce5c
    add r1, sp, #0x100
    b .L_1640
.L_15cc:
    ldr r0, _LIT14
    bl func_0202b100
    mov r2, r0
    ldr r1, _LIT13
    add r0, sp, #0x100
    bl func_ov002_0229ce5c
    add r1, sp, #0x100
    b .L_1640
.L_15ec:
    mov r1, #0x9d
    b .L_1640
.L_15f4:
    mov r1, #0x9e
    b .L_1640
.L_15fc:
    mov r1, #0xa3
    b .L_1640
.L_1604:
    mov r1, #0xa6
    b .L_1640
.L_160c:
    mov r1, #0xa7
    b .L_1640
.L_1614:
    mov r1, #0xa8
    b .L_1640
.L_161c:
    ldr r1, _LIT11
    b .L_1640
.L_1624:
    ldr r1, _LIT15
    b .L_1640
.L_162c:
    ldr r1, _LIT16
    b .L_1640
.L_1634:
    mov r1, #0x95
    b .L_1640
.L_163c:
    ldr r1, _LIT17
.L_1640:
    ldrh r2, [r4, #0x2]
    mov r0, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r0, r0, r2, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x200
    ldmia sp!, {r4, pc}
_LIT11: .word 0x00000119
_LIT12: .word 0x00000fbc
_LIT13: .word 0x00000127
_LIT14: .word 0x00000ff8
_LIT15: .word 0x0000011a
_LIT16: .word 0x00000125
_LIT17: .word 0x00000112
