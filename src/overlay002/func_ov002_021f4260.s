; func_ov002_021f4260 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021f4260
        .arm
func_ov002_021f4260:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_144
    bge .L_478
    sub r2, r3, #0xbf
    cmp r0, r2
    bgt .L_a4
    bge .L_37c
    ldr ip, _LIT1
    cmp r0, ip
    bgt .L_60
    bge .L_2dc
    sub r2, ip, #0xf0
    cmp r0, r2
    bgt .L_50
    bge .L_294
    sub r2, ip, #0x290
    cmp r0, r2
    beq .L_270
    b .L_6c4
.L_50:
    sub r2, ip, #0xc2
    cmp r0, r2
    beq .L_2b8
    b .L_6c4
.L_60:
    sub r2, r3, #0xf4
    cmp r0, r2
    bgt .L_80
    bge .L_324
    add r2, ip, #0x158
    cmp r0, r2
    beq .L_300
    b .L_6c4
.L_80:
    sub r2, r3, #0xd8
    cmp r0, r2
    bgt .L_94
    beq .L_348
    b .L_6c4
.L_94:
    sub r2, r3, #0xcf
    cmp r0, r2
    beq .L_348
    b .L_6c4
.L_a4:
    sub r2, r3, #0x58
    cmp r0, r2
    bgt .L_100
    bge .L_3e8
    sub r2, r3, #0xad
    cmp r0, r2
    bgt .L_f0
    bge .L_3a0
    sub r2, r3, #0xb2
    cmp r0, r2
    bgt .L_6c4
    sub r2, r3, #0xb4
    cmp r0, r2
    blt .L_6c4
    beq .L_2b8
    sub r2, r3, #0xb2
    cmp r0, r2
    beq .L_348
    b .L_6c4
.L_f0:
    sub r2, r3, #0x70
    cmp r0, r2
    beq .L_3c4
    b .L_6c4
.L_100:
    sub r2, r3, #0x22
    cmp r0, r2
    bgt .L_120
    bge .L_40c
    sub r2, r3, #0x4c
    cmp r0, r2
    beq .L_348
    b .L_6c4
.L_120:
    sub r2, r3, #0x1e
    cmp r0, r2
    bgt .L_134
    beq .L_430
    b .L_6c4
.L_134:
    sub r2, r3, #0xa
    cmp r0, r2
    beq .L_454
    b .L_6c4
.L_144:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_1e8
    bge .L_590
    sub ip, r2, #0xfd
    cmp r0, ip
    bgt .L_19c
    bge .L_524
    sub ip, r2, #0x158
    cmp r0, ip
    bgt .L_18c
    sub r2, r2, #0x158
    cmp r0, r2
    bge .L_4c0
    add r2, r3, #0x6
    cmp r0, r2
    beq .L_49c
    b .L_6c4
.L_18c:
    sub ip, r2, #0x120
    cmp r0, ip
    beq .L_4e4
    b .L_6c4
.L_19c:
    sub r3, r2, #0xf0
    cmp r0, r3
    bgt .L_1bc
    bge .L_56c
    sub r2, r2, #0xf1
    cmp r0, r2
    beq .L_548
    b .L_6c4
.L_1bc:
    sub r3, r2, #0x30
    cmp r0, r3
    bgt .L_1d8
    sub r2, r2, #0x30
    cmp r0, r2
    beq .L_348
    b .L_6c4
.L_1d8:
    sub r2, r2, #0x1c
    cmp r0, r2
    beq .L_2b8
    b .L_6c4
.L_1e8:
    add ip, r2, #0x1a0
    cmp r0, ip
    bgt .L_230
    bge .L_430
    add ip, r2, #0xd8
    cmp r0, ip
    bgt .L_220
    mov r3, ip
    cmp r0, r3
    bge .L_5d8
    add r2, r2, #0xcb
    cmp r0, r2
    beq .L_5b4
    b .L_6c4
.L_220:
    add r2, r3, #0x294
    cmp r0, r2
    beq .L_614
    b .L_6c4
.L_230:
    ldr ip, _LIT3
    cmp r0, ip
    bgt .L_250
    bge .L_66c
    sub r2, ip, #0x49
    cmp r0, r2
    beq .L_638
    b .L_6c4
.L_250:
    add r2, ip, #0x16
    cmp r0, r2
    bgt .L_264
    beq .L_66c
    b .L_6c4
.L_264:
    cmp r0, #0x1a80
    beq .L_6a0
    b .L_6c4
.L_270:
    cmp r1, #0x0
    beq .L_284
    cmp r1, #0x1
    beq .L_28c
    b .L_6c4
.L_284:
    ldr r0, _LIT4
    bx lr
.L_28c:
    ldr r0, _LIT5
    bx lr
.L_294:
    cmp r1, #0x0
    beq .L_2a8
    cmp r1, #0x1
    beq .L_2b0
    b .L_6c4
