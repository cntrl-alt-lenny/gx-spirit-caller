; func_ov002_02275dcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd230
        .extern func_0202b824
        .extern func_0202ea74
        .extern func_0202effc
        .extern func_ov002_021bc1a8
        .extern func_ov002_021bc5e4
        .extern func_ov002_021e349c
        .extern func_ov002_022719c4
        .extern func_ov002_02272324
        .extern func_ov002_022725c4
        .extern func_ov002_02272934
        .extern func_ov002_02272aa8
        .extern func_ov002_02272c40
        .extern func_ov002_02272d94
        .extern func_ov002_02272fac
        .extern func_ov002_02273128
        .extern func_ov002_0227323c
        .extern func_ov002_02273410
        .extern func_ov002_0227343c
        .extern func_ov002_022736ec
        .extern func_ov002_022739e4
        .extern func_ov002_02273a2c
        .extern func_ov002_02273a64
        .extern func_ov002_02273aa4
        .extern func_ov002_02273bb4
        .extern func_ov002_02273c84
        .extern func_ov002_022741ec
        .extern func_ov002_02274364
        .extern func_ov002_02274500
        .extern func_ov002_02274790
        .extern func_ov002_02274ad0
        .extern func_ov002_022751c8
        .extern func_ov002_02275580
        .extern func_ov002_02275b38
        .extern func_ov002_0227a990
        .extern func_ov002_0227acdc
        .extern func_ov002_0229acd0
        .global func_ov002_02275dcc
        .arm
func_ov002_02275dcc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    cmp r4, r0, lsr #0x11
    mov r0, r0, lsr #0x11
    bcc .L_610
    cmp r0, r4
    bcs .L_944
    ldr r3, _LIT2
    cmp r0, r3
    bhi .L_49c
    bcs .L_994
    ldr r1, _LIT3
    cmp r0, r1
    bhi .L_3b8
    bcs .L_964
    ldr r3, _LIT4
    cmp r0, r3
    bhi .L_34c
    bcs .L_944
    sub r2, r1, #0x400
    cmp r0, r2
    bhi .L_328
    sub r1, r1, #0x400
    cmp r0, r1
    bcs .L_934
    ldr r2, _LIT5
    cmp r0, r2
    bhi .L_9ec
    sub r1, r2, #0x1
    cmp r0, r1
    bcc .L_9ec
    cmpne r0, r2
    beq .L_934
    b .L_9ec
.L_328:
    sub r1, r3, #0x170
    cmp r0, r1
    bhi .L_33c
    beq .L_93c
    b .L_9ec
.L_33c:
    ldr r1, _LIT6
    cmp r0, r1
    beq .L_944
    b .L_9ec
.L_34c:
    add r2, r3, #0xfa
    cmp r0, r2
    bhi .L_374
    mov r1, r2
    cmp r0, r1
    bcs .L_9e4
    add r1, r3, #0xd
    cmp r0, r1
    beq .L_94c
    b .L_9ec
.L_374:
    add r2, r3, #0xfe
    cmp r0, r2
    bhi .L_3a8
    add r1, r3, #0xfb
    cmp r0, r1
    bcc .L_9ec
    addne r1, r3, #0xfc
    cmpne r0, r1
    beq .L_9e4
    mov r1, r2
    cmp r0, r1
    beq .L_95c
    b .L_9ec
.L_3a8:
    sub r1, r1, #0x34
    cmp r0, r1
    beq .L_99c
    b .L_9ec
.L_3b8:
    add r2, r1, #0x9e
    cmp r0, r2
    bhi .L_434
    add r2, r1, #0x9c
    cmp r0, r2
    bcc .L_3e8
    addne r2, r1, #0x9d
    cmpne r0, r2
    addne r1, r1, #0x9e
    cmpne r0, r1
    beq .L_96c
    b .L_9ec
