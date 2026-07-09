; func_ov002_021b45a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b86c
        .global func_ov002_021b45a4
        .arm
func_ov002_021b45a4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_0202b86c
    cmp r0, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    cmp r5, r1
    bgt .L_88
    bge .L_c8
    sub r0, r1, #0x1d8
    cmp r5, r0
    bgt .L_4c
    bge .L_c8
    sub r0, r1, #0x348
    cmp r5, r0
    beq .L_c8
    b .L_d0
.L_4c:
    ldr r0, _LIT1
    cmp r5, r0
    bgt .L_60
    beq .L_c8
    b .L_d0
.L_60:
    sub r0, r1, #0xe
    cmp r5, r0
    bgt .L_d0
    sub r0, r1, #0x12
    cmp r5, r0
    blt .L_d0
    subne r0, r1, #0xe
    cmpne r5, r0
    beq .L_c8
    b .L_d0
.L_88:
    ldr r1, _LIT2
    cmp r5, r1
    bgt .L_a8
    bge .L_c8
    sub r0, r1, #0xfc
    cmp r5, r0
    beq .L_c8
    b .L_d0
.L_a8:
    add r0, r1, #0xee
    cmp r5, r0
    bgt .L_bc
    beq .L_c8
    b .L_d0
.L_bc:
    add r0, r1, #0xef
    cmp r5, r0
    bne .L_d0
.L_c8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_d0:
    sub r0, r4, #0xd
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_494
    b .L_38c
    b .L_404
    b .L_41c
    b .L_478
    b .L_494
    b .L_494
    b .L_494
    b .L_108
    b .L_494
    b .L_304
.L_108:
    ldr r2, _LIT3
    cmp r5, r2
    bgt .L_21c
    bge .L_2fc
    ldr r0, _LIT4
    cmp r5, r0
    bgt .L_1ac
    bge .L_2fc
    sub r1, r0, #0xe6
    cmp r5, r1
    bgt .L_164
    bge .L_2fc
    sub r1, r0, #0xf8
    cmp r5, r1
    bgt .L_154
    sub r0, r0, #0xf8
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_154:
    sub r0, r0, #0xf1
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_164:
    sub r1, r0, #0x38
    cmp r5, r1
    bgt .L_19c
    bge .L_2fc
    sub r1, r0, #0x59
    cmp r5, r1
    bgt .L_494
    sub r1, r0, #0x5a
    cmp r5, r1
    blt .L_494
    subne r0, r0, #0x59
    cmpne r5, r0
    beq .L_2fc
    b .L_494
.L_19c:
    sub r0, r0, #0x37
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_1ac:
    add r1, r0, #0x65
    cmp r5, r1
    bgt .L_1ec
    bge .L_2fc
    add r1, r0, #0x7
    cmp r5, r1
    bgt .L_1dc
    bge .L_2fc
    add r0, r0, #0x1
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_1dc:
    add r0, r0, #0x58
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_1ec:
    add r1, r0, #0xe0
    cmp r5, r1
    bgt .L_20c
    bge .L_2fc
    add r0, r0, #0xc5
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_20c:
    sub r0, r2, #0x2c
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_21c:
    ldr r1, _LIT5
    cmp r5, r1
    bgt .L_290
    bge .L_2fc
    add r0, r2, #0x7f
    cmp r5, r0
    bgt .L_260
    bge .L_2fc
    sub r0, r1, #0x278
    cmp r5, r0
    bgt .L_250
    beq .L_2fc
    b .L_494
.L_250:
    add r0, r2, #0x56
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_260:
    sub r0, r1, #0xe8
    cmp r5, r0
    bgt .L_280
    bge .L_2fc
    add r0, r2, #0xe8
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_280:
    sub r0, r1, #0x80
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_290:
    ldr r1, _LIT6
    cmp r5, r1
    bgt .L_2d0
    bge .L_2fc
    sub r0, r1, #0xda
    cmp r5, r0
    bgt .L_2c0
    bge .L_2fc
    sub r0, r1, #0xe2
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_2c0:
    sub r0, r1, #0xab
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_2d0:
    ldr r0, _LIT7
    cmp r5, r0
    bgt .L_2f0
    bge .L_2fc
    sub r0, r0, #0xac
    cmp r5, r0
    beq .L_2fc
    b .L_494
.L_2f0:
    add r0, r0, #0x9
    cmp r5, r0
    bne .L_494
.L_2fc:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_304:
    ldr r1, _LIT8
    cmp r5, r1
    bgt .L_344
    bge .L_384
    ldr r0, _LIT9
    cmp r5, r0
    bgt .L_334
    bge .L_384
    sub r0, r0, #0x91
    cmp r5, r0
    beq .L_384
    b .L_494
.L_334:
    add r0, r0, #0x15c
    cmp r5, r0
    beq .L_384
    b .L_494
.L_344:
    add r0, r1, #0xbc
    cmp r5, r0
    bgt .L_364
    bge .L_384
    add r0, r1, #0x8a
    cmp r5, r0
    beq .L_384
    b .L_494
.L_364:
    add r0, r1, #0x10c
    cmp r5, r0
    bgt .L_378
    beq .L_384
    b .L_494
.L_378:
    ldr r0, _LIT10
    cmp r5, r0
    bne .L_494
.L_384:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_38c:
    ldr r1, _LIT11
    cmp r5, r1
    bgt .L_3dc
    bge .L_3fc
    sub r0, r1, #0x378
    cmp r5, r0
    bgt .L_3cc
    ldr r1, _LIT12
    cmp r5, r1
    blt .L_494
    addne r0, r1, #0x1
    cmpne r5, r0
    addne r0, r1, #0x2
    cmpne r5, r0
    beq .L_3fc
    b .L_494
.L_3cc:
    sub r0, r1, #0xec
    cmp r5, r0
    beq .L_3fc
    b .L_494
.L_3dc:
    add r0, r1, #0x3c0
    cmp r5, r0
    bgt .L_3f0
    beq .L_3fc
    b .L_494
.L_3f0:
    add r0, r1, #0x3f0
    cmp r5, r0
    bne .L_494
.L_3fc:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_404:
    cmp r5, #0xfe0
    ldrne r0, _LIT13
    cmpne r5, r0
    bne .L_494
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_41c:
    ldr r1, _LIT14
    cmp r5, r1
    bgt .L_450
    bge .L_470
    sub r0, r1, #0x3d
    cmp r5, r0
    bgt .L_440
    beq .L_470
    b .L_494
.L_440:
    sub r0, r1, #0x35
    cmp r5, r0
    beq .L_470
    b .L_494
.L_450:
    ldr r0, _LIT15
    cmp r5, r0
    bgt .L_464
    beq .L_470
    b .L_494
.L_464:
    add r0, r0, #0x1ec
    cmp r5, r0
    bne .L_494
.L_470:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_478:
    ldr r0, _LIT16
    cmp r5, r0
    addne r0, r0, #0x8
    cmpne r5, r0
    bne .L_494
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_494:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000017d4
_LIT1: .word 0x0000168f
_LIT2: .word 0x00001936
_LIT3: .word 0x000014be
_LIT4: .word 0x00001329
_LIT5: .word 0x00001763
_LIT6: .word 0x0000192d
_LIT7: .word 0x00001a60
_LIT8: .word 0x000018d4
_LIT9: .word 0x0000134b
_LIT10: .word 0x00001a17
_LIT11: .word 0x00001493
_LIT12: .word 0x00001119
_LIT13: .word 0x0000151b
_LIT14: .word 0x0000138f
_LIT15: .word 0x000017ca
_LIT16: .word 0x00001352