.L_2a8:
    ldr r0, _LIT6
    bx lr
.L_2b0:
    ldr r0, _LIT7
    bx lr
.L_2b8:
    cmp r1, #0x0
    beq .L_2cc
    cmp r1, #0x1
    beq .L_2d4
    b .L_6c4
.L_2cc:
    mov r0, #0x198
    bx lr
.L_2d4:
    ldr r0, _LIT8
    bx lr
.L_2dc:
    cmp r1, #0x0
    beq .L_2f0
    cmp r1, #0x1
    beq .L_2f8
    b .L_6c4
.L_2f0:
    ldr r0, _LIT9
    bx lr
.L_2f8:
    ldr r0, _LIT10
    bx lr
.L_300:
    cmp r1, #0x0
    beq .L_314
    cmp r1, #0x1
    beq .L_31c
    b .L_6c4
.L_314:
    mov r0, #0x1a4
    bx lr
.L_31c:
    ldr r0, _LIT9
    bx lr
.L_324:
    cmp r1, #0x0
    beq .L_338
    cmp r1, #0x1
    beq .L_340
    b .L_6c4
.L_338:
    ldr r0, _LIT11
    bx lr
.L_340:
    ldr r0, _LIT12
    bx lr
.L_348:
    cmp r1, #0x0
    beq .L_364
    cmp r1, #0x1
    beq .L_36c
    cmp r1, #0x2
    beq .L_374
    b .L_6c4
.L_364:
    mov r0, #0x1b8
    bx lr
.L_36c:
    ldr r0, _LIT13
    bx lr
.L_374:
    ldr r0, _LIT14
    bx lr
.L_37c:
    cmp r1, #0x0
    beq .L_390
    cmp r1, #0x1
    beq .L_398
    b .L_6c4
.L_390:
    ldr r0, _LIT15
    bx lr
.L_398:
    ldr r0, _LIT16
    bx lr
.L_3a0:
    cmp r1, #0x0
    beq .L_3b4
    cmp r1, #0x1
    beq .L_3bc
    b .L_6c4
.L_3b4:
    ldr r0, _LIT17
    bx lr
.L_3bc:
    ldr r0, _LIT18
    bx lr
.L_3c4:
    cmp r1, #0x0
    beq .L_3d8
    cmp r1, #0x1
    beq .L_3e0
    b .L_6c4
.L_3d8:
    ldr r0, _LIT19
    bx lr
.L_3e0:
    ldr r0, _LIT20
    bx lr
.L_3e8:
    cmp r1, #0x0
    beq .L_3fc
    cmp r1, #0x1
    beq .L_404
    b .L_6c4
.L_3fc:
    mov r0, #0x1a8
    bx lr
.L_404:
    ldr r0, _LIT21
    bx lr
.L_40c:
    cmp r1, #0x0
    beq .L_420
    cmp r1, #0x1
    beq .L_428
    b .L_6c4
.L_420:
    ldr r0, _LIT22
    bx lr
.L_428:
    ldr r0, _LIT23
    bx lr
.L_430:
    cmp r1, #0x0
    beq .L_444
    cmp r1, #0x1
    beq .L_44c
    b .L_6c4
.L_444:
    ldr r0, _LIT22
    bx lr
.L_44c:
    mov r0, #0x1cc
    bx lr
.L_454:
    cmp r1, #0x0
    beq .L_468
    cmp r1, #0x1
    beq .L_470
    b .L_6c4
.L_468:
    ldr r0, _LIT4
    bx lr
.L_470:
    mov r0, #0x1a4
    bx lr
.L_478:
    cmp r1, #0x0
    beq .L_48c
    cmp r1, #0x1
    beq .L_494
    b .L_6c4
.L_48c:
    ldr r0, _LIT24
    bx lr
.L_494:
    ldr r0, _LIT25
    bx lr
.L_49c:
    cmp r1, #0x0
    beq .L_4b0
    cmp r1, #0x1
    beq .L_4b8
    b .L_6c4
.L_4b0:
    mov r0, #0x1c4
    bx lr
.L_4b8:
    ldr r0, _LIT22
    bx lr
.L_4c0:
    cmp r1, #0x0
    beq .L_4d4
    cmp r1, #0x1
    beq .L_4dc
    b .L_6c4
.L_4d4:
    ldr r0, _LIT26
    bx lr
.L_4dc:
    ldr r0, _LIT16
    bx lr
.L_4e4:
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_6c4
    b .L_504
    b .L_50c
    b .L_6c4
    b .L_514
    b .L_51c
.L_504:
    mov r0, #0x1b0
    bx lr
.L_50c:
    sub r0, r3, #0x1440
    bx lr
.L_514:
    sub r0, r2, #0x15c0
    bx lr