.L_3e8:
    add r2, r1, #0x92
    cmp r0, r2
    bhi .L_408
    bcs .L_974
    add r1, r1, #0x7d
    cmp r0, r1
    beq .L_96c
    b .L_9ec
.L_408:
    add r2, r1, #0x9a
    cmp r0, r2
    bhi .L_424
    add r1, r1, #0x9a
    cmp r0, r1
    beq .L_96c
    b .L_9ec
.L_424:
    add r1, r1, #0x9b
    cmp r0, r1
    beq .L_96c
    b .L_9ec
.L_434:
    add r2, r1, #0x1c8
    cmp r0, r2
    bhi .L_470
    add r1, r1, #0x1c8
    cmp r0, r1
    bcs .L_994
    sub r1, r3, #0xaf
    cmp r0, r1
    bhi .L_460
    beq .L_99c
    b .L_9ec
.L_460:
    sub r1, r3, #0x82
    cmp r0, r1
    beq .L_984
    b .L_9ec
.L_470:
    sub r2, r3, #0x46
    cmp r0, r2
    bhi .L_48c
    mov r1, r2
    cmp r0, r1
    beq .L_994
    b .L_9ec
.L_48c:
    add r1, r1, #0x210
    cmp r0, r1
    beq .L_994
    b .L_9ec
.L_49c:
    ldr r1, _LIT7
    cmp r0, r1
    bhi .L_554
    bcs .L_9e4
    sub r2, r1, #0x5d
    cmp r0, r2
    bhi .L_508
    bcs .L_96c
    sub r2, r1, #0x60
    cmp r0, r2
    bhi .L_4dc
    bcs .L_96c
    sub r1, r1, #0xd9
    cmp r0, r1
    beq .L_94c
    b .L_9ec
.L_4dc:
    sub r2, r1, #0x5f
    cmp r0, r2
    bhi .L_4f8
    sub r1, r1, #0x5f
    cmp r0, r1
    beq .L_96c
    b .L_9ec
.L_4f8:
    sub r1, r1, #0x5e
    cmp r0, r1
    beq .L_96c
    b .L_9ec
.L_508:
    sub r2, r1, #0x5a
    cmp r0, r2
    bhi .L_528
    bcs .L_96c
    sub r1, r1, #0x5c
    cmp r0, r1
    beq .L_96c
    b .L_9ec
.L_528:
    sub r2, r1, #0x41
    cmp r0, r2
    bhi .L_544
    sub r1, r1, #0x41
    cmp r0, r1
    beq .L_96c
    b .L_9ec
.L_544:
    sub r1, r1, #0x39
    cmp r0, r1
    beq .L_9e4
    b .L_9ec
.L_554:
    add r2, r1, #0xa1
    cmp r0, r2
    bhi .L_5b0
    bcs .L_9a4
    add r2, r1, #0x33
    cmp r0, r2
    bhi .L_584
    bcs .L_944
    add r1, r1, #0x4
    cmp r0, r1
    beq .L_9e4
    b .L_9ec
.L_584:
    add r2, r1, #0x47
    cmp r0, r2
    bhi .L_5a0
    add r1, r1, #0x47
    cmp r0, r1
    beq .L_944
    b .L_9ec
.L_5a0:
    add r1, r1, #0x9d
    cmp r0, r1
    beq .L_944
    b .L_9ec
.L_5b0:
    add r2, r1, #0xe1
    cmp r0, r2
    bhi .L_5ec
    bcs .L_9c4
    add r2, r1, #0xa2
    cmp r0, r2
    bhi .L_5dc
    add r1, r1, #0xa2
    cmp r0, r1
    beq .L_9ac
    b .L_9ec
.L_5dc:
    add r1, r1, #0xa3
    cmp r0, r1
    beq .L_9ac
    b .L_9ec
.L_5ec:
    sub r1, r4, #0x5c
    cmp r0, r1
    bhi .L_600
    beq .L_974
    b .L_9ec
