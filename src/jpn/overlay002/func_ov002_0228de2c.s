; func_ov002_0228de2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd444
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_02030538
        .extern func_ov002_021bab58
        .extern func_ov002_021bd514
        .extern func_ov002_021c8390
        .extern func_ov002_021c83c8
        .extern func_ov002_0223dbd0
        .extern func_ov002_0223dda4
        .extern func_ov002_02253600
        .extern func_ov002_022575f0
        .extern func_ov002_0227afa0
        .extern func_ov002_02280a64
        .extern func_ov002_02280ce4
        .extern func_ov002_0228c474
        .extern func_ov002_0228c5f0
        .extern func_ov002_0228c70c
        .extern func_ov002_0228c754
        .extern func_ov002_0228ccb0
        .extern func_ov002_0228ce84
        .extern func_ov002_0228d788
        .extern func_ov002_0228d8dc
        .extern func_ov002_0228d944
        .extern func_ov002_0228da7c
        .extern func_ov002_0228da88
        .extern func_ov002_0228dc74
        .extern func_ov002_0228dc98
        .extern func_ov002_0228dcd0
        .extern func_ov002_0228dcf4
        .global func_ov002_0228de2c
        .arm
func_ov002_0228de2c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    mov r4, r0
    mov r8, r1
    mov r6, r2
    bl func_ov002_022575f0
    movs r7, r0
    addeq sp, sp, #0x30
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT0
    ldr r5, _LIT1
    mov r0, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r0, r0, r2, lsr #0x1f
    str r0, [r5]
    cmp r6, r1
    bgt .L_558
    bge .L_d98
    sub r0, r1, #0x22c
    cmp r6, r0
    bgt .L_2f4
    bge .L_d98
    ldr r1, _LIT2
    cmp r6, r1
    bgt .L_1b0
    bge .L_d98
    ldr r0, _LIT3
    cmp r6, r0
    bgt .L_fc
    bge .L_d98
    sub r1, r0, #0xf5
    cmp r6, r1
    bgt .L_cc
    bge .L_d98
    rsb r1, r0, #0x2180
    cmp r6, r1
    bgt .L_bc
    rsb r0, r0, #0x2180
    cmp r6, r0
    bge .L_d98
    ldr r0, _LIT4
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_bc:
    ldr r0, _LIT5
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_cc:
    sub r1, r0, #0x95
    cmp r6, r1
    bgt .L_ec
    bge .L_133c
    sub r0, r0, #0xa8
    cmp r6, r0
    beq .L_ac0
    b .L_1aa0
.L_ec:
    sub r0, r0, #0x78
    cmp r6, r0
    beq .L_a14
    b .L_1aa0
.L_fc:
    add r2, r0, #0xc8
    cmp r6, r2
    bgt .L_15c
    mov r1, r2
    cmp r6, r1
    bge .L_a14
    add r1, r0, #0x48
    cmp r6, r1
    bgt .L_14c
    bge .L_e1c
    add r1, r0, #0x20
    cmp r6, r1
    bgt .L_1aa0
    add r1, r0, #0x1f
    cmp r6, r1
    blt .L_1aa0
    addne r0, r0, #0x20
    cmpne r6, r0
    beq .L_d98
    b .L_1aa0
.L_14c:
    add r0, r0, #0xac
    cmp r6, r0
    beq .L_e1c
    b .L_1aa0
.L_15c:
    cmp r6, #0x1280
    bgt .L_178
    bge .L_fa8
    add r0, r0, #0xd8
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_178:
    sub r0, r1, #0x9
    cmp r6, r0
    bgt .L_1a0
    sub r0, r1, #0xc
    cmp r6, r0
    blt .L_1aa0
    subne r0, r1, #0x9
    cmpne r6, r0
    beq .L_e1c
    b .L_1aa0
.L_1a0:
    sub r0, r1, #0x3
    cmp r6, r0
    beq .L_fa8
    b .L_1aa0
.L_1b0:
    add r0, r1, #0x6f
    cmp r6, r0
    bgt .L_244
    bge .L_e1c
    add r0, r1, #0x59
    cmp r6, r0
    bgt .L_200
    bge .L_d98
    add r0, r1, #0xb
    cmp r6, r0
    bgt .L_1f0
    bge .L_d98
    add r0, r1, #0x1
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_1f0:
    add r0, r1, #0x2e
    cmp r6, r0
    beq .L_121c
    b .L_1aa0
