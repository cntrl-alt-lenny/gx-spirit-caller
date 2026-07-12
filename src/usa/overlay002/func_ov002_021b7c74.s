; func_ov002_021b7c74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e1e0
        .extern func_ov002_0223dda4
        .global func_ov002_021b7c74
        .arm
func_ov002_021b7c74:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ldrh r0, [r5, #0x6]
    mov r4, #0x0
    mov r8, r4
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_88
    mov r6, r4
    mov r7, #0x1
.L_2c:
    mov r0, r5
    mov r1, r8
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xe
    and r1, r0, #0xff
    bne .L_74
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r1
    movne r0, r7
    moveq r0, r6
    add r0, r0, #0x1
    orr r4, r4, r0
.L_74:
    ldrh r0, [r5, #0x6]
    add r8, r8, #0x1
    mov r0, r0, lsl #0x18
    cmp r8, r0, lsr #0x18
    blt .L_2c
.L_88:
    ldrh r2, [r5]
    ldr r1, _LIT0
    cmp r2, r1
    bgt .L_4c8
    bge .L_8a8
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_2c0
    bge .L_8a8
    sub r1, r0, #0x160
    cmp r2, r1
    bgt .L_1b0
    bge .L_8a8
    sub r1, r0, #0x230
    cmp r2, r1
    bgt .L_138
    bge .L_8d0
    ldr r3, _LIT2
    cmp r2, r3
    bgt .L_100
    bge .L_8a8
    sub r0, r3, #0x12c
    cmp r2, r0
    bgt .L_f0
    beq .L_8a8
    b .L_97c
.L_f0:
    sub r0, r3, #0xcb
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_100:
    add r1, r3, #0x15c
    cmp r2, r1
    bgt .L_128
    mov r0, r1
    cmp r2, r0
    bge .L_8a8
    add r0, r3, #0x1a
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_128:
    sub r0, r0, #0x244
    cmp r2, r0
    beq .L_8c8
    b .L_97c
.L_138:
    ldr r1, _LIT3
    cmp r2, r1
    bgt .L_164
    bge .L_8a8
    sub r0, r1, #0x6f
    cmp r2, r0
    ble .L_97c
    sub r0, r1, #0x1e
    cmp r2, r0
    beq .L_8fc
    b .L_97c
.L_164:
    add r0, r1, #0x20
    cmp r2, r0
    bgt .L_1a0
    bge .L_8b0
    add r0, r1, #0xd
    cmp r2, r0
    bgt .L_97c
    add r0, r1, #0xc
    cmp r2, r0
    blt .L_97c
    beq .L_8b8
    add r0, r1, #0xd
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_1a0:
    add r0, r1, #0x24
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_1b0:
    sub r1, r0, #0x98
    cmp r2, r1
    bgt .L_250
    bge .L_8fc
    sub r1, r0, #0xd5
    cmp r2, r1
    bgt .L_1fc
    bge .L_8c8
    sub r1, r0, #0xf5
    cmp r2, r1
    bgt .L_1ec
    sub r0, r0, #0xf5
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_1ec:
    sub r0, r0, #0xec
    cmp r2, r0
    beq .L_8c0
    b .L_97c
.L_1fc:
    sub r1, r0, #0xa5
    cmp r2, r1
    bgt .L_21c
    bge .L_8c0
    sub r0, r0, #0xad
    cmp r2, r0
    beq .L_8b0
    b .L_97c
.L_21c:
    sub r1, r0, #0x9e
    cmp r2, r1
    bgt .L_97c
    sub r1, r0, #0xa4
    cmp r2, r1
    blt .L_97c
    beq .L_8a8
    sub r1, r0, #0xa1
    cmp r2, r1
    subne r0, r0, #0x9e
    cmpne r2, r0
    beq .L_8fc
    b .L_97c
.L_250:
    sub r1, r0, #0x43
    cmp r2, r1
    bgt .L_290
    bge .L_8a8
    sub r1, r0, #0x62
    cmp r2, r1
    bgt .L_280
    bge .L_8b0
    sub r0, r0, #0x93
    cmp r2, r0
    beq .L_8fc
    b .L_97c
.L_280:
    sub r0, r0, #0x5f
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_290:
    sub r1, r0, #0x18
    cmp r2, r1
    bgt .L_2b0
    bge .L_8a8
    sub r0, r0, #0x29
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_2b0:
    sub r0, r0, #0x3
    cmp r2, r0
    beq .L_8b0
    b .L_97c
.L_2c0:
    add r3, r0, #0xfc
    cmp r2, r3
    bgt .L_3c4
    mov r1, r3
    cmp r2, r1
    bge .L_8b0
    add r1, r0, #0x4c
    cmp r2, r1
    bgt .L_354
    bge .L_8b8
    add r1, r0, #0xc
    cmp r2, r1
    bgt .L_324
    bge .L_8a8
    add r1, r0, #0x5
    cmp r2, r1
    bgt .L_314
    add r0, r0, #0x5
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_314:
    add r0, r0, #0x6
    cmp r2, r0
    beq .L_8b8
    b .L_97c
.L_324:
    add r1, r0, #0x11
    cmp r2, r1
    bgt .L_344
    bge .L_8b8
    add r0, r0, #0xd
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_344:
    add r0, r0, #0x4a
    cmp r2, r0
    beq .L_91c
    b .L_97c
.L_354:
    add r1, r0, #0x8c
    cmp r2, r1
    bgt .L_394
    bge .L_8a8
    add r1, r0, #0x80
    cmp r2, r1
    bgt .L_384
    bge .L_8a8
    add r0, r0, #0x5f
    cmp r2, r0
    beq .L_8fc
    b .L_97c
.L_384:
    add r0, r0, #0x83
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_394:
    add r1, r0, #0xa5
    cmp r2, r1
    bgt .L_3b4
    bge .L_8c8
    add r0, r0, #0xa1
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_3b4:
    add r0, r0, #0xa8
    cmp r2, r0
    beq .L_8c8
    b .L_97c
.L_3c4:
    sub r3, r1, #0x73
    cmp r2, r3
    bgt .L_448
    bge .L_8a8
    sub r3, r1, #0x93
    cmp r2, r3
    bgt .L_410
    mov r0, r3
    cmp r2, r0
    bge .L_8c0
    sub r0, r1, #0xa7
    cmp r2, r0
    bgt .L_400
    beq .L_8b0
    b .L_97c
.L_400:
    sub r0, r1, #0x94
    cmp r2, r0
    beq .L_8c0
    b .L_97c
.L_410:
    sub r3, r1, #0x7b
    cmp r2, r3
    bgt .L_438
    sub r1, r1, #0x7b
    cmp r2, r1
    bge .L_8c0
    add r0, r0, #0x12c
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_438:
    sub r0, r1, #0x74
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_448:
    sub r3, r1, #0x40
    cmp r2, r3
    bgt .L_490
    bge .L_8a8
    add r3, r0, #0x160
    cmp r2, r3
    bgt .L_480
    add r0, r0, #0x160
    cmp r2, r0
    bge .L_8a8
    sub r0, r1, #0x6c
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_480:
    sub r0, r1, #0x55
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_490:
    add r3, r0, #0x19c
    cmp r2, r3
    bgt .L_4b8
    add r0, r0, #0x19c
    cmp r2, r0
    bge .L_93c
    sub r0, r1, #0x27
    cmp r2, r0
    beq .L_8c0
    b .L_97c
.L_4b8:
    sub r0, r1, #0x15
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_4c8:
    add r0, r1, #0x228
    cmp r2, r0
    bgt .L_6a0
    bge .L_8a8
    add r0, r1, #0xf6
    cmp r2, r0
    bgt .L_5c0
    bge .L_8fc
    add r0, r1, #0xa1
    cmp r2, r0
    bgt .L_55c
    bge .L_8a8
    add r0, r1, #0x31
    cmp r2, r0
    bgt .L_52c
    bge .L_8a8
    add r0, r1, #0x4
    cmp r2, r0
    bgt .L_51c
    beq .L_8a8
    b .L_97c
.L_51c:
    add r0, r1, #0x18
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_52c:
    add r0, r1, #0x6f
    cmp r2, r0
    bgt .L_54c
    bge .L_8c0
    add r0, r1, #0x54
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_54c:
    add r0, r1, #0x70
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_55c:
    add r0, r1, #0xe6
    cmp r2, r0
    bgt .L_590
    bge .L_8a8
    add r0, r1, #0xc5
    cmp r2, r0
    bgt .L_580
    beq .L_8a8
    b .L_97c
.L_580:
    add r0, r1, #0xe4
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_590:
    add r0, r1, #0xed
    cmp r2, r0
    bgt .L_5b0
    bge .L_8c8
    add r0, r1, #0xe8
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_5b0:
    add r0, r1, #0xf1
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_5c0:
    ldr r1, _LIT4
    cmp r2, r1
    bgt .L_634
    bge .L_8a8
    sub r0, r1, #0x54
    cmp r2, r0
    bgt .L_604
    bge .L_8a8
    sub r0, r1, #0xa3
    cmp r2, r0
    bgt .L_5f4
    beq .L_8a8
    b .L_97c
.L_5f4:
    sub r0, r1, #0x8e
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_604:
    sub r0, r1, #0x25
    cmp r2, r0
    bgt .L_624
    bge .L_8a8
    sub r0, r1, #0x4e
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_624:
    sub r0, r1, #0x8
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_634:
    cmp r2, #0x1880
    bgt .L_670
    bge .L_8a8
    add r0, r1, #0x35
    cmp r2, r0
    bgt .L_660
    bge .L_8a8
    add r0, r1, #0x1f
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_660:
    add r0, r1, #0x3a
    cmp r2, r0
    beq .L_91c
    b .L_97c
.L_670:
    add r0, r1, #0x50
    cmp r2, r0
    bgt .L_690
    bge .L_8a8
    add r0, r1, #0x3c
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_690:
    add r0, r1, #0x5f
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_6a0:
    ldr r0, _LIT5
    cmp r2, r0
    bgt .L_7c0
    bge .L_8a8
    sub r1, r0, #0x7b
    cmp r2, r1
    bgt .L_72c
    bge .L_8c0
    sub r1, r0, #0xb0
    cmp r2, r1
    bgt .L_6fc
    bge .L_8a8
    sub r1, r0, #0xcd
    cmp r2, r1
    bgt .L_6ec
    sub r0, r0, #0xcd
    cmp r2, r0
    beq .L_954
    b .L_97c
.L_6ec:
    sub r0, r0, #0xb8
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_6fc:
    sub r1, r0, #0x93
    cmp r2, r1
    bgt .L_71c
    bge .L_8a8
    sub r0, r0, #0x9f
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_71c:
    sub r0, r0, #0x86
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_72c:
    sub r1, r0, #0x5b
    cmp r2, r1
    bgt .L_790
    sub r1, r0, #0x63
    cmp r2, r1
    blt .L_760
    subne r1, r0, #0x5e
    cmpne r2, r1
    beq .L_8a8
    sub r0, r0, #0x5b
    cmp r2, r0
    beq .L_91c
    b .L_97c
.L_760:
    sub r1, r0, #0x66
    cmp r2, r1
    bgt .L_780
    bge .L_8a8
    sub r0, r0, #0x68
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_780:
    sub r0, r0, #0x64
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_790:
    sub r1, r0, #0x47
    cmp r2, r1
    bgt .L_7b0
    bge .L_8b8
    sub r0, r0, #0x49
    cmp r2, r0
    beq .L_8c0
    b .L_97c
.L_7b0:
    sub r0, r0, #0x26
    cmp r2, r0
    beq .L_8c0
    b .L_97c
.L_7c0:
    add r1, r0, #0x82
    cmp r2, r1
    bgt .L_83c
    bge .L_8a8
    add r1, r0, #0x2e
    cmp r2, r1
    bgt .L_80c
    bge .L_8c0
    add r1, r0, #0x1d
    cmp r2, r1
    bgt .L_7fc
    add r0, r0, #0x1d
    cmp r2, r0
    beq .L_8b0
    b .L_97c
.L_7fc:
    add r0, r0, #0x2c
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_80c:
    add r1, r0, #0x6b
    cmp r2, r1
    bgt .L_82c
    bge .L_8a8
    add r0, r0, #0x3b
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_82c:
    add r0, r0, #0x81
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_83c:
    add r1, r0, #0xc4
    cmp r2, r1
    bgt .L_87c
    bge .L_8a8
    add r1, r0, #0x94
    cmp r2, r1
    bgt .L_86c
    bge .L_8a8
    add r0, r0, #0x8d
    cmp r2, r0
    beq .L_8a8
    b .L_97c
.L_86c:
    add r0, r0, #0xbe
    cmp r2, r0
    beq .L_8c8
    b .L_97c
.L_87c:
    ldr r0, _LIT6
    cmp r2, r0
    bgt .L_89c
    bge .L_97c
    sub r0, r0, #0x50
    cmp r2, r0
    beq .L_8fc
    b .L_97c
.L_89c:
    add r0, r0, #0x6c
    cmp r2, r0
    bne .L_97c
.L_8a8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_8b0:
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_8b8:
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_8c0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_8c8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_8d0:
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
    b .L_97c
.L_8fc:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    orr r4, r4, r0
    b .L_97c
.L_91c:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    orr r4, r4, r0
    b .L_97c
.L_93c:
    ldrh r0, [r5, #0xc]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    orr r4, r4, r0
    b .L_97c
.L_954:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq .L_97c
    ldr r0, [r5, #0x14]
    bl func_0202e1e0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_97c:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x000016a4
_LIT1: .word 0x000014ea
_LIT2: .word 0x00001138
_LIT3: .word 0x00001359
_LIT4: .word 0x00001845
_LIT5: .word 0x000019d7
_LIT6: .word 0x00001af9
