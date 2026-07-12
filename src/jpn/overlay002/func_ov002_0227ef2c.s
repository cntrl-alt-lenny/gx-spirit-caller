; func_ov002_0227ef2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022cdb98
        .extern data_ov002_022cdba8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_0202b86c
        .extern func_0202b89c
        .extern func_0202b8cc
        .extern func_0202b95c
        .extern func_0202e1e0
        .extern func_ov002_021afff0
        .extern func_ov002_021b3dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bbdcc
        .extern func_ov002_021bbe70
        .extern func_ov002_021bc14c
        .extern func_ov002_021bd284
        .extern func_ov002_021be1f8
        .extern func_ov002_021c2f28
        .extern func_ov002_021c3a04
        .extern func_ov002_021c3b70
        .extern func_ov002_0227ae40
        .extern func_ov002_0227e65c
        .extern func_ov002_0227e674
        .extern func_ov002_0227e6d8
        .extern func_ov002_0227e77c
        .extern func_ov002_0227e8c4
        .extern func_ov002_0227eba4
        .extern func_ov002_0227ecb4
        .extern func_ov002_0227ed24
        .extern func_ov002_02281494
        .extern func_ov002_02281810
        .extern func_ov002_02281884
        .global func_ov002_0227ef2c
        .arm
func_ov002_0227ef2c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    ldr r2, _LIT0
    mov r8, r0
    ldr r5, [r2, #0xc]
    mov r4, r1
    cmp r5, #0x0
    addeq sp, sp, #0x34
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT1
    bl func_ov002_02281810
    cmp r0, #0x0
    beq .L_2a8
    ldr r1, _LIT2
    mov r0, r8
    bl func_ov002_02281810
    cmp r0, #0x0
    beq .L_c4
    ldr r0, _LIT3
    cmp r4, r0
    addne r0, r0, #0x2d
    cmpne r4, r0
    bne .L_c4
    ldr r0, _LIT4
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT5
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT6
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c4:
    ldr r1, _LIT8
    cmp r4, r1
    bgt .L_12c
    bge .L_234
    sub r0, r1, #0x51
    cmp r4, r0
    bgt .L_108
    bge .L_234
    ldr r0, _LIT9
    cmp r4, r0
    bgt .L_f8
    beq .L_180
    b .L_2a8
.L_f8:
    ldr r0, _LIT10
    cmp r4, r0
    beq .L_180
    b .L_2a8
.L_108:
    sub r0, r1, #0x26
    cmp r4, r0
    bgt .L_11c
    beq .L_268
    b .L_2a8
.L_11c:
    sub r0, r1, #0xc
    cmp r4, r0
    beq .L_1e8
    b .L_2a8
.L_12c:
    add r0, r1, #0x2b
    cmp r4, r0
    bgt .L_160
    bge .L_234
    add r0, r1, #0x7
    cmp r4, r0
    bgt .L_150
    beq .L_268
    b .L_2a8
.L_150:
    add r0, r1, #0x1e
    cmp r4, r0
    beq .L_180
    b .L_2a8
.L_160:
    add r0, r1, #0x42
    cmp r4, r0
    bgt .L_174
    beq .L_234
    b .L_2a8
.L_174:
    ldr r0, _LIT11
    cmp r4, r0
    bne .L_2a8
.L_180:
    ldr r0, _LIT4
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT5
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT6
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    bl func_ov002_0227e674
    cmp r0, #0x0
    blt .L_2a8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e8:
    ldr r0, _LIT5
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT6
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    bl func_ov002_0227eba4
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_234:
    ldr r1, _LIT9
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT10
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    blt .L_2a8
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_268:
    ldr r1, _LIT9
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT10
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    bl func_ov002_0227eba4
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2a8:
    ldr r2, _LIT12
    cmp r4, r2
    bgt .L_4b4
    bge .L_10fc
    ldr r1, _LIT13
    cmp r4, r1
    bgt .L_3e8
    bge .L_6a8
    sub r0, r1, #0x93
    cmp r4, r0
    bgt .L_330
    bge .L_6a8
    ldr r2, _LIT14
    cmp r4, r2
    bgt .L_30c
    bge .L_a14
    ldr r0, _LIT9
    cmp r4, r0
    bgt .L_2fc
    beq .L_68c
    b .L_1340
.L_2fc:
    add r0, r0, #0x36
    cmp r4, r0
    beq .L_7b0
    b .L_1340
.L_30c:
    add r0, r2, #0x66
    cmp r4, r0
    bgt .L_320
    beq .L_c08
    b .L_1340
.L_320:
    add r0, r2, #0x6e
    cmp r4, r0
    beq .L_7b0
    b .L_1340
.L_330:
    sub r0, r1, #0x1b
    cmp r4, r0
    bgt .L_3b8
    bge .L_10fc
    sub r0, r1, #0x84
    cmp r4, r0
    bgt .L_354
    beq .L_8b8
    b .L_1340
.L_354:
    sub r0, r1, #0x4e
    sub r0, r4, r0
    cmp r0, #0x13
    addls pc, pc, r0, lsl #0x2
    b .L_1340
    b .L_a40
    b .L_1340
    b .L_1340
    b .L_1340
    b .L_fa8
    b .L_1340
    b .L_fa8
    b .L_1340
    b .L_1340
    b .L_1340
    b .L_1340
    b .L_1340
    b .L_9bc
    b .L_fa8
    b .L_1340
    b .L_fa8
    b .L_fa8
    b .L_1340
    b .L_1340
    b .L_fa8
.L_3b8:
    ldr r0, _LIT15
    cmp r4, r0
    bgt .L_3d8
    bge .L_6a8
    sub r0, r0, #0x1
    cmp r4, r0
    beq .L_6f0
    b .L_1340
.L_3d8:
    add r0, r0, #0x13
    cmp r4, r0
    beq .L_754
    b .L_1340
.L_3e8:
    sub r0, r2, #0x6a
    cmp r4, r0
    bgt .L_450
    bge .L_82c
    add r0, r1, #0xe9
    cmp r4, r0
    bgt .L_42c
    bge .L_82c
    add r0, r1, #0x70
    cmp r4, r0
    bgt .L_41c
    beq .L_a40
    b .L_1340
.L_41c:
    add r0, r1, #0xc8
    cmp r4, r0
    beq .L_ce4
    b .L_1340
.L_42c:
    add r0, r1, #0xf7
    cmp r4, r0
    bgt .L_440
    beq .L_dec
    b .L_1340
.L_440:
    rsb r0, r1, #0x2800
    cmp r4, r0
    beq .L_82c
    b .L_1340
.L_450:
    sub r0, r2, #0x67
    cmp r4, r0
    bgt .L_484
    bge .L_82c
    add r0, r1, #0x108
    cmp r4, r0
    bgt .L_474
    beq .L_82c
    b .L_1340
.L_474:
    sub r0, r2, #0x68
    cmp r4, r0
    beq .L_82c
    b .L_1340
.L_484:
    sub r0, r2, #0x1e
    cmp r4, r0
    bgt .L_4a4
    bge .L_1220
    sub r0, r2, #0x5e
    cmp r4, r0
    beq .L_82c
    b .L_1340
.L_4a4:
    sub r0, r2, #0x1c
    cmp r4, r0
    beq .L_1220
    b .L_1340
.L_4b4:
    ldr r0, _LIT16
    cmp r4, r0
    bgt .L_5a8
    bge .L_fa8
    add r1, r2, #0xa2
    cmp r4, r1
    bgt .L_53c
    bge .L_cb0
    add r1, r2, #0x41
    cmp r4, r1
    bgt .L_510
    bge .L_fa8
    sub r1, r0, #0x2d0
    cmp r4, r1
    bgt .L_500
    sub r0, r0, #0x2d0
    cmp r4, r0
    beq .L_754
    b .L_1340
.L_500:
    add r0, r2, #0x34
    cmp r4, r0
    beq .L_10fc
    b .L_1340
.L_510:
    sub r1, r0, #0x2b4
    cmp r4, r1
    bgt .L_52c
    sub r0, r0, #0x2b4
    cmp r4, r0
    beq .L_10fc
    b .L_1340
.L_52c:
    add r0, r2, #0x74
    cmp r4, r0
    beq .L_d8c
    b .L_1340
.L_53c:
    ldr r2, _LIT17
    cmp r4, r2
    bgt .L_570
    bge .L_7b0
    sub r0, r2, #0x9c
    cmp r4, r0
    bgt .L_560
    beq .L_ce4
    b .L_1340
.L_560:
    sub r0, r2, #0x26
    cmp r4, r0
    beq .L_f38
    b .L_1340
.L_570:
    add r1, r2, #0xd4
    cmp r4, r1
    bgt .L_598
    mov r0, r1
    cmp r4, r0
    bge .L_a64
    add r0, r2, #0x33
    cmp r4, r0
    beq .L_10fc
    b .L_1340
.L_598:
    sub r0, r0, #0x9f
    cmp r4, r0
    beq .L_10fc
    b .L_1340
.L_5a8:
    ldr r1, _LIT18
    cmp r4, r1
    bgt .L_62c
    bge .L_1220
    sub r3, r1, #0xb2
    cmp r4, r3
    bgt .L_5fc
    mov r2, r3
    cmp r4, r2
    bge .L_1220
    add r2, r0, #0x1
    cmp r4, r2
    bgt .L_5ec
    add r0, r0, #0x1
    cmp r4, r0
    beq .L_fa8
    b .L_1340
.L_5ec:
    sub r0, r1, #0xe6
    cmp r4, r0
    beq .L_116c
    b .L_1340
.L_5fc:
    sub r0, r1, #0x1d
    cmp r4, r0
    bgt .L_61c
    bge .L_f90
    sub r0, r1, #0x2b
    cmp r4, r0
    beq .L_f08
    b .L_1340
.L_61c:
    sub r0, r1, #0x3
    cmp r4, r0
    beq .L_fa8
    b .L_1340
.L_62c:
    ldr r1, _LIT19
    cmp r4, r1
    bgt .L_660
    bge .L_1220
    sub r0, r1, #0xf1
    cmp r4, r0
    bgt .L_650
    beq .L_f64
    b .L_1340
.L_650:
    sub r0, r1, #0xd7
    cmp r4, r0
    beq .L_fa8
    b .L_1340
.L_660:
    add r0, r1, #0x6f
    cmp r4, r0
    bgt .L_680
    bge .L_1304
    add r0, r1, #0x6e
    cmp r4, r0
    beq .L_1304
    b .L_1340
.L_680:
    cmp r4, #0x1a80
    beq .L_1220
    b .L_1340
.L_68c:
    ldr r1, _LIT20
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6a8:
    ldr r0, _LIT21
    ldr r1, [r0, #0xcec]
    cmp r1, r8
    bne .L_1340
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x3
    bhi .L_1340
    rsb r0, r8, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x0
    bne .L_1340
    ldr r1, _LIT22
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6f0:
    ldr r1, _LIT23
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT9
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT10
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT24
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_754:
    subs r6, r5, #0x1
    bmi .L_7b0
    ldr r0, _LIT25
    ldr r9, _LIT26
    add r7, r0, r6, lsl #0x2
.L_768:
    mov r0, r6
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_7a4
    ldr r1, [r7]
    ldr r2, [r9, #0x10]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    addeq sp, sp, #0x34
    moveq r0, r6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7a4:
    sub r7, r7, #0x4
    subs r6, r6, #0x1
    bpl .L_768
.L_7b0:
    cmp r5, #0x0
    mov r9, #0x0
    ble .L_1340
    ldr r7, _LIT25
    mov r6, r9
.L_7c4:
    mov r0, r9
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_818
    ldr r0, [r7]
    mov r1, r6
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_02281494
    cmp r0, #0x0
    addne sp, sp, #0x34
    movne r0, r9
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b95c
    cmp r0, #0x3
    addlt sp, sp, #0x34
    movlt r0, r9
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_818:
    add r9, r9, #0x1
    cmp r9, r5
    add r7, r7, #0x4
    blt .L_7c4
    b .L_1340
.L_82c:
    mvn r6, #0x0
    mov r7, r6
    cmp r5, #0x0
    mov r4, #0x0
    ble .L_8ac
    ldr r8, _LIT25
.L_844:
    mov r0, r4
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_89c
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202b89c
    mov r9, r0
    mov r0, sl
    bl func_0202b8cc
    cmp r9, r0
    mov r0, sl
    ble .L_888
    bl func_0202b89c
    b .L_88c
.L_888:
    bl func_0202b8cc
.L_88c:
    cmp r6, #0x0
    cmpge r0, r6
    movlt r6, r0
    movlt r7, r4
.L_89c:
    add r4, r4, #0x1
    cmp r4, r5
    add r8, r8, #0x4
    blt .L_844
.L_8ac:
    add sp, sp, #0x34
    mov r0, r7
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8b8:
    mov r0, r8
    add r1, r2, #0x1dc
    bl func_ov002_02281810
    cmp r0, #0x0
    bne .L_908
    ldr r1, _LIT27
    mov r0, r8
    bl func_ov002_02281810
    cmp r0, #0x0
    bne .L_908
    ldr r1, _LIT28
    mov r0, r8
    bl func_ov002_02281810
    cmp r0, #0x0
    bne .L_908
    ldr r1, _LIT29
    mov r0, r8
    bl func_ov002_02281810
    cmp r0, #0x0
    beq .L_960
.L_908:
    cmp r5, #0x0
    mov r7, #0x0
    ble .L_960
    ldr r6, _LIT25
.L_918:
    mov r0, r7
    bl func_ov002_0227e65c
    cmp r0, #0x0
    ldreq r0, [r6]
    moveq r1, r0, lsl #0x12
    cmpeq r8, r1, lsr #0x1f
    bne .L_950
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    addne sp, sp, #0x34
    movne r0, r7
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_950:
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    blt .L_918
.L_960:
    cmp r5, #0x0
    mov r9, #0x0
    ble .L_9a4
    ldr r6, _LIT25
    rsb r7, r8, #0x1
.L_974:
    mov r0, r9
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_994
    ldr r0, [r6]
    mov r0, r0, lsl #0x12
    cmp r7, r0, lsr #0x1f
    bne .L_9a4
.L_994:
    add r9, r9, #0x1
    cmp r9, r5
    add r6, r6, #0x4
    blt .L_974
.L_9a4:
    mov r5, r9
    cmp r9, #0x0
    bne .L_1340
    add sp, sp, #0x34
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9bc:
    sub r0, r1, #0x20
    bl func_ov002_021baf88
    cmp r0, #0x0
    bne .L_1340
    cmp r5, #0x0
    mov r7, #0x0
    ble .L_1340
    ldr r6, _LIT25
.L_9dc:
    mov r0, r7
    bl func_ov002_0227e65c
    cmp r0, #0x0
    ldreq r0, [r6]
    moveq r0, r0, lsl #0x13
    cmpeq r4, r0, lsr #0x13
    addeq sp, sp, #0x34
    moveq r0, r7
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    blt .L_9dc
    b .L_1340
.L_a14:
    sub r0, r2, #0xff
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT30
    bl func_ov002_0227e674
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a40:
    mov r0, r5
    bl func_ov002_021afff0
    mov r4, r0
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_a40
    add sp, sp, #0x34
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a64:
    and r3, r8, #0x1
    sub r0, r2, #0xdd0
    mul r1, r3, r0
    ldr r0, _LIT31
    mov r6, #0x0
    ldr r0, [r0, r1]
    mov sl, r6
    cmp r0, #0x0
    bls .L_ac4
    ldr r0, _LIT32
    add r9, r0, r1
    add r7, r9, #0x120
.L_a94:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b86c
    cmp r0, #0x6
    moveq r6, #0x1
    beq .L_ac4
    ldr r0, [r9, #0xc]
    add sl, sl, #0x1
    cmp sl, r0
    add r7, r7, #0x4
    bcc .L_a94
.L_ac4:
    cmp r6, #0x0
    bne .L_1340
    cmp r5, #0x0
    mov r7, #0x0
    ble .L_1340
    ldr r6, _LIT25
.L_adc:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b86c
    cmp r0, #0x6
    addeq sp, sp, #0x34
    moveq r0, r7
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    blt .L_adc
    b .L_1340
_LIT0: .word data_ov002_022cdb98
_LIT1: .word 0x00000fbb
_LIT2: .word 0x00001645
_LIT3: .word 0x00001315
_LIT4: .word 0x00000fb7
_LIT5: .word 0x00000fb8
_LIT6: .word 0x00000fb9
_LIT7: .word 0x00000fba
_LIT8: .word 0x0000133b
_LIT9: .word 0x00000fd6
_LIT10: .word 0x000011e4
_LIT11: .word 0x00001796
_LIT12: .word 0x000014ee
_LIT13: .word 0x0000137d
_LIT14: .word 0x000010e4
_LIT15: .word 0x00001366
_LIT16: .word 0x000017e5
_LIT17: .word 0x00001638
_LIT18: .word 0x000018f7
_LIT19: .word 0x00001a10
_LIT20: .word 0x000019a3
_LIT21: .word data_ov002_022d008c
_LIT22: .word 0x00001388
_LIT23: .word 0x000011d8
_LIT24: .word 0x00001331
_LIT25: .word data_ov002_022cdba8
_LIT26: .word data_ov002_022cd444
_LIT27: .word 0x000019f5
_LIT28: .word 0x00001712
_LIT29: .word 0x000017be
_LIT30: .word 0x00001477
_LIT31: .word data_ov002_022cf098
_LIT32: .word data_ov002_022cf08c
_LIT33: .word 0x000018fc
_LIT34: .word 0x000018fd
_LIT35: .word 0x000014f0
_LIT36: .word 0x00001386
_LIT37: .word 0x00001387
_LIT38: .word 0x000016cb
_LIT39: .word 0x000016e4
_LIT40: .word 0x0000169c
_LIT41: .word 0x000012be
_LIT42: .word 0x00001562
_LIT43: .word 0x000019cb
_LIT44: .word 0x000016f9
_LIT45: .word 0x0000197f
_LIT46: .word 0x000019fd
_LIT47: .word 0x00001a61
_LIT48: .word 0x000019fe
_LIT49: .word 0x00000fbe
_LIT50: .word 0x000018c5
_LIT51: .word 0x000018c3
_LIT52: .word 0x00001152
_LIT53: .word 0x0000179c
_LIT54: .word 0x00000ff8
_LIT55: .word 0x000017dd
_LIT56: .word 0x000017d9
_LIT57: .word 0x000012ac
_LIT58: .word 0x00001439
_LIT59: .word 0x000019bc
_LIT60: .word 0x00001870
_LIT61: .word 0x000017e8
.L_c08:
    mov r0, r8
    add r1, r1, #0x8c
    bl func_ov002_02281884
    cmp r0, #0x0
    beq .L_c50
    ldr r1, _LIT33
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT34
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c50:
    rsb r6, r8, #0x1
    mov r0, r6
    bl func_ov002_021bbe70
    cmp r0, #0x0
    beq .L_c80
    ldr r1, _LIT33
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c80:
    mov r0, r6
    mov r1, #0x1
    bl func_ov002_021bc14c
    cmp r0, #0x0
    beq .L_1340
    ldr r1, _LIT34
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cb0:
    mov r0, r8
    sub r1, r2, #0x86
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT35
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ce4:
    ldr r1, _LIT36
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT37
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT22
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT38
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT39
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT40
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    bl func_ov002_0227e6d8
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d8c:
    mov r0, r8
    sub r1, r2, #0x230
    bl func_ov002_02281810
    cmp r0, #0x0
    beq .L_dd0
    ldr r1, _LIT41
    mov r0, r8
    bl func_ov002_02281884
    cmp r0, #0x0
    bne .L_1340
    ldr r1, _LIT41
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_dd0:
    ldr r1, _LIT42
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_dec:
    ldr r0, _LIT4
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT5
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT6
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT2
    mov r0, r8
    bl func_ov002_02281810
    cmp r0, #0x0
    beq .L_e64
    ldr r0, _LIT1
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e64:
    ldr r0, _LIT43
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT44
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT45
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT46
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT47
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT48
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT49
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT50
    bl func_ov002_0227e674
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f08:
    mov r0, r8
    sub r1, r1, #0x5a0
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_1340
    ldr r0, _LIT51
    bl func_ov002_0227e674
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f38:
    mov r0, r8
    mov r1, #0x16
    bl func_ov002_021bd284
    cmp r0, #0x0
    beq .L_1340
    ldr r0, _LIT52
    bl func_ov002_0227e674
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f64:
    mov r0, r8
    sub r1, r1, #0x274
    bl func_ov002_02281884
    cmp r0, #0x0
    bne .L_1340
    ldr r0, _LIT53
    bl func_ov002_0227e674
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f90:
    add r0, r2, #0x40
    bl func_ov002_0227e674
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fa8:
    ldr r0, _LIT21
    ldr r0, [r0, #0xcec]
    cmp r0, r8
    beq .L_1340
    mov r7, #0x0
    mov sl, r7
    rsb r9, r8, #0x1
    mov r6, #0x1
.L_fc8:
    mov r0, r9
    mov r1, sl
    mov r2, r6
    bl func_ov002_021be1f8
    cmp r0, #0x0
    add sl, sl, #0x1
    addne r7, r7, #0x1
    cmp sl, #0x5
    blt .L_fc8
    cmp r7, #0x0
    bne .L_1340
    ldr r1, _LIT54
    mov r0, r8
    bl func_ov002_021c3a04
    cmp r0, #0x0
    beq .L_101c
    ldr r0, _LIT55
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_101c:
    ldr r0, _LIT56
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT57
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT58
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT59
    mov r0, r8
    bl func_ov002_02281884
    cmp r0, #0x0
    beq .L_1094
    ldr r1, _LIT60
    mov r0, r8
    bl func_ov002_02281884
    cmp r0, #0x0
    bne .L_1094
    ldr r0, _LIT60
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1094:
    ldr r0, _LIT59
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    mov r1, #0x7
    bl func_ov002_021c3b70
    cmp r0, #0x0
    beq .L_1340
    ldr r0, _LIT61
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT62
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT63
    bl func_ov002_0227e674
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10fc:
    cmp r5, #0x0
    mov r7, #0x0
    ble .L_1340
    ldr r6, _LIT25
    mov r9, r7
.L_1110:
    mov r0, r7
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_1158
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202b95c
    cmp r0, #0x3
    blt .L_1158
    mov r0, sl
    mov r1, r9
    bl func_ov002_02281494
    cmp r0, #0x0
    addeq sp, sp, #0x34
    moveq r0, r7
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1158:
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    blt .L_1110
    b .L_1340
.L_116c:
    mov r0, r8
    sub r2, r1, #0xe6
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_11f4
    ldr r0, _LIT64
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT65
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT66
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT67
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT20
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11f4:
    mov r0, r8
    bl func_ov002_0227e77c
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    bl func_ov002_0227e6d8
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1220:
    ldr r1, _LIT68
    mov r0, r8
    bl func_ov002_0227ecb4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    bl func_ov002_021bbdcc
    ldr r1, _LIT69
    and r2, r8, #0x1
    mul r3, r2, r1
    ldr r1, _LIT31
    ldr r1, [r1, r3]
    add r0, r1, r0
    cmp r0, #0x1
    bhi .L_1274
    ldr r0, _LIT70
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1274:
    ldr r1, _LIT45
    mov r0, r8
    bl func_ov002_021c2f28
    cmp r0, #0x0
    beq .L_12b0
    ldr r0, _LIT71
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT46
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12b0:
    ldr r1, _LIT72
    mov r0, r8
    bl func_ov002_02281884
    cmp r0, #0x0
    bne .L_12d8
    mov r0, #0x1a80
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12d8:
    mov r0, r8
    bl func_ov002_0227e8c4
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x1a80
    bl func_ov002_0227e674
    cmp r0, #0x0
    blt .L_1340
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1304:
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021bd284
    cmp r0, #0x0
    beq .L_132c
    ldr r0, _LIT73
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_132c:
    ldr r0, _LIT74
    bl func_ov002_0227e674
    cmp r0, #0x0
    addge sp, sp, #0x34
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1340:
    mov r9, #0x0
    mov r7, r9
    cmp r5, #0x0
    ble .L_1390
    ldr r6, _LIT25
.L_1354:
    mov r0, r7
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_1380
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    movne r9, #0x1
    bne .L_1390
.L_1380:
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    blt .L_1354
.L_1390:
    cmp r9, #0x0
    bne .L_13b0
    mov r0, r8
    bl func_ov002_0227e6d8
    cmp r0, #0x0
    blt .L_15ac
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13b0:
    mov fp, #0x0
    ldr r1, _LIT15
    sub r0, fp, #0x1
    cmp r4, r1
    str r0, [sp]
    addne r0, r1, #0x17
    cmpne r4, r0
    addne r0, r1, #0x280
    mov r2, fp
    cmpne r4, r0
    moveq r2, #0x1
    str fp, [sp, #0x4]
    cmp r2, #0x0
    bne .L_1504
    mov r6, #0x0
    rsb r9, r8, #0x1
    mov r7, r6
    add r8, sp, #0x8
.L_13f8:
    mov r0, r9
    mov r1, r7
    mov r2, r8
    bl func_ov002_0227ae40
    ldr r0, [sp, #0x1c]
    add r7, r7, #0x1
    cmp r6, r0
    movlt r6, r0
    ldr r0, [sp, #0x20]
    cmp fp, r0
    movlt fp, r0
    cmp r7, #0x5
    blt .L_13f8
    cmp r5, #0x0
    mov r9, #0x0
    ble .L_14f0
    ldr r8, _LIT25
.L_143c:
    mov r0, r9
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_14e0
    mov r0, r4
    mov r1, r9
    bl func_ov002_0227ed24
    cmp r0, #0x0
    bne .L_14e0
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202b89c
    mov sl, r0
    mov r0, r7
    bl func_0202b8cc
    cmp sl, r0
    mov r0, r7
    ble .L_1494
    bl func_0202b89c
    b .L_1498
.L_1494:
    bl func_0202b8cc
.L_1498:
    mov sl, r0
    ldr r0, [sp, #0x4]
    cmp r0, sl
    bge .L_14e0
    mov r0, r7
    bl func_0202b89c
    cmp r6, r0
    ble .L_14d8
    mov r0, r7
    bl func_0202b89c
    cmp fp, r0
    blt .L_14d8
    mov r0, r7
    bl func_0202b8cc
    cmp r6, r0
    bgt .L_14e0
.L_14d8:
    str sl, [sp, #0x4]
    str r9, [sp]
.L_14e0:
    add r9, r9, #0x1
    cmp r9, r5
    add r8, r8, #0x4
    blt .L_143c
.L_14f0:
    ldr r0, [sp]
    mvn r1, #0x0
    cmp r0, r1
    addgt sp, sp, #0x34
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1504:
    mov r9, #0x0
    mov r8, r9
    cmp r5, #0x0
    mvn sl, #0x0
    ble .L_1598
    ldr r7, _LIT25
    ldr r6, _LIT0
.L_1520:
    mov r0, r8
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_1588
    mov r0, r4
    mov r1, r8
    bl func_ov002_0227ed24
    cmp r0, #0x0
    bne .L_1588
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b89c
    add r1, r6, r8, lsl #0x1
    add r1, r1, #0x400
    ldrh r1, [r1, #0x10]
    mov r0, r0, lsl #0x2
    cmp r1, #0xd
    beq .L_1578
    cmp r1, #0xe
    addeq r0, r0, #0x1
    b .L_157c
.L_1578:
    add r0, r0, #0x2
.L_157c:
    cmp r9, r0
    movlt r9, r0
    movlt sl, r8
.L_1588:
    add r8, r8, #0x1
    cmp r8, r5
    add r7, r7, #0x4
    blt .L_1520
.L_1598:
    mvn r0, #0x0
    cmp sl, r0
    addgt sp, sp, #0x34
    movgt r0, sl
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_15ac:
    mov r4, #0x0
    mov r6, r4
    cmp r5, #0x0
    ble .L_15d8
.L_15bc:
    mov r0, r6
    bl func_ov002_0227e65c
    cmp r0, #0x0
    add r6, r6, #0x1
    addeq r4, r4, #0x1
    cmp r6, r5
    blt .L_15bc
.L_15d8:
    cmp r4, #0x0
    addeq sp, sp, #0x34
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    bl func_ov002_021afff0
    mov r6, r0
    cmp r5, #0x0
    mov r4, #0x0
    ble .L_1628
.L_1600:
    mov r0, r4
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_161c
    cmp r6, #0x0
    sub r6, r6, #0x1
    beq .L_1628
.L_161c:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_1600
.L_1628:
    mov r0, r4
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT62: .word 0x00001873
_LIT63: .word 0x00001874
_LIT64: .word 0x00001a7e
_LIT65: .word 0x00001a7f
_LIT66: .word 0x000019a5
_LIT67: .word 0x000019a4
_LIT68: .word 0x000018f6
_LIT69: .word 0x00000868
_LIT70: .word 0x000018f9
_LIT71: .word 0x0000194d
_LIT72: .word 0x000012e5
_LIT73: .word 0x00001ab1
_LIT74: .word 0x00001a4e
