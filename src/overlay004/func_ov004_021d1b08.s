; func_ov004_021d1b08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern data_021a18b8
        .extern data_021a1974
        .extern data_ov004_02200e00
        .extern data_ov004_0220b500
        .extern data_ov004_02211548
        .extern func_02005dac
        .extern func_0201d014
        .extern func_02021c28
        .extern func_0202c9b0
        .extern func_0202cdf8
        .extern func_02037208
        .extern func_0207fd28
        .extern func_020822a0
        .extern func_020822c8
        .extern func_020822f0
        .extern func_02084aec
        .extern func_0208b16c
        .extern func_0208e014
        .extern func_0208e1cc
        .extern func_020944a4
        .extern func_02094588
        .extern func_ov004_021ca0a4
        .extern func_ov004_021ca128
        .extern func_ov004_021cfd6c
        .extern func_ov004_021d0168
        .extern func_ov004_021d03ec
        .extern func_ov004_021d1a38
        .global func_ov004_021d1b08
        .arm
func_ov004_021d1b08:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x6c
    ldr r0, _LIT0
    ldr r0, [r0, #0x54]
    cmp r0, #0xf
    beq .L_4ec
    mov r8, #0x0
    mov fp, r8
.L_f0:
    ldr r0, _LIT0
    cmp r8, #0x0
    add r0, r0, r8, lsl #0x2
    movne sl, #0x25
    add r0, r0, #0xc
    moveq sl, #0x6a
    add r9, r0, #0x3c00
    add r0, r8, #0x6
    sub r1, sl, #0x3
    str r0, [sp, #0x18]
    ldr r0, _LIT0
    and r1, r1, #0xff
    orr r7, r1, #0x2000
    add r0, r0, #0xf90
    orr r7, r7, #-2147483648
    mov r4, #0x0
    mov r5, #0x9
    mov r6, #0xf
    str r0, [sp, #0x1c]
.L_13c:
    ldr r0, [r9]
    cmp r4, r0
    bge .L_194
    mov r0, r5, lsl #0x17
    orr r0, r7, r0, lsr #0x7
    str r0, [sp, #0x28]
    add r0, r4, fp
    mov r0, r0, lsl #0xa
    add r1, r0, #0x10000
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    mov r0, r0, asr #0x7
    orr r0, r0, #0x2400
    strh r0, [sp, #0x2c]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x28
    mov r2, #0x6
    bl func_020944a4
    b .L_1bc
.L_194:
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [sp, #0x18]
    mov r1, #0x2
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x1c]
    mov r2, r6
    add r0, r0, #0x5000
    mov r3, sl
    bl func_ov004_021ca0a4
.L_1bc:
    add r5, r5, #0x17
    add r6, r6, #0x17
    add r4, r4, #0x1
    cmp r4, #0xa
    blt .L_13c
    ldr r0, [r9]
    cmp r0, #0x0
    beq .L_244
    ldr r0, _LIT0
    rsb r1, r8, #0x1
    add r0, r0, r1, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc6c]
    cmp r0, #0x0
    beq .L_244
    bics r0, r0, #0x1b
    beq .L_244
    ldr r0, _LIT0
    mov r1, #0x0
    add r0, r0, r8, lsl #0x2
    str r1, [sp]
    mov r1, #0x4
    add r0, r0, #0x3000
    str r1, [sp, #0x4]
    ldr r1, [r0, #0xc64]
    mov r0, #0x17
    mul r2, r1, r0
    ldr r0, _LIT0
    add r2, r2, #0xf
    add r0, r0, #0xf90
    add r0, r0, #0x5000
    add r3, sl, #0x2
    mov r1, #0x2
    bl func_ov004_021ca0a4
.L_244:
    ldr r0, _LIT0
    add r0, r0, r8, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc6c]
    cmp r0, #0x0
    beq .L_298
    ldr r0, _LIT0
    cmp r8, #0x0
    movne r3, #0x8
    moveq r3, #0xa3
    cmp r8, #0x0
    movne r2, #0x5a
    add r0, r0, #0xf90
    mov r1, #0x0
    str r1, [sp]
    mov r4, #0x5
    moveq r2, #0x8f
    add r0, r0, #0x5000
    mov r1, #0x2
    str r4, [sp, #0x4]
    bl func_ov004_021ca0a4
.L_298:
    add r8, r8, #0x1
    cmp r8, #0x2
    add fp, fp, #0xa
    blt .L_f0
    ldr r0, _LIT0
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    bne .L_3ac
    ldr r0, _LIT0
    add r0, r0, #0x3000
    ldr r1, [r0, #0xc84]
    cmp r1, #0x0
    beq .L_2e0
    cmp r1, #0x1
    beq .L_33c
    cmp r1, #0x2
    beq .L_398
    b .L_3ac
.L_2e0:
    ldr r1, [r0, #0xc80]
    mov r0, #0x17
    mul r0, r1, r0
    add r0, r0, #0xf
    mov r1, #0x25
    mov r2, #0x14
    mov r3, #0x1a
    bl func_ov004_021d1a38
    ldr r0, _LIT0
    add r0, r0, #0x3000
    ldr r1, [r0, #0xc80]
    ldr r0, [r0, #0xc10]
    cmp r1, r0
    bge .L_330
    ldr r0, _LIT0
    add r0, r0, r1, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc3c]
    bl func_ov004_021d0168
    b .L_3ac
.L_330:
    mov r0, #0x0
    bl func_ov004_021d0168
    b .L_3ac
.L_33c:
    ldr r1, [r0, #0xc80]
    mov r0, #0x17
    mul r0, r1, r0
    add r0, r0, #0xf
    mov r1, #0x6a
    mov r2, #0x14
    mov r3, #0x1a
    bl func_ov004_021d1a38
    ldr r0, _LIT0
    add r0, r0, #0x3000
    ldr r1, [r0, #0xc80]
    ldr r0, [r0, #0xc0c]
    cmp r1, r0
    bge .L_38c
    ldr r0, _LIT0
    add r0, r0, r1, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc14]
    bl func_ov004_021d0168
    b .L_3ac
.L_38c:
    mov r0, #0x0
    bl func_ov004_021d0168
    b .L_3ac
.L_398:
    mov r0, #0x29
    mov r1, #0x89
    mov r2, #0xae
    mov r3, #0x15
    bl func_ov004_021d1a38
.L_3ac:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0, #0x9c]
    mov r3, #0x89
    cmp r0, #0x1
    ldr r0, _LIT0
    moveq r2, #0x1
    movne r2, #0x0
    add r0, r0, #0xf90
    str r1, [sp]
    add r4, r2, #0x8
    add r0, r0, #0x5000
    mov r1, #0x2
    mov r2, #0x29
    str r4, [sp, #0x4]
    bl func_ov004_021ca0a4
    mov r0, #0x20
    mov r1, #0x8d
    mov r2, #0x0
    bl func_ov004_021cfd6c
    ldr r0, _LIT0
    mov r1, #0x0
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc84]
    mov r3, #0x51
    cmp r0, #0x0
    ldr r0, _LIT0
    moveq r2, #0x1
    movne r2, #0x0
    add r0, r0, #0xf90
    str r1, [sp]
    add r4, r2, #0x1
    add r0, r0, #0x5000
    mov r1, #0x2
    mov r2, #0xa
    str r4, [sp, #0x4]
    bl func_ov004_021ca128
    ldr r0, _LIT0
    mov r1, #0x0
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc84]
    mov r3, #0x51
    cmp r0, #0x0
    ldr r0, _LIT0
    moveq r2, #0x1
    movne r2, #0x0
    add r0, r0, #0xf90
    str r1, [sp]
    add r4, r2, #0x1
    add r0, r0, #0x5000
    mov r1, #0x2
    mov r2, #0xe7
    str r4, [sp, #0x4]
    bl func_ov004_021ca128
    ldr r0, _LIT0
    mov r1, #0x1000
    add r0, r0, #0x5000
    ldr r0, [r0, #0xfa4]
    bl func_0207fd28
    ldr r0, _LIT0
    mov r1, #0x1000
    add r0, r0, #0x5000
    ldr r0, [r0, #0xfa8]
    bl func_0207fd28
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0, #0xa0]
    mov r2, #0xe0
    cmp r0, #0x1
    ldr r0, _LIT0
    moveq r4, #0x1
    add r0, r0, #0xf90
    str r1, [sp]
    movne r4, #0x0
    add r0, r0, #0x5000
    mov r1, #0x2
    mov r3, #0xa4
    str r4, [sp, #0x4]
    bl func_ov004_021ca0a4
    b .L_848
.L_4ec:
    ldr r0, _LIT0
    add r0, r0, #0x3000
    ldr sl, [r0, #0xc78]
    ldr r0, [r0, #0xc74]
    cmp r0, sl
    movle sl, r0
    cmp sl, #0x80
    bne .L_520
    mov r0, #0x5f
    sub r1, r0, #0x60
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_520:
    cmp sl, #0x80
    movge sl, #0x80
    rsb r0, sl, #0x80
    mov r8, #0x0
    ldr r7, _LIT0
    str r0, [sp, #0x8]
    mov r0, r7
    mov r6, r8
    add r4, r0, #0xf90
    add fp, r0, #0x3000
.L_548:
    cmp r8, #0x0
    movne r3, sl
    ldreq r3, [sp, #0x8]
    mov r0, #0x6a
    mul r1, r3, r0
    rsb r2, r3, #0x80
    mov r0, #0x25
    mla r1, r2, r0, r1
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    mov r5, r0, asr #0x7
    ldr r0, _LIT0
    add r1, r0, r8, lsl #0x2
    add r0, r1, #0x64
    add r9, r0, #0x3c00
    add r0, r1, #0x3000
    ldr r0, [r0, #0xc64]
    sub r1, r5, #0x3
    add r0, r6, r0
    and r2, r1, #0xff
    ldr r1, _LIT1
    mov r0, r0, lsl #0xa
    orr r1, r2, r1
    add r0, r0, #0x10000
    str r1, [sp, #0x20]
    mov r1, r0, asr #0x6
    add r0, r0, r1, lsr #0x19
    mov r0, r0, asr #0x7
    orr r0, r0, #0x2800
    strh r0, [sp, #0x24]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x20
    mov r2, #0x6
    bl func_020944a4
    ldr r0, _LIT0
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    bne .L_634
    cmp r8, #0x0
    moveq r1, #0x1
    ldr r0, [fp, #0xc84]
    movne r1, #0x0
    cmp r0, r1
    bne .L_634
    mov r1, r5
    mov r0, #0x76
    mov r2, #0x14
    mov r3, #0x1a
    bl func_ov004_021d1a38
    cmp sl, #0x0
    bne .L_634
    ldr r0, [r9]
    add r0, r7, r0, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc14]
    bl func_ov004_021d0168
.L_634:
    ldr r0, _LIT0
    add r0, r0, r8, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc74]
    cmp r0, #0x0
    beq .L_680
    cmp r8, #0x0
    movne r3, #0x8
    mov r0, #0x0
    moveq r3, #0xa3
    cmp r8, #0x0
    movne r2, #0x5a
    str r0, [sp]
    mov r0, #0x5
    str r0, [sp, #0x4]
    moveq r2, #0x8f
    add r0, r4, #0x5000
    mov r1, #0x2
    bl func_ov004_021ca0a4
.L_680:
    add r6, r6, #0xa
    add r7, r7, #0x28
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_548
    ldr r0, _LIT0
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    bne .L_6f0
    ldr r0, _LIT0
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc84]
    cmp r0, #0x2
    beq .L_6c4
    cmp r0, #0x3
    beq .L_6dc
    b .L_6f0
.L_6c4:
    mov r0, #0x2f
    mov r1, #0x89
    mov r2, #0x4a
    mov r3, #0x15
    bl func_ov004_021d1a38
    b .L_6f0
.L_6dc:
    mov r0, #0x84
    mov r1, #0x89
    mov r2, #0x4a
    mov r3, #0x15
    bl func_ov004_021d1a38
.L_6f0:
    cmp sl, #0x0
    beq .L_724
    cmp sl, #0x40
    bge .L_724
    ldr r0, _LIT0
    add r0, r0, #0x3000
    ldr r1, [r0, #0xc64]
    ldr r0, _LIT0
    add r0, r0, r1, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc14]
    bl func_ov004_021d0168
    b .L_74c
.L_724:
    cmp sl, #0x0
    beq .L_74c
    ldr r0, _LIT0
    add r0, r0, #0x3000
    ldr r1, [r0, #0xc68]
    ldr r0, _LIT0
    add r0, r0, r1, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc3c]
    bl func_ov004_021d0168
.L_74c:
    ldr r0, _LIT0
    mov r1, #0x0
    add r0, r0, #0xf90
    str r1, [sp]
    mov r4, #0x1
    add r0, r0, #0x5000
    mov r1, #0x2
    mov r2, #0xa
    mov r3, #0x51
    str r4, [sp, #0x4]
    bl func_ov004_021ca128
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [sp]
    add r0, r0, #0xf90
    add r0, r0, #0x5000
    mov r1, #0x2
    mov r2, #0xe7
    mov r3, #0x51
    str r4, [sp, #0x4]
    bl func_ov004_021ca128
    ldr r0, _LIT0
    mov r1, #0x1000
    add r0, r0, #0x5000
    ldr r0, [r0, #0xfa4]
    bl func_0207fd28
    ldr r0, _LIT0
    mov r1, #0x1000
    add r0, r0, #0x5000
    ldr r0, [r0, #0xfa8]
    bl func_0207fd28
    ldr r0, _LIT0
    mov r1, #0x3
    ldr r0, [r0, #0x9c]
    mov r3, #0x89
    cmp r0, #0x1
    moveq r2, r4
    ldr r0, _LIT0
    movne r2, #0x0
    add r0, r0, #0xf90
    str r1, [sp]
    add r1, r2, #0xa
    str r1, [sp, #0x4]
    add r0, r0, #0x5000
    mov r1, #0x2
    mov r2, #0x2f
    bl func_ov004_021ca0a4
    ldr r0, _LIT0
    mov r1, #0x3
    ldr r0, [r0, #0xa0]
    mov r3, #0x89
    cmp r0, #0x1
    ldr r0, _LIT0
    moveq r2, #0x1
    movne r2, #0x0
    add r0, r0, #0xf90
    str r1, [sp]
    add r4, r2, #0xa
    add r0, r0, #0x5000
    mov r1, #0x2
    mov r2, #0x84
    str r4, [sp, #0x4]
    bl func_ov004_021ca0a4
.L_848:
    bl func_0202c9b0
    cmp r0, #0x0
    beq .L_958
    ldr r0, _LIT0
    ldr r1, [r0, #0x54]
    mov r0, #0x1000
    cmp r1, #0xf
    bne .L_8a4
    ldr r0, _LIT0
    add r0, r0, #0x3000
    ldr r1, [r0, #0xc78]
    ldr r0, [r0, #0xc74]
    cmp r0, r1
    movle r1, r0
    subs r0, r1, #0x40
    rsbmi r0, r0, #0x0
    cmp r0, #0x20
    movgt r0, #0x20
    mov r0, r0, lsl #0x9
    mov r1, r0, asr #0x4
    ldr r0, _LIT2
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
.L_8a4:
    bl func_ov004_021d03ec
    ldr r0, _LIT3
    add r3, sp, #0x60
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r4, _LIT4
    add r3, sp, #0x54
    ldmia r4, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    add r0, sp, #0x30
    bl func_0208b16c
    ldr r1, _LIT5
    add r0, sp, #0x30
    bl func_02094588
    ldr r1, _LIT6
    add r0, sp, #0x60
    ldr r2, [r1, #0xfc]
    bic r2, r2, #0xa4
    str r2, [r1, #0xfc]
    bl func_020822a0
    add r0, sp, #0x54
    bl func_020822c8
    bl func_020822f0
    ldr r0, _LIT7
    bl func_02084aec
    bl func_0202cdf8
    cmp r0, #0x0
    beq .L_98c
    ldr r0, _LIT0
    mov r3, #0x0
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc8c]
    mov r2, #0xe3
    cmp r0, #0x1
    ldr r0, _LIT0
    moveq r1, #0x1
    movne r1, #0x0
    add r0, r0, #0xf90
    add r4, r1, #0x2
    str r3, [sp]
    add r0, r0, #0x5000
    mov r1, #0x2
    str r4, [sp, #0x4]
    bl func_ov004_021ca0a4
    b .L_98c
.L_958:
    bl func_0208e1cc
    mov r4, r0
    bl func_0201d014
    mov r0, r0, lsl #0x2
    add r0, r0, #0x1
    orr r1, r0, #0x5000
    strh r1, [r4, #0x3c]
    add r0, r1, #0x1
    strh r0, [r4, #0x3e]
    add r0, r1, #0x2
    strh r0, [r4, #0x7c]
    add r0, r1, #0x3
    strh r0, [r4, #0x7e]
.L_98c:
    ldr r0, _LIT0
    mov r7, #0x0
    ldr r1, [r0]
    ldr r2, _LIT8
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x3
    ldr r2, _LIT9
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x1
    mov r2, #0xc
    smull r0, r1, r2, r4
    sub r4, r3, r0
    mov fp, r7
    cmp r4, #0x3
    blt .L_9d8
    cmp r4, #0x6
    sublt r7, r4, #0x2
.L_9d8:
    cmp r4, #0x9
    blt .L_9e8
    cmp r4, #0xc
    sublt fp, r4, #0x8
.L_9e8:
    sub r0, r7, #0x1
    mov r0, r0, lsl #0x2
    mov r9, #0x0
    sub r1, fp, #0x1
    str r0, [sp, #0x10]
    mov r0, r1, lsl #0x2
    str r9, [sp, #0x14]
    str r0, [sp, #0xc]
.L_a08:
    ldr r1, _LIT0
    ldr r0, [sp, #0x10]
    mov sl, #0x0
    add r2, r1, r0, lsl #0x1
    ldr r0, [sp, #0xc]
    add r6, r2, r9, lsl #0x1
    add r1, r1, r0, lsl #0x1
    ldr r0, _LIT0
    add r4, r1, r9, lsl #0x1
    add r5, r0, r9, lsl #0x1
.L_a30:
    cmp r7, #0x0
    addeq r0, r5, sl, lsl #0x1
    addeq r0, r0, #0x5500
    ldreqh r8, [r0, #0xae]
    beq .L_a50
    add r0, r6, sl, lsl #0x1
    add r0, r0, #0x5200
    ldrh r8, [r0, #0x58]
.L_a50:
    bl func_0208e014
    add r0, r0, r9, lsl #0x1
    add r0, r0, sl, lsl #0x1
    strh r8, [r0, #0xd6]
    cmp fp, #0x0
    addeq r0, r5, sl, lsl #0x1
    addeq r0, r0, #0x5500
    ldreqh r8, [r0, #0xba]
    beq .L_a80
    add r0, r4, sl, lsl #0x1
    add r0, r0, #0x5300
    ldrh r8, [r0, #0x58]
.L_a80:
    bl func_0208e014
    add r0, r0, r9, lsl #0x1
    add r0, r0, sl, lsl #0x1
    add sl, sl, #0x1
    strh r8, [r0, #0xe2]
    cmp sl, #0x4
    blt .L_a30
    ldr r0, [sp, #0x14]
    add r9, r9, #0x20
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    cmp r0, #0x4
    blt .L_a08
    bl func_02021c28
    add sp, sp, #0x6c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0x80702000
_LIT2: .word data_020bef80
_LIT3: .word data_ov004_02200e00+0x24
_LIT4: .word data_ov004_02200e00+0xc
_LIT5: .word data_021a1974
_LIT6: .word data_021a18b8
_LIT7: .word data_ov004_02211548
_LIT8: .word 0x66666667
_LIT9: .word 0x2aaaaaab
