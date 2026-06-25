; func_ov002_021f3458 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .extern func_ov002_021b4254
        .extern func_ov002_021bae7c
        .global func_ov002_021f3458
        .arm
func_ov002_021f3458:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r2, [r6, #0x2]
    ldrh r0, [r6]
    mov r5, #0x0
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r4, r1, r2, lsr #0x1f
    bl func_0202b878
    cmp r0, #0x16
    bne .L_5c
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_5c
    ldr r1, _LIT0
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, r5
    ldmneia sp!, {r4, r5, r6, pc}
.L_5c:
    ldrh r3, [r6, #0x2]
    mov r0, r3, lsl #0x14
    mov ip, r0, lsr #0x1a
    cmp ip, #0x23
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r6]
    ldr r2, _LIT1
    cmp r1, r2
    bgt .L_328
    bge .L_618
    sub r0, r2, #0x284
    cmp r1, r0
    bgt .L_1cc
    bge .L_620
    sub r0, r2, #0x368
    cmp r1, r0
    bgt .L_12c
    bge .L_608
    ldr r3, _LIT2
    cmp r1, r3
    bgt .L_e8
    bge .L_628
    sub r0, r3, #0x63
    cmp r1, r0
    bgt .L_d8
    bge .L_680
    sub r0, r3, #0x6b
    cmp r1, r0
    beq .L_680
    b .L_708
.L_d8:
    sub r0, r3, #0x12
    cmp r1, r0
    beq .L_610
    b .L_708
.L_e8:
    add r0, r3, #0x85
    cmp r1, r0
    bgt .L_108
    bge .L_64c
    add r0, r3, #0x56
    cmp r1, r0
    ldreq r5, _LIT3
    b .L_708
.L_108:
    rsb r0, r2, #0x28c0
    cmp r1, r0
    bgt .L_11c
    beq .L_608
    b .L_708
.L_11c:
    add r0, r3, #0x174
    cmp r1, r0
    beq .L_610
    b .L_708
.L_12c:
    ldr r2, _LIT4
    cmp r1, r2
    bgt .L_188
    bge .L_610
    sub r0, r2, #0x31
    cmp r1, r0
    bgt .L_15c
    bge .L_680
    sub r0, r2, #0x46
    cmp r1, r0
    beq .L_630
    b .L_708
.L_15c:
    sub r0, r2, #0x25
    cmp r1, r0
    bgt .L_708
    sub r0, r2, #0x27
    cmp r1, r0
    blt .L_708
    beq .L_630
    sub r0, r2, #0x25
    cmp r1, r0
    beq .L_610
    b .L_708
.L_188:
    add r0, r2, #0x42
    cmp r1, r0
    bgt .L_1a8
    bge .L_608
    add r0, r2, #0x1
    cmp r1, r0
    beq .L_610
    b .L_708
.L_1a8:
    add r0, r2, #0x43
    cmp r1, r0
    bgt .L_1bc
    beq .L_680
    b .L_708
.L_1bc:
    add r0, r2, #0x6f
    cmp r1, r0
    beq .L_610
    b .L_708
.L_1cc:
    ldr r0, _LIT5
    cmp r1, r0
    bgt .L_270
    bge .L_610
    sub lr, r0, #0x45
    cmp r1, lr
    bgt .L_224
    bge .L_618
    sub lr, r0, #0xb2
    cmp r1, lr
    bgt .L_214
    sub r0, r0, #0xb2
    cmp r1, r0
    bge .L_658
    sub r0, r2, #0x264
    cmp r1, r0
    beq .L_6b4
    b .L_708
.L_214:
    sub r0, r0, #0xab
    cmp r1, r0
    beq .L_6cc
    b .L_708
.L_224:
    sub r2, r0, #0x32
    cmp r1, r2
    bgt .L_244
    bge .L_5f8
    sub r0, r0, #0x3a
    cmp r1, r0
    beq .L_610
    b .L_708
.L_244:
    sub r2, r0, #0x2e
    cmp r1, r2
    bgt .L_260
    sub r0, r0, #0x2e
    cmp r1, r0
    beq .L_680
    b .L_708
.L_260:
    sub r0, r0, #0x29
    cmp r1, r0
    beq .L_610
    b .L_708
.L_270:
    add r4, r0, #0xc5
    cmp r1, r4
    bgt .L_2d4
    mov r2, r4
    cmp r1, r2
    bge .L_610
    add r2, r0, #0x7a
    cmp r1, r2
    bgt .L_2a8
    bge .L_620
    add r0, r0, #0x27
    cmp r1, r0
    beq .L_694
    b .L_708
.L_2a8:
    add r2, r0, #0xa9
    cmp r1, r2
    bgt .L_2c4
    add r0, r0, #0xa9
    cmp r1, r0
    beq .L_66c
    b .L_708
.L_2c4:
    add r0, r0, #0xaf
    cmp r1, r0
    beq .L_610
    b .L_708
.L_2d4:
    sub r3, r2, #0x2c
    cmp r1, r3
    bgt .L_2fc
    sub r2, r2, #0x2c
    cmp r1, r2
    bge .L_610
    add r0, r0, #0xf6
    cmp r1, r0
    beq .L_618
    b .L_708
.L_2fc:
    sub r3, r2, #0x12
    cmp r1, r3
    bgt .L_318
    mov r0, r3
    cmp r1, r0
    beq .L_610
    b .L_708
.L_318:
    add r0, r0, #0x138
    cmp r1, r0
    beq .L_658
    b .L_708
.L_328:
    ldr r0, _LIT6
    cmp r1, r0
    bgt .L_494
    bge .L_600
    add ip, r2, #0xe7
    cmp r1, ip
    bgt .L_3ec
    mov r3, ip
    cmp r1, r3
    bge .L_620
    add r3, r2, #0x71
    cmp r1, r3
    bgt .L_398
    bge .L_620
    sub r3, r0, #0x1d4
    cmp r1, r3
    bgt .L_388
    sub r0, r0, #0x1d4
    cmp r1, r0
    bge .L_630
    add r0, r2, #0x41
    cmp r1, r0
    beq .L_610
    b .L_708
.L_388:
    add r0, r2, #0x59
    cmp r1, r0
    beq .L_608
    b .L_708
.L_398:
    add r3, r2, #0x79
    cmp r1, r3
    bgt .L_3c0
    add r2, r2, #0x79
    cmp r1, r2
    bge .L_600
    sub r0, r0, #0x1b0
    cmp r1, r0
    beq .L_680
    b .L_708
.L_3c0:
    sub r3, r0, #0x178
    cmp r1, r3
    bgt .L_3dc
    sub r0, r0, #0x178
    cmp r1, r0
    beq .L_66c
    b .L_708
.L_3dc:
    add r0, r2, #0xb9
    cmp r1, r0
    beq .L_610
    b .L_708
.L_3ec:
    sub r2, r0, #0xa6
    cmp r1, r2
    bgt .L_448
    bge .L_608
    sub r2, r0, #0xf0
    cmp r1, r2
    bgt .L_41c
    bge .L_6a4
    sub r0, r0, #0x10c
    cmp r1, r0
    beq .L_600
    b .L_708
.L_41c:
    sub r2, r0, #0xe7
    cmp r1, r2
    bgt .L_438
    sub r0, r0, #0xe7
    cmp r1, r0
    beq .L_610
    b .L_708
.L_438:
    sub r0, r0, #0xd8
    cmp r1, r0
    beq .L_600
    b .L_708
.L_448:
    sub r2, r0, #0x8f
    cmp r1, r2
    bgt .L_468
    bge .L_630
    sub r0, r0, #0x91
    cmp r1, r0
    beq .L_630
    b .L_708
.L_468:
    sub r2, r0, #0x84
    cmp r1, r2
    bgt .L_484
    sub r0, r0, #0x84
    cmp r1, r0
    beq .L_600
    b .L_708
.L_484:
    sub r0, r0, #0x59
    cmp r1, r0
    beq .L_610
    b .L_708
.L_494:
    add r2, r0, #0xe8
    cmp r1, r2
    bgt .L_534
    bge .L_610
    add r2, r0, #0x7f
    cmp r1, r2
    bgt .L_4e8
    bge .L_600
    add r2, r0, #0x34
    cmp r1, r2
    bgt .L_4d8
    add r0, r0, #0x34
    cmp r1, r0
    bge .L_608
    cmp r1, #0x1880
    beq .L_608
    b .L_708
.L_4d8:
    add r0, r0, #0x42
    cmp r1, r0
    beq .L_6c0
    b .L_708
.L_4e8:
    add r2, r0, #0x9f
    cmp r1, r2
    bgt .L_508
    bge .L_610
    add r0, r0, #0x85
    cmp r1, r0
    beq .L_66c
    b .L_708
.L_508:
    add r2, r0, #0xd5
    cmp r1, r2
    bgt .L_524
    add r0, r0, #0xd5
    cmp r1, r0
    beq .L_610
    b .L_708
.L_524:
    add r0, r0, #0xe5
    cmp r1, r0
    beq .L_610
    b .L_708
.L_534:
    ldr r3, _LIT7
    cmp r1, r3
    bgt .L_588
    bge .L_600
    sub r0, r3, #0x6b
    cmp r1, r0
    bgt .L_564
    bge .L_600
    sub r0, r3, #0x6d
    cmp r1, r0
    beq .L_610
    b .L_708
.L_564:
    sub r0, r3, #0xd
    cmp r1, r0
    bgt .L_578
    beq .L_620
    b .L_708
.L_578:
    sub r0, r3, #0x1
    cmp r1, r0
    beq .L_600
    b .L_708
.L_588:
    add r2, r3, #0x114
    cmp r1, r2
    bgt .L_5cc
    add r2, r0, #0x2a8
    cmp r1, r2
    blt .L_5bc
    add r0, r0, #0x2a8
    cmp r1, r0
    beq .L_610
    add r0, r3, #0x114
    cmp r1, r0
    beq .L_600
    b .L_708
.L_5bc:
    ldr r0, _LIT8
    cmp r1, r0
    beq .L_610
    b .L_708
.L_5cc:
    add r2, r0, #0x2b8
    cmp r1, r2
    bgt .L_5e8
    add r0, r0, #0x2b8
    cmp r1, r0
    beq .L_630
    b .L_708
.L_5e8:
    ldr r0, _LIT9
    cmp r1, r0
    beq .L_600
    b .L_708
.L_5f8:
    mov r5, #0x64
    b .L_708
.L_600:
    mov r5, #0x1f4
    b .L_708
.L_608:
    mov r5, #0x320
    b .L_708
.L_610:
    mov r5, #0x3e8
    b .L_708
.L_618:
    ldr r5, _LIT10
    b .L_708
.L_620:
    mov r5, #0x7d0
    b .L_708
.L_628:
    ldr r5, _LIT11
    b .L_708
.L_630:
    ldr r0, _LIT12
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT13
    ldr r0, [r0, r2]
    mov r5, r0, asr #0x1
    b .L_708
.L_64c:
    cmp ip, #0x2
    movne r5, #0x1f4
    b .L_708
.L_658:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    movne r5, #0x64
    b .L_708
.L_66c:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    movne r5, #0x12c
    b .L_708
.L_680:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    movne r5, #0x1f4
    b .L_708
.L_694:
    mov r0, r3, lsl #0x12
    movs r0, r0, lsr #0x1e
    movne r5, #0x320
    b .L_708
.L_6a4:
    mov r0, r3, lsl #0x12
    movs r0, r0, lsr #0x1e
    movne r5, #0x2bc
    b .L_708
.L_6b4:
    cmp ip, #0x16
    moveq r5, #0x3e8
    b .L_708
.L_6c0:
    cmp ip, #0x16
    moveq r5, #0x1f4
    b .L_708
.L_6cc:
    mov r0, r3, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_708
    ldrh r0, [r6, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b4254
    cmp r0, #0x3
    bge .L_708
    ldr r0, _LIT12
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT13
    ldr r0, [r0, r2]
    mov r5, r0, asr #0x1
.L_708:
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000017a3
_LIT1: .word 0x0000162b
_LIT2: .word 0x0000114a
_LIT3: .word 0x00000bb8
_LIT4: .word 0x00001324
_LIT5: .word 0x000014f0
_LIT6: .word 0x0000184d
_LIT7: .word 0x000019e2
_LIT8: .word 0x00001af4
_LIT9: .word 0x00001b57
_LIT10: .word 0x000005dc
_LIT11: .word 0x00001388
_LIT12: .word 0x00000868
_LIT13: .word data_ov002_022cf16c
