; func_ov002_021b6520 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_0202b824
        .extern func_ov002_021b4040
        .extern func_ov002_021bad9c
        .extern func_ov002_0220ea10
        .extern func_ov002_0223dda4
        .global func_ov002_021b6520
        .arm
func_ov002_021b6520:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, #0x0
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    sub r2, r4, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT0
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    orrne r4, r4, #0x2
    bl func_ov002_021bad9c
    cmp r0, #0x0
    ldrh r2, [r5]
    ldr r0, _LIT1
    orrne r4, r4, #0x1
    cmp r2, r0
    bgt .L_7a0
    bge .L_114c
    ldr r3, _LIT2
    cmp r2, r3
    bgt .L_414
    bge .L_11b0
    ldr r1, _LIT3
    cmp r2, r1
    bgt .L_27c
    bge .L_f34
    ldr r0, _LIT4
    cmp r2, r0
    bgt .L_194
    bge .L_f98
    sub r1, r0, #0x5b
    cmp r2, r1
    bgt .L_13c
    bge .L_11bc
    sub r1, r3, #0x3a0
    cmp r2, r1
    bgt .L_e4
    bge .L_f34
    sub r1, r0, #0x1d0
    cmp r2, r1
    bgt .L_d4
    sub r0, r0, #0x1d0
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_d4:
    ldr r0, _LIT5
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_e4:
    sub r1, r0, #0xf2
    cmp r2, r1
    bgt .L_100
    sub r0, r0, #0xf2
    cmp r2, r0
    beq .L_f40
    b .L_12a8
.L_100:
    sub r0, r0, #0xd7
    sub r0, r2, r0
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_12a8
    b .L_114c
    b .L_11b0
    b .L_11b0
    b .L_11b0
    b .L_11b0
    b .L_f34
    b .L_f34
    b .L_f34
    b .L_f34
    b .L_1084
.L_13c:
    ldr r1, _LIT6
    cmp r2, r1
    bgt .L_170
    bge .L_f34
    sub r0, r1, #0x1c
    cmp r2, r0
    bgt .L_160
    beq .L_1038
    b .L_12a8
.L_160:
    sub r0, r1, #0x16
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_170:
    add r0, r1, #0x16
    cmp r2, r0
    bgt .L_184
    beq .L_f34
    b .L_12a8
.L_184:
    add r0, r1, #0x23
    cmp r2, r0
    beq .L_1238
    b .L_12a8
.L_194:
    sub r3, r1, #0x51
    cmp r2, r3
    bgt .L_214
    bge .L_11b0
    add r3, r0, #0xd2
    cmp r2, r3
    bgt .L_1e8
    mov r1, r3
    cmp r2, r1
    bge .L_1044
    add r1, r0, #0xb3
    cmp r2, r1
    bgt .L_1d8
    add r0, r0, #0xb3
    cmp r2, r0
    beq .L_f98
    b .L_12a8
.L_1d8:
    add r0, r0, #0xcb
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_1e8:
    add r3, r0, #0xd3
    cmp r2, r3
    bgt .L_204
    add r0, r0, #0xd3
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_204:
    sub r0, r1, #0x5d
    cmp r2, r0
    beq .L_10ac
    b .L_12a8
.L_214:
    add r3, r0, #0x138
    cmp r2, r3
    bgt .L_250
    add r0, r0, #0x138
    cmp r2, r0
    bge .L_f34
    sub r0, r1, #0x50
    cmp r2, r0
    bgt .L_240
    beq .L_f34
    b .L_12a8
.L_240:
    sub r0, r1, #0x38
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_250:
    add r3, r0, #0x150
    cmp r2, r3
    bgt .L_26c
    add r0, r0, #0x150
    cmp r2, r0
    beq .L_1238
    b .L_12a8
.L_26c:
    sub r0, r1, #0x17
    cmp r2, r0
    beq .L_1244
    b .L_12a8
.L_27c:
    add r0, r1, #0x6f
    cmp r2, r0
    bgt .L_348
    bge .L_f34
    add r0, r1, #0x37
    cmp r2, r0
    bgt .L_2f4
    bge .L_11dc
    add r0, r1, #0x1c
    cmp r2, r0
    bgt .L_2d0
    bge .L_f34
    add r0, r1, #0x1
    cmp r2, r0
    bgt .L_2c0
    beq .L_11b0
    b .L_12a8
.L_2c0:
    add r0, r1, #0x19
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_2d0:
    add r0, r1, #0x21
    cmp r2, r0
    bgt .L_2e4
    beq .L_f34
    b .L_12a8
