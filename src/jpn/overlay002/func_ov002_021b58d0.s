; func_ov002_021b58d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021bce20
        .extern func_ov002_0223dda4
        .extern func_ov002_0225795c
        .global func_ov002_021b58d0
        .arm
func_ov002_021b58d0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r2, [r4]
    ldr r0, _LIT0
    cmp r2, r0
    bgt .L_1224
    bge .L_1658
    sub r1, r0, #0x208
    cmp r2, r1
    bgt .L_1018
    sub r0, r0, #0x208
    cmp r2, r0
    bge .L_1614
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_f2c
    bge .L_1658
    sub r1, r0, #0x93
    cmp r2, r1
    bgt .L_ea4
    sub r0, r0, #0x93
    cmp r2, r0
    bge .L_161c
    ldr r1, _LIT2
    cmp r2, r1
    bgt .L_e5c
    bge .L_161c
    sub r0, r1, #0xb8
    cmp r2, r0
    bgt .L_e4c
    beq .L_1650
    b .L_17f8
.L_e4c:
    sub r0, r1, #0x8c
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_e5c:
    ldr r1, _LIT3
    cmp r2, r1
    bgt .L_e94
    sub r0, r1, #0x3
    cmp r2, r0
    blt .L_e84
    beq .L_1650
    cmp r2, r1
    beq .L_161c
    b .L_17f8
.L_e84:
    sub r0, r1, #0x75
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_e94:
    add r0, r1, #0x56
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_ea4:
    sub r1, r0, #0x24
    cmp r2, r1
    bgt .L_ee4
    bge .L_16dc
    sub r1, r0, #0x3b
    cmp r2, r1
    bgt .L_ed4
    bge .L_161c
    sub r0, r0, #0x89
    cmp r2, r0
    beq .L_16c8
    b .L_17f8
.L_ed4:
    sub r0, r0, #0x36
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_ee4:
    sub r1, r0, #0x6
    cmp r2, r1
    bgt .L_f1c
    bge .L_1650
    sub r1, r0, #0x22
    cmp r2, r1
    bgt .L_17f8
    sub r1, r0, #0x23
    cmp r2, r1
    blt .L_17f8
    subne r0, r0, #0x22
    cmpne r2, r0
    beq .L_1614
    b .L_17f8
.L_f1c:
    sub r0, r0, #0x5
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_f2c:
    add r1, r0, #0xa2
    cmp r2, r1
    bgt .L_fa8
    bge .L_1650
    add r1, r0, #0x2c
    cmp r2, r1
    bgt .L_f78
    bge .L_161c
    add r1, r0, #0xc
    cmp r2, r1
    bgt .L_f68
    add r0, r0, #0xc
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_f68:
    add r0, r0, #0x2b
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_f78:
    add r1, r0, #0x5b
    cmp r2, r1
    bgt .L_f98
    bge .L_161c
    add r0, r0, #0x43
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_f98:
    add r0, r0, #0x94
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_fa8:
    ldr r1, _LIT4
    cmp r2, r1
    bgt .L_fe8
    bge .L_1614
    sub r0, r1, #0x7f
    cmp r2, r0
    bgt .L_fd8
    bge .L_1614
    sub r0, r1, #0x86
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_fd8:
    sub r0, r1, #0x1c
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_fe8:
    add r0, r1, #0x1e
    cmp r2, r0
    bgt .L_1008
    bge .L_1650
    add r0, r1, #0x3
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_1008:
    add r0, r1, #0x37
    cmp r2, r0
    beq .L_1624
    b .L_17f8
.L_1018:
    sub r1, r0, #0xf8
    cmp r2, r1
    bgt .L_111c
    sub r0, r0, #0xf8
    cmp r2, r0
    bge .L_161c
    ldr r0, _LIT5
    cmp r2, r0
    bgt .L_10ac
    bge .L_1614
    sub r1, r0, #0x5d
    cmp r2, r1
    bgt .L_107c
    bge .L_161c
    sub r1, r0, #0x60
    cmp r2, r1
    bgt .L_106c
    sub r0, r0, #0x60
    cmp r2, r0
    beq .L_1708
    b .L_17f8
.L_106c:
    sub r0, r0, #0x5f
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_107c:
    sub r1, r0, #0x27
    cmp r2, r1
    bgt .L_109c
    bge .L_16dc
    sub r0, r0, #0x2a
    cmp r2, r0
    beq .L_1624
    b .L_17f8
.L_109c:
    sub r0, r0, #0x13
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_10ac:
    add r1, r0, #0x6a
    cmp r2, r1
    bgt .L_10ec
    bge .L_1624
    add r1, r0, #0x37
    cmp r2, r1
    bgt .L_10dc
    bge .L_1650
    add r0, r0, #0x3
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_10dc:
    add r0, r0, #0x4c
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_10ec:
    add r1, r0, #0x76
    cmp r2, r1
    bgt .L_110c
    bge .L_1624
    add r0, r0, #0x73
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_110c:
    add r0, r0, #0x98
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_111c:
    sub r1, r0, #0xa4
    cmp r2, r1
    bgt .L_1198
    bge .L_171c
    sub r1, r0, #0xd6
    cmp r2, r1
    bgt .L_1168
    bge .L_161c
    sub r1, r0, #0xe0
    cmp r2, r1
    bgt .L_1158
    sub r0, r0, #0xe0
    cmp r2, r0
    beq .L_1658
    b .L_17f8
