; func_ov002_021e797c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a0
        .extern data_ov002_022cf1a4
        .extern func_0202de9c
        .extern func_0202df78
        .extern func_0202e864
        .extern func_0202ed90
        .extern func_0202f050
        .extern func_ov002_021b3014
        .extern func_ov002_021b90a8
        .extern func_ov002_021b9ecc
        .extern func_ov002_021ba104
        .extern func_ov002_021c1a2c
        .extern func_ov002_021c8470
        .extern func_ov002_021c84e0
        .extern func_ov002_021c8950
        .extern func_ov002_021c93cc
        .extern func_ov002_021e7918
        .global func_ov002_021e797c
        .arm
func_ov002_021e797c:
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
    bhi .L_184
    mov r2, r3, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, _LIT2
    and r3, r3, #0x1
    mul r0, r4, r0
    mla r1, r3, r1, r2
    ldrh r2, [r0, r1]
.L_184:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8950
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
    bl func_ov002_021b9ecc
    ldrh r2, [r9]
    ldr r3, _LIT4
    mov r5, r0
    cmp r2, r3
    bgt .L_498
    bge .L_ccc
    ldr r1, _LIT5
    cmp r2, r1
    bgt .L_380
    bge .L_11a0
    sub r3, r1, #0xaa
    cmp r2, r3
    bgt .L_2fc
    bge .L_1038
    ldr r3, _LIT6
    cmp r2, r3
    bgt .L_2cc
    bge .L_844
    sub r1, r3, #0x144
    cmp r2, r1
    bgt .L_2bc
    ldr r1, _LIT7
    subs r3, r2, r1
    addpl pc, pc, r3, lsl #0x2
    b .L_2ac
    b .L_1088
    b .L_118c
    b .L_1108
    b .L_11a8
    b .L_1028
    b .L_1028
    b .L_1164
    b .L_10f8
    b .L_113c
    b .L_10c8
    b .L_11a8
    b .L_1048
    b .L_11a8
    b .L_11a8
    b .L_10a8
    b .L_1078
    b .L_818
    b .L_11a8
    b .L_10d8
    b .L_11a8
    b .L_11a8
    b .L_10e8
    b .L_1098
    b .L_1128
    b .L_1038
    b .L_1058
    b .L_10b8
    b .L_1068
.L_2ac:
    ldr r3, _LIT8
    cmp r2, r3
    beq .L_7d0
    b .L_11a8
.L_2bc:
    sub r0, r3, #0x1
    cmp r2, r0
    beq .L_750
    b .L_11a8
.L_2cc:
    add r0, r3, #0x10
    cmp r2, r0
    bgt .L_2ec
    bge .L_1164
    add r0, r3, #0x2
    cmp r2, r0
    beq .L_1150
    b .L_11a8
.L_2ec:
    add r0, r3, #0x54
    cmp r2, r0
    beq .L_11a0
    b .L_11a8
.L_2fc:
    sub r0, r1, #0x63
    cmp r2, r0
    bgt .L_33c
    bge .L_1118
    sub r0, r1, #0x82
    cmp r2, r0
    bgt .L_32c
    bge .L_1150
    sub r0, r1, #0x9d
    cmp r2, r0
    beq .L_858
    b .L_11a8
.L_32c:
    sub r0, r1, #0x81
    cmp r2, r0
    beq .L_1178
    b .L_11a8
.L_33c:
    sub r0, r1, #0x58
    cmp r2, r0
    bgt .L_35c
    bge .L_768
    sub r0, r1, #0x62
    cmp r2, r0
    beq .L_1118
    b .L_11a8
.L_35c:
    sub r0, r1, #0x4e
    cmp r2, r0
    bgt .L_370
    beq .L_780
    b .L_11a8
.L_370:
    sub r0, r1, #0xa
    cmp r2, r0
    beq .L_11a0
    b .L_11a8
.L_380:
    add r0, r1, #0x19c
    cmp r2, r0
    bgt .L_414
    bge .L_1088
    add r0, r1, #0xf7
    cmp r2, r0
    bgt .L_3d0
    bge .L_86c
    add r0, r1, #0x86
    cmp r2, r0
    bgt .L_3c0
    bge .L_1088
    add r0, r1, #0x22
    cmp r2, r0
    beq .L_1088
    b .L_11a8
.L_3c0:
    add r0, r1, #0xf6
    cmp r2, r0
    beq .L_780
    b .L_11a8
.L_3d0:
    ldr r1, _LIT9
    cmp r2, r1
    bgt .L_3f0
    bge .L_1088
    sub r0, r1, #0x9
    cmp r2, r0
    beq .L_898
    b .L_11a8
.L_3f0:
    add r0, r1, #0x4e
    cmp r2, r0
    bgt .L_404
    beq .L_1048
    b .L_11a8
.L_404:
    add r0, r1, #0x6b
    cmp r2, r0
    beq .L_8ac
    b .L_11a8
.L_414:
    sub r0, r3, #0x22
    cmp r2, r0
    bgt .L_454
    bge .L_b58
    sub r0, r3, #0x37
    cmp r2, r0
    bgt .L_444
    bge .L_8e8
    add r0, r1, #0x1a4
    cmp r2, r0
    beq .L_750
    b .L_11a8