.L_2e4:
    add r0, r1, #0x23
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_2f4:
    cmp r2, #0x1380
    bgt .L_324
    bge .L_11b0
    add r0, r1, #0x41
    cmp r2, r0
    bgt .L_314
    beq .L_11b0
    b .L_12a8
.L_314:
    add r0, r1, #0x42
    cmp r2, r0
    beq .L_11fc
    b .L_12a8
.L_324:
    add r0, r1, #0x54
    cmp r2, r0
    bgt .L_338
    beq .L_1084
    b .L_12a8
.L_338:
    add r0, r1, #0x56
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_348:
    add r0, r1, #0xe8
    cmp r2, r0
    bgt .L_3b0
    bge .L_fb8
    add r0, r1, #0xcb
    cmp r2, r0
    bgt .L_38c
    bge .L_f34
    add r0, r1, #0xb7
    cmp r2, r0
    bgt .L_37c
    beq .L_114c
    b .L_12a8
.L_37c:
    add r0, r1, #0xba
    cmp r2, r0
    beq .L_114c
    b .L_12a8
.L_38c:
    add r0, r1, #0xcc
    cmp r2, r0
    bgt .L_3a0
    beq .L_11fc
    b .L_12a8
.L_3a0:
    add r0, r1, #0xe6
    cmp r2, r0
    beq .L_114c
    b .L_12a8
.L_3b0:
    sub r0, r3, #0x12
    cmp r2, r0
    bgt .L_3e4
    bge .L_128c
    add r0, r1, #0xf3
    cmp r2, r0
    bgt .L_3d4
    beq .L_11fc
    b .L_12a8
.L_3d4:
    add r0, r1, #0xfc
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_3e4:
    sub r0, r3, #0x2
    cmp r2, r0
    bgt .L_404
    bge .L_f34
    sub r0, r3, #0x5
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_404:
    sub r0, r3, #0x1
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_414:
    add r1, r3, #0x13c
    cmp r2, r1
    bgt .L_5c4
    mov r0, r1
    cmp r2, r0
    bge .L_f34
    add r0, r3, #0x91
    cmp r2, r0
    bgt .L_4f8
    bge .L_10d4
    add r0, r3, #0x17
    cmp r2, r0
    bgt .L_4a4
    bge .L_11fc
    add r0, r3, #0x5
    cmp r2, r0
    bgt .L_480
    bge .L_11b0
    add r0, r3, #0x1
    cmp r2, r0
    bgt .L_470
    beq .L_11b0
    b .L_12a8
.L_470:
    add r0, r3, #0x4
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_480:
    add r0, r3, #0x9
    cmp r2, r0
    bgt .L_494
    beq .L_11b0
    b .L_12a8
.L_494:
    add r0, r3, #0x10
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_4a4:
    add r0, r3, #0x62
    cmp r2, r0
    bgt .L_4d8
    bge .L_f40
    add r0, r3, #0x41
    cmp r2, r0
    bgt .L_4c8
    beq .L_f34
    b .L_12a8
.L_4c8:
    add r0, r3, #0x5a
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_4d8:
    cmp r2, #0x14c0
    bgt .L_4e8
    beq .L_11fc
    b .L_12a8
.L_4e8:
    add r0, r3, #0x90
    cmp r2, r0
    beq .L_ff0
    b .L_12a8
.L_4f8:
    add r0, r3, #0xcb
    cmp r2, r0
    bgt .L_560
    bge .L_11b0
    add r0, r3, #0xa3
    cmp r2, r0
    bgt .L_53c
    bge .L_11b0
    add r0, r3, #0x96
    cmp r2, r0
    bgt .L_52c
    beq .L_11b0
    b .L_12a8
.L_52c:
    add r0, r3, #0x9d
    cmp r2, r0
    beq .L_11fc
    b .L_12a8
.L_53c:
    add r0, r3, #0xa5
    cmp r2, r0
    bgt .L_550
    beq .L_f34
    b .L_12a8
.L_550:
    add r0, r3, #0xb6
    cmp r2, r0
    beq .L_1218
    b .L_12a8
.L_560:
    ldr r1, _LIT7
    cmp r2, r1
    bgt .L_594
    bge .L_f34
    sub r0, r1, #0x45
    cmp r2, r0
    bgt .L_584
    beq .L_f34
    b .L_12a8
