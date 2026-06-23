; func_ov006_021b930c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cb1cc
        .extern data_ov006_021cb1e8
        .extern data_ov006_021cb23c
        .extern data_ov006_021cb264
        .extern data_ov006_0224f2c0
        .extern data_ov006_0225bdc0
        .extern func_0202b060
        .extern func_0202b2e8
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_0202b854
        .extern func_0202b86c
        .extern func_0202b8fc
        .extern func_0202b92c
        .extern func_0202bacc
        .extern func_0202bb24
        .extern func_0202de48
        .global func_ov006_021b930c
        .arm
func_ov006_021b930c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldrh r6, [r0]
    ldrh r7, [r1]
    mov r0, r6
    bl func_0202bacc
    mov r4, r0
    mov r0, r7
    bl func_0202bacc
    ldr r1, _LIT0
    mov r5, r0
    ldrh r0, [r1]
    tst r0, #0x1
    beq .L_54
    mov r0, r6
    bl func_0202b2e8
    mov r8, r0
    mov r0, r7
    bl func_0202b2e8
    cmp r8, r0
    subne r0, r8, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_54:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x2
    beq .L_84
    mov r0, r6
    bl func_0202de48
    mov r8, r0
    mov r0, r7
    bl func_0202de48
    cmp r8, r0
    subne r0, r8, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_84:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x4
    beq .L_130
    mov r0, r6
    bl func_0202de48
    mov r8, r0
    mov r0, r7
    bl func_0202de48
    cmp r8, #0x7
    moveq r1, #0xfe
    beq .L_c0
    cmp r8, #0x8
    moveq r1, #0xff
    movne r1, #0x0
.L_c0:
    cmp r0, #0x7
    moveq r0, #0xfe
    beq .L_d8
    cmp r0, #0x8
    moveq r0, #0xff
    movne r0, #0x0
.L_d8:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r1, #0x0
    bne .L_130
    cmp r4, #0x0
    mvneq r8, #0x1
    beq .L_108
    mov r0, r6
    bl func_0202b8fc
    mov r0, r0, lsl #0x10
    mov r8, r0, asr #0x10
.L_108:
    cmp r5, #0x0
    mvneq r0, #0x1
    beq .L_124
    mov r0, r7
    bl func_0202b8fc
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
.L_124:
    cmp r8, r0
    subne r0, r0, r8
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_130:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8
    beq .L_1dc
    mov r0, r6
    bl func_0202de48
    mov r8, r0
    mov r0, r7
    bl func_0202de48
    cmp r8, #0x7
    moveq r1, #0xfe
    beq .L_16c
    cmp r8, #0x8
    moveq r1, #0xff
    movne r1, #0x0
.L_16c:
    cmp r0, #0x7
    moveq r0, #0xfe
    beq .L_184
    cmp r0, #0x8
    moveq r0, #0xff
    movne r0, #0x0
.L_184:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r1, #0x0
    bne .L_1dc
    cmp r4, #0x0
    mvneq r8, #0x1
    beq .L_1b4
    mov r0, r6
    bl func_0202b92c
    mov r0, r0, lsl #0x10
    mov r8, r0, asr #0x10
.L_1b4:
    cmp r5, #0x0
    mvneq r0, #0x1
    beq .L_1d0
    mov r0, r7
    bl func_0202b92c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
.L_1d0:
    cmp r8, r0
    subne r0, r0, r8
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_1dc:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x10
    beq .L_284
    mov r0, r6
    bl func_0202de48
    mov r8, r0
    mov r0, r7
    bl func_0202de48
    cmp r8, #0x7
    moveq r1, #0xfe
    beq .L_218
    cmp r8, #0x8
    moveq r1, #0xff
    movne r1, #0x0
.L_218:
    cmp r0, #0x7
    moveq r0, #0xfe
    beq .L_230
    cmp r0, #0x8
    moveq r0, #0xff
    movne r0, #0x0