.L_200:
    add r0, r1, #0x64
    cmp r6, r0
    bgt .L_220
    bge .L_12ec
    add r0, r1, #0x5e
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_220:
    add r0, r1, #0x65
    cmp r6, r0
    bgt .L_234
    beq .L_12ec
    b .L_1aa0
.L_234:
    add r0, r1, #0x6b
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_244:
    add r0, r1, #0xa3
    cmp r6, r0
    bgt .L_2b0
    add r0, r1, #0x9c
    subs r0, r6, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_280
    b .L_12ec
    b .L_12ec
    b .L_1aa0
    b .L_1aa0
    b .L_d28
    b .L_1aa0
    b .L_1aa0
    b .L_a14
.L_280:
    ldr r0, _LIT6
    cmp r6, r0
    bgt .L_2a0
    bge .L_e1c
    sub r0, r0, #0x18
    cmp r6, r0
    beq .L_133c
    b .L_1aa0
.L_2a0:
    add r0, r0, #0x4
    cmp r6, r0
    beq .L_14f0
    b .L_1aa0
.L_2b0:
    add r0, r1, #0xbf
    cmp r6, r0
    bgt .L_2d0
    bge .L_d98
    add r0, r1, #0xbe
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_2d0:
    add r0, r1, #0xc0
    cmp r6, r0
    bgt .L_2e4
    beq .L_d98
    b .L_1aa0
.L_2e4:
    add r0, r1, #0xd5
    cmp r6, r0
    beq .L_a84
    b .L_1aa0
.L_2f4:
    ldr r0, _LIT7
    cmp r6, r0
    bgt .L_418
    bge .L_14f0
    sub r2, r0, #0x8f
    cmp r6, r2
    bgt .L_38c
    bge .L_14c4
    sub r2, r0, #0xdd
    cmp r6, r2
    bgt .L_35c
    bge .L_e1c
    sub r2, r0, #0x100
    cmp r6, r2
    bgt .L_34c
    sub r0, r0, #0x100
    cmp r6, r0
    bge .L_150c
    sub r0, r1, #0x220
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_34c:
    sub r0, r0, #0xfc
    cmp r6, r0
    beq .L_fa8
    b .L_1aa0
.L_35c:
    sub r1, r0, #0xa4
    cmp r6, r1
    bgt .L_37c
    bge .L_ac0
    sub r0, r0, #0xaa
    cmp r6, r0
    beq .L_ac0
    b .L_1aa0
.L_37c:
    sub r0, r0, #0xa2
    cmp r6, r0
    beq .L_fa8
    b .L_1aa0
.L_38c:
    sub r1, r0, #0x22
    cmp r6, r1
    bgt .L_3cc
    bge .L_1580
    sub r1, r0, #0x5f
    cmp r6, r1
    bgt .L_3bc
    bge .L_d98
    sub r0, r0, #0x6d
    cmp r6, r0
    beq .L_a84
    b .L_1aa0
.L_3bc:
    sub r0, r0, #0x27
    cmp r6, r0
    beq .L_e1c
    b .L_1aa0
.L_3cc:
    sub r1, r0, #0xf
    cmp r6, r1
    bgt .L_3ec
    bge .L_d98
    sub r0, r0, #0x18
    cmp r6, r0
    beq .L_150c
    b .L_1aa0
.L_3ec:
    sub r1, r0, #0x8
    cmp r6, r1
    bgt .L_408
    sub r0, r0, #0x8
    cmp r6, r0
    beq .L_fa8
    b .L_1aa0
.L_408:
    sub r0, r0, #0x6
    cmp r6, r0
    beq .L_fa8
    b .L_1aa0
.L_418:
    add r2, r0, #0x5e
    cmp r6, r2
    bgt .L_4bc
    mov r1, r2
    cmp r6, r1
    bge .L_a14
    add r1, r0, #0x31
    cmp r6, r1
    bgt .L_470
    bge .L_a14
    add r1, r0, #0x25
    cmp r6, r1
    bgt .L_460
    bge .L_a14
    add r0, r0, #0x5
    cmp r6, r0
    beq .L_12ec
    b .L_1aa0
.L_460:
    add r0, r0, #0x2c
    cmp r6, r0
    beq .L_101c
    b .L_1aa0
.L_470:
    add r1, r0, #0x3e
    cmp r6, r1
    bgt .L_490
    bge .L_d98
    add r0, r0, #0x36
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_490:
    add r1, r0, #0x46
    cmp r6, r1
    bgt .L_4ac
    add r0, r0, #0x46
    cmp r6, r0
    beq .L_18a0
    b .L_1aa0