.L_584:
    sub r0, r1, #0x40
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_594:
    add r0, r1, #0x13
    cmp r2, r0
    bgt .L_5b4
    bge .L_1038
    add r0, r1, #0xf
    cmp r2, r0
    beq .L_f40
    b .L_12a8
.L_5b4:
    add r0, r1, #0x21
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_5c4:
    sub r1, r0, #0x98
    cmp r2, r1
    bgt .L_6b4
    bge .L_114c
    sub r1, r0, #0xd7
    cmp r2, r1
    bgt .L_64c
    bge .L_f34
    sub r1, r0, #0x110
    cmp r2, r1
    bgt .L_620
    sub r0, r0, #0x110
    cmp r2, r0
    bge .L_f40
    add r0, r3, #0x150
    cmp r2, r0
    bgt .L_610
    beq .L_1090
    b .L_12a8
.L_610:
    ldr r0, _LIT8
    cmp r2, r0
    beq .L_114c
    b .L_12a8
.L_620:
    add r1, r3, #0x1a4
    cmp r2, r1
    bgt .L_63c
    mov r0, r1
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_63c:
    sub r0, r0, #0xe1
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_64c:
    sub r1, r0, #0xbf
    cmp r2, r1
    bgt .L_688
    bge .L_114c
    sub r1, r0, #0xc9
    cmp r2, r1
    bgt .L_678
    sub r0, r0, #0xc9
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_678:
    sub r0, r0, #0xc7
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_688:
    sub r1, r0, #0xbd
    cmp r2, r1
    bgt .L_6a4
    sub r0, r0, #0xbd
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_6a4:
    sub r0, r0, #0x99
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_6b4:
    sub r1, r0, #0x27
    cmp r2, r1
    bgt .L_72c
    bge .L_f34
    add r1, r3, #0x250
    cmp r2, r1
    bgt .L_700
    bge .L_11b0
    sub r1, r0, #0x8f
    cmp r2, r1
    bgt .L_6f0
    sub r0, r0, #0x8f
    cmp r2, r0
    beq .L_1238
    b .L_12a8
.L_6f0:
    sub r0, r0, #0x64
    cmp r2, r0
    beq .L_1064
    b .L_12a8
.L_700:
    sub r1, r0, #0x39
    cmp r2, r1
    bgt .L_71c
    sub r0, r0, #0x39
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_71c:
    add r0, r3, #0x27c
    cmp r2, r0
    beq .L_f40
    b .L_12a8
.L_72c:
    sub r1, r0, #0x20
    cmp r2, r1
    bgt .L_768
    bge .L_1100
    sub r1, r0, #0x24
    cmp r2, r1
    bgt .L_758
    sub r0, r0, #0x24
    cmp r2, r0
    beq .L_11fc
    b .L_12a8
.L_758:
    add r0, r3, #0x28c
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_768:
    sub r1, r0, #0x9
    cmp r2, r1
    bgt .L_790
    sub r0, r0, #0x9
    cmp r2, r0
    bge .L_1238
    add r0, r3, #0x294
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_790:
    sub r0, r0, #0x4
    cmp r2, r0
    beq .L_f78
    b .L_12a8
.L_7a0:
    ldr r1, _LIT9
    cmp r2, r1
    bgt .L_b58
    bge .L_f34
    sub r3, r1, #0x164
    cmp r2, r3
    bgt .L_9ac
    bge .L_f34
    add r3, r0, #0x5c
    cmp r2, r3
    bgt .L_8b8
    bge .L_11b0
    add r3, r0, #0x41
    cmp r2, r3
    bgt .L_850
    bge .L_f34
    add r3, r0, #0x11
    cmp r2, r3
    bgt .L_824
    mov r1, r3
    cmp r2, r1
    bge .L_11b0
    add r1, r0, #0x4
    cmp r2, r1
    bgt .L_814
    add r0, r0, #0x4
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_814:
    add r0, r0, #0xd
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_824:
    sub r3, r1, #0x214
    cmp r2, r3
    bgt .L_840
    mov r0, r3
    cmp r2, r0
    beq .L_1084
    b .L_12a8
.L_840:
    add r0, r0, #0x31
    cmp r2, r0
    beq .L_f40
    b .L_12a8
