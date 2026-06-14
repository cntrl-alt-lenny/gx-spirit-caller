; func_ov009_021aa5d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_02104f4c
        .extern data_021067aa
        .extern data_021067ac
        .extern data_ov009_021adc00
        .extern data_ov009_021adc54
        .extern func_02006110
        .extern func_02006148
        .extern func_0200617c
        .extern func_02009758
        .extern func_0202ba94
        .extern func_0202bc10
        .extern func_02037208
        .extern func_ov009_021aa4a8
        .extern func_ov009_021ab838
        .global func_ov009_021aa5d8
        .arm
func_ov009_021aa5d8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr lr, [r4, #0x1c]
    ldr r3, [r4, #0xc]
    rsb r1, lr, #0xc0
    add r1, r1, r1, lsr #0x1f
    ldr r2, _LIT0
    mov ip, r1, asr #0x1
    add r1, lr, r1, asr #0x1
    cmp r3, #0x0
    sub ip, ip, #0x8
    sub r1, r1, #0x8
    ldrh r2, [r2, #0x54]
    beq .L_180
    cmp r3, #0x1
    beq .L_1e4
    cmp r3, #0x2
    beq .L_578
    b .L_614
.L_180:
    ldr r0, [r4, #0x24]
    ldr r2, _LIT1
    add r0, r0, #0x1
    mul r3, r1, r0
    str r0, [r4, #0x24]
    mov r0, r3, asr #0x2
    ldr ip, [r4, #0x1c]
    add r0, r3, r0, lsr #0x1d
    sub r0, ip, r0, asr #0x3
    ldr lr, _LIT2
    and r0, r2, r0, lsl #0x10
    str r0, [lr]
    ldr r0, [r4, #0x24]
    ldr ip, [r4, #0x1c]
    mul r3, r1, r0
    mov r0, r3, asr #0x2
    add r0, r3, r0, lsr #0x1d
    sub r0, ip, r0, asr #0x3
    and r0, r2, r0, lsl #0x10
    str r0, [lr, #0x4]
    ldr r0, [r4, #0x24]
    cmp r0, #0x8
    movge r0, #0x1
    strge r0, [r4, #0xc]
    b .L_614
.L_1e4:
    cmp r2, #0x0
    ldr r0, [r4, #0x8]
    beq .L_360
    cmp r0, #0x0
    beq .L_204
    cmp r0, #0x1
    beq .L_230
    b .L_614
.L_204:
    tst r2, #0x3
    beq .L_614
    mov r2, #0x0
    mov r0, #0x3a
    str r2, [r4]
    mov ip, #0x2
    sub r1, r0, #0x3b
    mov r3, #0x1
    str ip, [r4, #0xc]
    bl func_02037208
    b .L_614
.L_230:
    tst r2, #0x1
    beq .L_2fc
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r4, #0x18]
    mov r0, #0x2
    rsb r1, r1, #0x1
    str r1, [r4]
    str r0, [r4, #0xc]
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_614
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldr r3, [r1, #0xa60]
    ldr r2, [r0]
    ldr r0, _LIT5
    sub r2, r3, r2
    str r2, [r1, #0xa60]
    bl func_ov009_021ab838
    mov r1, #0x1
    bl func_0202ba94
    ldr r0, _LIT5
    bl func_ov009_021ab838
    mov r1, #0x1
    bl func_0202bc10
    ldr r1, _LIT6
    ldrh r0, [r1]
    add r0, r0, #0x1
    strh r0, [r1]
    ldrh r0, [r1]
    cmp r0, #0xa
    bcc .L_2c8
    mov r0, #0x2
    bl func_02009758
.L_2c8:
    ldr r3, _LIT7
    ldr r0, _LIT4
    ldrh r2, [r3]
    ldr r1, [r0]
    ldr r0, _LIT8
    add r1, r2, r1
    strh r1, [r3]
    ldrh r1, [r3]
    cmp r1, r0
    bcc .L_614
    mov r0, #0x3
    bl func_02009758
    b .L_614
.L_2fc:
    tst r2, #0x2
    beq .L_334
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    str r0, [r4, #0x18]
    rsb r0, r0, #0x1
    str r0, [r4]
    mov r0, #0x2
    str r0, [r4, #0xc]
    b .L_614
.L_334:
    tst r2, #0x30
    beq .L_614
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r4, #0x18]
    rsb r0, r0, #0x1
    str r0, [r4, #0x18]
    b .L_614
.L_360:
    cmp r0, #0x0
    beq .L_37c
    cmp r0, #0x1
    beq .L_404
    cmp r0, #0x2
    beq .L_564
    b .L_614
.L_37c:
    ldr r1, [r4, #0x20]
    add r0, sp, #0x4
    add r2, r1, ip
    add r1, sp, #0x0
    add r5, r2, #0x5
    bl func_02006148
    ldr r0, [sp, #0x4]
    cmp r0, #0x68
    ldrge r1, [sp]
    cmpge r1, r5
    blt .L_3c0
    cmp r0, #0x98
    addlt r0, r5, #0x12
    cmplt r1, r0
    movlt r0, #0x1
    strlt r0, [r4, #0x14]
    blt .L_3c8
.L_3c0:
    mov r0, #0x0
    str r0, [r4, #0x14]
.L_3c8:
    bl func_0200617c
    cmp r0, #0x0
    ldrne r0, [r4, #0x14]
    cmpne r0, #0x0
    beq .L_614
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x0
    str r0, [r4]
    mov r0, #0x2
    str r0, [r4, #0xc]
    b .L_614
.L_404:
    ldr r1, [r4, #0x20]
    add r0, sp, #0x4
    add r2, r1, ip
    add r1, sp, #0x0
    add r5, r2, #0x5
    bl func_02006110
    ldr r2, [sp, #0x4]
    cmp r2, #0x30
    ldrge r1, [sp]
    cmpge r1, r5
    blt .L_454
    cmp r2, #0x60
    addlt r0, r5, #0x12
    cmplt r1, r0
    bge .L_454
    mov r0, #0x1
    str r0, [r4, #0x14]
    mov r0, #0x0
    str r0, [r4, #0x18]
    b .L_48c
.L_454:
    cmp r2, #0xa0
    ldrge r1, [sp]
    cmpge r1, r5
    blt .L_484
    cmp r2, #0xd0
    addlt r0, r5, #0x12
    cmplt r1, r0
    bge .L_484
    mov r0, #0x1
    str r0, [r4, #0x14]
    str r0, [r4, #0x18]
    b .L_48c
.L_484:
    mov r0, #0x0
    str r0, [r4, #0x14]
.L_48c:
    bl func_0200617c
    cmp r0, #0x0
    ldrne r0, [r4, #0x14]
    cmpne r0, #0x0
    beq .L_614
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r4, #0x18]
    mov r0, #0x2
    rsb r1, r1, #0x1
    str r1, [r4]
    str r0, [r4, #0xc]
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_614
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldr r3, [r1, #0xa60]
    ldr r2, [r0]
    ldr r0, _LIT5
    sub r2, r3, r2
    str r2, [r1, #0xa60]
    bl func_ov009_021ab838
    mov r1, #0x1
    bl func_0202ba94
    ldr r0, _LIT5
    bl func_ov009_021ab838
    mov r1, #0x1
    bl func_0202bc10
    ldr r1, _LIT6
    ldrh r0, [r1]
    add r0, r0, #0x1
    strh r0, [r1]
    ldrh r0, [r1]
    cmp r0, #0xa
    bcc .L_530
    mov r0, #0x2
    bl func_02009758
.L_530:
    ldr r3, _LIT7
    ldr r0, _LIT4
    ldrh r2, [r3]
    ldr r1, [r0]
    ldr r0, _LIT8
    add r1, r2, r1
    strh r1, [r3]
    ldrh r1, [r3]
    cmp r1, r0
    bcc .L_614
    mov r0, #0x3
    bl func_02009758
    b .L_614
.L_564:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    movne r0, #0x2
    strne r0, [r4, #0xc]
    b .L_614
.L_578:
    ldr r2, [r4, #0x24]
    ldr r3, _LIT1
    sub r2, r2, #0x1
    mul ip, r1, r2
    str r2, [r4, #0x24]
    mov r2, ip, asr #0x2
    ldr lr, [r4, #0x1c]
    add r2, ip, r2, lsr #0x1d
    sub r2, lr, r2, asr #0x3
    ldr lr, _LIT2
    and r2, r3, r2, lsl #0x10
    str r2, [lr]
    ldr r2, [r4, #0x24]
    ldr ip, [r4, #0x1c]
    mul r2, r1, r2
    mov r1, r2, asr #0x2
    add r1, r2, r1, lsr #0x1d
    sub r1, ip, r1, asr #0x3
    and r1, r3, r1, lsl #0x10
    str r1, [lr, #0x4]
    ldr r1, [r4, #0x24]
    cmp r1, #0x0
    bgt .L_614
    ldr r1, [r4, #0x8]
    cmp r1, #0x1
    ldreq r1, [r4]
    cmpeq r1, #0x1
    bne .L_5fc
    mov r1, #0x3
    bl func_ov009_021aa4a8
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_5fc:
    mov r0, #0x0
    str r0, [r4, #0xc]
    str r0, [r4, #0x24]
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_614:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104bac
_LIT1: .word 0x01ff0000
_LIT2: .word 0x04001010
_LIT3: .word data_02104f4c
_LIT4: .word data_ov009_021adc54
_LIT5: .word data_ov009_021adc00
_LIT6: .word data_021067ac
_LIT7: .word data_021067aa
_LIT8: .word 0x00002710
