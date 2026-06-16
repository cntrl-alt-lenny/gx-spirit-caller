; func_ov002_021b59b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021bcf00
        .extern func_ov002_0223de94
        .extern func_ov002_02257a44
        .global func_ov002_021b59b0
        .arm
func_ov002_021b59b0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r2, [r4]
    ldr r0, _LIT0
    cmp r2, r0
    bgt .L_1784
    bge .L_1bb8
    sub r1, r0, #0x208
    cmp r2, r1
    bgt .L_1578
    sub r0, r0, #0x208
    cmp r2, r0
    bge .L_1b74
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_148c
    bge .L_1bb8
    sub r1, r0, #0x93
    cmp r2, r1
    bgt .L_1404
    sub r0, r0, #0x93
    cmp r2, r0
    bge .L_1b7c
    ldr r1, _LIT2
    cmp r2, r1
    bgt .L_13bc
    bge .L_1b7c
    sub r0, r1, #0xb8
    cmp r2, r0
    bgt .L_13ac
    beq .L_1bb0
    b .L_1d58
.L_13ac:
    sub r0, r1, #0x8c
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_13bc:
    ldr r1, _LIT3
    cmp r2, r1
    bgt .L_13f4
    sub r0, r1, #0x3
    cmp r2, r0
    blt .L_13e4
    beq .L_1bb0
    cmp r2, r1
    beq .L_1b7c
    b .L_1d58
.L_13e4:
    sub r0, r1, #0x75
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_13f4:
    add r0, r1, #0x56
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_1404:
    sub r1, r0, #0x24
    cmp r2, r1
    bgt .L_1444
    bge .L_1c3c
    sub r1, r0, #0x3b
    cmp r2, r1
    bgt .L_1434
    bge .L_1b7c
    sub r0, r0, #0x89
    cmp r2, r0
    beq .L_1c28
    b .L_1d58
.L_1434:
    sub r0, r0, #0x36
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_1444:
    sub r1, r0, #0x6
    cmp r2, r1
    bgt .L_147c
    bge .L_1bb0
    sub r1, r0, #0x22
    cmp r2, r1
    bgt .L_1d58
    sub r1, r0, #0x23
    cmp r2, r1
    blt .L_1d58
    subne r0, r0, #0x22
    cmpne r2, r0
    beq .L_1b74
    b .L_1d58
.L_147c:
    sub r0, r0, #0x5
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_148c:
    add r1, r0, #0xa2
    cmp r2, r1
    bgt .L_1508
    bge .L_1bb0
    add r1, r0, #0x2c
    cmp r2, r1
    bgt .L_14d8
    bge .L_1b7c
    add r1, r0, #0xc
    cmp r2, r1
    bgt .L_14c8
    add r0, r0, #0xc
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_14c8:
    add r0, r0, #0x2b
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_14d8:
    add r1, r0, #0x5b
    cmp r2, r1
    bgt .L_14f8
    bge .L_1b7c
    add r0, r0, #0x43
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_14f8:
    add r0, r0, #0x94
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_1508:
    ldr r1, _LIT4
    cmp r2, r1
    bgt .L_1548
    bge .L_1b74
    sub r0, r1, #0x7f
    cmp r2, r0
    bgt .L_1538
    bge .L_1b74
    sub r0, r1, #0x86
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_1538:
    sub r0, r1, #0x1c
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_1548:
    add r0, r1, #0x1e
    cmp r2, r0
    bgt .L_1568
    bge .L_1bb0
    add r0, r1, #0x3
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_1568:
    add r0, r1, #0x37
    cmp r2, r0
    beq .L_1b84
    b .L_1d58
.L_1578:
    sub r1, r0, #0xf8
    cmp r2, r1
    bgt .L_167c
    sub r0, r0, #0xf8
    cmp r2, r0
    bge .L_1b7c
    ldr r0, _LIT5
    cmp r2, r0
    bgt .L_160c
    bge .L_1b74
    sub r1, r0, #0x5d
    cmp r2, r1
    bgt .L_15dc
    bge .L_1b7c
    sub r1, r0, #0x60
    cmp r2, r1
    bgt .L_15cc
    sub r0, r0, #0x60
    cmp r2, r0
    beq .L_1c68
    b .L_1d58
.L_15cc:
    sub r0, r0, #0x5f
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_15dc:
    sub r1, r0, #0x27
    cmp r2, r1
    bgt .L_15fc
    bge .L_1c3c
    sub r0, r0, #0x2a
    cmp r2, r0
    beq .L_1b84
    b .L_1d58