.L_230:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r1, #0x0
    bne .L_284
    mov r0, r6
    bl func_0202b83c
    mov r8, r0
    mov r0, r7
    bl func_0202b83c
    cmp r4, #0x0
    ldrne r1, _LIT1
    ldrne r2, [r1, r8, lsl #0x2]
    moveq r2, #0xff
    cmp r5, #0x0
    ldrne r1, _LIT1
    ldrne r0, [r1, r0, lsl #0x2]
    moveq r0, #0xff
    cmp r2, r0
    subne r0, r2, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_284:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x20
    beq .L_32c
    mov r0, r6
    bl func_0202de48
    mov r8, r0
    mov r0, r7
    bl func_0202de48
    cmp r8, #0x7
    moveq r1, #0xfe
    beq .L_2c0
    cmp r8, #0x8
    moveq r1, #0xff
    movne r1, #0x0
.L_2c0:
    cmp r0, #0x7
    moveq r0, #0xfe
    beq .L_2d8
    cmp r0, #0x8
    moveq r0, #0xff
    movne r0, #0x0
.L_2d8:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r1, #0x0
    bne .L_32c
    mov r0, r6
    bl func_0202b824
    mov r8, r0
    mov r0, r7
    bl func_0202b824
    cmp r4, #0x0
    ldrne r1, _LIT2
    ldrne r2, [r1, r8, lsl #0x2]
    moveq r2, #0xff
    cmp r5, #0x0
    ldrne r1, _LIT2
    ldrne r0, [r1, r0, lsl #0x2]
    moveq r0, #0xff
    cmp r2, r0
    subne r0, r2, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_32c:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x40
    beq .L_3cc
    mov r0, r6
    bl func_0202de48
    mov r8, r0
    mov r0, r7
    bl func_0202de48
    cmp r8, #0x7
    moveq r1, #0xfe
    beq .L_368
    cmp r8, #0x8
    moveq r1, #0xff
    movne r1, #0x0
.L_368:
    cmp r0, #0x7
    moveq r0, #0xfe
    beq .L_380
    cmp r0, #0x8
    moveq r0, #0xff
    movne r0, #0x0
.L_380:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r1, #0x0
    bne .L_3cc
    cmp r4, #0x0
    mvneq r8, #0x0
    beq .L_3ac
    mov r0, r6
    bl func_0202b854
    mov r8, r0
.L_3ac:
    cmp r5, #0x0
    mvneq r0, #0x0
    beq .L_3c0
    mov r0, r7
    bl func_0202b854
.L_3c0:
    cmp r8, r0
    subne r0, r0, r8
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_3cc:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x80
    beq .L_4bc
    mov r0, r6
    bl func_0202de48
    mov r8, r0
    mov r0, r7
    bl func_0202de48
    cmp r8, #0x7
    mvneq r1, #0x1
    beq .L_408
    cmp r8, #0x8
    mvneq r1, #0x0
    movne r1, r8
.L_408:
    cmp r0, #0x7
    mvneq r0, #0x1
    beq .L_41c
    cmp r0, #0x8
    mvneq r0, #0x0
.L_41c:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r8, #0x7
    bne .L_474
    mov r0, r6
    bl func_0202b86c
    mov r8, r0
    mov r0, r7
    bl func_0202b86c
    cmp r4, #0x0
    ldrne r1, _LIT3
    ldrne r2, [r1, r8, lsl #0x2]
    moveq r2, #0xff
    cmp r5, #0x0
    ldrne r1, _LIT3
    ldrne r0, [r1, r0, lsl #0x2]
    moveq r0, #0xff
    cmp r2, r0
    beq .L_4bc
    sub r0, r2, r0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_474:
    cmp r8, #0x8
    bne .L_4bc
    mov r0, r6
    bl func_0202b86c
    mov r8, r0
    mov r0, r7
    bl func_0202b86c
    cmp r4, #0x0
    ldrne r1, _LIT4
    ldrne r2, [r1, r8, lsl #0x2]
    moveq r2, #0xff
    cmp r5, #0x0
    ldrne r1, _LIT4
    ldrne r0, [r1, r0, lsl #0x2]
    moveq r0, #0xff
    cmp r2, r0
    subne r0, r2, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_4bc:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x100
    beq .L_510
    cmp r4, #0x0
    moveq r8, #0xff
    beq .L_4e8
    mov r0, r6
    bl func_0202b060
    ldr r1, _LIT5
    ldrb r8, [r1, r0]
.L_4e8:
    cmp r5, #0x0
    moveq r0, #0xff
    beq .L_504
    mov r0, r7
    bl func_0202b060
    ldr r1, _LIT5
    ldrb r0, [r1, r0]
.L_504:
    cmp r8, r0
    subne r0, r8, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_510:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x200
    beq .L_574
    cmp r4, #0x0
    beq .L_540
    mov r0, r6
    bl func_0202bb24
    cmp r0, #0x0
    movne r4, #0x1
    moveq r4, #0x0
    b .L_544
.L_540:
    mvn r4, #0x0
.L_544:
    cmp r5, #0x0
    beq .L_564
    mov r0, r7
    bl func_0202bb24
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    b .L_568
.L_564:
    mvn r0, #0x0
.L_568:
    cmp r4, r0
    subne r0, r0, r4
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_574:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x4000
    beq .L_5a4
    mov r0, r6
    bl func_0202de48
    mov r4, r0
    mov r0, r7
    bl func_0202de48
    cmp r4, r0
    subne r0, r4, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_5a4:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    beq .L_5d4
    mov r0, r6
    bl func_0202b2e8
    mov r4, r0
    mov r0, r7
    bl func_0202b2e8
    cmp r4, r0
    subne r0, r4, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_5d4:
    sub r0, r6, r7
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov006_0224f2c0
_LIT1: .word data_ov006_021cb23c
_LIT2: .word data_ov006_021cb264
_LIT3: .word data_ov006_021cb1cc
_LIT4: .word data_ov006_021cb1e8
_LIT5: .word data_ov006_0225bdc0
