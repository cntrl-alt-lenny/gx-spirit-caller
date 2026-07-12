; func_ov002_021e788c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c0
        .extern data_ov002_022cf0c4
        .extern func_0202de48
        .extern func_0202df24
        .extern func_0202e810
        .extern func_0202ed3c
        .extern func_0202effc
        .extern func_ov002_021b2f34
        .extern func_ov002_021b8fc8
        .extern func_ov002_021b9dec
        .extern func_ov002_021ba024
        .extern func_ov002_021c194c
        .extern func_ov002_021c8390
        .extern func_ov002_021c8400
        .extern func_ov002_021c8870
        .extern func_ov002_021c92ec
        .extern func_ov002_021e7828
        .global func_ov002_021e788c
        .arm
func_ov002_021e788c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r8, r1
    ldr r1, _LIT0
    and r3, r8, #0x1
    mul sl, r3, r1
    mov r9, r0
    ldr r3, _LIT1
    mov r7, r2
    add r5, r3, sl
    mov r0, #0x14
    ldrh r3, [r9, #0x2]
    mul r6, r7, r0
    mov r2, r3, lsl #0x1a
    mov r4, r2, lsr #0x1b
    add r5, r5, #0x30
    ldr r2, [r5, r6]
    cmp r4, #0xa
    mov r2, r2, lsl #0x13
    mov fp, r2, lsr #0x13
    movhi r2, #0x0
    bhi .L_70
    mov r2, r3, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, _LIT2
    and r3, r3, #0x1
    mul r0, r4, r0
    mla r1, r3, r1, r2
    ldrh r2, [r0, r1]
.L_70:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8870
    mov r4, r0
    cmp r7, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r5, r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT3
    add r0, r0, sl
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9dec
    ldrh r2, [r9]
    ldr r3, _LIT4
    mov r5, r0
    cmp r2, r3
    bgt .L_384
    bge .L_bb8
    ldr r1, _LIT5
    cmp r2, r1
    bgt .L_26c
    bge .L_108c
    sub r3, r1, #0xaa
    cmp r2, r3
    bgt .L_1e8
    bge .L_f24
    ldr r3, _LIT6
    cmp r2, r3
    bgt .L_1b8
    bge .L_730
    sub r1, r3, #0x144
    cmp r2, r1
    bgt .L_1a8
    ldr r1, _LIT7
    subs r3, r2, r1
    addpl pc, pc, r3, lsl #0x2
    b .L_198
    b .L_f74
    b .L_1078
    b .L_ff4
    b .L_1094
    b .L_f14
    b .L_f14
    b .L_1050
    b .L_fe4
    b .L_1028
    b .L_fb4
    b .L_1094
    b .L_f34
    b .L_1094
    b .L_1094
    b .L_f94
    b .L_f64
    b .L_704
    b .L_1094
    b .L_fc4
    b .L_1094
    b .L_1094
    b .L_fd4
    b .L_f84
    b .L_1014
    b .L_f24
    b .L_f44
    b .L_fa4
    b .L_f54
.L_198:
    ldr r3, _LIT8
    cmp r2, r3
    beq .L_6bc
    b .L_1094
.L_1a8:
    sub r0, r3, #0x1
    cmp r2, r0
    beq .L_63c
    b .L_1094
.L_1b8:
    add r0, r3, #0x10
    cmp r2, r0
    bgt .L_1d8
    bge .L_1050
    add r0, r3, #0x2
    cmp r2, r0
    beq .L_103c
    b .L_1094
.L_1d8:
    add r0, r3, #0x54
    cmp r2, r0
    beq .L_108c
    b .L_1094
.L_1e8:
    sub r0, r1, #0x63
    cmp r2, r0
    bgt .L_228
    bge .L_1004
    sub r0, r1, #0x82
    cmp r2, r0
    bgt .L_218
    bge .L_103c
    sub r0, r1, #0x9d
    cmp r2, r0
    beq .L_744
    b .L_1094
.L_218:
    sub r0, r1, #0x81
    cmp r2, r0
    beq .L_1064
    b .L_1094
.L_228:
    sub r0, r1, #0x58
    cmp r2, r0
    bgt .L_248
    bge .L_654
    sub r0, r1, #0x62
    cmp r2, r0
    beq .L_1004
    b .L_1094
.L_248:
    sub r0, r1, #0x4e
    cmp r2, r0
    bgt .L_25c
    beq .L_66c
    b .L_1094
.L_25c:
    sub r0, r1, #0xa
    cmp r2, r0
    beq .L_108c
    b .L_1094
.L_26c:
    add r0, r1, #0x19c
    cmp r2, r0
    bgt .L_300
    bge .L_f74
    add r0, r1, #0xf7
    cmp r2, r0
    bgt .L_2bc
    bge .L_758
    add r0, r1, #0x86
    cmp r2, r0
    bgt .L_2ac
    bge .L_f74
    add r0, r1, #0x22
    cmp r2, r0
    beq .L_f74
    b .L_1094
.L_2ac:
    add r0, r1, #0xf6
    cmp r2, r0
    beq .L_66c
    b .L_1094
.L_2bc:
    ldr r1, _LIT9
    cmp r2, r1
    bgt .L_2dc
    bge .L_f74
    sub r0, r1, #0x9
    cmp r2, r0
    beq .L_784
    b .L_1094
.L_2dc:
    add r0, r1, #0x4e
    cmp r2, r0
    bgt .L_2f0
    beq .L_f34
    b .L_1094
.L_2f0:
    add r0, r1, #0x6b
    cmp r2, r0
    beq .L_798
    b .L_1094
.L_300:
    sub r0, r3, #0x22
    cmp r2, r0
    bgt .L_340
    bge .L_a44
    sub r0, r3, #0x37
    cmp r2, r0
    bgt .L_330
    bge .L_7d4
    add r0, r1, #0x1a4
    cmp r2, r0
    beq .L_63c
    b .L_1094
.L_330:
    add r0, r1, #0x240
    cmp r2, r0
    beq .L_9ec
    b .L_1094
.L_340:
    sub r0, r3, #0x6
    cmp r2, r0
    bgt .L_360
    bge .L_aa4
    sub r0, r3, #0x7
    cmp r2, r0
    beq .L_aa4
    b .L_1094
.L_360:
    sub r0, r3, #0x4
    cmp r2, r0
    bgt .L_374
    beq .L_b00
    b .L_1094
.L_374:
    sub r0, r3, #0x2
    cmp r2, r0
    beq .L_b5c
    b .L_1094
.L_384:
    add r1, r3, #0x2fc
    cmp r2, r1
    bgt .L_4a4
    bge .L_6a0
    add r1, r3, #0x184
    cmp r2, r1
    bgt .L_424
    bge .L_7f8
    add r1, r3, #0x4b
    cmp r2, r1
    bgt .L_3ec
    mov r0, r1
    cmp r2, r0
    bge .L_ccc
    add r0, r3, #0x2
    cmp r2, r0
    bgt .L_3dc
    bge .L_c70
    add r0, r3, #0x1
    cmp r2, r0
    beq .L_c14
    b .L_1094
.L_3dc:
    add r0, r3, #0x11
    cmp r2, r0
    beq .L_108c
    b .L_1094
.L_3ec:
    add r1, r3, #0xc5
    cmp r2, r1
    bgt .L_414
    mov r0, r1
    cmp r2, r0
    bge .L_66c
    add r0, r3, #0xbe
    cmp r2, r0
    beq .L_d70
    b .L_1094
.L_414:
    add r1, r3, #0xf7
    cmp r2, r1
    beq .L_7f0
    b .L_1094
.L_424:
    add r0, r3, #0x250
    cmp r2, r0
    bgt .L_464
    bge .L_de0
    ldr r0, _LIT10
    cmp r2, r0
    bgt .L_454
    bge .L_860
    sub r0, r0, #0x5a
    cmp r2, r0
    beq .L_814
    b .L_1094
.L_454:
    add r0, r0, #0x1
    cmp r2, r0
    beq .L_890
    b .L_1094
.L_464:
    cmp r2, #0x1880
    bgt .L_480
    bge .L_108c
    ldr r0, _LIT11
    cmp r2, r0
    beq .L_66c
    b .L_1094
.L_480:
    add r0, r3, #0x2ac
    cmp r2, r0
    bgt .L_494
    beq .L_108c
    b .L_1094
.L_494:
    ldr r1, _LIT12
    cmp r2, r1
    beq .L_8c0
    b .L_1094
.L_4a4:
    add r1, r3, #0x3e8
    cmp r2, r1
    bgt .L_53c
    mov r0, r1
    cmp r2, r0
    bge .L_108c
    ldr r3, _LIT13
    cmp r2, r3
    bgt .L_4fc
    bge .L_f74
    sub r0, r3, #0x24
    cmp r2, r0
    bgt .L_4ec
    bge .L_e5c
    sub r0, r3, #0x31
    cmp r2, r0
    beq .L_900
    b .L_1094
.L_4ec:
    sub r0, r3, #0x23
    cmp r2, r0
    beq .L_d14
    b .L_1094
.L_4fc:
    cmp r2, #0x1980
    bgt .L_518
    bge .L_914
    add r0, r3, #0x11
    cmp r2, r0
    beq .L_eb8
    b .L_1094
.L_518:
    add r0, r3, #0x4f
    cmp r2, r0
    bgt .L_52c
    beq .L_940
    b .L_1094
.L_52c:
    add r0, r3, #0x76
    cmp r2, r0
    beq .L_954
    b .L_1094
.L_53c:
    ldr r1, _LIT14
    cmp r2, r1
    bgt .L_57c
    bge .L_98c
    sub r0, r1, #0x91
    cmp r2, r0
    bgt .L_56c
    bge .L_968
    sub r0, r1, #0x92
    cmp r2, r0
    beq .L_108c
    b .L_1094
.L_56c:
    sub r0, r1, #0x51
    cmp r2, r0
    beq .L_108c
    b .L_1094
.L_57c:
    add r3, r1, #0x51
    cmp r2, r3
    bgt .L_59c
    bge .L_9c0
    add r1, r1, #0x35
    cmp r2, r1
    beq .L_9b8
    b .L_1094
.L_59c:
    add r0, r1, #0x53
    cmp r2, r0
    bgt .L_5b0
    beq .L_9c0
    b .L_1094
.L_5b0:
    add r0, r1, #0xb3
    cmp r2, r0
    beq .L_9cc
    b .L_1094
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c0
_LIT3: .word data_ov002_022cf0c4
_LIT4: .word 0x000015d5
_LIT5: .word 0x00001370
_LIT6: .word 0x00001232
_LIT7: .word 0x000010d3
_LIT8: .word 0x00000fee
_LIT9: .word 0x0000149f
_LIT10: .word 0x000017fa
_LIT11: .word 0x00001877
_LIT12: .word 0x000018d0
_LIT13: .word 0x0000193a
_LIT14: .word 0x00001a69
_LIT15: .word 0x00000fe5
_LIT16: .word 0x00000fc9
_LIT17: .word 0x00000514
_LIT18: .word 0x000005dc
_LIT19: .word 0x000015d8
_LIT20: .word 0x000015b0
_LIT21: .word 0x000015cd
_LIT22: .word 0x000015d0
_LIT23: .word 0x000015d2
_LIT24: .word 0x000015d4
_LIT25: .word 0x000015d7
_LIT26: .word 0x000015d6
_LIT27: .word 0x0000160a
_LIT28: .word 0x0000190b
_LIT29: .word 0x00001915
_LIT30: .word 0x00001947
.L_63c:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r8, r0, lsr #0x1f
    moveq r0, #0x1
    mvnne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_654:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r8, r0, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_66c:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    beq .L_698
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c194c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_698:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6a0:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6bc:
    add r0, r3, #0xce
    cmp r5, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    mov r1, r7
    mov r2, r3
    bl func_ov002_021b2f34
    cmp r0, #0x0
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_704:
    sub r1, r1, #0xef
    bl func_0202df24
    cmp r0, #0x0
    bne .L_720
    ldr r0, _LIT15
    cmp r5, r0
    bne .L_728
.L_720:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_728:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_730:
    sub r0, r1, #0x25c
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_744:
    sub r0, r1, #0xda
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_758:
    ldr r0, _LIT16
    cmp r5, r0
    subne r0, r1, #0xd2
    cmpne r5, r0
    addne r0, r1, #0xbd
    cmpne r5, r0
    bne .L_77c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_77c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_784:
    sub r0, r1, #0x8b
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_798:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_7cc
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8390
    ldr r1, _LIT17
    cmp r0, r1
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7cc:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7d4:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8390
    cmp r0, #0x3e8
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7f0:
    bl func_0202e810
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7f8:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8400
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_814:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b8fc8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8400
    cmp r0, #0x3
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_860:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8400
    cmp r0, #0x6
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, fp
    bl func_0202de48
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_890:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8400
    cmp r0, #0x6
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, fp
    bl func_0202de48
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8c0:
    sub r0, r1, #0x76
    cmp r5, r0
    subne r0, r1, #0x18
    cmpne r5, r0
    subne r0, r1, #0x17
    cmpne r5, r0
    bne .L_8f8
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8f8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_900:
    sub r0, r3, #0x91
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_914:
    cmp r4, #0xf
    bne .L_938
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8390
    ldr r1, _LIT18
    cmp r0, r1
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_938:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_940:
    mov r0, r8
    mov r1, r7
    sub r2, r3, #0x41
    bl func_ov002_021ba024
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_954:
    add r0, r3, #0x14
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_968:
    rsb r0, r1, #0x31c0
    cmp r5, r0
    subne r0, r1, #0x14c
    cmpne r5, r0
    bne .L_984
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_984:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_98c:
    bl func_0202ed3c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9b8:
    bl func_0202ed3c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9c0:
    mov r0, r5
    bl func_0202effc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9cc:
    cmp r4, #0xf
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021c92ec
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9ec:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r5, #0x1580
    beq .L_a28
    ldr r0, _LIT19
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a28:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a44:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r5, #0x1580
    ldrne r0, _LIT20
    cmpne r5, r0
    beq .L_a88
    add r0, r0, #0x28
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a88:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_aa4:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT21
    cmp r5, r0
    beq .L_ae4
    add r0, r0, #0xb
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ae4:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b00:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT22
    cmp r5, r0
    beq .L_b40
    add r0, r0, #0x8
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b40:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b5c:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT23
    cmp r5, r0
    beq .L_b9c
    add r0, r0, #0x6
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b9c:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bb8:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT24
    cmp r5, r0
    beq .L_bf8
    add r0, r0, #0x4
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bf8:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c14:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT25
    cmp r5, r0
    beq .L_c54
    add r0, r0, #0x1
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c54:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c70:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT26
    cmp r5, r0
    beq .L_cb0
    add r0, r0, #0x2
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cb0:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ccc:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT27
    cmp r5, r0
    beq .L_d0c
    sub r0, r0, #0x32
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d0c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d14:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT28
    cmp r5, r0
    beq .L_d54
    ldr r0, _LIT19
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d54:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d70:
    ldr r1, _LIT1
    ldrh r0, [r9, #0x4]
    add r1, r1, sl
    add r1, r1, #0x30
    ldr r1, [r1, r6]
    mov r2, r0, lsl #0x11
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_de0:
    ldr r1, _LIT1
    ldrh r0, [r9, #0x4]
    add r1, r1, sl
    add r1, r1, #0x30
    ldr r1, [r1, r6]
    mov r2, r0, lsl #0x11
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r4, #0x7
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e5c:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT29
    cmp r5, r0
    beq .L_e9c
    ldr r0, _LIT19
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e9c:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_eb8:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7828
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT30
    cmp r5, r0
    beq .L_ef8
    ldr r0, _LIT19
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ef8:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f14:
    cmp r4, #0xa
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f24:
    cmp r4, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f34:
    cmp r4, #0x11
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f44:
    cmp r4, #0x9
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f54:
    cmp r4, #0xe
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f64:
    cmp r4, #0x13
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f74:
    cmp r4, #0xf
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f84:
    cmp r4, #0x12
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f94:
    cmp r4, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fa4:
    cmp r4, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fb4:
    cmp r4, #0xd
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fc4:
    cmp r4, #0xc
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fd4:
    cmp r4, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fe4:
    cmp r4, #0xb
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ff4:
    cmp r4, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1004:
    cmp r4, #0x7
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1014:
    mov r0, r8
    mov r1, r7
    mov r2, #0x5
    bl func_ov002_021c92ec
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1028:
    mov r0, r8
    mov r1, r7
    mov r2, #0x3
    bl func_ov002_021c92ec
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_103c:
    mov r0, r8
    mov r1, r7
    mov r2, #0x4
    bl func_ov002_021c92ec
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1050:
    mov r0, r8
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021c92ec
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1064:
    mov r0, r8
    mov r1, r7
    mov r2, #0x6
    bl func_ov002_021c92ec
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1078:
    mov r0, r8
    mov r1, r7
    mov r2, #0x2
    bl func_ov002_021c92ec
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_108c:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1094:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
