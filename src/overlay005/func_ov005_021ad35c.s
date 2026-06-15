; func_ov005_021ad35c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov005_021b1568
        .extern data_ov005_021b1a44
        .extern data_ov005_021b1a76
        .extern data_ov005_021b1ab2
        .extern data_ov005_021b1d4c
        .extern func_02005dac
        .extern func_020061ac
        .extern func_0201e964
        .extern func_02034784
        .extern func_02034810
        .extern func_020944a4
        .extern func_ov005_021aee84
        .extern func_ov005_021af704
        .extern func_ov005_021b0a10
        .global func_ov005_021ad35c
        .arm
func_ov005_021ad35c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x58
    ldr r1, _LIT0
    mov r6, #0x0
    ldrh r4, [r1]
    ldrh r2, [r1, #0x2]
    mov r3, #0x11
    strh r4, [sp, #0x34]
    strh r2, [sp, #0x36]
    ldrh r7, [r1, #0x4]
    ldrh r4, [r1, #0x6]
    mov r1, #0x2
    mov r2, #0xf
    mov sl, r0
    str r6, [sp, #0x2c]
    strh r7, [sp, #0x38]
    strh r4, [sp, #0x3a]
    strh r6, [sp, #0x4c]
    strh r6, [sp, #0x4e]
    strb r3, [sp, #0x50]
    strb r2, [sp, #0x51]
    strh r1, [sp, #0x52]
    strh r1, [sp, #0x54]
    bl func_02034784
    cmp r0, #0x0
    beq .L_174
    bl func_02034810
    mov r0, r0, lsl #0x1
    orr r2, r0, #0x800
    ldr r3, _LIT1
    mov r0, #0x1
    mov r1, r6
    str r3, [sp, #0x44]
    strh r2, [sp, #0x48]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x44
    mov r2, #0x6
    bl func_020944a4
.L_174:
    ldr r3, _LIT2
    ldr r1, _LIT3
    str r3, [sp]
    add r2, sp, #0x34
    mov r0, sl
    mov r3, #0x4
    bl func_ov005_021b0a10
    ldr r0, [sl, #0x4]
    cmp r0, #0x0
    bne .L_30c
    bl func_020061ac
    cmp r0, #0x0
    bne .L_30c
    ldr r0, [sl, #0x18]
    cmp r0, #0x0
    bne .L_210
    ldr r1, [sl, #0x14]
    mov r0, #0x13
    mul r0, r1, r0
    add r0, r0, #0x15
    and r1, r0, #0xff
    ldr r2, [sl, #0x10]
    mov r0, #0x15
    mul r0, r2, r0
    add r0, r0, #0xb
    ldr r2, _LIT4
    mov r3, r0, lsl #0x17
    orr r0, r1, #-2147483648
    orr r3, r0, r3, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x44]
    strh r2, [sp, #0x48]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x44
    mov r2, #0x6
    bl func_020944a4
    b .L_3e4
.L_210:
    ldr r3, [sl, #0x1c]
    ldr r2, _LIT5
    add r1, r3, #0x6
    mov r0, #0xa
    mla r4, r1, r0, r2
    cmp r3, #0x3
    bge .L_27c
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT6
    sub r0, r0, #0x5
    and r0, r0, #0xff
    sub r1, r1, #0x5
    orr r0, r0, #0x4000
    mov r1, r1, lsl #0x17
    orr r0, r0, #-1073741824
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x44]
    strh r2, [sp, #0x48]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x44
    mov r2, #0x6
    bl func_020944a4
    b .L_2ec
.L_27c:
    mov r7, #0x0
    ldr fp, _LIT7
    mov r8, r7
    mov r9, #0xe
.L_28c:
    ldrh r2, [r4]
    orr r0, r9, #0x5400
    ldrh r1, [r4, #0x2]
    strh r0, [sp, #0x48]
    sub r0, r2, #0x5
    add r0, r0, r8
    mov r2, r0, lsl #0x17
    sub r0, r1, #0x5
    and r0, r0, #0xff
    orr r0, r0, fp
    orr r0, r0, r2, lsr #0x7
    str r0, [sp, #0x44]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x44
    mov r2, #0x6
    bl func_020944a4
    add r7, r7, #0x1
    add r8, r8, #0x40
    add r9, r9, #0x8
    cmp r7, #0x2
    blt .L_28c
.L_2ec:
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x44
    mov r2, #0x6
    bl func_020944a4
    b .L_3e4
.L_30c:
    ldr r4, _LIT5
    mov r7, #0x0
    mov r9, #0xa
.L_318:
    add r0, r7, #0x6
    mla r8, r0, r9, r4
    ldr r0, [sl, #0x4]
    cmp r0, #0x0
    bne .L_3d8
    mov r0, sl
    mov r1, r8
    bl func_ov005_021aee84
    cmp r0, #0x0
    beq .L_3d8
    cmp r7, #0x2
    moveq r0, #0x1
    streq r0, [sp, #0x2c]
    beq .L_358
    cmp r7, #0x3
    moveq r6, #0x1
.L_358:
    str r7, [sl, #0x1c]
    ldrh r0, [r8]
    cmp r7, #0x1
    add r5, r7, #0x1
    movne r0, r0, lsl #0xc
    strne r0, [sp, #0x3c]
    bne .L_380
    sub r0, r0, #0x2
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x3c]
.L_380:
    ldrh r0, [r8, #0x2]
    mov r3, #0x0
    ldr r1, _LIT8
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x40]
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r4, [r8, #0x8]
    add r2, sp, #0x3c
    mov r0, #0x2
    str r4, [sp, #0x8]
    ldrh r4, [r8, #0x6]
    str r4, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [sl, #0x38]
    ldr r1, [r1, #0x2c]
    add r1, r1, r5, lsl #0x3
    bl func_0201e964
    b .L_3e4
.L_3d8:
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_318
.L_3e4:
    ldr r0, [sp, #0x2c]
    ldr r1, _LIT9
    add r0, r0, #0x3
    orr r2, r1, r0, lsl #0xc
    ldr r3, _LIT10
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x44]
    strh r2, [sp, #0x48]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x44
    mov r2, #0x6
    bl func_020944a4
    ldr r3, _LIT11
    ldr r0, _LIT12
    add r1, r6, #0x3
    orr r2, r0, r1, lsl #0xc
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x44]
    strh r2, [sp, #0x48]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x44
    mov r2, #0x6
    bl func_020944a4
    mov r0, #0x1a
    str r0, [sp, #0x28]
    str r0, [sp, #0x24]
    mov r9, #0x0
.L_460:
    ldr r0, _LIT13
    mov fp, #0x2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    ldreq r0, [sl, #0x3cc]
    cmpeq r0, #0x0
    bne .L_490
    ldr r0, [sl, #0x24]
    add r0, r0, r9
    cmp r0, #0x5
    movlt fp, #0x1
.L_490:
    ldr r0, [sp, #0x24]
    mov r6, #0x0
    and r0, r0, #0xff
    orr r0, r0, #0x40000000
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x28]
    mov r7, #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r8, #0x11
    str r0, [sp, #0x30]
    mov r4, r6
.L_4c0:
    ldr r0, [sp, #0x30]
    strh r7, [sp, #0x4c]
    strh r0, [sp, #0x4e]
    ldr r0, [sl, #0x4]
    cmp r0, #0x0
    bne .L_550
    mov r0, sl
    add r1, sp, #0x4c
    bl func_ov005_021aee84
    cmp r0, #0x0
    beq .L_550
    str r6, [sl, #0x10]
    str r9, [sl, #0x14]
    ldrh r2, [sp, #0x4c]
    ldrh r1, [sp, #0x4e]
    ldrh r0, [sp, #0x54]
    mov r2, r2, lsl #0xc
    mov r1, r1, lsl #0xc
    str r2, [sp, #0x3c]
    str r1, [sp, #0x40]
    str r4, [sp]
    str r4, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r0, _LIT8
    add r2, sp, #0x3c
    str r0, [sp, #0x10]
    str r4, [sp, #0x14]
    str r4, [sp, #0x18]
    str r4, [sp, #0x1c]
    ldr r1, [sl, #0x38]
    mov r0, #0x2
    ldr r1, [r1, #0x2c]
    mov r3, r4
    mov r5, r4
    bl func_0201e964
.L_550:
    ldr r0, [sl, #0x24]
    mov r1, r8, lsl #0x17
    add r2, r0, r9
    mov r0, #0xa
    mla r0, r2, r0, r6
    add r2, r0, #0x3d
    ldr r0, [sp, #0x20]
    orr r0, r0, r1, lsr #0x7
    str r0, [sp, #0x44]
    orr r0, r2, #0x800
    orr r0, r0, fp, lsl #0xc
    strh r0, [sp, #0x48]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x44
    mov r2, #0x6
    bl func_020944a4
    add r6, r6, #0x1
    add r7, r7, #0x15
    add r8, r8, #0x15
    cmp r6, #0xa
    blt .L_4c0
    ldr r0, [sp, #0x28]
    add r9, r9, #0x1
    add r0, r0, #0x13
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x24]
    cmp r9, #0x6
    add r0, r0, #0x13
    str r0, [sp, #0x24]
    blt .L_460
    ldr r0, _LIT13
    mov r8, #0x0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_7cc
    ldr r9, _LIT5
    ldr fp, _LIT8
    mov r6, #0x9
    mov r7, #0x5
    mov r4, r8
.L_600:
    ldrh r0, [r9]
    ldrh r1, [r9, #0x2]
    cmp r8, #0x0
    sub r0, r0, #0x1
    sub r1, r1, #0x1
    ldrh r2, [r9, #0x8]
    beq .L_630
    cmp r8, #0x1
    beq .L_658
    cmp r8, #0x2
    beq .L_678
    b .L_698
.L_630:
    ldr r3, [sl, #0x3cc]
    mov r5, #0x7
    cmp r3, r8
    cmpne r3, #0x3
    bne .L_698
    add r5, r5, #0x1
    sub r0, r0, #0x1
    sub r1, r1, #0x2
    sub r2, r2, #0x1
    b .L_698
.L_658:
    mov r5, r7
    ldr r3, [sl, #0x3cc]
    cmp r3, r8
    bne .L_698
    add r5, r7, #0x1
    sub r1, r1, #0x2
    sub r2, r2, #0x1
    b .L_698
.L_678:
    mov r5, r6
    ldr r3, [sl, #0x3cc]
    cmp r3, r8
    bne .L_698
    add r5, r6, #0x1
    add r0, r0, #0x1
    sub r1, r1, #0x2
    sub r2, r2, #0x1
.L_698:
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x3c]
    mov r0, r1, lsl #0xc
    str r0, [sp, #0x40]
    str r4, [sp]
    str r4, [sp, #0x4]
    str r2, [sp, #0x8]
    ldrh r1, [r9, #0x6]
    mov r0, #0x2
    add r2, sp, #0x3c
    str r1, [sp, #0xc]
    str fp, [sp, #0x10]
    str r4, [sp, #0x14]
    str r4, [sp, #0x18]
    str r4, [sp, #0x1c]
    ldr r1, [sl, #0x38]
    mov r3, r4
    ldr r1, [r1, #0x2c]
    add r1, r1, r5, lsl #0x3
    bl func_0201e964
    add r8, r8, #0x1
    cmp r8, #0x3
    add r9, r9, #0xa
    blt .L_600
    ldr r0, [sl, #0x3cc]
    cmp r0, #0x3
    bne .L_8d8
    ldr r0, [sl, #0x4]
    mov r4, #0x0
    cmp r0, #0x0
    ldr r6, _LIT14
    mov r5, #0x17
    bne .L_734
    mov r0, sl
    mov r1, r6
    bl func_ov005_021aee84
    cmp r0, #0x0
    addne r5, r5, #0x1
    movne r4, #0x1
.L_734:
    ldrh r1, [r6]
    ldrh r0, [r6, #0x2]
    mov r3, #0x0
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x3c]
    str r0, [sp, #0x40]
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r0, [r6, #0x8]
    ldr r1, _LIT8
    add r2, sp, #0x3c
    str r0, [sp, #0x8]
    ldrh r6, [r6, #0x6]
    mov r0, #0x2
    str r6, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [sl, #0x38]
    ldr r1, [r1, #0x2c]
    add r1, r1, r5, lsl #0x3
    bl func_0201e964
    ldr r3, _LIT15
    ldr r0, _LIT16
    add r1, r4, #0x3
    orr r2, r0, r1, lsl #0xc
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x44]
    strh r2, [sp, #0x48]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x44
    mov r2, #0x6
    bl func_020944a4
    b .L_8d8
.L_7cc:
    ldr r9, _LIT5
    mov r4, #0x9
    mov r6, #0xd
    mov r7, #0xb
    mov fp, r8
.L_7e0:
    ldrh r0, [r9]
    ldrh r1, [r9, #0x2]
    cmp r8, #0x0
    sub r0, r0, #0x1
    sub r1, r1, #0x1
    ldrh r2, [r9, #0x8]
    beq .L_810
    cmp r8, #0x1
    beq .L_834
    cmp r8, #0x2
    beq .L_854
    b .L_874
.L_810:
    mov r5, r7
    ldr r3, [sl, #0x3cc]
    cmp r3, r8
    bne .L_874
    add r5, r7, #0x1
    sub r0, r0, #0x1
    sub r1, r1, #0x2
    sub r2, r2, #0x1
    b .L_874
.L_834:
    mov r5, r6
    ldr r3, [sl, #0x3cc]
    cmp r3, r8
    bne .L_874
    add r5, r6, #0x1
    sub r1, r1, #0x2
    sub r2, r2, #0x1
    b .L_874
.L_854:
    mov r5, r4
    ldr r3, [sl, #0x3cc]
    cmp r3, r8
    bne .L_874
    add r5, r4, #0x1
    add r0, r0, #0x1
    sub r1, r1, #0x2
    sub r2, r2, #0x1
.L_874:
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x3c]
    mov r0, r1, lsl #0xc
    str r0, [sp, #0x40]
    str fp, [sp]
    str fp, [sp, #0x4]
    str r2, [sp, #0x8]
    ldrh r1, [r9, #0x6]
    mov r0, #0x2
    add r2, sp, #0x3c
    str r1, [sp, #0xc]
    ldr r1, _LIT8
    mov r3, fp
    str r1, [sp, #0x10]
    str fp, [sp, #0x14]
    str fp, [sp, #0x18]
    str fp, [sp, #0x1c]
    ldr r1, [sl, #0x38]
    ldr r1, [r1, #0x2c]
    add r1, r1, r5, lsl #0x3
    bl func_0201e964
    add r8, r8, #0x1
    cmp r8, #0x3
    add r9, r9, #0xa
    blt .L_7e0
.L_8d8:
    ldr r0, [sl, #0x4]
    cmp r0, #0x0
    bne .L_a74
    ldr r0, _LIT17
    ldr r0, [r0, #0x38]
    mov r0, r0, asr #0x2
    tst r0, #0x1
    beq .L_a74
    ldr r0, [sl, #0x8]
    mov r3, #0x0
    cmp r0, #0x4
    bhi .L_918
    mov r1, #0x1
    mov r2, r1, lsl r0
    tst r2, #0x19
    movne r3, r1
.L_918:
    ldr r1, _LIT13
    cmp r3, #0x0
    ldr r1, [r1, #0x4]
    movne r4, #0x78
    mov r1, r1, lsl #0x1d
    moveq r4, #0x90
    movs r1, r1, lsr #0x1d
    bne .L_9d8
    cmp r0, #0x4
    bhi .L_954
    mov r1, #0x1
    mov r1, r1, lsl r0
    tst r1, #0x19
    movne r1, #0xa
    bne .L_958
.L_954:
    mov r1, #0xc
.L_958:
    ldrh r2, [sl, #0x28]
    cmp r2, r1
    blt .L_988
    cmp r0, #0x4
    bhi .L_980
    mov r1, #0x1
    mov r0, r1, lsl r0
    tst r0, #0x19
    movne r0, #0xa
    bne .L_984
.L_980:
    mov r0, #0xc
.L_984:
    sub r2, r0, #0x1
.L_988:
    mov r0, #0xc
    mul r1, r2, r0
    rsb r0, r4, #0x100
    add r0, r0, r0, lsr #0x1f
    add r0, r1, r0, asr #0x1
    sub r1, r0, #0x1
    ldr r2, _LIT18
    ldr r0, _LIT19
    mov r1, r1, lsl #0x17
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x44]
    strh r2, [sp, #0x48]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x44
    mov r2, #0x6
    bl func_020944a4
    b .L_a74
.L_9d8:
    cmp r0, #0x4
    bhi .L_9f4
    mov r1, #0x1
    mov r1, r1, lsl r0
    tst r1, #0x19
    movne r2, #0xa
    bne .L_9f8
.L_9f4:
    mov r2, #0xc
.L_9f8:
    ldrh r1, [sl, #0x28]
    cmp r1, r2, lsl #0x1
    blt .L_a2c
    cmp r0, #0x4
    bhi .L_a20
    mov r1, #0x1
    mov r0, r1, lsl r0
    tst r0, #0x19
    movne r0, #0xa
    bne .L_a24
.L_a20:
    mov r0, #0xc
.L_a24:
    mov r0, r0, lsl #0x1
    sub r1, r0, #0x1
.L_a2c:
    mov r0, sl
    bl func_ov005_021af704
    rsb r1, r4, #0x100
    add r1, r1, r1, lsr #0x1f
    add r0, r0, r1, asr #0x1
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x7
    orr r3, r0, #0x8
    ldr r2, _LIT18
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x44]
    strh r2, [sp, #0x48]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x44
    mov r2, #0x6
    bl func_020944a4
.L_a74:
    mov r8, #0x0
    ldr r5, _LIT8
    ldr r7, _LIT5
    mov r9, #0xf
    mov r6, r8
    mov r4, #0xa
.L_a8c:
    add r0, r8, #0x3
    mla r1, r0, r4, r7
    ldr r0, [sl, #0x20]
    mov fp, r9
    cmp r0, #0x6
    ble .L_adc
    cmp r8, #0x0
    beq .L_ab8
    cmp r8, #0x1
    beq .L_acc
    b .L_adc
.L_ab8:
    ldr r0, _LIT20
    ldr r0, [r0, #0x18]
    cmp r0, #0x2
    addeq fp, r9, #0x1
    b .L_adc
.L_acc:
    ldr r0, _LIT20
    ldr r0, [r0, #0x18]
    cmp r0, #0x3
    addeq fp, r9, #0x1
.L_adc:
    ldrh r3, [r1]
    ldrh r2, [r1, #0x2]
    mov r0, #0x2
    mov r3, r3, lsl #0xc
    mov r2, r2, lsl #0xc
    str r3, [sp, #0x3c]
    str r2, [sp, #0x40]
    str r6, [sp]
    str r6, [sp, #0x4]
    ldrh ip, [r1, #0x8]
    add r2, sp, #0x3c
    mov r3, r6
    str ip, [sp, #0x8]
    ldrh r1, [r1, #0x6]
    str r1, [sp, #0xc]
    str r5, [sp, #0x10]
    str r6, [sp, #0x14]
    str r6, [sp, #0x18]
    str r6, [sp, #0x1c]
    ldr r1, [sl, #0x38]
    ldr r1, [r1, #0x2c]
    add r1, r1, fp, lsl #0x3
    bl func_0201e964
    add r8, r8, #0x1
    cmp r8, #0x2
    add r9, r9, #0x2
    blt .L_a8c
    ldr r0, [sl, #0x20]
    cmp r0, #0x6
    ble .L_bc0
    mov r0, #0xe2000
    str r0, [sp, #0x3c]
    ldr r1, [sl, #0x2c]
    ldr r0, _LIT20
    mov r1, r1, lsl #0xc
    ldr r0, [r0, #0x18]
    str r1, [sp, #0x40]
    mov r3, #0x0
    str r3, [sp]
    cmp r0, #0x1
    str r3, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r0, #0x2
    ldr r1, _LIT8
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [sl, #0x38]
    mov r4, #0x13
    ldr r1, [r1, #0x2c]
    addeq r4, r4, #0x1
    add r2, sp, #0x3c
    add r1, r1, r4, lsl #0x3
    bl func_0201e964
.L_bc0:
    ldr r0, [sl, #0x8]
    cmp r0, #0x3
    bge .L_c54
    ldr r0, [sl, #0x4]
    ldr r4, _LIT21
    cmp r0, #0x0
    mov r5, #0x15
    bne .L_bf4
    mov r0, sl
    mov r1, r4
    bl func_ov005_021aee84
    cmp r0, #0x0
    addne r5, r5, #0x1
.L_bf4:
    ldrh r1, [r4]
    ldrh r0, [r4, #0x2]
    mov r3, #0x0
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x3c]
    str r0, [sp, #0x40]
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r0, [r4, #0x8]
    ldr r1, _LIT8
    add r2, sp, #0x3c
    str r0, [sp, #0x8]
    ldrh r4, [r4, #0x6]
    mov r0, #0x2
    str r4, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [sl, #0x38]
    ldr r1, [r1, #0x2c]
    add r1, r1, r5, lsl #0x3
    bl func_0201e964
.L_c54:
    mov r0, #0x1
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov005_021b1568
_LIT1: .word 0x40f02000
_LIT2: .word 0x00600100
_LIT3: .word 0x050006b8
_LIT4: .word 0x00005402
_LIT5: .word data_ov005_021b1a44
_LIT6: .word 0x00005406
_LIT7: .word 0xc0004000
_LIT8: .word 0x0000ee80
_LIT9: .word 0x00000439
_LIT10: .word 0x8067408f
_LIT11: .word 0x80a6408f
_LIT12: .word 0x00000437
_LIT13: .word data_02104f4c
_LIT14: .word data_ov005_021b1ab2
_LIT15: .word 0x80df408f
_LIT16: .word 0x0000043b
_LIT17: .word data_021040ac
_LIT18: .word 0x0000581e
_LIT19: .word 0x00004008
_LIT20: .word data_ov005_021b1d4c
_LIT21: .word data_ov005_021b1a76