.L_1158:
    sub r0, r0, #0xde
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_1168:
    sub r1, r0, #0xb8
    cmp r2, r1
    bgt .L_1188
    bge .L_161c
    sub r0, r0, #0xd3
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_1188:
    sub r0, r0, #0xb1
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_1198:
    sub r1, r0, #0x29
    cmp r2, r1
    bgt .L_11f4
    bge .L_1614
    sub r1, r0, #0x9b
    cmp r2, r1
    bgt .L_11e4
    sub r1, r0, #0x9c
    cmp r2, r1
    blt .L_11d4
    beq .L_1650
    sub r0, r0, #0x9b
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_11d4:
    sub r0, r0, #0xa2
    cmp r2, r0
    beq .L_1658
    b .L_17f8
.L_11e4:
    sub r0, r0, #0x53
    cmp r2, r0
    beq .L_1624
    b .L_17f8
.L_11f4:
    sub r1, r0, #0x17
    cmp r2, r1
    bgt .L_1214
    bge .L_161c
    sub r0, r0, #0x1d
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_1214:
    sub r0, r0, #0x8
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_1224:
    ldr r1, _LIT6
    cmp r2, r1
    bgt .L_1434
    bge .L_161c
    ldr r0, _LIT7
    cmp r2, r0
    bgt .L_1330
    bge .L_1614
    sub r1, r0, #0x81
    cmp r2, r1
    bgt .L_12c0
    bge .L_161c
    sub r1, r0, #0xcc
    cmp r2, r1
    bgt .L_1290
    bge .L_1624
    sub r1, r0, #0xf7
    cmp r2, r1
    bgt .L_1280
    sub r0, r0, #0xf7
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_1280:
    sub r0, r0, #0xcd
    cmp r2, r0
    beq .L_1658
    b .L_17f8
.L_1290:
    sub r1, r0, #0xb3
    cmp r2, r1
    bgt .L_12b0
    bge .L_1614
    sub r0, r0, #0xc5
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_12b0:
    sub r0, r0, #0x88
    cmp r2, r0
    beq .L_1624
    b .L_17f8
.L_12c0:
    sub r1, r0, #0x2b
    cmp r2, r1
    bgt .L_1300
    bge .L_1650
    sub r1, r0, #0x60
    cmp r2, r1
    bgt .L_12f0
    bge .L_1614
    sub r0, r0, #0x69
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_12f0:
    sub r0, r0, #0x2c
    cmp r2, r0
    beq .L_1658
    b .L_17f8
.L_1300:
    sub r1, r0, #0x18
    cmp r2, r1
    bgt .L_1320
    bge .L_1658
    sub r0, r0, #0x1c
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_1320:
    sub r0, r0, #0xe
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_1330:
    add r3, r0, #0xb9
    cmp r2, r3
    bgt .L_13b4
    mov r1, r3
    cmp r2, r1
    bge .L_1658
    add r1, r0, #0x74
    cmp r2, r1
    bgt .L_1384
    bge .L_1650
    add r1, r0, #0xe
    cmp r2, r1
    bgt .L_1374
    add r0, r0, #0xe
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_1374:
    add r0, r0, #0x66
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_1384:
    add r1, r0, #0x88
    cmp r2, r1
    bgt .L_13a4
    bge .L_1650
    add r0, r0, #0x7d
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_13a4:
    add r0, r0, #0x8b
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_13b4:
    add r3, r0, #0x124
    cmp r2, r3
    bgt .L_13fc
    bge .L_1650
    sub r3, r1, #0x84
    cmp r2, r3
    bgt .L_13ec
    mov r0, r3
    cmp r2, r0
    bge .L_1614
    sub r0, r1, #0x85
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_13ec:
    add r0, r0, #0x10c
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_13fc:
    sub r3, r1, #0x3f
    cmp r2, r3
    bgt .L_1424
    mov r0, r3
    cmp r2, r0
    bge .L_1658
    sub r0, r1, #0x58
    cmp r2, r0
    beq .L_1624
    b .L_17f8
.L_1424:
    add r0, r0, #0x18c
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_1434:
    cmp r2, #0x1a80
    bgt .L_1524
    bge .L_16c8
    add r0, r1, #0x91
    cmp r2, r0
    bgt .L_14b4
    bge .L_161c
    add r0, r1, #0x41
    cmp r2, r0
    bgt .L_1484
    bge .L_161c
    add r0, r1, #0x7
    cmp r2, r0
    bgt .L_1474
    beq .L_1624
    b .L_17f8
.L_1474:
    add r0, r1, #0xe
    cmp r2, r0
    beq .L_1624
    b .L_17f8
