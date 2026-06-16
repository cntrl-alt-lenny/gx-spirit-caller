; func_ov002_0227b9b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_020310d8
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b9e00
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021bb90c
        .extern func_ov002_021bb950
        .extern func_ov002_021bbc58
        .extern func_ov002_021bbd14
        .extern func_ov002_021bbf50
        .extern func_ov002_021bc16c
        .extern func_ov002_021bc1d0
        .extern func_ov002_021bc618
        .extern func_ov002_021bd45c
        .extern func_ov002_021bd6c8
        .extern func_ov002_021c3a6c
        .extern func_ov002_021c3ae4
        .extern func_ov002_022536e8
        .extern func_ov002_02259f74
        .extern func_ov002_0227b8bc
        .extern func_ov002_0227d400
        .extern func_ov002_02280d18
        .extern func_ov002_02281994
        .extern func_ov002_02281a74
        .global func_ov002_0227b9b8
        .arm
func_ov002_0227b9b8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    mov r7, r0
    ldr ip, [r4, #0xcf8]
    mov r6, r1
    mov r5, r2
    mov r4, r3
    cmp ip, #0x3
    bne .L_44
    ldr r2, _LIT1
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_44:
    ldr r0, _LIT2
    bl func_ov002_021bb068
    cmp r0, #0x0
    ldr r3, _LIT3
    movgt r5, #0x1
    cmp r6, r3
    bgt .L_344
    bge .L_78c
    ldr r2, _LIT4
    cmp r6, r2
    bgt .L_1f0
    bge .L_78c
    ldr r0, _LIT5
    cmp r6, r0
    bgt .L_140
    bge .L_660
    sub r1, r0, #0xf9
    cmp r6, r1
    bgt .L_dc
    sub r0, r0, #0xf9
    cmp r6, r0
    bge .L_660
    cmp r6, #0xfe0
    bgt .L_b8
    bge .L_628
    sub r0, r3, #0x750
    cmp r6, r0
    beq .L_678
    b .L_bb0
.L_b8:
    ldr r0, _LIT6
    cmp r6, r0
    bgt .L_cc
    beq .L_678
    b .L_bb0
.L_cc:
    add r0, r0, #0x16c
    cmp r6, r0
    beq .L_818
    b .L_bb0
.L_dc:
    sub r1, r0, #0xf
    cmp r6, r1
    bgt .L_114
    sub r1, r0, #0x12
    cmp r6, r1
    blt .L_104
    subne r0, r0, #0xf
    cmpne r6, r0
    beq .L_770
    b .L_bb0
.L_104:
    sub r0, r0, #0xed
    cmp r6, r0
    beq .L_678
    b .L_bb0
.L_114:
    sub r1, r0, #0x9
    cmp r6, r1
    bgt .L_130
    sub r0, r0, #0x9
    cmp r6, r0
    beq .L_660
    b .L_bb0
.L_130:
    sub r0, r0, #0x5
    cmp r6, r0
    beq .L_660
    b .L_bb0
.L_140:
    add r1, r0, #0xae
    cmp r6, r1
    bgt .L_19c
    bge .L_660
    add r1, r0, #0x15
    cmp r6, r1
    bgt .L_170
    bge .L_78c
    add r0, r0, #0x7
    cmp r6, r0
    beq .L_ad0
    b .L_bb0
.L_170:
    add r1, r0, #0x28
    cmp r6, r1
    bgt .L_18c
    add r0, r0, #0x28
    cmp r6, r0
    beq .L_714
    b .L_bb0
.L_18c:
    add r0, r0, #0xa1
    cmp r6, r0
    beq .L_660
    b .L_bb0
.L_19c:
    sub r1, r2, #0x31
    cmp r6, r1
    bgt .L_1c4
    mov r0, r1
    cmp r6, r0
    bge .L_678
    sub r0, r2, #0x34
    cmp r6, r0
    beq .L_8c8
    b .L_bb0
.L_1c4:
    add r1, r0, #0x114
    cmp r6, r1
    bgt .L_1e0
    add r0, r0, #0x114
    cmp r6, r0
    beq .L_7b0
    b .L_bb0
.L_1e0:
    rsb r0, r0, #0x2640
    cmp r6, r0
    beq .L_678
    b .L_bb0
.L_1f0:
    ldr r1, _LIT7
    cmp r6, r1
    bgt .L_298
    bge .L_678
    sub r0, r1, #0xbf
    cmp r6, r0
    bgt .L_254
    bge .L_838
    add r0, r2, #0x80
    cmp r6, r0
    bgt .L_230
    bge .L_678
    add r0, r2, #0x6c
    cmp r6, r0
    beq .L_ad0
    b .L_bb0
.L_230:
    sub r0, r1, #0xf1
    cmp r6, r0
    bgt .L_244
    beq .L_7f8
    b .L_bb0
.L_244:
    sub r0, r1, #0xdf
    cmp r6, r0
    beq .L_678
    b .L_bb0
.L_254:
    sub r0, r1, #0xa0
    cmp r6, r0
    bgt .L_274
    bge .L_678
    sub r0, r1, #0xa5
    cmp r6, r0
    beq .L_660
    b .L_bb0
.L_274:
    sub r0, r1, #0x94
    cmp r6, r0
    bgt .L_288
    beq .L_7d8
    b .L_bb0
.L_288:
    sub r0, r1, #0x48
    cmp r6, r0
    beq .L_98c
    b .L_bb0
.L_298:
    add r0, r1, #0xb1
    cmp r6, r0
    bgt .L_2ec
    bge .L_8a4
    add r0, r1, #0x6f
    cmp r6, r0
    bgt .L_2c8
    bge .L_678
    add r0, r1, #0x20
    cmp r6, r0
    beq .L_678
    b .L_bb0
.L_2c8:
    add r0, r1, #0xa7
    cmp r6, r0
    bgt .L_2dc
    beq .L_85c
    b .L_bb0
.L_2dc:
    add r0, r1, #0xac
    cmp r6, r0
    beq .L_660
    b .L_bb0
.L_2ec:
    sub r0, r3, #0x72
    cmp r6, r0
    bgt .L_320
    bge .L_73c
    add r0, r1, #0xb6
    cmp r6, r0
    bgt .L_310
    beq .L_ad0
    b .L_bb0
.L_310:
    add r0, r1, #0xce
    cmp r6, r0
    beq .L_ad0
    b .L_bb0
.L_320:
    sub r0, r3, #0x4a
    cmp r6, r0
    bgt .L_334
    beq .L_a74
    b .L_bb0
.L_334:
    add r0, r1, #0x154
    cmp r6, r0
    beq .L_ba0
    b .L_bb0
.L_344:
    ldr r1, _LIT8
    cmp r6, r1
    bgt .L_4b0
    bge .L_8f8
    sub r0, r1, #0x58
    cmp r6, r0
    bgt .L_418
    bge .L_678
    add r0, r3, #0x4f
    cmp r6, r0
    bgt .L_3d4
    bge .L_8f8
    add r0, r3, #0x28
    cmp r6, r0
    bgt .L_3b0
    bge .L_678
    add r0, r3, #0x6
    cmp r6, r0
    bgt .L_bb0
    add r0, r3, #0x3
    cmp r6, r0
    blt .L_bb0
    beq .L_78c
    add r0, r3, #0x6
    cmp r6, r0
    beq .L_660
    b .L_bb0
.L_3b0:
    sub r0, r1, #0x120
    cmp r6, r0
    bgt .L_3c4
    beq .L_ad0
    b .L_bb0
.L_3c4:
    add r0, r3, #0x3e
    cmp r6, r0
    beq .L_8f8
    b .L_bb0
.L_3d4:
    sub r0, r1, #0x86
    cmp r6, r0
    bgt .L_3f4
    bge .L_934
    add r0, r3, #0x50
    cmp r6, r0
    beq .L_8f8
    b .L_bb0
.L_3f4:
    sub r0, r1, #0x85
    cmp r6, r0
    bgt .L_408
    beq .L_a9c
    b .L_bb0
.L_408:
    sub r0, r1, #0x5c
    cmp r6, r0
    beq .L_678
    b .L_bb0
.L_418:
    sub r0, r1, #0x3a
    cmp r6, r0
    bgt .L_46c
    bge .L_ad0
    sub r0, r1, #0x50
    cmp r6, r0
    bgt .L_448
    bge .L_ac4
    sub r0, r1, #0x57
    cmp r6, r0
    beq .L_678
    b .L_bb0
.L_448:
    sub r0, r1, #0x4e
    cmp r6, r0
    bgt .L_45c
    beq .L_ac4
    b .L_bb0
.L_45c:
    sub r0, r1, #0x42
    cmp r6, r0
    beq .L_9fc
    b .L_bb0
.L_46c:
    sub r0, r1, #0x2d
    cmp r6, r0
    bgt .L_48c
    bge .L_95c
    sub r0, r1, #0x36
    cmp r6, r0
    beq .L_b30
    b .L_bb0
.L_48c:
    sub r0, r1, #0x29
    cmp r6, r0
    bgt .L_4a0
    beq .L_678
    b .L_bb0
.L_4a0:
    sub r0, r1, #0x6
    cmp r6, r0
    beq .L_a24
    b .L_bb0
.L_4b0:
    add r0, r3, #0x2c0
    cmp r6, r0
    bgt .L_558
    bge .L_660
    add r0, r1, #0xb1
    cmp r6, r0
    bgt .L_514
    bge .L_b5c
    add r0, r1, #0x37
    cmp r6, r0
    bgt .L_4f0
    bge .L_9d4
    add r0, r1, #0x5
    cmp r6, r0
    beq .L_678
    b .L_bb0
.L_4f0:
    add r0, r1, #0x53
    cmp r6, r0
    bgt .L_504
    beq .L_a48
    b .L_bb0
.L_504:
    add r0, r1, #0x60
    cmp r6, r0
    beq .L_ad0
    b .L_bb0
.L_514:
    add r0, r1, #0xb9
    cmp r6, r0
    bgt .L_534
    bge .L_adc
    add r0, r1, #0xb5
    cmp r6, r0
    beq .L_660
    b .L_bb0
.L_534:
    add r0, r1, #0xf7
    cmp r6, r0
    bgt .L_548
    beq .L_ac4
    b .L_bb0
.L_548:
    ldr r0, _LIT9
    cmp r6, r0
    beq .L_678
    b .L_bb0
.L_558:
    add r0, r1, #0x24c
    cmp r6, r0
    bgt .L_5a8
    bge .L_6c0
    add r0, r3, #0x318
    cmp r6, r0
    bgt .L_588
    bge .L_678
    add r0, r1, #0x1a4
    cmp r6, r0
    beq .L_ad0
    b .L_bb0
.L_588:
    cmp r6, #0x1a80
    bgt .L_598
    beq .L_678
    b .L_bb0
.L_598:
    add r0, r3, #0x3a8
    cmp r6, r0
    beq .L_6c0
    b .L_bb0
.L_5a8:
    add r0, r3, #0x3dc
    cmp r6, r0
    bgt .L_5f0
    bge .L_68c
    ldr r1, _LIT10
    cmp r6, r1
    bgt .L_5e0
    sub r0, r1, #0x1
    cmp r6, r0
    blt .L_bb0
    beq .L_6c0
    cmp r6, r1
    beq .L_6f0
    b .L_bb0
.L_5e0:
    add r0, r1, #0x2f
    cmp r6, r0
    beq .L_68c
    b .L_bb0
.L_5f0:
    add r0, r1, #0x280
    cmp r6, r0
    bgt .L_604
    beq .L_68c
    b .L_bb0
.L_604:
    sub r0, r6, #0x2e4
    sub r0, r0, #0x1800
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_bb0
    b .L_68c
    b .L_68c
    b .L_68c
    b .L_68c
.L_628:
    cmp r5, #0x0
    beq .L_bb0
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x2
    blt .L_bb0
    ldr r1, _LIT11
    mov r0, r7
    bl func_ov002_021bbd14
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_660:
    cmp r4, #0x0
    cmpeq r5, #0x0
    bne .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_678:
    cmp r5, #0x0
    bne .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_68c:
    cmp r5, #0x0
    bne .L_bb0
    ldr r0, _LIT12
    and r1, r7, #0x1
    mul r2, r1, r0
    ldr r1, _LIT13
    add r0, r0, #0x350
    ldr r1, [r1, r2]
    cmp r1, r0
    blt .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_6c0:
    cmp r4, #0x0
    cmpeq r5, #0x0
    bne .L_bb0
    mov r0, r7
    mov r1, r6
    mov r2, #0x0
    bl func_ov002_022536e8
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_6f0:
    mov r0, r7
    mov r1, r6
    mov r2, #0x0
    bl func_ov002_022536e8
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_714:
    cmp r5, #0x0
    bne .L_bb0
    rsb r0, r7, #0x1
    mov r1, #0x1
    bl func_ov002_021bc1d0
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_73c:
    cmp r5, #0x0
    bne .L_bb0
    mov r0, #0x0
    bl func_ov002_021bbf50
    mov r4, r0
    mov r0, #0x1
    bl func_ov002_021bbf50
    add r0, r4, r0
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x4
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_770:
    rsb r0, r7, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_78c:
    cmp r5, #0x0
    bne .L_bb0
    ldr r0, _LIT14
    bl func_ov002_021bd6c8
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_7b0:
    ldr r0, _LIT12
    and r1, r7, #0x1
    mul r2, r1, r0
    ldr r0, _LIT13
    ldr r0, [r0, r2]
    cmp r0, #0x7d0
    ble .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_7d8:
    mov r0, r7
    mov r1, #0x1
    bl func_ov002_021c3a6c
    cmp r0, #0x1
    ble .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_7f8:
    mov r0, r7
    sub r1, r1, #0xfc
    bl func_ov002_021bb90c
    cmp r0, #0x0
    bne .L_bb0
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_818:
    mov r0, r7
    add r1, r2, #0x5d
    bl func_ov002_02281994
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_838:
    cmp r4, #0x0
    bne .L_bb0
    rsb r0, r7, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_85c:
    mov r8, #0x0
.L_860:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9ecc
    bl func_020310d8
    movs r4, r0
    beq .L_894
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9e00
    cmp r0, r4
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_894:
    add r8, r8, #0x1
    cmp r8, #0xa
    blt .L_860
    b .L_bb0
.L_8a4:
    cmp r5, #0x0
    bne .L_bb0
    mov r0, r7
    bl func_ov002_02281a74
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_8c8:
    cmp r5, #0x0
    bne .L_bb0
    mov r0, r7
    bl func_ov002_021bbf50
    mov r4, r0
    rsb r0, r7, #0x1
    bl func_ov002_021bbf50
    cmp r4, r0
    blt .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_8f8:
    cmp r5, #0x0
    bne .L_bb0
    mov r0, r6
    bl func_0202b878
    mov r1, r0
    mov r0, r7
    bl func_ov002_021bbc58
    mov r4, r0
    rsb r0, r7, #0x1
    bl func_ov002_021bbf50
    cmp r4, r0
    blt .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_934:
    cmp r5, #0x0
    bne .L_bb0
    ldr r1, _LIT15
    mov r0, r7
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_95c:
    cmp r5, #0x0
    bne .L_bb0
    ldr r0, _LIT12
    and r1, r7, #0x1
    mul r2, r1, r0
    ldr r0, _LIT13
    ldr r0, [r0, r2]
    cmp r0, #0xfa0
    blt .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_98c:
    cmp r5, #0x0
    bne .L_bb0
    mov r4, #0x0
    mov r0, r7
    rsb r1, r7, #0x1
    sub r2, r4, #0x1
    mov r3, #0x1
    str r4, [sp]
    bl func_ov002_02280d18
    ldr r1, _LIT16
    cmp r0, r1
    ble .L_9c8
    add r1, r1, #0x320
    cmp r0, r1
    blt .L_bb0
.L_9c8:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_9d4:
    cmp r5, #0x0
    bne .L_bb0
    ldr r1, _LIT17
    mov r0, r7
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_9fc:
    cmp r5, #0x0
    bne .L_bb0
    mov r0, r7
    sub r1, r1, #0x43
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_a24:
    cmp r5, #0x0
    bne .L_bb0
    mov r0, r7
    bl func_ov002_021bbf50
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_a48:
    cmp r5, #0x0
    bne .L_bb0
    mov r0, r7
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_021bc16c
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_a74:
    cmp r5, #0x0
    bne .L_bb0
    mov r0, r7
    mov r1, #0x3
    bl func_ov002_021bd45c
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_a9c:
    cmp r5, #0x0
    bne .L_bb0
    ldr r1, _LIT18
    mov r0, r7
    bl func_ov002_02281994
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_ac4:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_ad0:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_adc:
    mov r0, r7
    mov r1, #0x7
    bl func_ov002_021bbc58
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT19
    mov r0, r7
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_bb0
    ldr r1, _LIT20
    mov r0, r7
    bl func_ov002_02281994
    cmp r0, #0x0
    beq .L_bb0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_b30:
    sub r0, r3, #0x2f8
    bl func_ov002_021bb068
    cmp r0, #0x0
    bne .L_b50
    ldr r0, _LIT21
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_bb0
.L_b50:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_b5c:
    cmp r5, #0x0
    bne .L_bb0
    sub r1, r1, #0xdf
    mov r0, #0x0
    bl func_ov002_021bb950
    cmp r0, #0x0
    bne .L_b94
    ldr r1, _LIT22
    mov r0, #0x1
    bl func_ov002_021bb950
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_b94:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_ba0:
    cmp r5, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_bb0:
    mov r0, r7
    bl func_ov002_02259f74
    cmp r0, #0x0
    beq .L_bec
    ldr r1, _LIT23
    mov r0, r7
    bl func_ov002_02281994
    cmp r0, #0x0
    beq .L_bec
    mov r0, r6
    bl func_ov002_0227d400
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_bec:
    cmp r5, #0x0
    bne .L_c0c
    mov r0, r6
    bl func_ov002_0227b8bc
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_c0c:
    mvn r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00001669
_LIT2: .word 0x0000135d
_LIT3: .word 0x00001706
_LIT4: .word 0x000013cd
_LIT5: .word 0x00001293
_LIT6: .word 0x0000101e
_LIT7: .word 0x0000156b
_LIT8: .word 0x00001863
_LIT9: .word 0x000019bc
_LIT10: .word 0x00001ab1
_LIT11: .word 0x000012c5
_LIT12: .word 0x00000868
_LIT13: .word data_ov002_022cf16c
_LIT14: .word 0x000010f4
_LIT15: .word 0x00000ff8
_LIT16: .word 0x0000044c
_LIT17: .word 0x00000fa7
_LIT18: .word 0x000012dc
_LIT19: .word 0x00001357
_LIT20: .word 0x0000198e
_LIT21: .word 0x000017a6
_LIT22: .word 0x00001784
_LIT23: .word 0x0000142a