.L_15fc:
    sub r0, r0, #0x13
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_160c:
    add r1, r0, #0x6a
    cmp r2, r1
    bgt .L_164c
    bge .L_1b84
    add r1, r0, #0x37
    cmp r2, r1
    bgt .L_163c
    bge .L_1bb0
    add r0, r0, #0x3
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_163c:
    add r0, r0, #0x4c
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_164c:
    add r1, r0, #0x76
    cmp r2, r1
    bgt .L_166c
    bge .L_1b84
    add r0, r0, #0x73
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_166c:
    add r0, r0, #0x98
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_167c:
    sub r1, r0, #0xa4
    cmp r2, r1
    bgt .L_16f8
    bge .L_1c7c
    sub r1, r0, #0xd6
    cmp r2, r1
    bgt .L_16c8
    bge .L_1b7c
    sub r1, r0, #0xe0
    cmp r2, r1
    bgt .L_16b8
    sub r0, r0, #0xe0
    cmp r2, r0
    beq .L_1bb8
    b .L_1d58
.L_16b8:
    sub r0, r0, #0xde
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_16c8:
    sub r1, r0, #0xb8
    cmp r2, r1
    bgt .L_16e8
    bge .L_1b7c
    sub r0, r0, #0xd3
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_16e8:
    sub r0, r0, #0xb1
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_16f8:
    sub r1, r0, #0x29
    cmp r2, r1
    bgt .L_1754
    bge .L_1b74
    sub r1, r0, #0x9b
    cmp r2, r1
    bgt .L_1744
    sub r1, r0, #0x9c
    cmp r2, r1
    blt .L_1734
    beq .L_1bb0
    sub r0, r0, #0x9b
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_1734:
    sub r0, r0, #0xa2
    cmp r2, r0
    beq .L_1bb8
    b .L_1d58
.L_1744:
    sub r0, r0, #0x53
    cmp r2, r0
    beq .L_1b84
    b .L_1d58
.L_1754:
    sub r1, r0, #0x17
    cmp r2, r1
    bgt .L_1774
    bge .L_1b7c
    sub r0, r0, #0x1d
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_1774:
    sub r0, r0, #0x8
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_1784:
    ldr r1, _LIT6
    cmp r2, r1
    bgt .L_1994
    bge .L_1b7c
    ldr r0, _LIT7
    cmp r2, r0
    bgt .L_1890
    bge .L_1b74
    sub r1, r0, #0x81
    cmp r2, r1
    bgt .L_1820
    bge .L_1b7c
    sub r1, r0, #0xcc
    cmp r2, r1
    bgt .L_17f0
    bge .L_1b84
    sub r1, r0, #0xf7
    cmp r2, r1
    bgt .L_17e0
    sub r0, r0, #0xf7
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_17e0:
    sub r0, r0, #0xcd
    cmp r2, r0
    beq .L_1bb8
    b .L_1d58
.L_17f0:
    sub r1, r0, #0xb3
    cmp r2, r1
    bgt .L_1810
    bge .L_1b74
    sub r0, r0, #0xc5
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_1810:
    sub r0, r0, #0x88
    cmp r2, r0
    beq .L_1b84
    b .L_1d58
.L_1820:
    sub r1, r0, #0x2b
    cmp r2, r1
    bgt .L_1860
    bge .L_1bb0
    sub r1, r0, #0x60
    cmp r2, r1
    bgt .L_1850
    bge .L_1b74
    sub r0, r0, #0x69
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_1850:
    sub r0, r0, #0x2c
    cmp r2, r0
    beq .L_1bb8
    b .L_1d58
.L_1860:
    sub r1, r0, #0x18
    cmp r2, r1
    bgt .L_1880
    bge .L_1bb8
    sub r0, r0, #0x1c
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_1880:
    sub r0, r0, #0xe
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_1890:
    add r3, r0, #0xb9
    cmp r2, r3
    bgt .L_1914
    mov r1, r3
    cmp r2, r1
    bge .L_1bb8
    add r1, r0, #0x74
    cmp r2, r1
    bgt .L_18e4
    bge .L_1bb0
    add r1, r0, #0xe
    cmp r2, r1
    bgt .L_18d4
    add r0, r0, #0xe
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_18d4:
    add r0, r0, #0x66
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_18e4:
    add r1, r0, #0x88
    cmp r2, r1
    bgt .L_1904
    bge .L_1bb0
    add r0, r0, #0x7d
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_1904:
    add r0, r0, #0x8b
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_1914:
    add r3, r0, #0x124
    cmp r2, r3
    bgt .L_195c
    bge .L_1bb0
    sub r3, r1, #0x84
    cmp r2, r3
    bgt .L_194c
    mov r0, r3
    cmp r2, r0
    bge .L_1b74
    sub r0, r1, #0x85
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_194c:
    add r0, r0, #0x10c
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_195c:
    sub r3, r1, #0x3f
    cmp r2, r3
    bgt .L_1984
    mov r0, r3
    cmp r2, r0
    bge .L_1bb8
    sub r0, r1, #0x58
    cmp r2, r0
    beq .L_1b84
    b .L_1d58
