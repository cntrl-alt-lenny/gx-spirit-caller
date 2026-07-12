; func_ov002_021b8718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b380
        .global func_ov002_021b8718
        .arm
func_ov002_021b8718:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4]
    mov r1, #0x3
    bl func_0202b380
    cmp r0, #0x0
    beq .L_6b0
    ldrh r2, [r4]
    ldr r1, _LIT0
    cmp r2, r1
    bgt .L_2f4
    bge .L_588
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_1c8
    bge .L_5f8
    sub r1, r0, #0xfe
    cmp r2, r1
    bgt .L_c8
    sub r0, r0, #0xfe
    cmp r2, r0
    bge .L_5a4
    ldr r1, _LIT2
    cmp r2, r1
    bgt .L_98
    bge .L_56c
    sub r0, r1, #0xa2
    cmp r2, r0
    bgt .L_88
    bge .L_514
    ldr r0, _LIT3
    cmp r2, r0
    beq .L_534
    b .L_6a8
.L_88:
    sub r0, r1, #0x9a
    cmp r2, r0
    beq .L_56c
    b .L_6a8
.L_98:
    add r0, r1, #0xc4
    cmp r2, r0
    bgt .L_b8
    bge .L_5a4
    add r0, r1, #0x8c
    cmp r2, r0
    beq .L_588
    b .L_6a8
.L_b8:
    add r0, r1, #0x134
    cmp r2, r0
    beq .L_534
    b .L_6a8
.L_c8:
    sub r1, r0, #0x6d
    cmp r2, r1
    bgt .L_120
    sub r1, r0, #0x70
    cmp r2, r1
    blt .L_f0
    subne r0, r0, #0x6d
    cmpne r2, r0
    beq .L_5f8
    b .L_6a8
.L_f0:
    sub r1, r0, #0xec
    cmp r2, r1
    bgt .L_110
    bge .L_550
    sub r0, r0, #0xf7
    cmp r2, r0
    beq .L_534
    b .L_6a8
.L_110:
    sub r0, r0, #0xe5
    cmp r2, r0
    beq .L_534
    b .L_6a8
.L_120:
    sub r1, r0, #0x3e
    cmp r2, r1
    bgt .L_19c
    sub r0, r0, #0x51
    subs r0, r2, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_18c
    b .L_628
    b .L_5dc
    b .L_5f8
    b .L_6a8
    b .L_628
    b .L_6a8
    b .L_5f8
    b .L_5f8
    b .L_5f8
    b .L_6a8
    b .L_6a8
    b .L_6a8
    b .L_6a8
    b .L_6a8
    b .L_6a8
    b .L_6a8
    b .L_6a8
    b .L_534
    b .L_6a8
    b .L_534
.L_18c:
    ldr r0, _LIT4
    cmp r2, r0
    beq .L_5f8
    b .L_6a8
.L_19c:
    sub r1, r0, #0x29
    cmp r2, r1
    bgt .L_1b8
    sub r0, r0, #0x29
    cmp r2, r0
    beq .L_654
    b .L_6a8
.L_1b8:
    sub r0, r0, #0xe
    cmp r2, r0
    beq .L_56c
    b .L_6a8
.L_1c8:
    sub r3, r1, #0xba
    cmp r2, r3
    bgt .L_258
    bge .L_5a4
    sub r3, r1, #0xe0
    cmp r2, r3
    bgt .L_220
    bge .L_684
    add r3, r0, #0x73
    cmp r2, r3
    bgt .L_210
    mov r1, r3
    cmp r2, r1
    bge .L_5f8
    add r0, r0, #0x2c
    cmp r2, r0
    beq .L_514
    b .L_6a8
.L_210:
    sub r0, r1, #0x160
    cmp r2, r0
    beq .L_51c
    b .L_6a8
.L_220:
    sub r3, r1, #0xc8
    cmp r2, r3
    bgt .L_248
    mov r0, r3
    cmp r2, r0
    bge .L_514
    sub r0, r1, #0xdd
    cmp r2, r0
    beq .L_550
    b .L_6a8
.L_248:
    add r0, r0, #0x1a8
    cmp r2, r0
    beq .L_514
    b .L_6a8
.L_258:
    add r3, r0, #0x1d8
    cmp r2, r3
    bgt .L_2a0
    bge .L_5c0
    add r3, r0, #0x1b8
    cmp r2, r3
    bgt .L_290
    add r0, r0, #0x1b8
    cmp r2, r0
    bge .L_5c0
    sub r0, r1, #0xb8
    cmp r2, r0
    beq .L_5c0
    b .L_6a8
.L_290:
    sub r0, r1, #0xb5
    cmp r2, r0
    beq .L_5c0
    b .L_6a8
.L_2a0:
    sub r3, r1, #0x6a
    cmp r2, r3
    bgt .L_2c8
    mov r0, r3
    cmp r2, r0
    bge .L_5f8
    sub r0, r1, #0x89
    cmp r2, r0
    beq .L_514
    b .L_6a8