.L_4ac:
    add r0, r0, #0x54
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_4bc:
    add r2, r0, #0xab
    cmp r6, r2
    bgt .L_504
    mov r1, r2
    cmp r6, r1
    bge .L_18a0
    add r1, r0, #0x9e
    cmp r6, r1
    bgt .L_4f4
    bge .L_d98
    add r0, r0, #0x9d
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_4f4:
    add r0, r0, #0xaa
    cmp r6, r0
    beq .L_ea0
    b .L_1aa0
.L_504:
    add r2, r0, #0xed
    cmp r6, r2
    bgt .L_52c
    mov r1, r2
    cmp r6, r1
    bge .L_1680
    add r0, r0, #0xdf
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_52c:
    add r2, r0, #0xf4
    cmp r6, r2
    bgt .L_548
    add r0, r0, #0xf4
    cmp r6, r0
    beq .L_133c
    b .L_1aa0
.L_548:
    sub r0, r1, #0x1a
    cmp r6, r0
    beq .L_1a18
    b .L_1aa0
.L_558:
    add r0, r1, #0x210
    cmp r6, r0
    bgt .L_7a4
    bge .L_fa8
    add r0, r1, #0xe8
    cmp r6, r0
    bgt .L_67c
    bge .L_f20
    add r0, r1, #0x6a
    cmp r6, r0
    bgt .L_5f8
    bge .L_101c
    add r0, r1, #0x41
    cmp r6, r0
    bgt .L_5c8
    bge .L_e1c
    add r0, r1, #0xc
    cmp r6, r0
    bgt .L_5b8
    bge .L_d98
    add r0, r1, #0x9
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_5b8:
    add r0, r1, #0x10
    cmp r6, r0
    beq .L_15d0
    b .L_1aa0
.L_5c8:
    add r0, r1, #0x51
    cmp r6, r0
    bgt .L_5e8
    bge .L_d98
    add r0, r1, #0x4d
    cmp r6, r0
    beq .L_fa8
    b .L_1aa0
.L_5e8:
    add r0, r1, #0x52
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_5f8:
    add r0, r1, #0xa3
    cmp r6, r0
    bgt .L_638
    bge .L_d98
    add r0, r1, #0x76
    cmp r6, r0
    bgt .L_628
    bge .L_d98
    add r0, r1, #0x6f
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_628:
    add r0, r1, #0x7c
    cmp r6, r0
    beq .L_101c
    b .L_1aa0
.L_638:
    add r0, r1, #0xc1
    cmp r6, r0
    bgt .L_658
    bge .L_10d8
    add r0, r1, #0xae
    cmp r6, r0
    beq .L_e1c
    b .L_1aa0
.L_658:
    add r0, r1, #0xc7
    cmp r6, r0
    bgt .L_66c
    beq .L_d98
    b .L_1aa0
.L_66c:
    add r0, r1, #0xdd
    cmp r6, r0
    beq .L_e1c
    b .L_1aa0
.L_67c:
    ldr r0, _LIT8
    cmp r6, r0
    bgt .L_718
    bge .L_a14
    sub r1, r0, #0x60
    cmp r6, r1
    bgt .L_6cc
    bge .L_e1c
    sub r1, r0, #0x78
    cmp r6, r1
    bgt .L_6bc
    bge .L_1a60
    sub r0, r0, #0x86
    cmp r6, r0
    beq .L_198c
    b .L_1aa0
.L_6bc:
    sub r0, r0, #0x6f
    cmp r6, r0
    beq .L_e1c
    b .L_1aa0
.L_6cc:
    sub r1, r0, #0x4c
    cmp r6, r1
    bgt .L_6ec
    bge .L_178c
    sub r0, r0, #0x4f
    cmp r6, r0
    beq .L_e1c
    b .L_1aa0
.L_6ec:
    sub r1, r0, #0x37
    cmp r6, r1
    bgt .L_708
    sub r0, r0, #0x37
    cmp r6, r0
    beq .L_12ec
    b .L_1aa0
.L_708:
    sub r0, r0, #0x2
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_718:
    add r1, r0, #0x33
    cmp r6, r1
    bgt .L_758
    bge .L_d98
    add r1, r0, #0x10
    cmp r6, r1
    bgt .L_748
    bge .L_198c
    add r0, r0, #0xd
    cmp r6, r0
    beq .L_e1c
    b .L_1aa0
.L_748:
    add r0, r0, #0x32
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_758:
    add r1, r0, #0x74
    cmp r6, r1
    bgt .L_778
    bge .L_198c
    add r0, r0, #0x43
    cmp r6, r0
    beq .L_ee0
    b .L_1aa0