.L_1984:
    add r0, r0, #0x18c
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_1994:
    cmp r2, #0x1a80
    bgt .L_1a84
    bge .L_1c28
    add r0, r1, #0x91
    cmp r2, r0
    bgt .L_1a14
    bge .L_1b7c
    add r0, r1, #0x41
    cmp r2, r0
    bgt .L_19e4
    bge .L_1b7c
    add r0, r1, #0x7
    cmp r2, r0
    bgt .L_19d4
    beq .L_1b84
    b .L_1d58
.L_19d4:
    add r0, r1, #0xe
    cmp r2, r0
    beq .L_1b84
    b .L_1d58
.L_19e4:
    add r0, r1, #0x66
    cmp r2, r0
    bgt .L_1a04
    bge .L_1b7c
    add r0, r1, #0x4e
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_1a04:
    add r0, r1, #0x73
    cmp r2, r0
    beq .L_1bb8
    b .L_1d58
.L_1a14:
    add r0, r1, #0xc2
    cmp r2, r0
    bgt .L_1a54
    bge .L_1b74
    add r0, r1, #0xaf
    cmp r2, r0
    bgt .L_1a44
    bge .L_1bb0
    add r0, r1, #0xa8
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_1a44:
    add r0, r1, #0xbc
    cmp r2, r0
    beq .L_1b84
    b .L_1d58
.L_1a54:
    add r0, r1, #0xc6
    cmp r2, r0
    bgt .L_1a74
    bge .L_1ca0
    add r0, r1, #0xc3
    cmp r2, r0
    beq .L_1b74
    b .L_1d58
.L_1a74:
    add r0, r1, #0xd3
    cmp r2, r0
    beq .L_1bd0
    b .L_1d58
.L_1a84:
    add r0, r1, #0x19c
    cmp r2, r0
    bgt .L_1b04
    bge .L_1cf4
    ldr r1, _LIT8
    cmp r2, r1
    bgt .L_1ad4
    bge .L_1b7c
    sub r0, r1, #0x1a
    cmp r2, r0
    bgt .L_1ac4
    bge .L_1cd8
    sub r0, r1, #0x1f
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_1ac4:
    sub r0, r1, #0x11
    cmp r2, r0
    beq .L_1bb8
    b .L_1d58
.L_1ad4:
    add r0, r1, #0x31
    cmp r2, r0
    bgt .L_1af4
    bge .L_1b84
    add r0, r1, #0x26
    cmp r2, r0
    beq .L_1b84
    b .L_1d58
.L_1af4:
    add r0, r1, #0x41
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_1b04:
    ldr r1, _LIT9
    cmp r2, r1
    bgt .L_1b44
    bge .L_1d58
    sub r0, r1, #0x7
    cmp r2, r0
    bgt .L_1b34
    bge .L_1b7c
    sub r0, r1, #0x3e
    cmp r2, r0
    beq .L_1bb0
    b .L_1d58
.L_1b34:
    sub r0, r1, #0x6
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_1b44:
    add r0, r1, #0xf
    cmp r2, r0
    bgt .L_1b64
    bge .L_1b84
    add r0, r1, #0x2
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_1b64:
    add r0, r1, #0x1a
    cmp r2, r0
    beq .L_1b7c
    b .L_1d58
.L_1b74:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1b7c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1b84:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0x5
    bcc .L_1d58
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_1bb0:
    mov r0, #0x4
    ldmia sp!, {r3, r4, r5, pc}
.L_1bb8:
    mov r0, r4
    bl func_ov002_02257a44
    cmp r0, #0x0
    beq .L_1d58
    mov r0, #0x6
    ldmia sp!, {r3, r4, r5, pc}
.L_1bd0:
    ldrh r0, [r4, #0x6]
    mov r5, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_1d58
.L_1be8:
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223de94
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
    blt .L_1be8
    b .L_1d58
.L_1c28:
    ldrh r0, [r4, #0xc]
    cmp r0, #0x1
    bne .L_1d58
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1c3c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x1f
    cmpne r0, #0x20
    cmpne r0, #0x21
    bne .L_1c60
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1c60:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1c68:
    ldrh r0, [r4, #0x8]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1c7c:
    ldrh r1, [r4, #-22]
    mov r0, #0x0
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0x5
    ldmccia sp!, {r3, r4, r5, pc}
    cmp r1, #0xa
    movls r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1ca0:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bcf00
    cmp r0, #0x0
    beq .L_1d58
    mov r0, #0x6
    ldmia sp!, {r3, r4, r5, pc}
.L_1cd8:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_1d58
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1cf4:
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
.L_1d58:
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
_LIT12: .word data_ov002_022cf16c