.L_850:
    add r1, r0, #0x50
    cmp r2, r1
    bgt .L_88c
    bge .L_114c
    add r1, r0, #0x4c
    cmp r2, r1
    bgt .L_87c
    add r0, r0, #0x4c
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_87c:
    add r0, r0, #0x4d
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_88c:
    add r1, r0, #0x58
    cmp r2, r1
    bgt .L_8a8
    add r0, r0, #0x58
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_8a8:
    add r0, r0, #0x59
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_8b8:
    add r3, r0, #0x94
    cmp r2, r3
    bgt .L_938
    bge .L_11b0
    add r3, r0, #0x69
    cmp r2, r3
    bgt .L_90c
    mov r1, r3
    cmp r2, r1
    bge .L_f34
    add r1, r0, #0x63
    cmp r2, r1
    bgt .L_8fc
    add r0, r0, #0x63
    cmp r2, r0
    beq .L_114c
    b .L_12a8
.L_8fc:
    add r0, r0, #0x64
    cmp r2, r0
    beq .L_f40
    b .L_12a8
.L_90c:
    add r3, r0, #0x6c
    cmp r2, r3
    bgt .L_928
    add r0, r0, #0x6c
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_928:
    sub r0, r1, #0x1bc
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_938:
    add r3, r0, #0x9d
    cmp r2, r3
    bgt .L_974
    bge .L_f34
    add r3, r0, #0x95
    cmp r2, r3
    bgt .L_964
    add r0, r0, #0x95
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_964:
    sub r0, r1, #0x198
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_974:
    add r3, r0, #0xa7
    cmp r2, r3
    bgt .L_99c
    add r0, r0, #0xa7
    cmp r2, r0
    bge .L_11fc
    sub r0, r1, #0x188
    cmp r2, r0
    beq .L_11fc
    b .L_12a8
.L_99c:
    add r0, r0, #0xc9
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_9ac:
    sub r3, r1, #0x64
    cmp r2, r3
    bgt .L_a8c
    bge .L_f34
    sub r3, r1, #0xc3
    cmp r2, r3
    bgt .L_a34
    bge .L_114c
    add r3, r0, #0x104
    cmp r2, r3
    bgt .L_a10
    mov r1, r3
    cmp r2, r1
    bge .L_114c
    add r1, r0, #0xe3
    cmp r2, r1
    bgt .L_a00
    add r0, r0, #0xe3
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_a00:
    add r0, r0, #0xf8
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_a10:
    sub r0, r1, #0x128
    cmp r2, r0
    bgt .L_a24
    beq .L_f34
    b .L_12a8
.L_a24:
    sub r0, r1, #0xd7
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_a34:
    sub r0, r1, #0xa1
    cmp r2, r0
    bgt .L_a68
    bge .L_f34
    sub r0, r1, #0xb5
    cmp r2, r0
    bgt .L_a58
    beq .L_1260
    b .L_12a8
.L_a58:
    sub r0, r1, #0xb1
    cmp r2, r0
    beq .L_f40
    b .L_12a8
.L_a68:
    sub r0, r1, #0x76
    cmp r2, r0
    bgt .L_a7c
    beq .L_f34
    b .L_12a8
.L_a7c:
    sub r0, r1, #0x75
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_a8c:
    sub r0, r1, #0x50
    cmp r2, r0
    bgt .L_af4
    bge .L_f34
    sub r0, r1, #0x56
    cmp r2, r0
    bgt .L_ad0
    bge .L_f34
    sub r0, r1, #0x5c
    cmp r2, r0
    bgt .L_ac0
    beq .L_f40
    b .L_12a8
.L_ac0:
    sub r0, r1, #0x5b
    cmp r2, r0
    beq .L_f40
    b .L_12a8
.L_ad0:
    sub r0, r1, #0x55
    cmp r2, r0
    bgt .L_ae4
    beq .L_114c
    b .L_12a8
.L_ae4:
    sub r0, r1, #0x52
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_af4:
    sub r0, r1, #0x18
    cmp r2, r0
    bgt .L_b28
    bge .L_114c
    sub r0, r1, #0x26
    cmp r2, r0
    bgt .L_b18
    beq .L_f34
    b .L_12a8
.L_b18:
    sub r0, r1, #0x22
    cmp r2, r0
    beq .L_1008
    b .L_12a8
.L_b28:
    sub r0, r1, #0x6
    cmp r2, r0
    bgt .L_b48
    bge .L_f34
    sub r0, r1, #0xf
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_b48:
    sub r0, r1, #0x3
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_b58:
    ldr r0, _LIT10
    cmp r2, r0
    bgt .L_d38
    bge .L_f40
    sub r3, r0, #0x96
    cmp r2, r3
    bgt .L_c58
    bge .L_f34
    sub r3, r0, #0xcd
    cmp r2, r3
    bgt .L_bf0
    bge .L_f5c
    add r3, r1, #0x1e
    cmp r2, r3
    bgt .L_bc4
    mov r0, r3
    cmp r2, r0
    bge .L_f34
    add r0, r1, #0xf
    cmp r2, r0
    bgt .L_bb4
    beq .L_f34
    b .L_12a8