.L_778:
    add r1, r0, #0x80
    cmp r6, r1
    bgt .L_794
    add r0, r0, #0x80
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_794:
    add r0, r0, #0x85
    cmp r6, r0
    beq .L_fa8
    b .L_1aa0
.L_7a4:
    ldr r0, _LIT9
    cmp r6, r0
    bgt .L_8ec
    bge .L_133c
    sub r2, r0, #0x89
    cmp r6, r2
    bgt .L_860
    bge .L_16c0
    sub r2, r0, #0xcf
    cmp r6, r2
    bgt .L_80c
    bge .L_e1c
    add r2, r1, #0x254
    cmp r6, r2
    bgt .L_7fc
    mov r0, r2
    cmp r6, r0
    bge .L_101c
    ldr r0, _LIT10
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_7fc:
    sub r0, r0, #0xd1
    cmp r6, r0
    beq .L_ac0
    b .L_1aa0
.L_80c:
    sub r2, r0, #0xc0
    cmp r6, r2
    bgt .L_834
    mov r1, r2
    cmp r6, r1
    bge .L_108c
    sub r0, r0, #0xc8
    cmp r6, r0
    beq .L_1800
    b .L_1aa0
.L_834:
    sub r2, r0, #0xa5
    cmp r6, r2
    bgt .L_850
    sub r0, r0, #0xa5
    cmp r6, r0
    beq .L_e1c
    b .L_1aa0
.L_850:
    sub r0, r0, #0x8a
    cmp r6, r0
    beq .L_1118
    b .L_1aa0
.L_860:
    sub r1, r0, #0x4d
    cmp r6, r1
    bgt .L_8a0
    bge .L_e1c
    sub r1, r0, #0x59
    cmp r6, r1
    bgt .L_890
    bge .L_e1c
    sub r0, r0, #0x80
    cmp r6, r0
    beq .L_101c
    b .L_1aa0
.L_890:
    sub r0, r0, #0x58
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_8a0:
    sub r1, r0, #0x1b
    cmp r6, r1
    bgt .L_8c0
    bge .L_d98
    sub r0, r0, #0x23
    cmp r6, r0
    beq .L_1a18
    b .L_1aa0
.L_8c0:
    sub r1, r0, #0xa
    cmp r6, r1
    bgt .L_8dc
    sub r0, r0, #0xa
    cmp r6, r0
    beq .L_133c
    b .L_1aa0
.L_8dc:
    sub r0, r0, #0x5
    cmp r6, r0
    beq .L_1264
    b .L_1aa0
.L_8ec:
    add r2, r0, #0xf6
    cmp r6, r2
    bgt .L_990
    bge .L_d98
    add r2, r0, #0x5d
    cmp r6, r2
    bgt .L_944
    mov r1, r2
    cmp r6, r1
    bge .L_d98
    add r1, r0, #0x32
    cmp r6, r1
    bgt .L_934
    bge .L_108c
    add r0, r0, #0x1a
    cmp r6, r0
    beq .L_12ec
    b .L_1aa0
.L_934:
    add r0, r0, #0x4f
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_944:
    add r2, r0, #0xc8
    cmp r6, r2
    bgt .L_964
    bge .L_e1c
    add r0, r0, #0x65
    cmp r6, r0
    beq .L_1700
    b .L_1aa0
.L_964:
    add r1, r0, #0xe0
    cmp r6, r1
    bgt .L_980
    add r0, r0, #0xe0
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_980:
    add r0, r0, #0xe1
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_990:
    ldr r1, _LIT11
    cmp r6, r1
    bgt .L_9d0
    bge .L_12ec
    sub r0, r1, #0x5a
    cmp r6, r0
    bgt .L_9c0
    bge .L_101c
    sub r0, r1, #0x5c
    cmp r6, r0
    beq .L_121c
    b .L_1aa0
.L_9c0:
    sub r0, r1, #0x4b
    cmp r6, r0
    beq .L_d98
    b .L_1aa0
.L_9d0:
    add r0, r1, #0x13
    cmp r6, r0
    bgt .L_9f0
    bge .L_101c
    add r0, r1, #0x4
    cmp r6, r0
    beq .L_e1c
    b .L_1aa0
.L_9f0:
    add r0, r1, #0x31
    cmp r6, r0
    bgt .L_a04
    beq .L_d98
    b .L_1aa0
.L_a04:
    add r0, r1, #0xb5
    cmp r6, r0
    beq .L_121c
    b .L_1aa0