.L_444:
    add r0, r1, #0x240
    cmp r2, r0
    beq .L_b00
    b .L_11a8
.L_454:
    sub r0, r3, #0x6
    cmp r2, r0
    bgt .L_474
    bge .L_bb8
    sub r0, r3, #0x7
    cmp r2, r0
    beq .L_bb8
    b .L_11a8
.L_474:
    sub r0, r3, #0x4
    cmp r2, r0
    bgt .L_488
    beq .L_c14
    b .L_11a8
.L_488:
    sub r0, r3, #0x2
    cmp r2, r0
    beq .L_c70
    b .L_11a8
.L_498:
    add r1, r3, #0x2fc
    cmp r2, r1
    bgt .L_5b8
    bge .L_7b4
    add r1, r3, #0x184
    cmp r2, r1
    bgt .L_538
    bge .L_90c
    add r1, r3, #0x4b
    cmp r2, r1
    bgt .L_500
    mov r0, r1
    cmp r2, r0
    bge .L_de0
    add r0, r3, #0x2
    cmp r2, r0
    bgt .L_4f0
    bge .L_d84
    add r0, r3, #0x1
    cmp r2, r0
    beq .L_d28
    b .L_11a8
.L_4f0:
    add r0, r3, #0x11
    cmp r2, r0
    beq .L_11a0
    b .L_11a8
.L_500:
    add r1, r3, #0xc5
    cmp r2, r1
    bgt .L_528
    mov r0, r1
    cmp r2, r0
    bge .L_780
    add r0, r3, #0xbe
    cmp r2, r0
    beq .L_e84
    b .L_11a8
.L_528:
    add r1, r3, #0xf7
    cmp r2, r1
    beq .L_904
    b .L_11a8
.L_538:
    add r0, r3, #0x250
    cmp r2, r0
    bgt .L_578
    bge .L_ef4
    ldr r0, _LIT10
    cmp r2, r0
    bgt .L_568
    bge .L_974
    sub r0, r0, #0x5a
    cmp r2, r0
    beq .L_928
    b .L_11a8
.L_568:
    add r0, r0, #0x1
    cmp r2, r0
    beq .L_9a4
    b .L_11a8
.L_578:
    cmp r2, #0x1880
    bgt .L_594
    bge .L_11a0
    ldr r0, _LIT11
    cmp r2, r0
    beq .L_780
    b .L_11a8
.L_594:
    add r0, r3, #0x2ac
    cmp r2, r0
    bgt .L_5a8
    beq .L_11a0
    b .L_11a8
.L_5a8:
    ldr r1, _LIT12
    cmp r2, r1
    beq .L_9d4
    b .L_11a8
.L_5b8:
    add r1, r3, #0x3e8
    cmp r2, r1
    bgt .L_650
    mov r0, r1
    cmp r2, r0
    bge .L_11a0
    ldr r3, _LIT13
    cmp r2, r3
    bgt .L_610
    bge .L_1088
    sub r0, r3, #0x24
    cmp r2, r0
    bgt .L_600
    bge .L_f70
    sub r0, r3, #0x31
    cmp r2, r0
    beq .L_a14
    b .L_11a8
.L_600:
    sub r0, r3, #0x23
    cmp r2, r0
    beq .L_e28
    b .L_11a8
.L_610:
    cmp r2, #0x1980
    bgt .L_62c
    bge .L_a28
    add r0, r3, #0x11
    cmp r2, r0
    beq .L_fcc
    b .L_11a8
.L_62c:
    add r0, r3, #0x4f
    cmp r2, r0
    bgt .L_640
    beq .L_a54
    b .L_11a8
.L_640:
    add r0, r3, #0x76
    cmp r2, r0
    beq .L_a68
    b .L_11a8
.L_650:
    ldr r1, _LIT14
    cmp r2, r1
    bgt .L_690
    bge .L_aa0
    sub r0, r1, #0x91
    cmp r2, r0
    bgt .L_680
    bge .L_a7c
    sub r0, r1, #0x92
    cmp r2, r0
    beq .L_11a0
    b .L_11a8
.L_680:
    sub r0, r1, #0x51
    cmp r2, r0
    beq .L_11a0
    b .L_11a8
.L_690:
    add r3, r1, #0x51
    cmp r2, r3
    bgt .L_6b0
    bge .L_ad4
    add r1, r1, #0x35
    cmp r2, r1
    beq .L_acc
    b .L_11a8
.L_6b0:
    add r0, r1, #0x53
    cmp r2, r0
    bgt .L_6c4
    beq .L_ad4
    b .L_11a8
.L_6c4:
    add r0, r1, #0xb3
    cmp r2, r0
    beq .L_ae0
    b .L_11a8
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a0
_LIT3: .word data_ov002_022cf1a4
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
.L_750:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r8, r0, lsr #0x1f
    moveq r0, #0x1
    mvnne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_768:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r8, r0, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_780:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    beq .L_7ac
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7ac:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7b4:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7d0:
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
    bl func_ov002_021b3014
    cmp r0, #0x0
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_818:
    sub r1, r1, #0xef
    bl func_0202df78
    cmp r0, #0x0
    bne .L_834
    ldr r0, _LIT15
    cmp r5, r0
    bne .L_83c