.L_600:
    sub r1, r4, #0x30
    cmp r0, r1
    beq .L_97c
    b .L_9ec
.L_610:
    ldr r1, _LIT8
    cmp r0, r1
    bhi .L_79c
    bcs .L_9a4
    sub r2, r1, #0x51
    cmp r0, r2
    bhi .L_6d8
    bcs .L_994
    sub r2, r1, #0xaf
    cmp r0, r2
    bhi .L_68c
    bcs .L_94c
    sub r2, r1, #0xf1
    cmp r0, r2
    bhi .L_660
    bcs .L_96c
    sub r1, r1, #0x110
    cmp r0, r1
    beq .L_9bc
    b .L_9ec
.L_660:
    sub r2, r1, #0xec
    cmp r0, r2
    bhi .L_67c
    sub r1, r1, #0xec
    cmp r0, r1
    beq .L_944
    b .L_9ec
.L_67c:
    sub r1, r1, #0xbd
    cmp r0, r1
    beq .L_944
    b .L_9ec
.L_68c:
    sub r2, r1, #0xa0
    cmp r0, r2
    bhi .L_6ac
    bcs .L_9e4
    sub r1, r1, #0xac
    cmp r0, r1
    beq .L_94c
    b .L_9ec
.L_6ac:
    sub r2, r1, #0x59
    cmp r0, r2
    bhi .L_6c8
    sub r1, r1, #0x59
    cmp r0, r1
    beq .L_9cc
    b .L_9ec
.L_6c8:
    sub r1, r1, #0x52
    cmp r0, r1
    beq .L_994
    b .L_9ec
.L_6d8:
    sub r2, r1, #0x23
    cmp r0, r2
    bhi .L_734
    bcs .L_944
    sub r2, r1, #0x39
    cmp r0, r2
    bhi .L_708
    bcs .L_9d4
    sub r1, r1, #0x3a
    cmp r0, r1
    beq .L_9d4
    b .L_9ec
.L_708:
    sub r2, r1, #0x38
    cmp r0, r2
    bhi .L_724
    sub r1, r1, #0x38
    cmp r0, r1
    beq .L_9d4
    b .L_9ec
.L_724:
    sub r1, r1, #0x37
    cmp r0, r1
    beq .L_9d4
    b .L_9ec
.L_734:
    sub r2, r1, #0x19
    cmp r0, r2
    bhi .L_770
    bcs .L_944
    sub r2, r1, #0x20
    cmp r0, r2
    bhi .L_760
    sub r1, r1, #0x20
    cmp r0, r1
    beq .L_9e4
    b .L_9ec
.L_760:
    sub r1, r1, #0x1f
    cmp r0, r1
    beq .L_9e4
    b .L_9ec
.L_770:
    sub r2, r1, #0x2
    cmp r0, r2
    bhi .L_78c
    sub r1, r1, #0x2
    cmp r0, r1
    beq .L_9dc
    b .L_9ec
.L_78c:
    sub r1, r1, #0x1
    cmp r0, r1
    beq .L_9dc
    b .L_9ec
.L_79c:
    add r2, r1, #0xc8
    cmp r0, r2
    bhi .L_870
    bcs .L_994
    add r2, r1, #0x4b
    cmp r0, r2
    bhi .L_808
    bcs .L_944
    add r2, r1, #0x5
    cmp r0, r2
    bhi .L_7dc
    bcs .L_954
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_9b4
    b .L_9ec
.L_7dc:
    add r2, r1, #0x23
    cmp r0, r2
    bhi .L_7f8
    add r1, r1, #0x23
    cmp r0, r1
    beq .L_9dc
    b .L_9ec
.L_7f8:
    add r1, r1, #0x25
    cmp r0, r1
    beq .L_96c
    b .L_9ec
.L_808:
    add r2, r1, #0x7b
    cmp r0, r2
    bhi .L_844
    bcs .L_974
    add r2, r1, #0x52
    cmp r0, r2
    bhi .L_834
    add r1, r1, #0x52
    cmp r0, r1
    beq .L_944
    b .L_9ec
