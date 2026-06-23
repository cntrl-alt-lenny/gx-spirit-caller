; func_ov006_021b8f10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .extern func_0202bb24
        .extern func_0202de48
        .global func_ov006_021b8f10
        .arm
func_ov006_021b8f10:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    ldrh r4, [r0]
    ldrh r0, [r2]
    ldrh r5, [r1]
    tst r0, #0x1
    beq .L_3c
    mov r0, r4
    bl func_0202b2e8
    mov r6, r0
    mov r0, r5
    bl func_0202b2e8
    cmp r6, r0
    subne r0, r6, r0
    ldmneia sp!, {r4, r5, r6, pc}
.L_3c:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x2
    beq .L_6c
    mov r0, r4
    bl func_0202de48
    mov r6, r0
    mov r0, r5
    bl func_0202de48
    cmp r6, r0
    subne r0, r6, r0
    ldmneia sp!, {r4, r5, r6, pc}
.L_6c:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x4
    beq .L_fc
    mov r0, r4
    bl func_0202de48
    mov r6, r0
    mov r0, r5
    bl func_0202de48
    cmp r6, #0x7
    moveq r1, #0xfe
    beq .L_a8
    cmp r6, #0x8
    moveq r1, #0xff
    movne r1, #0x0
.L_a8:
    cmp r0, #0x7
    moveq r0, #0xfe
    beq .L_c0
    cmp r0, #0x8
    moveq r0, #0xff
    movne r0, #0x0
.L_c0:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r1, #0x0
    bne .L_fc
    mov r0, r4
    bl func_0202b8fc
    mov r1, r0, lsl #0x10
    mov r0, r5
    mov r6, r1, asr #0x10
    bl func_0202b8fc
    mov r0, r0, lsl #0x10
    cmp r6, r0, asr #0x10
    rsbne r0, r6, r0, asr #0x10
    ldmneia sp!, {r4, r5, r6, pc}
.L_fc:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8
    beq .L_18c
    mov r0, r4
    bl func_0202de48
    mov r6, r0
    mov r0, r5
    bl func_0202de48
    cmp r6, #0x7
    moveq r1, #0xfe
    beq .L_138
    cmp r6, #0x8
    moveq r1, #0xff
    movne r1, #0x0
.L_138:
    cmp r0, #0x7
    moveq r0, #0xfe
    beq .L_150
    cmp r0, #0x8
    moveq r0, #0xff
    movne r0, #0x0
.L_150:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r1, #0x0
    bne .L_18c
    mov r0, r4
    bl func_0202b92c
    mov r1, r0, lsl #0x10
    mov r0, r5
    mov r6, r1, asr #0x10
    bl func_0202b92c
    mov r0, r0, lsl #0x10
    cmp r6, r0, asr #0x10
    rsbne r0, r6, r0, asr #0x10
    ldmneia sp!, {r4, r5, r6, pc}
.L_18c:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x10
    beq .L_1c8
    mov r0, r4
    bl func_0202b83c
    mov r6, r0
    mov r0, r5
    bl func_0202b83c
    ldr r2, _LIT1
    ldr r1, [r2, r6, lsl #0x2]
    ldr r0, [r2, r0, lsl #0x2]
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, pc}
.L_1c8:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x20
    beq .L_204
    mov r0, r4
    bl func_0202b824
    mov r6, r0
    mov r0, r5
    bl func_0202b824
    ldr r2, _LIT2
    ldr r1, [r2, r6, lsl #0x2]
    ldr r0, [r2, r0, lsl #0x2]
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, pc}
.L_204:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x40
    beq .L_234
    mov r0, r4
    bl func_0202b854
    mov r6, r0
    mov r0, r5
    bl func_0202b854
    cmp r6, r0
    subne r0, r0, r6
    ldmneia sp!, {r4, r5, r6, pc}
.L_234:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x80
    beq .L_2fc
    mov r0, r4
    bl func_0202de48
    mov r6, r0
    mov r0, r5
    bl func_0202de48
    cmp r6, #0x7
    mvneq r1, #0x1
    beq .L_270
    cmp r6, #0x8
    mvneq r1, #0x0
    movne r1, r6
.L_270:
    cmp r0, #0x7
    mvneq r0, #0x1
    beq .L_284
    cmp r0, #0x8
    mvneq r0, #0x0
.L_284:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r6, #0x7
    bne .L_2c8
    mov r0, r4
    bl func_0202b86c
    mov r6, r0
    mov r0, r5
    bl func_0202b86c
    ldr r2, _LIT3
    ldr r1, [r2, r6, lsl #0x2]
    ldr r0, [r2, r0, lsl #0x2]
    cmp r1, r0
    beq .L_2fc
    sub r0, r1, r0
    ldmia sp!, {r4, r5, r6, pc}
.L_2c8:
    cmp r6, #0x8
    bne .L_2fc
    mov r0, r4
    bl func_0202b86c
    mov r6, r0
    mov r0, r5
    bl func_0202b86c
    ldr r2, _LIT4
    ldr r1, [r2, r6, lsl #0x2]
    ldr r0, [r2, r0, lsl #0x2]
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, pc}
.L_2fc:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x100
    beq .L_338
    mov r0, r4
    bl func_0202b060
    ldr r1, _LIT5
    ldrb r6, [r1, r0]
    mov r0, r5
    bl func_0202b060
    ldr r1, _LIT5
    ldrb r0, [r1, r0]
    cmp r6, r0
    subne r0, r6, r0
    ldmneia sp!, {r4, r5, r6, pc}
.L_338:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x200
    beq .L_37c
    mov r0, r4
    bl func_0202bb24
    cmp r0, #0x0
    movne r6, #0x1
    mov r0, r5
    moveq r6, #0x0
    bl func_0202bb24
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r6, r0
    subne r0, r0, r6
    ldmneia sp!, {r4, r5, r6, pc}
.L_37c:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x4000
    beq .L_3ac
    mov r0, r4
    bl func_0202de48
    mov r6, r0
    mov r0, r5
    bl func_0202de48
    cmp r6, r0
    subne r0, r6, r0
    ldmneia sp!, {r4, r5, r6, pc}
.L_3ac:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    beq .L_3dc
    mov r0, r4
    bl func_0202b2e8
    mov r6, r0
    mov r0, r5
    bl func_0202b2e8
    cmp r6, r0
    subne r0, r6, r0
    ldmneia sp!, {r4, r5, r6, pc}
.L_3dc:
    sub r0, r4, r5
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov006_0224f2c0
_LIT1: .word data_ov006_021cb23c
_LIT2: .word data_ov006_021cb264
_LIT3: .word data_ov006_021cb1cc
_LIT4: .word data_ov006_021cb1e8
_LIT5: .word data_ov006_0225bdc0
