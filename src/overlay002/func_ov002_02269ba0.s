; func_ov002_02269ba0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_0202b7ec
        .extern func_0202b830
        .extern func_ov002_021ae400
        .extern func_ov002_021ae430
        .extern func_ov002_021ae484
        .extern func_ov002_021ae4bc
        .extern func_ov002_021ae514
        .extern func_ov002_021b97d4
        .extern func_ov002_021bbf50
        .extern func_ov002_021f4260
        .extern func_ov002_02281ae8
        .extern func_ov002_02281b5c
        .extern func_ov002_0229cf10
        .global func_ov002_02269ba0
        .arm
func_ov002_02269ba0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x210
    ldr r3, _LIT0
    mov r5, r0
    ldr r6, [r3, #0xd9c]
    mov r4, r1
    cmp r6, #0x0
    beq .L_2c
    cmp r6, #0x1
    beq .L_244
    b .L_67c
.L_2c:
    ldr r1, _LIT1
    ldr r1, [r1, r5, lsl #0x2]
    cmp r1, #0x1
    bne .L_230
    ldr r1, _LIT2
    cmp r4, r1
    bgt .L_a0
    bge .L_130
    cmp r4, #0x1300
    bgt .L_7c
    ldr r1, _LIT3
    cmp r4, r1
    blt .L_70
    beq .L_1bc
    cmp r4, #0x1300
    beq .L_184
    b .L_218
.L_70:
    cmp r4, #0xfe0
    beq .L_e4
    b .L_218
.L_7c:
    ldr r1, _LIT4
    cmp r4, r1
    bgt .L_90
    beq .L_f4
    b .L_218
.L_90:
    add r0, r1, #0x7b
    cmp r4, r0
    beq .L_e4
    b .L_218
.L_a0:
    add r0, r1, #0x9e
    cmp r4, r0
    bgt .L_c0
    bge .L_e4
    add r0, r1, #0x5
    cmp r4, r0
    beq .L_104
    b .L_218
.L_c0:
    ldr r0, _LIT5
    cmp r4, r0
    bgt .L_d4
    beq .L_148
    b .L_218
.L_d4:
    add r0, r0, #0x2b8
    cmp r4, r0
    beq .L_1fc
    b .L_218
.L_e4:
    ldr r0, _LIT6
    mov r1, #0x1
    strh r1, [r0, #0xb0]
    b .L_224
.L_f4:
    bl func_ov002_02281ae8
    ldr r1, _LIT6
    strh r0, [r1, #0xb0]
    b .L_224
.L_104:
    ldr r0, _LIT7
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT8
    ldr r0, [r0, r2]
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT6
    movne r1, #0x0
    strh r1, [r0, #0xb0]
    b .L_224
.L_130:
    mov r1, r2
    rsb r0, r5, #0x1
    bl func_ov002_02281b5c
    ldr r1, _LIT6
    strh r0, [r1, #0xb0]
    b .L_224
.L_148:
    rsb r1, r5, #0x1
    ldr r0, _LIT7
    and r2, r5, #0x1
    mul r3, r2, r0
    and r1, r1, #0x1
    mul r0, r1, r0
    ldr r2, _LIT9
    ldr r1, [r2, r3]
    ldr r0, [r2, r0]
    cmp r1, r0
    movlt r1, #0x1
    ldr r0, _LIT6
    movge r1, #0x0
    strh r1, [r0, #0xb0]
    b .L_224
.L_184:
    ldr r1, [r3, #0xcec]
    cmp r1, r5
    beq .L_1ac
    bl func_ov002_021bbf50
    mov r4, r0
    rsb r0, r5, #0x1
    bl func_ov002_021bbf50
    cmp r4, r0
    movgt r1, #0x1
    bgt .L_1b0
.L_1ac:
    mov r1, #0x0
.L_1b0:
    ldr r0, _LIT6
    strh r1, [r0, #0xb0]
    b .L_224
.L_1bc:
    ldr r0, [r3, #0xcec]
    cmp r0, r5
    beq .L_1ec
    ldr r0, _LIT7
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r1, _LIT9
    add r0, r0, #0x350
    ldr r1, [r1, r2]
    cmp r1, r0
    movlt r1, #0x1
    blt .L_1f0
.L_1ec:
    mov r1, #0x0
.L_1f0:
    ldr r0, _LIT6
    strh r1, [r0, #0xb0]
    b .L_224
.L_1fc:
    ldr r0, [r3, #0xcec]
    cmp r0, r5
    movne r1, #0x1
    ldr r0, _LIT6
    moveq r1, #0x0
    strh r1, [r0, #0xb0]
    b .L_224
.L_218:
    ldr r0, _LIT6
    mov r1, #0x0
    strh r1, [r0, #0xb0]
.L_224:
    add sp, sp, #0x210
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_230:
    add r0, r6, #0x1
    str r0, [r3, #0xd9c]
    add sp, sp, #0x210
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_244:
    ldr r3, _LIT5
    cmp r4, r3
    bgt .L_348
    bge .L_578
    ldr ip, _LIT10
    cmp r4, ip
    bgt .L_2d4
    bge .L_490
    ldr r3, _LIT11
    cmp r4, r3
    bgt .L_2b0
    sub r1, r3, #0x4
    cmp r4, r1
    blt .L_28c
    beq .L_460
    cmp r4, r3
    beq .L_440
    b .L_648
.L_28c:
    ldr r1, _LIT12
    cmp r4, r1
    bgt .L_2a0
    beq .L_424
    b .L_648
.L_2a0:
    sub r0, r3, #0x68
    cmp r4, r0
    beq .L_430
    b .L_648
.L_2b0:
    add r0, r3, #0x41
    cmp r4, r0
    bgt .L_2c4
    beq .L_478
    b .L_648
.L_2c4:
    add r0, r3, #0xb2
    cmp r4, r0
    beq .L_484
    b .L_648
.L_2d4:
    add r1, ip, #0xb7
    cmp r4, r1
    bgt .L_310
    mov r0, r1
    cmp r4, r0
    bge .L_4a4
    add r0, ip, #0x2b
    cmp r4, r0
    bgt .L_300
    beq .L_430
    b .L_648
.L_300:
    add r0, ip, #0x8e
    cmp r4, r0
    beq .L_584
    b .L_648
.L_310:
    sub r1, r3, #0x9d
    cmp r4, r1
    bgt .L_338
    mov r0, r1
    cmp r4, r0
    bge .L_560
    add r0, ip, #0xbc
    cmp r4, r0
    beq .L_4f8
    b .L_648
.L_338:
    sub r1, r3, #0x87
    cmp r4, r1
    beq .L_56c
    b .L_648
.L_348:
    ldr ip, _LIT13
    cmp r4, ip
    bgt .L_3b8
    bge .L_61c
    add r1, r3, #0xa5
    cmp r4, r1
    bgt .L_394
    bge .L_5a0
    add r1, r3, #0x65
    cmp r4, r1
    bgt .L_384
    mov r0, r1
    cmp r4, r0
    beq .L_584
    b .L_648
.L_384:
    add r1, r3, #0x9d
    cmp r4, r1
    beq .L_594
    b .L_648
.L_394:
    add r0, r3, #0xbf
    cmp r4, r0
    bgt .L_3a8
    beq .L_5b8
    b .L_648
.L_3a8:
    ldr r0, _LIT14
    cmp r4, r0
    beq .L_610
    b .L_648
.L_3b8:
    add r1, ip, #0x5a
    cmp r4, r1
    bgt .L_3f4
    bge .L_5a0
    add r1, ip, #0x15
    cmp r4, r1
    bgt .L_3e4
    mov r0, r1
    cmp r4, r0
    beq .L_5a0
    b .L_648
.L_3e4:
    add r1, ip, #0x26
    cmp r4, r1
    beq .L_628
    b .L_648
.L_3f4:
    add r0, ip, #0xe8
    cmp r4, r0
    bgt .L_414
    bge .L_430
    add r0, ip, #0xb1
    cmp r4, r0
    beq .L_430
    b .L_648
.L_414:
    add r0, ip, #0xff
    cmp r4, r0
    beq .L_430
    b .L_648
.L_424:
    mov r1, #0x1ac
    bl func_ov002_021ae430
    b .L_660
.L_430:
    mov r0, r5
    mov r1, #0x11
    bl func_ov002_021ae400
    b .L_660
.L_440:
    cmp r2, #0x0
    beq .L_454
    mov r1, #0x11
    bl func_ov002_021ae400
    b .L_660
.L_454:
    mov r1, #0xed
    bl func_ov002_021ae400
    b .L_660
.L_460:
    mov r0, r2
    bl func_0202b7ec
    mov r1, r0
    mov r0, r5
    bl func_ov002_021ae430
    b .L_660
.L_478:
    mov r0, #0xe1
    bl func_ov002_021ae484
    b .L_660
.L_484:
    mov r0, #0xb
    bl func_ov002_021ae484
    b .L_660
.L_490:
    bl func_ov002_021b97d4
    mov r1, r0
    mov r0, #0xe
    bl func_ov002_021ae4bc
    b .L_660
.L_4a4:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_021f4260
    mov r6, r0
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021f4260
    mov r5, r0
    mov r0, r4
    mov r1, #0x2
    bl func_ov002_021f4260
    mov r1, r6
    mov r2, r5
    mov r3, r0
    mov r0, #0x0
    str r0, [sp]
    mov r0, #0xf
    str r0, [sp, #0x4]
    mov r0, #0x104
    bl func_ov002_021ae514
    b .L_660
.L_4f8:
    and r1, r5, #0x1
    sub r0, ip, #0xc20
    mul r2, r1, r0
    ldr r0, _LIT8
    mov r6, #0x0
    ldr r0, [r0, r2]
    cmp r0, #0x0
    mov r0, r5
    orrne r6, r6, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x0
    mov r0, r4
    mov r1, #0x0
    orrne r6, r6, #0x2
    bl func_ov002_021f4260
    mov r5, r0
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021f4260
    mov r2, r0
    mov r3, #0x0
    ldr r0, _LIT15
    mov r1, r5
    stmia sp, {r3, r6}
    bl func_ov002_021ae514
    b .L_660
.L_560:
    mov r0, #0x55
    bl func_ov002_021ae484
    b .L_660
.L_56c:
    mov r1, #0x7b
    bl func_ov002_021ae400
    b .L_660
.L_578:
    ldr r0, _LIT16
    bl func_ov002_021ae484
    b .L_660
.L_584:
    mov r0, r5
    mov r1, #0x3a
    bl func_ov002_021ae400
    b .L_660
.L_594:
    mov r1, #0xd
    bl func_ov002_021ae400
    b .L_660
.L_5a0:
    mov r0, r2
    bl func_0202b830
    mov r1, r0
    mov r0, r5
    bl func_ov002_021ae430
    b .L_660
.L_5b8:
    mov r3, #0x1
    mov r4, #0x0
    add r0, sp, #0x8
    mov r1, r3
.L_5c8:
    tst r2, r1, lsl r3
    strne r3, [r0, r4, lsl #0x2]
    add r3, r3, #0x1
    addne r4, r4, #0x1
    cmp r3, #0x6
    ble .L_5c8
    ldr r2, [sp, #0x8]
    ldr r1, _LIT17
    add r0, sp, #0x10
    bl func_ov002_0229cf10
    ldr r2, [sp, #0xc]
    add r0, sp, #0x110
    add r1, sp, #0x10
    bl func_ov002_0229cf10
    add r1, sp, #0x110
    mov r0, r5
    bl func_ov002_021ae400
    b .L_660
.L_610:
    mov r0, #0x2f
    bl func_ov002_021ae484
    b .L_660
.L_61c:
    mov r1, #0x1f
    bl func_ov002_021ae400
    b .L_660
.L_628:
    cmp r2, #0x0
    beq .L_63c
    ldr r1, _LIT18
    bl func_ov002_021ae400
    b .L_660
.L_63c:
    ldr r1, _LIT19
    bl func_ov002_021ae400
    b .L_660
.L_648:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b97d4
    mov r1, r0
    mov r0, #0xfa
    bl func_ov002_021ae4bc
.L_660:
    ldr r1, _LIT0
    add sp, sp, #0x210
    ldr r2, [r1, #0xd9c]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, pc}
.L_67c:
    ldr r2, [r3, #0xd44]
    ldr r1, _LIT6
    mov r0, #0x1
    strh r2, [r1, #0xb0]
    add sp, sp, #0x210
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd744
_LIT2: .word 0x0000153f
_LIT3: .word 0x000012fd
_LIT4: .word 0x0000140d
_LIT5: .word 0x0000167a
_LIT6: .word data_ov002_022d0e6c
_LIT7: .word 0x00000868
_LIT8: .word data_ov002_022cf178
_LIT9: .word data_ov002_022cf16c
_LIT10: .word 0x00001488
_LIT11: .word 0x0000135b
_LIT12: .word 0x000010d6
_LIT13: .word 0x00001968
_LIT14: .word 0x000017c3
_LIT15: .word 0x00000103
_LIT16: .word 0x0000012a
_LIT17: .word 0x00000129
_LIT18: .word 0x00000141
_LIT19: .word 0x00000122
