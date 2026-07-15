; func_ov009_021aa4f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_02104e6c
        .extern data_021066ca
        .extern data_021066cc
        .extern data_ov009_021adb20
        .extern data_ov009_021adb74
        .extern func_020060f4
        .extern func_0200612c
        .extern func_02006160
        .extern func_0200973c
        .extern func_0202ba40
        .extern func_0202bbbc
        .extern func_020371b8
        .extern func_ov009_021aa3c8
        .extern func_ov009_021ab758
        .global func_ov009_021aa4f8
        .arm
func_ov009_021aa4f8:
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
    beq .L_50
    cmp r3, #0x1
    beq .L_b4
    cmp r3, #0x2
    beq .L_448
    b .L_4e4
.L_50:
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
    b .L_4e4
.L_b4:
    cmp r2, #0x0
    ldr r0, [r4, #0x8]
    beq .L_230
    cmp r0, #0x0
    beq .L_d4
    cmp r0, #0x1
    beq .L_100
    b .L_4e4
.L_d4:
    tst r2, #0x3
    beq .L_4e4
    mov r2, #0x0
    mov r0, #0x3a
    str r2, [r4]
    mov ip, #0x2
    sub r1, r0, #0x3b
    mov r3, #0x1
    str ip, [r4, #0xc]
    bl func_020371b8
    b .L_4e4
.L_100:
    tst r2, #0x1
    beq .L_1cc
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r1, [r4, #0x18]
    mov r0, #0x2
    rsb r1, r1, #0x1
    str r1, [r4]
    str r0, [r4, #0xc]
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_4e4
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldr r3, [r1, #0xa60]
    ldr r2, [r0]
    ldr r0, _LIT5
    sub r2, r3, r2
    str r2, [r1, #0xa60]
    bl func_ov009_021ab758
    mov r1, #0x1
    bl func_0202ba40
    ldr r0, _LIT5
    bl func_ov009_021ab758
    mov r1, #0x1
    bl func_0202bbbc
    ldr r1, _LIT6
    ldrh r0, [r1]
    add r0, r0, #0x1
    strh r0, [r1]
    ldrh r0, [r1]
    cmp r0, #0xa
    bcc .L_198
    mov r0, #0x2
    bl func_0200973c
.L_198:
    ldr r3, _LIT7
    ldr r0, _LIT4
    ldrh r2, [r3]
    ldr r1, [r0]
    ldr r0, _LIT8
    add r1, r2, r1
    strh r1, [r3]
    ldrh r1, [r3]
    cmp r1, r0
    bcc .L_4e4
    mov r0, #0x3
    bl func_0200973c
    b .L_4e4
.L_1cc:
    tst r2, #0x2
    beq .L_204
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    str r0, [r4, #0x18]
    rsb r0, r0, #0x1
    str r0, [r4]
    mov r0, #0x2
    str r0, [r4, #0xc]
    b .L_4e4
.L_204:
    tst r2, #0x30
    beq .L_4e4
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r4, #0x18]
    rsb r0, r0, #0x1
    str r0, [r4, #0x18]
    b .L_4e4
.L_230:
    cmp r0, #0x0
    beq .L_24c
    cmp r0, #0x1
    beq .L_2d4
    cmp r0, #0x2
    beq .L_434
    b .L_4e4
.L_24c:
    ldr r1, [r4, #0x20]
    add r0, sp, #0x4
    add r2, r1, ip
    add r1, sp, #0x0
    add r5, r2, #0x5
    bl func_0200612c
    ldr r0, [sp, #0x4]
    cmp r0, #0x68
    ldrge r1, [sp]
    cmpge r1, r5
    blt .L_290
    cmp r0, #0x98
    addlt r0, r5, #0x12
    cmplt r1, r0
    movlt r0, #0x1
    strlt r0, [r4, #0x14]
    blt .L_298
.L_290:
    mov r0, #0x0
    str r0, [r4, #0x14]
.L_298:
    bl func_02006160
    cmp r0, #0x0
    ldrne r0, [r4, #0x14]
    cmpne r0, #0x0
    beq .L_4e4
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x0
    str r0, [r4]
    mov r0, #0x2
    str r0, [r4, #0xc]
    b .L_4e4
.L_2d4:
    ldr r1, [r4, #0x20]
    add r0, sp, #0x4
    add r2, r1, ip
    add r1, sp, #0x0
    add r5, r2, #0x5
    bl func_020060f4
    ldr r2, [sp, #0x4]
    cmp r2, #0x30
    ldrge r1, [sp]
    cmpge r1, r5
    blt .L_324
    cmp r2, #0x60
    addlt r0, r5, #0x12
    cmplt r1, r0
    bge .L_324
    mov r0, #0x1
    str r0, [r4, #0x14]
    mov r0, #0x0
    str r0, [r4, #0x18]
    b .L_35c
.L_324:
    cmp r2, #0xa0
    ldrge r1, [sp]
    cmpge r1, r5
    blt .L_354
    cmp r2, #0xd0
    addlt r0, r5, #0x12
    cmplt r1, r0
    bge .L_354
    mov r0, #0x1
    str r0, [r4, #0x14]
    str r0, [r4, #0x18]
    b .L_35c
.L_354:
    mov r0, #0x0
    str r0, [r4, #0x14]
.L_35c:
    bl func_02006160
    cmp r0, #0x0
    ldrne r0, [r4, #0x14]
    cmpne r0, #0x0
    beq .L_4e4
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r1, [r4, #0x18]
    mov r0, #0x2
    rsb r1, r1, #0x1
    str r1, [r4]
    str r0, [r4, #0xc]
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_4e4
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldr r3, [r1, #0xa60]
    ldr r2, [r0]
    ldr r0, _LIT5
    sub r2, r3, r2
    str r2, [r1, #0xa60]
    bl func_ov009_021ab758
    mov r1, #0x1
    bl func_0202ba40
    ldr r0, _LIT5
    bl func_ov009_021ab758
    mov r1, #0x1
    bl func_0202bbbc
    ldr r1, _LIT6
    ldrh r0, [r1]
    add r0, r0, #0x1
    strh r0, [r1]
    ldrh r0, [r1]
    cmp r0, #0xa
    bcc .L_400
    mov r0, #0x2
    bl func_0200973c
.L_400:
    ldr r3, _LIT7
    ldr r0, _LIT4
    ldrh r2, [r3]
    ldr r1, [r0]
    ldr r0, _LIT8
    add r1, r2, r1
    strh r1, [r3]
    ldrh r1, [r3]
    cmp r1, r0
    bcc .L_4e4
    mov r0, #0x3
    bl func_0200973c
    b .L_4e4
.L_434:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    movne r0, #0x2
    strne r0, [r4, #0xc]
    b .L_4e4
.L_448:
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
    bgt .L_4e4
    ldr r1, [r4, #0x8]
    cmp r1, #0x1
    ldreq r1, [r4]
    cmpeq r1, #0x1
    bne .L_4cc
    mov r1, #0x3
    bl func_ov009_021aa3c8
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_4cc:
    mov r0, #0x0
    str r0, [r4, #0xc]
    str r0, [r4, #0x24]
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_4e4:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104acc
_LIT1: .word 0x01ff0000
_LIT2: .word 0x04001010
_LIT3: .word data_02104e6c
_LIT4: .word data_ov009_021adb74
_LIT5: .word data_ov009_021adb20
_LIT6: .word data_021066cc
_LIT7: .word data_021066ca
_LIT8: .word 0x00002710
