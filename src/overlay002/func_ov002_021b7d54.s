; func_ov002_021b7d54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e234
        .extern func_ov002_0223de94
        .global func_ov002_021b7d54
        .arm
func_ov002_021b7d54:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ldrh r0, [r5, #0x6]
    mov r4, #0x0
    mov r8, r4
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_224
    mov r6, r4
    mov r7, #0x1
.L_1c8:
    mov r0, r5
    mov r1, r8
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xe
    and r1, r0, #0xff
    bne .L_210
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r1
    movne r0, r7
    moveq r0, r6
    add r0, r0, #0x1
    orr r4, r4, r0
.L_210:
    ldrh r0, [r5, #0x6]
    add r8, r8, #0x1
    mov r0, r0, lsl #0x18
    cmp r8, r0, lsr #0x18
    blt .L_1c8
.L_224:
    ldrh r2, [r5]
    ldr r1, _LIT0
    cmp r2, r1
    bgt .L_664
    bge .L_a44
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_45c
    bge .L_a44
    sub r1, r0, #0x160
    cmp r2, r1
    bgt .L_34c
    bge .L_a44
    sub r1, r0, #0x230
    cmp r2, r1
    bgt .L_2d4
    bge .L_a6c
    ldr r3, _LIT2
    cmp r2, r3
    bgt .L_29c
    bge .L_a44
    sub r0, r3, #0x12c
    cmp r2, r0
    bgt .L_28c
    beq .L_a44
    b .L_b18
.L_28c:
    sub r0, r3, #0xcb
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_29c:
    add r1, r3, #0x15c
    cmp r2, r1
    bgt .L_2c4
    mov r0, r1
    cmp r2, r0
    bge .L_a44
    add r0, r3, #0x1a
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_2c4:
    sub r0, r0, #0x244
    cmp r2, r0
    beq .L_a64
    b .L_b18
.L_2d4:
    ldr r1, _LIT3
    cmp r2, r1
    bgt .L_300
    bge .L_a44
    sub r0, r1, #0x6f
    cmp r2, r0
    ble .L_b18
    sub r0, r1, #0x1e
    cmp r2, r0
    beq .L_a98
    b .L_b18
.L_300:
    add r0, r1, #0x20
    cmp r2, r0
    bgt .L_33c
    bge .L_a4c
    add r0, r1, #0xd
    cmp r2, r0
    bgt .L_b18
    add r0, r1, #0xc
    cmp r2, r0
    blt .L_b18
    beq .L_a54
    add r0, r1, #0xd
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_33c:
    add r0, r1, #0x24
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_34c:
    sub r1, r0, #0x98
    cmp r2, r1
    bgt .L_3ec
    bge .L_a98
    sub r1, r0, #0xd5
    cmp r2, r1
    bgt .L_398
    bge .L_a64
    sub r1, r0, #0xf5
    cmp r2, r1
    bgt .L_388
    sub r0, r0, #0xf5
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_388:
    sub r0, r0, #0xec
    cmp r2, r0
    beq .L_a5c
    b .L_b18
.L_398:
    sub r1, r0, #0xa5
    cmp r2, r1
    bgt .L_3b8
    bge .L_a5c
    sub r0, r0, #0xad
    cmp r2, r0
    beq .L_a4c
    b .L_b18
.L_3b8:
    sub r1, r0, #0x9e
    cmp r2, r1
    bgt .L_b18
    sub r1, r0, #0xa4
    cmp r2, r1
    blt .L_b18
    beq .L_a44
    sub r1, r0, #0xa1
    cmp r2, r1
    subne r0, r0, #0x9e
    cmpne r2, r0
    beq .L_a98
    b .L_b18
.L_3ec:
    sub r1, r0, #0x43
    cmp r2, r1
    bgt .L_42c
    bge .L_a44
    sub r1, r0, #0x62
    cmp r2, r1
    bgt .L_41c
    bge .L_a4c
    sub r0, r0, #0x93
    cmp r2, r0
    beq .L_a98
    b .L_b18
.L_41c:
    sub r0, r0, #0x5f
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_42c:
    sub r1, r0, #0x18
    cmp r2, r1
    bgt .L_44c
    bge .L_a44
    sub r0, r0, #0x29
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_44c:
    sub r0, r0, #0x3
    cmp r2, r0
    beq .L_a4c
    b .L_b18
.L_45c:
    add r3, r0, #0xfc
    cmp r2, r3
    bgt .L_560
    mov r1, r3
    cmp r2, r1
    bge .L_a4c
    add r1, r0, #0x4c
    cmp r2, r1
    bgt .L_4f0
    bge .L_a54
    add r1, r0, #0xc
    cmp r2, r1
    bgt .L_4c0
    bge .L_a44
    add r1, r0, #0x5
    cmp r2, r1
    bgt .L_4b0
    add r0, r0, #0x5
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_4b0:
    add r0, r0, #0x6
    cmp r2, r0
    beq .L_a54
    b .L_b18
.L_4c0:
    add r1, r0, #0x11
    cmp r2, r1
    bgt .L_4e0
    bge .L_a54
    add r0, r0, #0xd
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_4e0:
    add r0, r0, #0x4a
    cmp r2, r0
    beq .L_ab8
    b .L_b18
.L_4f0:
    add r1, r0, #0x8c
    cmp r2, r1
    bgt .L_530
    bge .L_a44
    add r1, r0, #0x80
    cmp r2, r1
    bgt .L_520
    bge .L_a44
    add r0, r0, #0x5f
    cmp r2, r0
    beq .L_a98
    b .L_b18
.L_520:
    add r0, r0, #0x83
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_530:
    add r1, r0, #0xa5
    cmp r2, r1
    bgt .L_550
    bge .L_a64
    add r0, r0, #0xa1
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_550:
    add r0, r0, #0xa8
    cmp r2, r0
    beq .L_a64
    b .L_b18
.L_560:
    sub r3, r1, #0x73
    cmp r2, r3
    bgt .L_5e4
    bge .L_a44
    sub r3, r1, #0x93
    cmp r2, r3
    bgt .L_5ac
    mov r0, r3
    cmp r2, r0
    bge .L_a5c
    sub r0, r1, #0xa7
    cmp r2, r0
    bgt .L_59c
    beq .L_a4c
    b .L_b18
.L_59c:
    sub r0, r1, #0x94
    cmp r2, r0
    beq .L_a5c
    b .L_b18
.L_5ac:
    sub r3, r1, #0x7b
    cmp r2, r3
    bgt .L_5d4
    sub r1, r1, #0x7b
    cmp r2, r1
    bge .L_a5c
    add r0, r0, #0x12c
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_5d4:
    sub r0, r1, #0x74
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_5e4:
    sub r3, r1, #0x40
    cmp r2, r3
    bgt .L_62c
    bge .L_a44
    add r3, r0, #0x160
    cmp r2, r3
    bgt .L_61c
    add r0, r0, #0x160
    cmp r2, r0
    bge .L_a44
    sub r0, r1, #0x6c
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_61c:
    sub r0, r1, #0x55
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_62c:
    add r3, r0, #0x19c
    cmp r2, r3
    bgt .L_654
    add r0, r0, #0x19c
    cmp r2, r0
    bge .L_ad8
    sub r0, r1, #0x27
    cmp r2, r0
    beq .L_a5c
    b .L_b18
.L_654:
    sub r0, r1, #0x15
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_664:
    add r0, r1, #0x228
    cmp r2, r0
    bgt .L_83c
    bge .L_a44
    add r0, r1, #0xf6
    cmp r2, r0
    bgt .L_75c
    bge .L_a98
    add r0, r1, #0xa1
    cmp r2, r0
    bgt .L_6f8
    bge .L_a44
    add r0, r1, #0x31
    cmp r2, r0
    bgt .L_6c8
    bge .L_a44
    add r0, r1, #0x4
    cmp r2, r0
    bgt .L_6b8
    beq .L_a44
    b .L_b18
.L_6b8:
    add r0, r1, #0x18
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_6c8:
    add r0, r1, #0x6f
    cmp r2, r0
    bgt .L_6e8
    bge .L_a5c
    add r0, r1, #0x54
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_6e8:
    add r0, r1, #0x70
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_6f8:
    add r0, r1, #0xe6
    cmp r2, r0
    bgt .L_72c
    bge .L_a44
    add r0, r1, #0xc5
    cmp r2, r0
    bgt .L_71c
    beq .L_a44
    b .L_b18
.L_71c:
    add r0, r1, #0xe4
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_72c:
    add r0, r1, #0xed
    cmp r2, r0
    bgt .L_74c
    bge .L_a64
    add r0, r1, #0xe8
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_74c:
    add r0, r1, #0xf1
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_75c:
    ldr r1, _LIT4
    cmp r2, r1
    bgt .L_7d0
    bge .L_a44
    sub r0, r1, #0x54
    cmp r2, r0
    bgt .L_7a0
    bge .L_a44
    sub r0, r1, #0xa3
    cmp r2, r0
    bgt .L_790
    beq .L_a44
    b .L_b18
.L_790:
    sub r0, r1, #0x8e
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_7a0:
    sub r0, r1, #0x25
    cmp r2, r0
    bgt .L_7c0
    bge .L_a44
    sub r0, r1, #0x4e
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_7c0:
    sub r0, r1, #0x8
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_7d0:
    cmp r2, #0x1880
    bgt .L_80c
    bge .L_a44
    add r0, r1, #0x35
    cmp r2, r0
    bgt .L_7fc
    bge .L_a44
    add r0, r1, #0x1f
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_7fc:
    add r0, r1, #0x3a
    cmp r2, r0
    beq .L_ab8
    b .L_b18
.L_80c:
    add r0, r1, #0x50
    cmp r2, r0
    bgt .L_82c
    bge .L_a44
    add r0, r1, #0x3c
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_82c:
    add r0, r1, #0x5f
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_83c:
    ldr r0, _LIT5
    cmp r2, r0
    bgt .L_95c
    bge .L_a44
    sub r1, r0, #0x7b
    cmp r2, r1
    bgt .L_8c8
    bge .L_a5c
    sub r1, r0, #0xb0
    cmp r2, r1
    bgt .L_898
    bge .L_a44
    sub r1, r0, #0xcd
    cmp r2, r1
    bgt .L_888
    sub r0, r0, #0xcd
    cmp r2, r0
    beq .L_af0
    b .L_b18
.L_888:
    sub r0, r0, #0xb8
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_898:
    sub r1, r0, #0x93
    cmp r2, r1
    bgt .L_8b8
    bge .L_a44
    sub r0, r0, #0x9f
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_8b8:
    sub r0, r0, #0x86
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_8c8:
    sub r1, r0, #0x5b
    cmp r2, r1
    bgt .L_92c
    sub r1, r0, #0x63
    cmp r2, r1
    blt .L_8fc
    subne r1, r0, #0x5e
    cmpne r2, r1
    beq .L_a44
    sub r0, r0, #0x5b
    cmp r2, r0
    beq .L_ab8
    b .L_b18
.L_8fc:
    sub r1, r0, #0x66
    cmp r2, r1
    bgt .L_91c
    bge .L_a44
    sub r0, r0, #0x68
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_91c:
    sub r0, r0, #0x64
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_92c:
    sub r1, r0, #0x47
    cmp r2, r1
    bgt .L_94c
    bge .L_a54
    sub r0, r0, #0x49
    cmp r2, r0
    beq .L_a5c
    b .L_b18
.L_94c:
    sub r0, r0, #0x26
    cmp r2, r0
    beq .L_a5c
    b .L_b18
.L_95c:
    add r1, r0, #0x82
    cmp r2, r1
    bgt .L_9d8
    bge .L_a44
    add r1, r0, #0x2e
    cmp r2, r1
    bgt .L_9a8
    bge .L_a5c
    add r1, r0, #0x1d
    cmp r2, r1
    bgt .L_998
    add r0, r0, #0x1d
    cmp r2, r0
    beq .L_a4c
    b .L_b18
.L_998:
    add r0, r0, #0x2c
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_9a8:
    add r1, r0, #0x6b
    cmp r2, r1
    bgt .L_9c8
    bge .L_a44
    add r0, r0, #0x3b
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_9c8:
    add r0, r0, #0x81
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_9d8:
    add r1, r0, #0xc4
    cmp r2, r1
    bgt .L_a18
    bge .L_a44
    add r1, r0, #0x94
    cmp r2, r1
    bgt .L_a08
    bge .L_a44
    add r0, r0, #0x8d
    cmp r2, r0
    beq .L_a44
    b .L_b18
.L_a08:
    add r0, r0, #0xbe
    cmp r2, r0
    beq .L_a64
    b .L_b18
.L_a18:
    ldr r0, _LIT6
    cmp r2, r0
    bgt .L_a38
    bge .L_b18
    sub r0, r0, #0x50
    cmp r2, r0
    beq .L_a98
    b .L_b18
.L_a38:
    add r0, r0, #0x6c
    cmp r2, r0
    bne .L_b18
.L_a44:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_a4c:
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_a54:
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_a5c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_a64:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_a6c:
    ldr r1, [r5, #0x14]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x16
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    add r0, r0, #0x1
    orr r4, r4, r0
    b .L_b18
.L_a98:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    orr r4, r4, r0
    b .L_b18
.L_ab8:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    orr r4, r4, r0
    b .L_b18
.L_ad8:
    ldrh r0, [r5, #0xc]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    orr r4, r4, r0
    b .L_b18
.L_af0:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq .L_b18
    ldr r0, [r5, #0x14]
    bl func_0202e234
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_b18:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x000016a4
_LIT1: .word 0x000014ea
_LIT2: .word 0x00001138
_LIT3: .word 0x00001359
_LIT4: .word 0x00001845
_LIT5: .word 0x000019d7
_LIT6: .word 0x00001af9