.L_2c8:
    add r3, r0, #0x23c
    cmp r2, r3
    bgt .L_2e4
    add r0, r0, #0x23c
    cmp r2, r0
    beq .L_5a4
    b .L_6a8
.L_2e4:
    sub r0, r1, #0x10
    cmp r2, r0
    beq .L_550
    b .L_6a8
.L_2f4:
    ldr r0, _LIT5
    cmp r2, r0
    bgt .L_410
    bge .L_534
    sub r1, r0, #0x6c
    cmp r2, r1
    bgt .L_384
    bge .L_514
    sub r1, r0, #0xc2
    cmp r2, r1
    bgt .L_354
    bge .L_628
    sub r1, r0, #0xdf
    cmp r2, r1
    bgt .L_344
    bge .L_514
    sub r0, r0, #0xe2
    cmp r2, r0
    beq .L_514
    b .L_6a8
.L_344:
    sub r0, r0, #0xce
    cmp r2, r0
    beq .L_56c
    b .L_6a8
.L_354:
    sub r1, r0, #0x8d
    cmp r2, r1
    bgt .L_374
    bge .L_5f8
    sub r0, r0, #0xc1
    cmp r2, r0
    beq .L_5f8
    b .L_6a8
.L_374:
    sub r0, r0, #0x6d
    cmp r2, r0
    beq .L_514
    b .L_6a8
.L_384:
    sub r1, r0, #0x66
    cmp r2, r1
    bgt .L_3c4
    bge .L_550
    sub r1, r0, #0x6a
    cmp r2, r1
    bgt .L_3b4
    bge .L_514
    sub r0, r0, #0x6b
    cmp r2, r0
    beq .L_514
    b .L_6a8
.L_3b4:
    sub r0, r0, #0x67
    cmp r2, r0
    beq .L_550
    b .L_6a8
.L_3c4:
    sub r1, r0, #0x3a
    cmp r2, r1
    bgt .L_3e4
    bge .L_6a8
    sub r0, r0, #0x5b
    cmp r2, r0
    beq .L_56c
    b .L_6a8
.L_3e4:
    sub r1, r0, #0x33
    cmp r2, r1
    bgt .L_400
    sub r0, r0, #0x33
    cmp r2, r0
    beq .L_550
    b .L_6a8
.L_400:
    sub r0, r0, #0x2e
    cmp r2, r0
    beq .L_514
    b .L_6a8
.L_410:
    add r1, r0, #0xc7
    cmp r2, r1
    bgt .L_490
    bge .L_56c
    add r1, r0, #0x50
    cmp r2, r1
    bgt .L_460
    bge .L_56c
    add r1, r0, #0x42
    cmp r2, r1
    bgt .L_450
    bge .L_668
    add r0, r0, #0x34
    cmp r2, r0
    beq .L_56c
    b .L_6a8
.L_450:
    add r0, r0, #0x44
    cmp r2, r0
    beq .L_670
    b .L_6a8
.L_460:
    add r1, r0, #0x89
    cmp r2, r1
    bgt .L_480
    bge .L_56c
    add r0, r0, #0x5f
    cmp r2, r0
    beq .L_514
    b .L_6a8
.L_480:
    add r0, r0, #0xba
    cmp r2, r0
    beq .L_514
    b .L_6a8
.L_490:
    add r1, r0, #0x104
    cmp r2, r1
    bgt .L_4d0
    bge .L_5a4
    add r1, r0, #0xfe
    cmp r2, r1
    bgt .L_4c0
    bge .L_5a4
    add r0, r0, #0xf2
    cmp r2, r0
    beq .L_51c
    b .L_6a8
.L_4c0:
    add r0, r0, #0xff
    cmp r2, r0
    beq .L_5a4
    b .L_6a8
.L_4d0:
    ldr r1, _LIT6
    cmp r2, r1
    bgt .L_4f0
    bge .L_514
    sub r0, r1, #0x5c
    cmp r2, r0
    beq .L_5a4
    b .L_6a8
.L_4f0:
    add r0, r1, #0x4
    cmp r2, r0
    bgt .L_504
    beq .L_56c
    b .L_6a8
.L_504:
    add r0, r1, #0x23
    cmp r2, r0
    beq .L_534
    b .L_6a8
.L_514:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_51c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_534:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_550:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_56c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_588:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_5a4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_5c0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x5
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_5dc:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x6
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_5f8:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0x5
    bcc .L_620
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_620:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_628:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_64c
    ldrh r0, [r4, #0xc]
    cmp r0, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_64c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_654:
    ldrh r0, [r4, #0xc]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_668:
    ldrh r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_670:
    ldrh r0, [r4, #0xc]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_684:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x5
    ldrneh r0, [r4, #0xc]
    cmpne r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_6a8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_6b0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000188f
_LIT1: .word 0x00001620
_LIT2: .word 0x0000133b
_LIT3: .word 0x00001232
_LIT4: .word 0x000015ce
_LIT5: .word 0x000019d8
_LIT6: .word 0x00001b39
