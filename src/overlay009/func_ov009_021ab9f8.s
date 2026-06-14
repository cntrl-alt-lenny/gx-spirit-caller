; func_ov009_021ab9f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov009_021ad84c
        .extern data_ov009_021ada18
        .extern data_ov009_021adaa8
        .extern data_ov009_021adab4
        .extern data_ov009_021adac0
        .extern data_ov009_021adacc
        .extern data_ov009_021adad8
        .extern data_ov009_021adae4
        .extern func_02005dac
        .extern func_020061ac
        .extern func_0201e964
        .extern func_0202cdf8
        .extern func_020944a4
        .extern func_ov009_021ac458
        .extern func_ov009_021acf1c
        .extern func_ov009_021ad214
        .global func_ov009_021ab9f8
        .arm
func_ov009_021ab9f8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x3c
    ldr r1, _LIT0
    mov sl, r0
    ldrh r3, [r1]
    ldrh r0, [r1, #0x2]
    ldrh r2, [r1, #0x4]
    strh r3, [sp, #0x30]
    strh r0, [sp, #0x32]
    ldrh r0, [r1, #0x6]
    strh r2, [sp, #0x34]
    strh r0, [sp, #0x36]
    ldrh r0, [r1, #0x8]
    strh r0, [sp, #0x38]
    ldr r0, [sl, #0x28]
    cmp r0, #0x0
    bne .L_3a4
    bl func_020061ac
    cmp r0, #0x0
    bne .L_3a4
    ldr r0, [sl, #0x3c]
    cmp r0, #0x0
    beq .L_190
    mov r1, #0x0
    mov r0, sl
    str r1, [sl, #0x3c]
    bl func_ov009_021acf1c
    and r0, r0, #0xf
    cmp r0, #0xe
    ldreq r0, [sl, #0x38]
    ldreq r2, _LIT1
    addeq r1, r0, #0x10
    beq .L_17c
    mov r0, sl
    bl func_ov009_021acf1c
    ldr r2, _LIT1
    and r1, r0, #0xf
.L_17c:
    mov r0, #0xc
    mla r2, r1, r0, r2
    mov r0, #0x1
    str r0, [sl, #0x3c]
    b .L_1d4
.L_190:
    mov r0, sl
    bl func_ov009_021acf1c
    and r0, r0, #0xf
    cmp r0, #0xe
    beq .L_1c0
    mov r0, sl
    bl func_ov009_021acf1c
    ldr r2, _LIT1
    and r1, r0, #0xf
    mov r0, #0xc
    mla r2, r1, r0, r2
    b .L_1d4
.L_1c0:
    ldr r0, [sl, #0x38]
    ldr r2, _LIT1
    add r1, r0, #0x10
    mov r0, #0xc
    mla r2, r1, r0, r2
.L_1d4:
    ldrh r1, [r2]
    ldrh r0, [r2, #0x2]
    sub r3, r1, #0x4
    sub r1, r0, #0x4
    str r3, [sp, #0x28]
    str r1, [sp, #0x2c]
    ldr r0, [sl, #0x34]
    cmp r0, #0x0
    ble .L_234
    and r0, r1, #0xff
    ldr r2, _LIT2
    mov r1, r3, lsl #0x17
    orr r0, r0, #-1073741824
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x20
    mov r2, #0x6
    bl func_020944a4
    b .L_388
.L_234:
    ldr r0, [sl, #0x38]
    ldr r2, _LIT3
    cmp r0, #0x1
    and r0, r1, #0xff
    bgt .L_358
    orr r0, r0, #0x4000
    mov r1, r3, lsl #0x17
    orr r0, r0, #-1073741824
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x20
    mov r2, #0x6
    bl func_020944a4
    ldr r0, [sp, #0x2c]
    ldr r1, [sp, #0x28]
    add r0, r0, #0x1e
    ldr r2, _LIT4
    mov r1, r1, lsl #0x17
    and r0, r0, #0xff
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x20
    mov r2, #0x6
    bl func_020944a4
    ldr r0, [sp, #0x2c]
    ldr r1, [sp, #0x28]
    add r0, r0, #0x1e
    and r0, r0, #0xff
    add r1, r1, #0x20
    orr r0, r0, #0x4000
    mov r1, r1, lsl #0x17
    orr r0, r0, #0x40000000
    orr r0, r0, r1, lsr #0x7
    ldr r1, _LIT5
    str r0, [sp, #0x20]
    strh r1, [sp, #0x24]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x20
    mov r2, #0x6
    bl func_020944a4
    ldr r0, [sp, #0x2c]
    ldr r1, [sp, #0x28]
    add r0, r0, #0x26
    and r0, r0, #0xff
    orr r0, r0, #0x4000
    mov r1, r1, lsl #0x17
    orr r0, r0, #-1073741824
    orr r0, r0, r1, lsr #0x7
    ldr r1, _LIT3
    orr r0, r0, #0x20000000
    str r0, [sp, #0x20]
    strh r1, [sp, #0x24]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x20
    mov r2, #0x6
    bl func_020944a4
    b .L_388
.L_358:
    mov r1, r3, lsl #0x17
    orr r0, r0, #-1073741824
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x20
    mov r2, #0x6
    bl func_020944a4
.L_388:
    ldr r4, _LIT6
    ldr r1, _LIT7
    add r2, sp, #0x30
    mov r0, sl
    mov r3, #0x5
    str r4, [sp]
    bl func_ov009_021ad214
.L_3a4:
    mov r7, #0x0
    ldr r8, _LIT1
    mov r9, r7
    mov r6, r7
    mov r5, r7
    mov r4, #0x2200
    mov fp, #0x2
.L_3c0:
    ldrh r1, [r8]
    ldrh r0, [r8, #0x2]
    add r1, r1, #0x1
    add r0, r0, #0x1
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x28]
    str r0, [sp, #0x2c]
    ldr r0, [sl, #0x28]
    cmp r0, #0x0
    movne r0, r6
    bne .L_3fc
    mov r0, sl
    mov r1, r8
    bl func_ov009_021ac458
.L_3fc:
    str r5, [sp]
    str r5, [sp, #0x4]
    ldrh r2, [r8, #0xa]
    add r1, r0, r9
    mov r0, fp
    str r2, [sp, #0x8]
    ldrh ip, [r8, #0x8]
    add r2, sp, #0x28
    mov r3, r5
    str ip, [sp, #0xc]
    str r4, [sp, #0x10]
    str r5, [sp, #0x14]
    str r5, [sp, #0x18]
    str r5, [sp, #0x1c]
    ldr ip, [sl, #0xc]
    ldr ip, [ip, #0x2c]
    add r1, ip, r1, lsl #0x3
    bl func_0201e964
    add r7, r7, #0x1
    cmp r7, #0xc
    add r8, r8, #0xc
    add r9, r9, #0x2
    blt .L_3c0
    ldr r5, _LIT8
    ldr r0, _LIT9
    ldrh r2, [r5]
    ldrh r1, [r5, #0x2]
    ldr r3, [r0, #0x4]
    add r2, r2, #0x1
    add r0, r1, #0x1
    mov r1, r2, lsl #0xc
    mov r0, r0, lsl #0xc
    mov r2, r3, lsl #0x1d
    str r1, [sp, #0x28]
    str r0, [sp, #0x2c]
    ldr r0, [sl, #0x28]
    mov r4, r2, lsr #0x1d
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_4a8
    mov r0, sl
    mov r1, r5
    bl func_ov009_021ac458
.L_4a8:
    mov r3, #0x0
    cmp r4, #0x0
    mov r6, #0x2200
    str r3, [sp]
    bne .L_500
    str r3, [sp, #0x4]
    ldrh r2, [r5, #0xa]
    add r1, r0, #0x18
    mov r0, #0x2
    str r2, [sp, #0x8]
    ldrh r5, [r5, #0x8]
    add r2, sp, #0x28
    str r5, [sp, #0xc]
    str r6, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r5, [sl, #0xc]
    ldr r5, [r5, #0x2c]
    add r1, r5, r1, lsl #0x3
    bl func_0201e964
    b .L_540
.L_500:
    str r3, [sp, #0x4]
    ldrh r2, [r5, #0xa]
    add r1, r0, #0x1c
    mov r0, #0x2
    str r2, [sp, #0x8]
    ldrh r5, [r5, #0x8]
    add r2, sp, #0x28
    str r5, [sp, #0xc]
    str r6, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r5, [sl, #0xc]
    ldr r5, [r5, #0x2c]
    add r1, r5, r1, lsl #0x3
    bl func_0201e964
.L_540:
    ldr r5, _LIT10
    ldrh r1, [r5]
    ldrh r0, [r5, #0x2]
    add r1, r1, #0x1
    add r0, r0, #0x1
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x28]
    str r0, [sp, #0x2c]
    ldr r0, [sl, #0x28]
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_580
    mov r0, sl
    mov r1, r5
    bl func_ov009_021ac458
.L_580:
    mov r3, #0x0
    cmp r4, #0x0
    str r3, [sp]
    bne .L_5d8
    str r3, [sp, #0x4]
    ldrh r2, [r5, #0xa]
    add r1, r0, #0x1a
    mov r4, #0x2200
    str r2, [sp, #0x8]
    ldrh r5, [r5, #0x8]
    add r2, sp, #0x28
    mov r0, #0x2
    str r5, [sp, #0xc]
    str r4, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r4, [sl, #0xc]
    ldr r4, [r4, #0x2c]
    add r1, r4, r1, lsl #0x3
    bl func_0201e964
    b .L_620
.L_5d8:
    str r3, [sp, #0x4]
    ldrh r2, [r5, #0xa]
    add r1, r4, #0xe
    add r1, r0, r1, lsl #0x1
    str r2, [sp, #0x8]
    ldrh r5, [r5, #0x8]
    mov r4, #0x2200
    add r2, sp, #0x28
    str r5, [sp, #0xc]
    str r4, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r4, [sl, #0xc]
    mov r0, #0x2
    ldr r4, [r4, #0x2c]
    add r1, r4, r1, lsl #0x3
    bl func_0201e964
.L_620:
    ldr r4, _LIT11
    ldrh r1, [r4]
    ldrh r0, [r4, #0x2]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x28]
    str r0, [sp, #0x2c]
    ldr r0, [sl, #0x28]
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_658
    mov r0, sl
    mov r1, r4
    bl func_ov009_021ac458
.L_658:
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r2, [r4, #0xa]
    add r1, r0, #0x2a
    mov r5, #0x2200
    str r2, [sp, #0x8]
    ldrh r4, [r4, #0x8]
    add r2, sp, #0x28
    mov r0, #0x2
    str r4, [sp, #0xc]
    str r5, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r4, [sl, #0xc]
    ldr r4, [r4, #0x2c]
    add r1, r4, r1, lsl #0x3
    bl func_0201e964
    ldr r5, _LIT12
    mov r3, #0x0
    ldrh r2, [r5]
    ldrh r0, [r5, #0x2]
    mov r1, #0x2200
    mov r2, r2, lsl #0xc
    mov r0, r0, lsl #0xc
    str r2, [sp, #0x28]
    str r0, [sp, #0x2c]
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r4, [r5, #0xa]
    add r2, sp, #0x28
    mov r0, #0x2
    str r4, [sp, #0x8]
    ldrh r4, [r5, #0x8]
    str r4, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [sl, #0xc]
    ldr r1, [r1, #0x2c]
    add r1, r1, #0x160
    bl func_0201e964
    ldr r5, _LIT13
    mov r3, #0x0
    ldrh r2, [r5]
    ldrh r0, [r5, #0x2]
    mov r1, #0x2200
    mov r2, r2, lsl #0xc
    mov r0, r0, lsl #0xc
    str r2, [sp, #0x28]
    str r0, [sp, #0x2c]
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r4, [r5, #0xa]
    add r2, sp, #0x28
    mov r0, #0x2
    str r4, [sp, #0x8]
    ldrh r4, [r5, #0x8]
    str r4, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [sl, #0xc]
    ldr r1, [r1, #0x2c]
    add r1, r1, #0x168
    bl func_0201e964
    ldr r3, _LIT14
    ldr r2, _LIT15
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    mov r8, #0xe4
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x20
    mov r2, #0x6
    bl func_020944a4
    ldr r0, _LIT9
    ldr r5, _LIT16
    ldr r9, [r0, #0xa60]
    sub r8, r8, #0xe
    mov r7, #0x2
    mov r6, #0x0
    add fp, sp, #0x20
    mov r4, #0xa
.L_7bc:
    smull r1, r2, r5, r9
    mov r0, r9, lsr #0x1f
    add r2, r0, r2, asr #0x2
    smull r0, r1, r4, r2
    sub r2, r9, r0
    mov r1, r8, lsl #0x17
    mov r1, r1, lsr #0x7
    orr r1, r1, #0x40000002
    orr r2, r2, #0x800
    str r1, [sp, #0x20]
    mov r0, r7
    mov r1, r6
    strh r2, [sp, #0x24]
    bl func_02005dac
    mov r1, r0
    mov r0, fp
    mov r2, #0x6
    bl func_020944a4
    mov r1, r9
    smull r0, r9, r5, r1
    mov r0, r1, lsr #0x1f
    add r9, r0, r9, asr #0x2
    cmp r9, #0x0
    sub r8, r8, #0xb
    bgt .L_7bc
    bl func_0202cdf8
    cmp r0, #0x0
    beq .L_8b0
    ldr r4, _LIT17
    ldrh r1, [r4]
    ldrh r0, [r4, #0x2]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x28]
    str r0, [sp, #0x2c]
    ldr r0, [sl, #0x28]
    cmp r0, #0x2
    movne r0, #0x0
    bne .L_864
    mov r0, sl
    mov r1, r4
    bl func_ov009_021ac458
.L_864:
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r2, [r4, #0xa]
    add r1, r0, #0x28
    mov r5, #0x2200
    str r2, [sp, #0x8]
    ldrh r4, [r4, #0x8]
    add r2, sp, #0x28
    mov r0, #0x2
    str r4, [sp, #0xc]
    str r5, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r4, [sl, #0xc]
    ldr r4, [r4, #0x2c]
    add r1, r4, r1, lsl #0x3
    bl func_0201e964
.L_8b0:
    mov r0, #0x1
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov009_021ad84c
_LIT1: .word data_ov009_021ada18
_LIT2: .word 0x0000100c
_LIT3: .word 0x0000101c
_LIT4: .word 0x0000101e
_LIT5: .word 0x0000101f
_LIT6: .word 0x00600100
_LIT7: .word 0x05000636
_LIT8: .word data_ov009_021adaa8
_LIT9: .word data_02104f4c
_LIT10: .word data_ov009_021adab4
_LIT11: .word data_ov009_021adac0
_LIT12: .word data_ov009_021adad8
_LIT13: .word data_ov009_021adae4
_LIT14: .word 0x40e40002
_LIT15: .word 0x0000080a
_LIT16: .word 0x66666667
_LIT17: .word data_ov009_021adacc