.L_834:
    add r1, r1, #0x53
    cmp r0, r1
    beq .L_944
    b .L_9ec
.L_844:
    add r2, r1, #0x7c
    cmp r0, r2
    bhi .L_860
    add r1, r1, #0x7c
    cmp r0, r1
    beq .L_97c
    b .L_9ec
.L_860:
    add r1, r1, #0xc0
    cmp r0, r1
    beq .L_9a4
    b .L_9ec
.L_870:
    add r2, r1, #0x188
    cmp r0, r2
    bhi .L_8cc
    bcs .L_97c
    add r2, r1, #0xca
    cmp r0, r2
    bhi .L_8a0
    bcs .L_994
    add r1, r1, #0xc9
    cmp r0, r1
    beq .L_994
    b .L_9ec
.L_8a0:
    add r2, r1, #0xed
    cmp r0, r2
    bhi .L_8bc
    add r1, r1, #0xed
    cmp r0, r1
    beq .L_98c
    b .L_9ec
.L_8bc:
    add r1, r1, #0xf1
    cmp r0, r1
    beq .L_97c
    b .L_9ec
.L_8cc:
    add r2, r4, #0x2b8
    cmp r0, r2
    bhi .L_908
    mov r1, r2
    cmp r0, r1
    bcs .L_994
    ldr r1, _LIT9
    cmp r0, r1
    bhi .L_8f8
    beq .L_9e4
    b .L_9ec
.L_8f8:
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_9e4
    b .L_9ec
.L_908:
    add r2, r1, #0x1a8
    cmp r0, r2
    bhi .L_924
    add r1, r1, #0x1a8
    cmp r0, r1
    beq .L_994
    b .L_9ec
.L_924:
    ldr r1, _LIT10
    cmp r0, r1
    beq .L_994
    b .L_9ec
.L_934:
    bl func_ov002_02272aa8
    b .L_a4c
.L_93c:
    bl func_ov002_0227323c
    b .L_a4c
.L_944:
    bl func_ov002_02272c40
    b .L_a4c
.L_94c:
    bl func_ov002_022739e4
    b .L_a4c
.L_954:
    bl func_ov002_02273a2c
    b .L_a4c
.L_95c:
    bl func_ov002_0227343c
    b .L_a4c
.L_964:
    bl func_ov002_022736ec
    b .L_a4c
.L_96c:
    bl func_ov002_02273c84
    b .L_a4c
.L_974:
    bl func_ov002_022741ec
    b .L_a4c
.L_97c:
    bl func_ov002_02274364
    b .L_a4c
.L_984:
    bl func_ov002_02274500
    b .L_a4c
.L_98c:
    bl func_ov002_02274790
    b .L_a4c
.L_994:
    bl func_ov002_02274ad0
    b .L_a4c
.L_99c:
    bl func_ov002_022751c8
    b .L_a4c
.L_9a4:
    bl func_ov002_02272d94
    b .L_a4c
.L_9ac:
    bl func_ov002_02273a64
    b .L_a4c
.L_9b4:
    bl func_ov002_02272fac
    b .L_a4c
.L_9bc:
    bl func_ov002_02273128
    b .L_a4c
.L_9c4:
    bl func_ov002_02273aa4
    b .L_a4c
.L_9cc:
    bl func_ov002_02273bb4
    b .L_a4c
.L_9d4:
    bl func_ov002_02275580
    b .L_a4c
.L_9dc:
    bl func_ov002_02275b38
    b .L_a4c
.L_9e4:
    bl func_ov002_02273410
    b .L_a4c
.L_9ec:
    bl func_0202ea74
    cmp r0, #0x0
    beq .L_a00
    bl func_ov002_02272324
    b .L_a4c
.L_a00:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202effc
    cmp r0, #0x0
    beq .L_a24
    bl func_ov002_022725c4
    b .L_a4c
