; func_ov002_0226ea6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern data_ov002_022d0170
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_0202e1e0
        .extern func_0202e3d8
        .extern func_0202ea74
        .extern func_0202effc
        .extern func_02030584
        .extern func_020317e4
        .extern func_ov002_021b3ef8
        .extern func_ov002_021baf88
        .extern func_ov002_021bb82c
        .extern func_ov002_021bb97c
        .extern func_ov002_021bbe70
        .extern func_ov002_021bbf20
        .extern func_ov002_021bc538
        .extern func_ov002_021bca30
        .extern func_ov002_021bd77c
        .extern func_ov002_021c37e4
        .extern func_ov002_021c9b08
        .extern func_ov002_021c9bb4
        .extern func_ov002_021c9d34
        .extern func_ov002_0226e71c
        .extern func_ov002_0226e828
        .extern func_ov002_0226e8bc
        .extern func_ov002_0226e90c
        .extern func_ov002_0226e98c
        .extern func_ov002_0226e9e0
        .global func_ov002_0226ea6c
        .arm
func_ov002_0226ea6c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov fp, r1
    ldr r1, _LIT0
    mov r4, fp, lsl #0x2
    ldrh r1, [r1, r4]
    mov r9, r0
    mov sl, r2
    mov r0, r1, lsl #0x13
    mov r8, r3
    movs r4, r0, lsr #0x13
    mov r5, #0x0
    mov r6, #0x10
    mov r7, #0x40
    moveq r0, r5
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    bl func_0202e1e0
    cmp r0, #0x0
    moveq r0, r5
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    mvn r1, #0x0
    bl func_ov002_021bd77c
    cmp r0, #0x0
    beq .L_84
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r9, r0
    ldreq r0, _LIT2
    moveq r1, r6
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_84:
    mov r0, r9
    mov r1, r4
    bl func_ov002_021c9b08
    cmp r0, #0x0
    bne .L_b8
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r9, r0
    ldreq r0, _LIT2
    moveq r1, #0x17
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b8:
    mov r0, r4
    bl func_02030584
    cmp r0, #0x0
    moveq r0, r5
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT3
    bl func_ov002_021baf88
    cmp r0, #0x0
    mov r0, r9
    movne r6, #0x50
    movne r7, r5
    bl func_ov002_021c9d34
    cmp r0, #0x0
    bne .L_10c
    ldr r0, _LIT1
    mov r6, #0x0
    ldr r0, [r0, #0x4]
    cmp r9, r0
    ldreq r0, _LIT2
    moveq r1, #0x11
    streq r1, [r0, #0xd80]
.L_10c:
    mov r0, r4
    bl func_0202b83c
    mov r2, r0
    ldr r1, _LIT4
    rsb r0, r9, #0x1
    bl func_ov002_021bb97c
    cmp r0, #0x0
    beq .L_148
    ldr r0, _LIT1
    mov r6, #0x0
    ldr r0, [r0, #0x4]
    cmp r9, r0
    ldreq r0, _LIT2
    moveq r1, #0x11
    streq r1, [r0, #0xd80]
.L_148:
    mov r0, r9
    bl func_ov002_021c9bb4
    cmp r0, #0x0
    ldr r2, _LIT5
    moveq r7, #0x0
    cmp r4, r2
    bgt .L_274
    bge .L_4b0
    ldr r1, _LIT6
    cmp r4, r1
    bgt .L_1fc
    bge .L_478
    ldr r0, _LIT7
    cmp r4, r0
    bgt .L_1d0
    bge .L_44c
    sub r3, r2, #0x450
    cmp r4, r3
    bgt .L_1c0
    sub r3, r1, #0x2c4
    cmp r4, r3
    blt .L_69c
    sub r1, r1, #0x2c4
    cmp r4, r1
    subne r0, r0, #0x154
    cmpne r4, r0
    subne r0, r2, #0x450
    cmpne r4, r0
    beq .L_364
    b .L_69c
.L_1c0:
    sub r0, r0, #0x60
    cmp r4, r0
    beq .L_410
    b .L_69c
.L_1d0:
    add r1, r0, #0xb0
    cmp r4, r1
    bgt .L_1ec
    add r0, r0, #0xb0
    cmp r4, r0
    beq .L_460
    b .L_69c
.L_1ec:
    add r0, r0, #0x134
    cmp r4, r0
    beq .L_460
    b .L_69c
.L_1fc:
    add r0, r1, #0x47
    cmp r4, r0
    bgt .L_244
    bge .L_498
    add r0, r1, #0x1
    cmp r4, r0
    bgt .L_220
    beq .L_478
    b .L_69c
.L_220:
    add r0, r1, #0x2
    sub r0, r4, r0
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_69c
    b .L_478
    b .L_478
    b .L_478
    b .L_478
.L_244:
    ldr r0, _LIT8
    cmp r4, r0
    bgt .L_264
    bge .L_3f0
    sub r0, r0, #0x39
    cmp r4, r0
    beq .L_3f0
    b .L_69c
.L_264:
    add r0, r0, #0x4
    cmp r4, r0
    beq .L_3f0
    b .L_69c
.L_274:
    ldr r0, _LIT9
    cmp r4, r0
    bgt .L_2f0
    bge .L_3f0
    add r1, r2, #0x8c
    cmp r4, r1
    bgt .L_2c0
    mov r0, r1
    cmp r4, r0
    bge .L_4dc
    add r0, r2, #0x4b
    cmp r4, r0
    bgt .L_2b0
    beq .L_4b0
    b .L_69c
.L_2b0:
    add r0, r2, #0x60
    cmp r4, r0
    beq .L_4b8
    b .L_69c
.L_2c0:
    sub r1, r0, #0x3a
    cmp r4, r1
    bgt .L_2e0
    bge .L_560
    sub r0, r0, #0x81
    cmp r4, r0
    beq .L_364
    b .L_69c
.L_2e0:
    sub r0, r0, #0x1
    cmp r4, r0
    beq .L_3f0
    b .L_69c
.L_2f0:
    add r1, r0, #0x110
    cmp r4, r1
    bgt .L_32c
    bge .L_678
    add r1, r0, #0x9a
    cmp r4, r1
    bgt .L_31c
    add r0, r0, #0x9a
    cmp r4, r0
    beq .L_5d8
    b .L_69c
.L_31c:
    add r0, r0, #0x9b
    cmp r4, r0
    beq .L_5f8
    b .L_69c
.L_32c:
    add r1, r0, #0x1a8
    cmp r4, r1
    bgt .L_354
    add r0, r0, #0x1a8
    cmp r4, r0
    bge .L_3f0
    ldr r0, _LIT10
    cmp r4, r0
    beq .L_678
    b .L_69c
.L_354:
    ldr r0, _LIT11
    cmp r4, r0
    beq .L_3f0
    b .L_69c
.L_364:
    cmp r8, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r9
    mov r1, #0x0
    bl func_ov002_0226e9e0
    cmp r0, #0x0
    bne .L_3a4
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r9, r0
    ldreq r0, _LIT2
    moveq r1, #0xb
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3a4:
    mov r0, r9
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021bca30
    cmp r0, #0x3
    orrge r0, r5, r6
    orrge r5, r0, r7
    cmp r5, #0x0
    bne .L_3e8
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r9, r0
    ldreq r0, _LIT2
    moveq r1, #0x0
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3e8:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3f0:
    mov r0, r9
    mov r1, r4
    bl func_ov002_0226e71c
    cmp r0, #0x0
    orrne r0, r6, r7
    orrne r5, r5, r0
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_410:
    cmp r8, #0x0
    bne .L_69c
    and r1, r9, #0x1
    sub r0, r2, #0xf70
    mul r2, r1, r0
    ldr r0, _LIT12
    ldr r0, [r0, r2]
    cmp r0, #0x1
    bne .L_69c
    mov r0, r9
    bl func_ov002_021bc538
    cmp r0, #0x0
    cmpne sl, #0x0
    orrne r5, r5, r6
    b .L_69c
.L_44c:
    mov r0, r9
    bl func_ov002_021bbe70
    cmp r0, #0x0
    movne r6, #0x0
    b .L_69c
.L_460:
    mov r0, r9
    mov r1, r4
    bl func_ov002_021bb82c
    cmp r0, #0x0
    movne r6, #0x0
    b .L_69c
.L_478:
    mov r0, r4
    bl func_020317e4
    mov r1, r0
    mov r0, r9
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r6, #0x0
    b .L_69c
.L_498:
    ldr r1, _LIT13
    mov r0, r9
    bl func_ov002_021bbf20
    cmp r0, #0x0
    moveq r6, #0x0
    b .L_69c
.L_4b0:
    mov r6, #0x0
    b .L_69c
.L_4b8:
    cmp r8, #0x0
    bne .L_69c
    mov r0, r9
    bl func_ov002_021bc538
    cmp r0, #0x0
    cmpne sl, #0x0
    orrne r0, r6, r7
    orrne r5, r5, r0
    b .L_69c
.L_4dc:
    cmp sl, #0x0
    beq .L_69c
    cmp r8, #0x0
    bne .L_69c
    mov r0, r9
    mov r1, #0x0
    bl func_ov002_0226e9e0
    cmp r0, #0x0
    bne .L_520
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r9, r0
    bne .L_69c
    ldr r0, _LIT2
    mov r1, #0xb
    str r1, [r0, #0xd80]
    b .L_69c
.L_520:
    mov r0, r9
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021bca30
    cmp r0, #0x1
    orrge r0, r5, r6
    orrge r5, r0, r7
    cmp r5, #0x0
    ldreq r0, _LIT1
    ldreq r0, [r0, #0x4]
    cmpeq r9, r0
    bne .L_69c
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd80]
    b .L_69c
.L_560:
    and r1, r9, #0x1
    sub r0, r2, #0xf70
    mul r2, r1, r0
    ldr r0, _LIT12
    ldr r0, [r0, r2]
    cmp r0, #0x1
    movls r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r9
    mov r1, #0x0
    bl func_ov002_0226e9e0
    cmp r0, #0x0
    bne .L_5b4
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r9, r0
    ldreq r0, _LIT2
    moveq r1, #0xb
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5b4:
    mov r0, r9
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021bca30
    cmp r0, #0x1
    orrge r0, r6, r7
    orrge r5, r5, r0
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5d8:
    cmp r8, #0x0
    bne .L_69c
    mov r0, r9
    bl func_ov002_021bc538
    cmp r0, #0x0
    cmpne sl, #0x0
    orrne r5, r5, r6
    b .L_69c
.L_5f8:
    cmp sl, #0x0
    beq .L_69c
    cmp r8, #0x0
    bne .L_69c
    mov r0, r9
    mov r1, #0x0
    bl func_ov002_0226e9e0
    cmp r0, #0x0
    bne .L_63c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r9, r0
    bne .L_69c
    ldr r0, _LIT2
    mov r1, #0xb
    str r1, [r0, #0xd80]
    b .L_69c
.L_63c:
    mov r0, r9
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021bca30
    cmp r0, #0x1
    orrge r5, r5, r6
    cmp r5, #0x0
    ldreq r0, _LIT1
    ldreq r0, [r0, #0x4]
    cmpeq r9, r0
    bne .L_69c
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd80]
    b .L_69c
.L_678:
    cmp r8, #0x0
    bne .L_69c
    cmp sl, #0x0
    beq .L_69c
    mov r0, r9
    mov r1, r4
    bl func_ov002_0226e828
    cmp r0, #0x0
    orrne r5, r5, r6
.L_69c:
    cmp r8, #0x0
    bne .L_760
    cmp sl, #0x0
    beq .L_760
    mov r0, r4
    bl func_0202ea74
    cmp r0, #0x0
    beq .L_6d0
    mov r0, r9
    mov r1, fp
    bl func_ov002_0226e8bc
    cmp r0, #0x0
    orrne r5, r5, r6
.L_6d0:
    mov r0, r4
    bl func_0202effc
    cmp r0, #0x0
    beq .L_6f8
    mov r0, r9
    mov r1, fp
    bl func_ov002_0226e90c
    cmp r0, #0x0
    orrne r0, r6, r7
    orrne r5, r5, r0
.L_6f8:
    mov r0, r4
    bl func_0202b824
    cmp r0, #0x9
    bne .L_71c
    mov r0, r9
    mov r1, fp
    bl func_ov002_0226e98c
    cmp r0, #0x0
    orrne r5, r5, r6
.L_71c:
    cmp sl, #0x2
    beq .L_760
    mov r0, r4
    bl func_0202effc
    cmp r0, #0x0
    beq .L_760
    ldr r2, _LIT14
    mov r0, r9
    mov r3, fp
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_760
    mov r0, r9
    bl func_ov002_021bc538
    cmp r0, #0x0
    orrne r5, r5, r6
.L_760:
    cmp sl, #0x2
    moveq r0, r5
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r9
    mov r1, fp
    bl func_ov002_021c37e4
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_894
    b .L_7a0
    b .L_7a0
    b .L_7a0
    b .L_7a0
    b .L_7a0
    b .L_7e4
    b .L_7e4
.L_7a0:
    cmp r8, #0x0
    bne .L_93c
    mov r0, r9
    bl func_ov002_021bc538
    cmp r0, #0x0
    bne .L_7d8
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r9, r0
    bne .L_93c
    ldr r0, _LIT2
    mov r1, #0xb
    str r1, [r0, #0xd80]
    b .L_93c
.L_7d8:
    orr r0, r6, r7
    orr r5, r5, r0
    b .L_93c
.L_7e4:
    cmp r8, #0x1
    bne .L_804
    mov r0, r9
    bl func_ov002_021bc538
    cmp r0, #0x0
    orrne r0, r5, r6
    orrne r5, r0, r7
    bne .L_80c
.L_804:
    cmp r8, #0x0
    bne .L_93c
.L_80c:
    mov r0, r9
    mov r1, #0x0
    bl func_ov002_0226e9e0
    cmp r0, #0x0
    bne .L_840
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r9, r0
    bne .L_93c
    ldr r0, _LIT2
    mov r1, #0xb
    str r1, [r0, #0xd80]
    b .L_93c
.L_840:
    mov r0, r9
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021bca30
    cmp r0, #0x1
    orrge r5, r5, r6
    mov r0, r9
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_021bca30
    cmp r0, #0x1
    orrge r5, r5, r7
    cmp r5, #0x0
    ldreq r0, _LIT1
    ldreq r0, [r0, #0x4]
    cmpeq r9, r0
    bne .L_93c
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd80]
    b .L_93c
.L_894:
    cmp r8, #0x2
    bne .L_8b4
    mov r0, r9
    bl func_ov002_021bc538
    cmp r0, #0x0
    orrne r0, r5, r6
    orrne r5, r0, r7
    bne .L_8bc
.L_8b4:
    cmp r8, #0x0
    bne .L_93c
.L_8bc:
    mov r0, r9
    mov r1, #0x0
    bl func_ov002_0226e9e0
    cmp r0, #0x0
    bne .L_8f0
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r9, r0
    bne .L_93c
    ldr r0, _LIT2
    mov r1, #0xb
    str r1, [r0, #0xd80]
    b .L_93c
.L_8f0:
    mov r0, r9
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021bca30
    cmp r0, #0x2
    orrge r5, r5, r6
    mov r0, r9
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_021bca30
    cmp r0, #0x2
    orrge r5, r5, r7
    cmp r5, #0x0
    ldreq r0, _LIT1
    ldreq r0, [r0, #0x4]
    cmpeq r9, r0
    ldreq r0, _LIT2
    moveq r1, #0x0
    streq r1, [r0, #0xd80]
.L_93c:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d0170
_LIT1: .word data_ov002_022cd65c
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x0000135d
_LIT4: .word 0x0000197d
_LIT5: .word 0x000017d8
_LIT6: .word 0x0000164a
_LIT7: .word 0x000014db
_LIT8: .word 0x00001725
_LIT9: .word 0x00001986
_LIT10: .word 0x00001b2d
_LIT11: .word 0x00001b2f
_LIT12: .word data_ov002_022cf098
_LIT13: .word func_0202e3d8
_LIT14: .word 0x000019ad