.L_1484:
    add r0, r1, #0x66
    cmp r2, r0
    bgt .L_14a4
    bge .L_161c
    add r0, r1, #0x4e
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_14a4:
    add r0, r1, #0x73
    cmp r2, r0
    beq .L_1658
    b .L_17f8
.L_14b4:
    add r0, r1, #0xc2
    cmp r2, r0
    bgt .L_14f4
    bge .L_1614
    add r0, r1, #0xaf
    cmp r2, r0
    bgt .L_14e4
    bge .L_1650
    add r0, r1, #0xa8
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_14e4:
    add r0, r1, #0xbc
    cmp r2, r0
    beq .L_1624
    b .L_17f8
.L_14f4:
    add r0, r1, #0xc6
    cmp r2, r0
    bgt .L_1514
    bge .L_1740
    add r0, r1, #0xc3
    cmp r2, r0
    beq .L_1614
    b .L_17f8
.L_1514:
    add r0, r1, #0xd3
    cmp r2, r0
    beq .L_1670
    b .L_17f8
.L_1524:
    add r0, r1, #0x19c
    cmp r2, r0
    bgt .L_15a4
    bge .L_1794
    ldr r1, _LIT8
    cmp r2, r1
    bgt .L_1574
    bge .L_161c
    sub r0, r1, #0x1a
    cmp r2, r0
    bgt .L_1564
    bge .L_1778
    sub r0, r1, #0x1f
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_1564:
    sub r0, r1, #0x11
    cmp r2, r0
    beq .L_1658
    b .L_17f8
.L_1574:
    add r0, r1, #0x31
    cmp r2, r0
    bgt .L_1594
    bge .L_1624
    add r0, r1, #0x26
    cmp r2, r0
    beq .L_1624
    b .L_17f8
.L_1594:
    add r0, r1, #0x41
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_15a4:
    ldr r1, _LIT9
    cmp r2, r1
    bgt .L_15e4
    bge .L_17f8
    sub r0, r1, #0x7
    cmp r2, r0
    bgt .L_15d4
    bge .L_161c
    sub r0, r1, #0x3e
    cmp r2, r0
    beq .L_1650
    b .L_17f8
.L_15d4:
    sub r0, r1, #0x6
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_15e4:
    add r0, r1, #0xf
    cmp r2, r0
    bgt .L_1604
    bge .L_1624
    add r0, r1, #0x2
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_1604:
    add r0, r1, #0x1a
    cmp r2, r0
    beq .L_161c
    b .L_17f8
.L_1614:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_161c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1624:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0x5
    bcc .L_17f8
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_1650:
    mov r0, #0x4
    ldmia sp!, {r3, r4, r5, pc}
.L_1658:
    mov r0, r4
    bl func_ov002_0225795c
    cmp r0, #0x0
    beq .L_17f8
    mov r0, #0x6
    ldmia sp!, {r3, r4, r5, pc}
.L_1670:
    ldrh r0, [r4, #0x6]
    mov r5, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_17f8
.L_1688:
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223dda4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0x5
    movcs r0, #0x6
    ldmcsia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x6]
    add r5, r5, #0x1
    mov r0, r0, lsl #0x18
    cmp r5, r0, lsr #0x18
    blt .L_1688
    b .L_17f8
.L_16c8:
    ldrh r0, [r4, #0xc]
    cmp r0, #0x1
    bne .L_17f8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_16dc:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x1f
    cmpne r0, #0x20
    cmpne r0, #0x21
    bne .L_1700
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1700:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1708:
    ldrh r0, [r4, #0x8]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_171c:
    ldrh r1, [r4, #-22]
    mov r0, #0x0
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0x5
    ldmccia sp!, {r3, r4, r5, pc}
    cmp r1, #0xa
    movls r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1740:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bce20
    cmp r0, #0x0
    beq .L_17f8
    mov r0, #0x6
    ldmia sp!, {r3, r4, r5, pc}
.L_1778:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_17f8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1794:
    ldrh r5, [r4, #0x2]
    ldr r3, _LIT10
    mov r2, #0x5
    mov r4, r5, lsl #0x1a
    mov r1, r4, lsr #0x1b
    mov r0, r1, lsr #0x1f
    mov ip, r5, lsl #0x1f
    smull r1, r5, r3, r1
    add r5, r0, r5, asr #0x1
    smull r0, r1, r2, r5
    mov r3, ip, lsr #0x1f
    rsb r2, r3, #0x1
    rsb r5, r0, r4, lsr #0x1b
    ldr r0, _LIT11
    ldr r1, _LIT12
    and r3, r2, #0x1
    mla r2, r3, r0, r1
    rsb r1, r5, #0x9
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_17f8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000016cf
_LIT1: .word 0x00001321
_LIT2: .word 0x00001086
_LIT3: .word 0x000011f0
_LIT4: .word 0x0000148c
_LIT5: .word 0x0000153e
_LIT6: .word 0x00001962
_LIT7: .word 0x000017d4
_LIT8: .word 0x00001ab9
_LIT9: .word 0x00001b3d
_LIT10: .word 0x66666667
_LIT11: .word 0x00000868
_LIT12: .word data_ov002_022cf08c