.L_834:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_83c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_844:
    sub r0, r1, #0x25c
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_858:
    sub r0, r1, #0xda
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_86c:
    ldr r0, _LIT16
    cmp r5, r0
    subne r0, r1, #0xd2
    cmpne r5, r0
    addne r0, r1, #0xbd
    cmpne r5, r0
    bne .L_890
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_890:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_898:
    sub r0, r1, #0x8b
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8ac:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_8e0
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8470
    ldr r1, _LIT17
    cmp r0, r1
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8e0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8e8:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8470
    cmp r0, #0x3e8
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_904:
    bl func_0202e864
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_90c:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c84e0
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_928:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b90a8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c84e0
    cmp r0, #0x3
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_974:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c84e0
    cmp r0, #0x6
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, fp
    bl func_0202de9c
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9a4:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c84e0
    cmp r0, #0x6
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, fp
    bl func_0202de9c
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9d4:
    sub r0, r1, #0x76
    cmp r5, r0
    subne r0, r1, #0x18
    cmpne r5, r0
    subne r0, r1, #0x17
    cmpne r5, r0
    bne .L_a0c
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a0c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a14:
    sub r0, r3, #0x91
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a28:
    cmp r4, #0xf
    bne .L_a4c
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8470
    ldr r1, _LIT18
    cmp r0, r1
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a4c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a54:
    mov r0, r8
    mov r1, r7
    sub r2, r3, #0x41
    bl func_ov002_021ba104
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a68:
    add r0, r3, #0x14
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a7c:
    rsb r0, r1, #0x31c0
    cmp r5, r0
    subne r0, r1, #0x14c
    cmpne r5, r0
    bne .L_a98
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a98:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_aa0:
    bl func_0202ed90
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
.L_acc:
    bl func_0202ed90
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ad4:
    mov r0, r5
    bl func_0202f050
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ae0:
    cmp r4, #0xf
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021c93cc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b00:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7918
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r5, #0x1580
    beq .L_b3c
    ldr r0, _LIT19
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b3c:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b58:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7918
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r5, #0x1580
    ldrne r0, _LIT20
    cmpne r5, r0
    beq .L_b9c
    add r0, r0, #0x28
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
    bl func_ov002_021e7918
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT21
    cmp r5, r0
    beq .L_bf8
    add r0, r0, #0xb
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
    bl func_ov002_021e7918
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT22
    cmp r5, r0
    beq .L_c54
    add r0, r0, #0x8
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
    bl func_ov002_021e7918
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT23
    cmp r5, r0
    beq .L_cb0
    add r0, r0, #0x6
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
    bl func_ov002_021e7918
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT24
    cmp r5, r0
    beq .L_d0c
    add r0, r0, #0x4
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d0c:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d28:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7918
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT25
    cmp r5, r0
    beq .L_d68
    add r0, r0, #0x1
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d68:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d84:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7918
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT26
    cmp r5, r0
    beq .L_dc4
    add r0, r0, #0x2
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_dc4:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_de0:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7918
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT27
    cmp r5, r0
    beq .L_e20
    sub r0, r0, #0x32
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e20:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e28:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7918
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT28
    cmp r5, r0
    beq .L_e68
    ldr r0, _LIT19
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e68:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e84:
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
    bl func_ov002_021e7918
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
.L_ef4:
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
    bl func_ov002_021e7918
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
.L_f70:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7918
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT29
    cmp r5, r0
    beq .L_fb0
    ldr r0, _LIT19
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fb0:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fcc:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021e7918
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT30
    cmp r5, r0
    beq .L_100c
    ldr r0, _LIT19
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_100c:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mvnne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1028:
    cmp r4, #0xa
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1038:
    cmp r4, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1048:
    cmp r4, #0x11
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1058:
    cmp r4, #0x9
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1068:
    cmp r4, #0xe
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1078:
    cmp r4, #0x13
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1088:
    cmp r4, #0xf
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1098:
    cmp r4, #0x12
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10a8:
    cmp r4, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10b8:
    cmp r4, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10c8:
    cmp r4, #0xd
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10d8:
    cmp r4, #0xc
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10e8:
    cmp r4, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10f8:
    cmp r4, #0xb
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1108:
    cmp r4, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1118:
    cmp r4, #0x7
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1128:
    mov r0, r8
    mov r1, r7
    mov r2, #0x5
    bl func_ov002_021c93cc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_113c:
    mov r0, r8
    mov r1, r7
    mov r2, #0x3
    bl func_ov002_021c93cc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1150:
    mov r0, r8
    mov r1, r7
    mov r2, #0x4
    bl func_ov002_021c93cc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1164:
    mov r0, r8
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021c93cc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1178:
    mov r0, r8
    mov r1, r7
    mov r2, #0x6
    bl func_ov002_021c93cc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_118c:
    mov r0, r8
    mov r1, r7
    mov r2, #0x2
    bl func_ov002_021c93cc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11a0:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11a8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
