; func_0206f688 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eee8
        .extern data_0219eeec
        .extern data_0219eef8
        .extern data_0219ef00
        .extern data_0219ef14
        .extern data_0219ef18
        .extern data_0219ef1c
        .extern data_0219ef2c
        .extern data_0219ef34
        .extern func_0207039c
        .extern func_0207092c
        .extern func_02070a38
        .extern func_02073da0
        .extern func_0207445c
        .extern func_020930b0
        .global func_0206f688
        .arm
func_0206f688:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    add r2, r1, #0x1
    mov r1, #0xf
    mul r1, r2, r1
    str r1, [sp, #0x8]
    str r0, [sp]
    bl func_020930b0
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x4]
    orr r0, r0, r1, lsl #0x10
    mov r4, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x3
    mov r9, r4
    ldr r5, _LIT0
    mov r7, #0x2
    mov r8, #0x1
    ldr fp, _LIT1
    ldr r6, _LIT2
    str r0, [sp, #0xc]
    b .L_918
.L_620:
    bl func_0207039c
    cmp r0, #0x0
    bne .L_634
    bl func_0207445c
    b .L_918
.L_634:
    add r0, sp, #0x10
    bl func_02070a38
    mov sl, r0
    ldr r0, [sp, #0x10]
    cmp r0, #0xf0
    bls .L_910
    ldrb r0, [sl]
    cmp r0, #0x2
    bne .L_910
    ldrh r1, [sl, #0x6]
    ldrh r2, [sl, #0x4]
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    mov r1, r0, lsl #0x10
    mov r0, r2, asr #0x8
    orr r0, r0, r2, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    orr r1, r0, r1, lsr #0x10
    ldr r0, [sp]
    cmp r0, r1
    bne .L_910
    ldr r1, _LIT3
    add r0, sl, #0x1c
    bl func_02073da0
    cmp r0, #0x0
    bne .L_910
    ldrb r3, [sl, #0x10]
    ldrb r0, [sl, #0x11]
    ldrb r2, [sl, #0x12]
    ldrb r1, [sl, #0x13]
    orr r0, r0, r3, lsl #0x8
    mov r0, r0, lsl #0x10
    orr r1, r1, r2, lsl #0x8
    mov r0, r0, lsr #0x10
    mov r2, r0, lsl #0x10
    mov r0, r1, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    ldrb r2, [sl, #0xec]
    ldr r1, [sp, #0x10]
    ldr r4, [sp, #0xc]
    add r1, sl, r1
    cmp r2, #0x63
    bne .L_910
    ldrb r2, [sl, #0xed]
    cmp r2, #0x82
    bne .L_910
    ldrb r2, [sl, #0xee]
    cmp r2, #0x53
    bne .L_910
    add r2, sl, #0xf0
    ldrb r3, [sl, #0xef]
    cmp r3, #0x63
    bne .L_910
    b .L_8fc
.L_714:
    cmp r3, #0x0
    beq .L_8fc
    cmp r3, #0x33
    bgt .L_758
    cmp r3, #0x33
    bge .L_854
    cmp r3, #0x6
    bgt .L_8f0
    cmp r3, #0x1
    blt .L_8f0
    cmp r3, #0x1
    beq .L_778
    cmp r3, #0x3
    beq .L_7ac
    cmp r3, #0x6
    beq .L_7e0
    b .L_8f0
.L_758:
    cmp r3, #0x35
    bgt .L_76c
    cmp r3, #0x35
    beq .L_88c
    b .L_8f0
.L_76c:
    cmp r3, #0x36
    beq .L_8bc
    b .L_8f0
.L_778:
    ldrb lr, [r2, #0x1]
    ldrb ip, [r2, #0x2]
    ldrb sl, [r2, #0x3]
    ldrb r3, [r2, #0x4]
    orr ip, ip, lr, lsl #0x8
    mov ip, ip, lsl #0x10
    orr r3, r3, sl, lsl #0x8
    mov sl, ip, lsr #0x10
    mov sl, sl, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r3, sl, r3, lsr #0x10
    str r3, [r6]
    b .L_8f0
.L_7ac:
    ldrb lr, [r2, #0x1]
    ldrb ip, [r2, #0x2]
    ldrb sl, [r2, #0x3]
    ldrb r3, [r2, #0x4]
    orr ip, ip, lr, lsl #0x8
    mov ip, ip, lsl #0x10
    orr r3, r3, sl, lsl #0x8
    mov sl, ip, lsr #0x10
    mov sl, sl, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r3, sl, r3, lsr #0x10
    str r3, [fp]
    b .L_8f0
.L_7e0:
    ldrb r3, [r2]
    cmp r3, #0x8
    strcc r9, [r5, #0x4]
    bcc .L_820
    ldrb lr, [r2, #0x5]
    ldrb ip, [r2, #0x6]
    ldrb sl, [r2, #0x7]
    ldrb r3, [r2, #0x8]
    orr ip, ip, lr, lsl #0x8
    mov ip, ip, lsl #0x10
    orr r3, r3, sl, lsl #0x8
    mov sl, ip, lsr #0x10
    mov sl, sl, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r3, sl, r3, lsr #0x10
    str r3, [r5, #0x4]
.L_820:
    ldrb lr, [r2, #0x1]
    ldrb ip, [r2, #0x2]
    ldrb sl, [r2, #0x3]
    ldrb r3, [r2, #0x4]
    orr ip, ip, lr, lsl #0x8
    mov ip, ip, lsl #0x10
    orr r3, r3, sl, lsl #0x8
    mov sl, ip, lsr #0x10
    mov sl, sl, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r3, sl, r3, lsr #0x10
    str r3, [r5]
    b .L_8f0
.L_854:
    ldrb lr, [r2, #0x1]
    ldrb ip, [r2, #0x2]
    ldrb sl, [r2, #0x3]
    ldrb r3, [r2, #0x4]
    orr ip, ip, lr, lsl #0x8
    mov ip, ip, lsl #0x10
    orr r3, r3, sl, lsl #0x8
    mov sl, ip, lsr #0x10
    mov sl, sl, lsl #0x10
    mov r3, r3, lsl #0x10
    orr sl, sl, r3, lsr #0x10
    ldr r3, _LIT4
    str sl, [r3]
    b .L_8f0
.L_88c:
    ldrb r3, [r2, #0x1]
    cmp r3, #0x2
    beq .L_8ac
    cmp r3, #0x5
    ldreq r3, _LIT5
    moveq r4, r7
    streq r0, [r3]
    b .L_8f0
.L_8ac:
    ldr r3, _LIT6
    mov r4, r8
    str r0, [r3]
    b .L_8f0
.L_8bc:
    ldrb lr, [r2, #0x1]
    ldrb ip, [r2, #0x2]
    ldrb sl, [r2, #0x3]
    ldrb r3, [r2, #0x4]
    orr ip, ip, lr, lsl #0x8
    mov ip, ip, lsl #0x10
    orr r3, r3, sl, lsl #0x8
    mov sl, ip, lsr #0x10
    mov sl, sl, lsl #0x10
    mov r3, r3, lsl #0x10
    orr sl, sl, r3, lsr #0x10
    ldr r3, _LIT7
    str sl, [r3]
.L_8f0:
    ldrb r3, [r2]
    add r3, r3, #0x1
    add r2, r2, r3
.L_8fc:
    cmp r2, r1
    bcs .L_910
    ldrb r3, [r2], #0x1
    cmp r3, #0xff
    bne .L_714
.L_910:
    ldr r0, [sp, #0x10]
    bl func_0207092c
.L_918:
    ldr r0, _LIT8
    ldr r0, [r0]
    blx r0
    cmp r0, #0x0
    beq .L_954
    cmp r4, #0x0
    bne .L_954
    bl func_020930b0
    mov r2, r0, lsr #0x10
    ldr r0, [sp, #0x4]
    orr r2, r2, r1, lsl #0x10
    sub r1, r2, r0
    ldr r0, [sp, #0x8]
    cmp r1, r0
    blt .L_620
.L_954:
    mov r0, r4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219ef34
_LIT1: .word data_0219eef8
_LIT2: .word data_0219eee8
_LIT3: .word data_0219ef2c
_LIT4: .word data_0219ef18
_LIT5: .word data_0219ef1c
_LIT6: .word data_0219ef00
_LIT7: .word data_0219eeec
_LIT8: .word data_0219ef14