.L_51c:
    ldr r0, _LIT12
    bx lr
.L_524:
    cmp r1, #0x0
    beq .L_538
    cmp r1, #0x1
    beq .L_540
    b .L_6c4
.L_538:
    mov r0, #0x1c8
    bx lr
.L_540:
    ldr r0, _LIT27
    bx lr
.L_548:
    cmp r1, #0x0
    beq .L_55c
    cmp r1, #0x1
    beq .L_564
    b .L_6c4
.L_55c:
    ldr r0, _LIT28
    bx lr
.L_564:
    ldr r0, _LIT29
    bx lr
.L_56c:
    cmp r1, #0x0
    beq .L_580
    cmp r1, #0x1
    beq .L_588
    b .L_6c4
.L_580:
    mov r0, #0x1b4
    bx lr
.L_588:
    ldr r0, _LIT30
    bx lr
.L_590:
    cmp r1, #0x0
    beq .L_5a4
    cmp r1, #0x1
    beq .L_5ac
    b .L_6c4
.L_5a4:
    mov r0, #0x1c0
    bx lr
.L_5ac:
    ldr r0, _LIT31
    bx lr
.L_5b4:
    cmp r1, #0x0
    beq .L_5c8
    cmp r1, #0x1
    beq .L_5d0
    b .L_6c4
.L_5c8:
    mov r0, #0x1c0
    bx lr
.L_5d0:
    ldr r0, _LIT15
    bx lr
.L_5d8:
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_6c4
    b .L_5f4
    b .L_5fc
    b .L_604
    b .L_60c
.L_5f4:
    rsb r0, r2, #0x1940
    bx lr
.L_5fc:
    ldr r0, _LIT32
    bx lr
.L_604:
    ldr r0, _LIT33
    bx lr
.L_60c:
    ldr r0, _LIT31
    bx lr
.L_614:
    cmp r1, #0x0
    beq .L_628
    cmp r1, #0x1
    beq .L_630
    b .L_6c4
.L_628:
    ldr r0, _LIT34
    bx lr
.L_630:
    ldr r0, _LIT35
    bx lr
.L_638:
    cmp r1, #0x0
    beq .L_654
    cmp r1, #0x1
    beq .L_65c
    cmp r1, #0x2
    beq .L_664
    b .L_6c4
.L_654:
    ldr r0, _LIT36
    bx lr
.L_65c:
    rsb r0, r3, #0x17c0
    bx lr
.L_664:
    mov r0, #0x1d0
    bx lr
.L_66c:
    cmp r1, #0x0
    beq .L_688
    cmp r1, #0x1
    beq .L_690
    cmp r1, #0x2
    beq .L_698
    b .L_6c4
.L_688:
    ldr r0, _LIT37
    bx lr
.L_690:
    mov r0, #0x1d4
    bx lr
.L_698:
    ldr r0, _LIT38
    bx lr
.L_6a0:
    cmp r1, #0x0
    beq .L_6b4
    cmp r1, #0x1
    beq .L_6bc
    b .L_6c4
.L_6b4:
    ldr r0, _LIT39
    bx lr
.L_6bc:
    ldr r0, _LIT40
    bx lr
.L_6c4:
    mov r0, #0x1ac
    bx lr
_LIT0: .word 0x000015f1
_LIT1: .word 0x00001388
_LIT2: .word 0x00001776
_LIT3: .word 0x00001a1c
_LIT4: .word 0x00000196
_LIT5: .word 0x00000197
_LIT6: .word 0x000001c6
_LIT7: .word 0x000001c7
_LIT8: .word 0x00000199
_LIT9: .word 0x000001ad
_LIT10: .word 0x000001ae
_LIT11: .word 0x000001b6
_LIT12: .word 0x000001b7
_LIT13: .word 0x000001b9
_LIT14: .word 0x000001ba
_LIT15: .word 0x000001a6
_LIT16: .word 0x000001a7
_LIT17: .word 0x000001aa
_LIT18: .word 0x000001ab
_LIT19: .word 0x000001be
_LIT20: .word 0x000001bf
_LIT21: .word 0x000001a9
_LIT22: .word 0x000001c5
_LIT23: .word 0x000001cd
_LIT24: .word 0x000001c2
_LIT25: .word 0x000001c3
_LIT26: .word 0x000001af
_LIT27: .word 0x000001c9
_LIT28: .word 0x000001b2
_LIT29: .word 0x000001b3
_LIT30: .word 0x000001b5
_LIT31: .word 0x000001c1
_LIT32: .word 0x000001cb
_LIT33: .word 0x000001a5
_LIT34: .word 0x000001d1
_LIT35: .word 0x000001d2
_LIT36: .word 0x000001ce
_LIT37: .word 0x000001d3
_LIT38: .word 0x000001d5
_LIT39: .word 0x000001d6
_LIT40: .word 0x000001d7