.L_bb4:
    add r0, r1, #0x17
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_bc4:
    add r3, r1, #0x24
    cmp r2, r3
    bgt .L_be0
    mov r0, r3
    cmp r2, r0
    beq .L_1084
    b .L_12a8
.L_be0:
    sub r0, r0, #0xf3
    cmp r2, r0
    beq .L_1084
    b .L_12a8
.L_bf0:
    sub r1, r0, #0xb3
    cmp r2, r1
    bgt .L_c2c
    bge .L_12a8
    sub r1, r0, #0xca
    cmp r2, r1
    bgt .L_c1c
    sub r0, r0, #0xca
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_c1c:
    sub r0, r0, #0xc6
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_c2c:
    sub r1, r0, #0xad
    cmp r2, r1
    bgt .L_c48
    sub r0, r0, #0xad
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_c48:
    sub r0, r0, #0xa1
    cmp r2, r0
    beq .L_f40
    b .L_12a8
.L_c58:
    sub r1, r0, #0x71
    cmp r2, r1
    bgt .L_cd0
    bge .L_11b0
    sub r1, r0, #0x82
    cmp r2, r1
    bgt .L_ca4
    bge .L_f34
    sub r1, r0, #0x84
    cmp r2, r1
    bgt .L_c94
    sub r0, r0, #0x84
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_c94:
    sub r0, r0, #0x83
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_ca4:
    sub r1, r0, #0x7e
    cmp r2, r1
    bgt .L_cc0
    sub r0, r0, #0x7e
    cmp r2, r0
    beq .L_fd0
    b .L_12a8
.L_cc0:
    sub r0, r0, #0x73
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_cd0:
    sub r1, r0, #0x43
    cmp r2, r1
    bgt .L_d0c
    bge .L_f34
    sub r1, r0, #0x61
    cmp r2, r1
    bgt .L_cfc
    sub r0, r0, #0x61
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_cfc:
    sub r0, r0, #0x44
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_d0c:
    sub r1, r0, #0x2e
    cmp r2, r1
    bgt .L_d2c
    bge .L_11b0
    sub r0, r0, #0x3d
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_d2c:
    cmp r2, #0x1a40
    beq .L_1084
    b .L_12a8
.L_d38:
    add r1, r0, #0xa7
    cmp r2, r1
    bgt .L_e28
    bge .L_f34
    add r1, r0, #0x5f
    cmp r2, r1
    bgt .L_dc0
    bge .L_fd0
    add r1, r0, #0x4f
    cmp r2, r1
    bgt .L_d94
    bge .L_f34
    add r1, r0, #0x18
    cmp r2, r1
    bgt .L_d84
    add r0, r0, #0x18
    cmp r2, r0
    beq .L_f40
    b .L_12a8
.L_d84:
    add r0, r0, #0x20
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_d94:
    add r1, r0, #0x51
    cmp r2, r1
    bgt .L_db0
    add r0, r0, #0x51
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_db0:
    add r0, r0, #0x5c
    cmp r2, r0
    beq .L_114c
    b .L_12a8
.L_dc0:
    add r1, r0, #0x7b
    cmp r2, r1
    bgt .L_dfc
    bge .L_f34
    add r1, r0, #0x69
    cmp r2, r1
    bgt .L_dec
    add r0, r0, #0x69
    cmp r2, r0
    beq .L_f40
    b .L_12a8
.L_dec:
    add r0, r0, #0x6a
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_dfc:
    add r1, r0, #0x8f
    cmp r2, r1
    bgt .L_e18
    add r0, r0, #0x8f
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_e18:
    add r0, r0, #0xa6
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_e28:
    add r1, r0, #0xc8
    cmp r2, r1
    bgt .L_e9c
    bge .L_1084
    add r1, r0, #0xc3
    cmp r2, r1
    bgt .L_e74
    bge .L_12a8
    add r1, r0, #0xb1
    cmp r2, r1
    bgt .L_e64
    add r0, r0, #0xb1
    cmp r2, r0
    beq .L_11b0
    b .L_12a8