.L_a14:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT12
    mov r3, #0x1
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldr r1, [r0]
    rsb r2, r2, #0x1
    cmp r1, r2
    bne .L_a5c
    ldr r2, [r0, #0x1c]
    add r0, r2, r1, lsl #0x4
    tst r7, r3, lsl r0
    beq .L_1aa0
    mov r0, r4
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a5c:
    ldr r1, [r0, #0x4]
    ldr r2, [r0, #0x20]
    add r0, r2, r1, lsl #0x4
    tst r7, r3, lsl r0
    beq .L_1aa0
    mov r0, r4
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a84:
    ldr r0, _LIT12
    mov r1, #0x1
    ldr r2, [r0, #0x20]
    ldr r0, [r0, #0x4]
    add r0, r2, r0, lsl #0x4
    tst r7, r1, lsl r0
    beq .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ac0:
    ldrh r2, [r4, #0x2]
    ldrh r1, [r4]
    ldr r0, _LIT13
    mov r2, r2, lsl #0x1f
    cmp r1, r0
    mov r5, r2, lsr #0x1f
    bgt .L_b64
    cmp r1, r0
    bge .L_bf0
    sub r2, r0, #0x10
    cmp r1, r2
    bgt .L_b38
    bge .L_bf0
    sub r2, r0, #0x1bc
    cmp r1, r2
    bgt .L_b10
    sub r0, r0, #0x1bc
    cmp r1, r0
    beq .L_bc0
    b .L_cbc
.L_b10:
    sub r2, r0, #0xe5
    cmp r1, r2
    bgt .L_cbc
    sub r2, r0, #0xe6
    cmp r1, r2
    blt .L_cbc
    subne r0, r0, #0xe5
    cmpne r1, r0
    beq .L_bf0
    b .L_cbc
.L_b38:
    sub r2, r0, #0xa
    cmp r1, r2
    bgt .L_b54
    sub r0, r0, #0xa
    cmp r1, r0
    beq .L_bf0
    b .L_cbc
.L_b54:
    sub r0, r0, #0x9
    cmp r1, r0
    beq .L_bf0
    b .L_cbc
.L_b64:
    ldr r3, _LIT14
    cmp r1, r3
    bgt .L_ba0
    bge .L_bf0
    add r2, r0, #0xaa
    cmp r1, r2
    bgt .L_b90
    add r0, r0, #0xaa
    cmp r1, r0
    beq .L_bf0
    b .L_cbc
.L_b90:
    sub r0, r3, #0x8f
    cmp r1, r0
    beq .L_bf0
    b .L_cbc
.L_ba0:
    add r0, r3, #0x88
    cmp r1, r0
    bgt .L_bb4
    beq .L_c8c
    b .L_cbc
.L_bb4:
    cmp r1, #0x1980
    beq .L_c50
    b .L_cbc
.L_bc0:
    rsb r6, r5, #0x1
    ldr r0, _LIT15
    and r2, r5, #0x1
    mul r3, r2, r0
    and r1, r6, #0x1
    mul r0, r1, r0
    ldr r2, _LIT16
    ldr r1, [r2, r3]
    ldr r0, [r2, r0]
    cmp r1, r0
    movgt r5, r6
    b .L_cbc
.L_bf0:
    rsb r5, r5, #0x1
    b .L_cbc
_LIT0: .word 0x000015a8
_LIT1: .word data_ov002_022cd444
_LIT2: .word 0x0000128d
_LIT3: .word 0x0000117b
_LIT4: .word 0x00000ffa
_LIT5: .word 0x0000101e
_LIT6: .word 0x00001322
_LIT7: .word 0x0000148d
_LIT8: .word 0x0000171a
_LIT9: .word 0x00001913
_LIT10: .word 0x000017da
_LIT11: .word 0x00001a69
_LIT12: .word data_ov002_022cd314
_LIT13: .word 0x000013f3
_LIT14: .word 0x000018d1
_LIT15: .word 0x00000868
_LIT16: .word data_ov002_022cf08c
_LIT17: .word func_ov002_021bd514
_LIT18: .word data_ov002_022d008c
_LIT19: .word 0x00001539
_LIT20: .word func_ov002_0228d8dc
_LIT21: .word func_ov002_0228dcd0
.L_c50:
    ldr r0, _LIT12
    ldr r3, [r0, #0x4]
    cmp r3, r5
    bne .L_cbc
    ldr r2, [r0, #0x20]
    mov r1, #0x1
    add r0, r2, r3, lsl #0x4
    tst r7, r1, lsl r0
    beq .L_cbc
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c8c:
    ldr r2, _LIT17
    mov r0, r5
    mov r1, r7
    bl func_ov002_0228c754
    movs r2, r0
    bmi .L_cbc
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cbc:
    mov r0, r4
    mov r1, r5
    mvn r2, #0x0
    mov r3, #0x1
    bl func_ov002_02280ce4
    movs r2, r0
    bmi .L_cf0
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cf0:
    rsb r5, r5, #0x1
    mov r0, r4
    mov r1, r5
    mvn r2, #0x0
    mov r3, #0x1
    bl func_ov002_02280ce4
    movs r2, r0
    bmi .L_1aa0
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d28:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT18
    mov r2, r0, lsl #0x1f
    ldr r3, [r1, #0xcec]
    mov r0, r2, lsr #0x1f
    cmp r3, r2, lsr #0x1f
    beq .L_d50
    ldr r1, [r1, #0xcf8]
    cmp r1, #0x5
    beq .L_d68
.L_d50:
    cmp r3, r0
    bne .L_d98
    ldr r1, _LIT18
    ldr r1, [r1, #0xcf8]
    cmp r1, #0x1
    bhi .L_d98
.L_d68:
    ldr r1, _LIT19
    bl func_ov002_021bab58
    movs r2, r0
    bmi .L_d98
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d98:
    ldrh r0, [r4, #0x2]
    mov r1, r7
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0228ccb0
    movs r2, r0
    bmi .L_de0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_de0:
    ldrh r0, [r4, #0x2]
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228ce84
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e1c:
    ldrh r0, [r4, #0x2]
    mov r1, r7
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0228ccb0
    movs r2, r0
    bmi .L_e64
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e64:
    ldrh r0, [r4, #0x2]
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228ce84
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ea0:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT20
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c754
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ee0:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT21
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c754
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f20:
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT18
    mov r3, r2, lsl #0x1f
    ldr r0, [r0, #0xcec]
    mov r1, r3, lsr #0x1f
    cmp r0, r3, lsr #0x1f
    beq .L_f68
    mov r0, r2, lsl #0x1a
    mov r2, r0, lsr #0x1b
    add r0, r2, r1, lsl #0x4
    mov r3, #0x1
    tst r7, r3, lsl r0
    beq .L_f68
    mov r0, r4
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f68:
    mov r2, #0x1
    mvn r5, #0x0
    mov r0, r4
    mov r3, r2
    str r5, [sp]
    bl func_ov002_0228c70c
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fa8:
    ldrh r0, [r4, #0x2]
    mov r2, #0x1
    mvn r5, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r6, r0, #0x1
    mov r0, r4
    mov r1, r6
    mov r3, r2
    str r5, [sp]
    bl func_ov002_0228c70c
    movs r2, r0
    bpl .L_ffc
    mov r2, r5
    rsb r6, r6, #0x1
    mov r0, r4
    mov r1, r6
    mov r3, r2
    str r2, [sp]
    bl func_ov002_0228c70c
    mov r2, r0
.L_ffc:
    cmp r2, #0x0
    blt .L_1aa0
    mov r0, r4
    mov r1, r6
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_101c:
    ldrh r0, [r4, #0x2]
    mov r2, #0x1
    mvn r5, #0x0
    mov r0, r0, lsl #0x1f
    mov r6, r0, lsr #0x1f
    mov r0, r4
    mov r1, r6
    mov r3, r2
    str r5, [sp]
    bl func_ov002_0228c70c
    movs r2, r0
    bpl .L_106c
    mov r2, r5
    rsb r6, r6, #0x1
    mov r0, r4
    mov r1, r6
    mov r3, r2
    str r2, [sp]
    bl func_ov002_0228c70c
    mov r2, r0
.L_106c:
    cmp r2, #0x0
    blt .L_1aa0
    mov r0, r4
    mov r1, r6
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_108c:
    mvn r0, #0x0
    str r0, [sp]
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, #0x1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_0228c70c
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10d8:
    ldrh r0, [r4, #0x2]
    mov r1, r7
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c5f0
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1118:
    mov r9, #0x0
    ldr fp, _LIT16
    mov r8, r9
    mov sl, r9
    sub r5, r1, #0xd40
    mov r6, #0x1
.L_1130:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    add r0, r8, r1, lsl #0x4
    tst r7, r6, lsl r0
    beq .L_11a0
    and r0, r1, #0x1
    mla r1, r0, r5, fp
    add r0, r1, sl
    ldr r1, [r0, #0x40]
    mov r2, r1, lsr #0x16
    mov r1, r1, lsr #0x17
    and r2, r2, #0x1
    and r1, r1, #0x1
    adds r1, r2, r1
    beq .L_11a0
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_02030538
    cmp r0, #0x0
    bne .L_11a0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r1, r8, r0, lsl #0x4
    mov r0, #0x1
    orr r9, r9, r0, lsl r1
.L_11a0:
    add r8, r8, #0x1
    cmp r8, #0xa
    add sl, sl, #0x14
    ble .L_1130
    ldrh r0, [r4, #0x2]
    mov r1, r9
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_0228c474
    movs r2, r0
    bpl .L_11f4
    ldrh r0, [r4, #0x2]
    mov r1, r7
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_0228c474
    mov r2, r0
.L_11f4:
    cmp r2, #0x0
    blt .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_121c:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT22
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0228c754
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1264:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT23
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c754
    movs r2, r0
    bmi .L_12a4
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12a4:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT23
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0228c754
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12ec:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT12
    mov r3, r1, lsl #0x1f
    ldr r2, [r0]
    mov r1, r3, lsr #0x1f
    cmp r2, r3, lsr #0x1f
    ldreq r2, [r0, #0x1c]
    mov r3, #0x1
    ldrne r2, [r0, #0x20]
    add r0, r2, r1, lsl #0x4
    tst r7, r3, lsl r0
    mov r0, r4
    beq .L_1330
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1330:
    bl func_ov002_0228d788
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_133c:
    mov sl, #0x0
    ldr r5, _LIT16
    ldr r9, _LIT15
    mov r6, sl
    mov r8, sl
.L_1350:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r2, r1, r9, r5
    add r2, r2, r8
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_13ac
    ldrh r1, [r2, #0x36]
    cmp r1, #0x0
    bne .L_13ac
    mov r1, r6
    bl func_ov002_021c8390
    cmp sl, r0
    bgt .L_13ac
    ldrh r0, [r4, #0x2]
    mov r1, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c8390
    mov sl, r0
.L_13ac:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r8, r8, #0x14
    blt .L_1350
    cmp sl, #0x0
    bne .L_13ec
    ldrh r0, [r4, #0x2]
    mov r5, #0x0
    sub r2, r5, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    mov r3, #0x1
    str r5, [sp]
    bl func_ov002_02280a64
    mov sl, r0
.L_13ec:
    mov r9, #0x0
    ldr r5, _LIT16
    ldr fp, _LIT15
    mov r8, r9
    mov r6, #0x1
.L_1400:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    add r1, r9, r0, lsl #0x4
    tst r7, r6, lsl r1
    beq .L_14b0
    mov r1, r9
    add r2, sp, #0x4
    bl func_ov002_0227afa0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    and r2, r1, #0x1
    mla r0, r2, fp, r5
    add r0, r8, r0
    ldrh r0, [r0, #0x36]
    cmp r0, #0x0
    bne .L_1480
    ldr r0, [sp, #0x18]
    cmp r0, sl
    blt .L_14b0
    ldr r0, [sp, #0x1c]
    cmp r0, sl
    bge .L_14b0
    mov r0, r4
    mov r2, r9
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1480:
    ldr r0, [sp, #0x1c]
    cmp r0, sl
    blt .L_14b0
    ldr r0, [sp, #0x18]
    cmp r0, sl
    bge .L_14b0
    mov r0, r4
    mov r2, r9
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_14b0:
    add r9, r9, #0x1
    cmp r9, #0x5
    add r8, r8, #0x14
    blt .L_1400
    b .L_1aa0
.L_14c4:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT18
    mov r2, r1, lsl #0x1f
    ldr r0, [r0, #0xcec]
    mov r1, r2, lsr #0x1f
    cmp r0, r2, lsr #0x1f
    bne .L_1aa0
    mov r0, r4
    bl func_ov002_0228d788
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_14f0:
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0228d788
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_150c:
    ldrh r1, [r4, #0x2]
    mvn r5, #0x0
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r6, r1, #0x1
    mov r1, r6
    mov r2, #0x1
    mov r3, #0x0
    str r5, [sp]
    bl func_ov002_0228c70c
    movs r2, r0
    bpl .L_1560
    rsb r6, r6, #0x1
    mov r0, r4
    mov r1, r6
    mov r2, #0x1
    mov r3, #0x0
    str r5, [sp]
    bl func_ov002_0228c70c
    mov r2, r0
.L_1560:
    cmp r2, #0x0
    blt .L_1aa0
    mov r0, r4
    mov r1, r6
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1580:
    mvn r2, #0x0
    str r2, [sp]
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r3, #0x1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0228c70c
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_15d0:
    cmp r8, #0x0
    beq .L_1aa0
    ldrh r1, [r8, #0x2]
    ldrh r0, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    beq .L_1aa0
    ldrh r0, [r8, #0x6]
    mov r6, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_1aa0
    mov r5, #0x1
.L_1610:
    mov r0, r8
    mov r1, r6
    bl func_ov002_0223dda4
    ldrh r2, [r4, #0x2]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    and r1, r0, #0xff
    mov r0, r2, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    and r2, r3, #0xff
    bne .L_1668
    cmp r2, #0x4
    bgt .L_1668
    add r0, r2, r1, lsl #0x4
    tst r7, r5, lsl r0
    beq .L_1668
    mov r0, r4
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1668:
    ldrh r0, [r8, #0x6]
    add r6, r6, #0x1
    mov r0, r0, lsl #0x18
    cmp r6, r0, lsr #0x18
    blt .L_1610
    b .L_1aa0
.L_1680:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT24
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c754
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_16c0:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT25
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c754
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1700:
    mov r9, #0x0
    ldr r5, _LIT16
    mov r8, r9
    sub sl, r1, #0xd40
    mov r6, #0x1
.L_1714:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r1, r9, r0, lsl #0x4
    tst r7, r6, lsl r1
    beq .L_1778
    and r2, r0, #0x1
    mla r1, r2, sl, r5
    add r1, r1, r8
    ldr r2, [r1, #0x30]
    ldrh r1, [r4]
    mov r2, r2, lsl #0x13
    mov r2, r2, lsr #0x13
    bl func_ov002_02253600
    cmp r0, #0x0
    beq .L_1778
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, r9
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1778:
    add r9, r9, #0x1
    cmp r9, #0x5
    add r8, r8, #0x14
    blt .L_1714
    b .L_1aa0
.L_178c:
    mov r8, #0x0
    mov r6, #0x1
.L_1794:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r1, r8, r0, lsl #0x4
    tst r7, r6, lsl r1
    beq .L_17f0
    add r1, r5, r8, lsl #0x2
    ldr r1, [r1, #0x1e4]
    cmp r1, #0x1
    bls .L_17f0
    mov r1, r8
    bl func_ov002_021c83c8
    cmp r0, #0x0
    beq .L_17f0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, r8
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_17f0:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_1794
    b .L_1aa0
.L_1800:
    cmp r8, #0x0
    beq .L_1884
    ldrh r0, [r8, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_1884
    mov r0, r8
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xa
    bhi .L_1884
    mov r0, r8
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r1, asr #0x8
    and r1, r0, #0xff
    and r2, r2, #0xff
    add r0, r2, r1, lsl #0x4
    mov r3, #0x1
    tst r7, r3, lsl r0
    beq .L_1884
    mov r0, r4
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1884:
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0228d788
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18a0:
    cmp r8, #0x0
    beq .L_1924
    ldrh r0, [r8, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_1924
    mov r0, r8
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xa
    bhi .L_1924
    mov r0, r8
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r1, asr #0x8
    and r1, r0, #0xff
    and r2, r2, #0xff
    add r0, r2, r1, lsl #0x4
    mov r3, #0x1
    tst r7, r3, lsl r0
    beq .L_1924
    mov r0, r4
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1924:
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    add r0, r0, #0xee
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_198c
    ldr r0, _LIT12
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldr r1, [r0]
    rsb r2, r2, #0x1
    cmp r1, r2
    bne .L_198c
    ldr r2, [r0, #0x1c]
    mov r3, #0x1
    add r0, r2, r1, lsl #0x4
    tst r7, r3, lsl r0
    beq .L_198c
    mov r0, r4
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_198c:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT25
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c754
    movs r2, r0
    bmi .L_19cc
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19cc:
    ldrh r0, [r4, #0x2]
    mov r1, r7
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mov r3, #0x0
    bl func_ov002_0228c474
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a18:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT26
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0228c754
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a60:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT27
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c754
    movs r2, r0
    bmi .L_1aa0
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1aa0:
    ldrh r2, [r4, #0x2]
    mov r0, r4
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r1, r1, r2, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0228d788
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT22: .word func_ov002_0228da7c
_LIT23: .word func_ov002_0228dcf4
_LIT24: .word func_ov002_0228dc74
_LIT25: .word func_ov002_0228d944
_LIT26: .word func_ov002_0228da88
_LIT27: .word func_ov002_0228dc98