.L_a24:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202b824
    cmp r0, #0x9
    bne .L_a48
    bl func_ov002_02272934
    b .L_a4c
.L_a48:
    bl func_ov002_022719c4
.L_a4c:
    cmp r0, #0x0
    bge .L_a80
    ldr r4, _LIT0
    mov r1, #0x0
    ldrh r0, [r4, #0x16]
    mov r2, r1
    mov r3, r1
    orr r5, r0, #0x8
    mov r0, #0x29
    strh r5, [r4, #0x16]
    bl func_ov002_0229acd0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a80:
    cmp r0, #0x1
    bne .L_c48
    ldr r1, _LIT0
    ldr r0, _LIT11
    ldrh r1, [r1, #0x6]
    mov r2, #0x1
    cmp r1, r0
    ldrne r0, _LIT12
    cmpne r1, r0
    ldr r0, _LIT0
    movne r2, #0x0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    eor r6, r2, r0, lsr #0x1f
    mov r0, r6
    bl func_ov002_021bc5e4
    ldr r4, _LIT0
    mov r7, r0
    ldrb r0, [r4, #0x8]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_b2c
.L_ad8:
    add r0, r4, r5, lsl #0x1
    ldrh r1, [r0, #0x10]
    and r0, r1, #0xff
    cmp r6, r0
    bne .L_b1c
    mov r1, r1, asr #0x8
    mov r0, r6
    and r1, r1, #0xff
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    beq .L_b1c
    ldr r0, _LIT13
    mov r1, r5, lsl #0x1
    ldrh r0, [r0, r1]
    mov r0, r0, asr #0x8
    and r7, r0, #0xff
    b .L_b2c
.L_b1c:
    ldrb r0, [r4, #0x8]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_ad8
.L_b2c:
    cmp r7, #0x0
    bge .L_b4c
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229acd0
    b .L_bc4
.L_b4c:
    ldr r0, _LIT0
    ldrh r1, [r0, #0x16]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    beq .L_b8c
    ldrb r1, [r0, #0x8]
    mov r2, r7
    str r1, [sp]
    ldr r1, [r0]
    mov r0, r1, lsl #0x1f
    mov r3, r1, lsl #0x18
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x17
    mov r3, r3, lsr #0x1e
    bl func_ov002_0227acdc
    b .L_bc4
.L_b8c:
    ldr r0, [r0]
    mov r2, r7
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1e
    moveq r1, #0x1
    movne r1, #0x0
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0]
    ldrb r3, [r0, #0x8]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_0227a990
.L_bc4:
    ldr r1, _LIT0
    ldr r0, _LIT14
    ldr r2, [r1]
    mov r3, r2, lsl #0x9
    cmp r0, r3, lsr #0x11
    bne .L_c40
    ldrh r0, [r1, #0x16]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_c40
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc5e4
    ldr r1, _LIT0
    mov r0, r0, lsl #0x10
    ldr r1, [r1]
    and r2, r0, #0x1f0000
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x1f
    mov r3, r1, lsl #0x9
    and r0, r0, #-2147483648
    mov r4, r3, lsr #0x11
    orr r3, r0, #0x200000
    mov r0, r1, lsr #0x17
    mov r1, r0, lsl #0x10
    mov r0, r4, lsl #0x10
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e349c
.L_c40:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c48:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0x00001894
_LIT2: .word 0x000015fa
_LIT3: .word 0x000013e9
_LIT4: .word 0x0000128c
_LIT5: .word 0x00000fdf
_LIT6: .word 0x0000112e
_LIT7: .word 0x00001725
_LIT8: .word 0x000019a5
_LIT9: .word 0x00001b2e
_LIT10: .word 0x00001b4e
_LIT11: .word 0x00001578
_LIT12: .word 0x00001a92
_LIT13: .word data_ov002_022cd230
_LIT14: .word 0x00001488