.L_e64:
    add r0, r0, #0xb2
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_e74:
    add r1, r0, #0xc4
    cmp r2, r1
    bgt .L_e8c
    add r0, r0, #0xc4
    cmp r2, r0
    b .L_12a8
.L_e8c:
    add r0, r0, #0xc7
    cmp r2, r0
    beq .L_1280
    b .L_12a8
.L_e9c:
    add r1, r0, #0xfe
    cmp r2, r1
    bgt .L_ed8
    bge .L_f34
    add r1, r0, #0xcd
    cmp r2, r1
    bgt .L_ec8
    add r0, r0, #0xcd
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_ec8:
    add r0, r0, #0xdc
    cmp r2, r0
    beq .L_f34
    b .L_12a8
.L_ed8:
    add r1, r0, #0x10c
    cmp r2, r1
    bgt .L_f28
    bge .L_f34
    add r0, r0, #0x100
    cmp r2, r0
    beq .L_fd0
    b .L_12a8
_LIT0: .word 0x00001256
_LIT1: .word 0x000016fe
_LIT2: .word 0x00001450
_LIT3: .word 0x00001339
_LIT4: .word 0x000011cf
_LIT5: .word 0x0000104c
_LIT6: .word 0x000011a6
_LIT7: .word 0x00001565
_LIT8: .word 0x000015e7
_LIT9: .word 0x0000192c
_LIT10: .word 0x00001a51
_LIT11: .word 0x00001b7f
.L_f28:
    ldr r0, _LIT11
    cmp r2, r0
    bne .L_12a8
.L_f34:
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_f40:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    beq .L_12a8
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_f5c:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_12a8
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_f78:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_12a8
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_f98:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x2
    bne .L_12a8
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_fb8:
    ldrh r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_12a8
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_fd0:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    bne .L_12a8
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_ff0:
    ldrh r0, [r5, #0xc]
    cmp r0, #0x1
    bne .L_12a8
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_1008:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq .L_12a8
    ldr r0, [r5, #0x14]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_12a8
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_1038:
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_1044:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    beq .L_12a8
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_1064:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_12a8
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_1084:
    add sp, sp, #0x8
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_1090:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    beq .L_12a8
    add sp, sp, #0x8
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_10ac:
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT12
    add sp, sp, #0x8
    mov r1, r1, lsl #0x1f
    ldr r0, [r0, #0xcec]
    mov r1, r1, lsr #0x1f
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_10d4:
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_0223dda4
    ldrh r1, [r5, #0x2]
    and r0, r0, #0xff
    add sp, sp, #0x8
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_1100:
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b4040
    ldrh r1, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    addeq sp, sp, #0x8
    mov r1, r1, lsr #0x1f
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    rsb r0, r0, #0x1
    cmp r1, r0
    bne .L_12a8
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_114c:
    add r1, sp, #0x0
    mov r0, r5
    mov r6, #0x0
    bl func_ov002_0220ea10
    ldrh r1, [r5, #0x2]
    add r0, sp, #0x0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r2, [r0, r1, lsl #0x2]
    add r0, sp, #0x0
    rsb r1, r1, #0x1
    cmp r2, #0x0
    ldr r1, [r0, r1, lsl #0x2]
    orrlt r6, r6, #0x1
    cmp r1, #0x0
    orrlt r6, r6, #0x2
    cmp r2, #0x0
    andgt r0, r4, #0x1
    orrgt r6, r6, r0
    cmp r1, #0x0
    andgt r0, r4, #0x2
    orrgt r6, r6, r0
    add sp, sp, #0x8
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
.L_11b0:
    add sp, sp, #0x8
    and r0, r4, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_11bc:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_12a8
    add sp, sp, #0x8
    and r0, r4, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_11dc:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x2
    bne .L_12a8
    add sp, sp, #0x8
    and r0, r4, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_11fc:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    beq .L_12a8
    add sp, sp, #0x8
    and r0, r4, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_1218:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x5
    beq .L_12a8
    add sp, sp, #0x8
    and r0, r4, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_1238:
    add sp, sp, #0x8
    and r0, r4, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_1244:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    beq .L_12a8
    add sp, sp, #0x8
    and r0, r4, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_1260:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x2
    bne .L_12a8
    add sp, sp, #0x8
    and r0, r4, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_1280:
    add sp, sp, #0x8
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_128c:
    ldrh r0, [r5, #0x2]
    add sp, sp, #0x8
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    andeq r0, r4, #0x3
    movne r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_12a8:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT12: .word data_ov002_022d008c
