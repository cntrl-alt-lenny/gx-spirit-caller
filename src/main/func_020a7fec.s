; func_020a7fec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102a60
        .extern data_02102a68
        .extern data_02102a70
        .extern data_02102a78
        .extern data_02102a7c
        .extern data_02102a80
        .extern data_02102a88
        .extern data_02102a90
        .extern data_02102a94
        .extern func_020a7ac0
        .extern func_020b005c
        .extern func_020b10e0
        .extern func_020b2b50
        .global func_020a7fec
        .arm
func_020a7fec:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x44
    ldr r7, [sp, #0x80]
    ldr r0, _LIT0
    mov r8, r2
    cmp r7, r0
    ldrb r6, [sp, #0x79]
    ldrb r5, [sp, #0x77]
    ldrb r4, [sp, #0x75]
    ldr r1, [sp, #0x68]
    ldr r2, [sp, #0x6c]
    addgt sp, sp, #0x44
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    addgt sp, sp, #0x10
    bxgt lr
    mov sl, #0x0
    mov r9, #0x20
    add r0, sp, #0x8
    add r3, sp, #0xc
    strb sl, [sp, #0x8]
    strh r9, [sp, #0xa]
    bl func_020b10e0
    ldr r0, [sp, #0x68]
    ldr r1, [sp, #0x6c]
    bl func_020b005c
    mov r2, r0
    mov r0, sl
    mov r3, r1
    mov r1, r0
    bl func_020b2b50
    bne .L_cd0
    ldr r3, _LIT1
    sub r0, r8, #0x6
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    add sp, sp, #0x44
    strb r2, [r8, #-6]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldrb r2, [r3, #0x4]
    ldrb r1, [r3, #0x5]
    strb r2, [r0, #0x4]
    strb r1, [r0, #0x5]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
.L_cd0:
    ldrb r0, [sp, #0x11]
    cmp r0, #0x49
    bne .L_de0
    ldrsb r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_d6c
    cmp r6, #0x41
    sub r0, r8, #0x5
    bne .L_d30
    ldr r3, _LIT2
    add sp, sp, #0x44
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldrb r1, [r3, #0x4]
    strb r1, [r0, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
.L_d30:
    ldr r3, _LIT3
    add sp, sp, #0x44
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldrb r1, [r3, #0x4]
    strb r1, [r0, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
.L_d6c:
    cmp r6, #0x41
    sub r0, r8, #0x4
    bne .L_dac
    ldr r3, _LIT4
    add sp, sp, #0x44
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
.L_dac:
    ldr r3, _LIT5
    add sp, sp, #0x44
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
.L_de0:
    cmp r0, #0x4e
    bne .L_eec
    ldrsb r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_e78
    cmp r6, #0x41
    sub r0, r8, #0x5
    bne .L_e3c
    ldr r3, _LIT6
    add sp, sp, #0x44
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldrb r1, [r3, #0x4]
    strb r1, [r0, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
.L_e3c:
    ldr r3, _LIT7
    add sp, sp, #0x44
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldrb r1, [r3, #0x4]
    strb r1, [r0, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
.L_e78:
    cmp r6, #0x41
    sub r0, r8, #0x4
    bne .L_eb8
    ldr r3, _LIT8
    add sp, sp, #0x44
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
.L_eb8:
    ldr r3, _LIT9
    add sp, sp, #0x44
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
.L_eec:
    mov r3, sl
    mov r1, #0x1
    mov r0, #0x64
    add r9, sp, #0x68
    strb r1, [sp, #0x34]
    strb r1, [sp, #0x35]
    strb r3, [sp, #0x36]
    strb r3, [sp, #0x37]
    strb r3, [sp, #0x38]
    str r3, [sp, #0x3c]
    str r1, [sp, #0x40]
    strb r0, [sp, #0x39]
.L_f1c:
    rsb r1, r3, #0x7
    ldrsb r2, [r9, r3]
    ldrsb r0, [r9, r1]
    strb r0, [r9, r3]
    add r3, r3, #0x1
    strb r2, [r9, r1]
    cmp r3, #0x4
    blt .L_f1c
    ldrb r0, [sp, #0x69]
    ldrb r1, [sp, #0x68]
    ldr r9, _LIT10
    mov r0, r0, lsl #0x11
    orr r1, r0, r1, lsl #0x19
    add r0, sp, #0x34
    and lr, r9, r1, lsr #0x15
    sub ip, sp, #0x8
    ldmia r0, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    rsb r0, r9, #0x400
    mov r1, r8
    add r0, lr, r0
    ldmia ip, {r2, r3}
    bl func_020a7ac0
    cmp r6, #0x61
    moveq r1, #0x70
    movne r1, #0x50
    strb r1, [r0, #-1]!
    mov r1, r7, lsl #0x2
    mov lr, r7
    cmp r7, #0x1
    add r8, r1, #0xb
    add ip, sp, #0x68
    blt .L_102c
    mov r9, #0x30
.L_fa4:
    cmp r8, #0x40
    bge .L_1014
    ldrb r1, [ip, r8, asr #0x3]
    and r2, r8, #0x7
    rsb r3, r2, #0x7
    mov r2, r1, asr r3
    sub sl, r8, #0x4
    bic r1, r8, #0x7
    bic sl, sl, #0x7
    cmp r1, sl
    add sl, ip, r8, asr #0x3
    and r1, r2, #0xff
    beq .L_fe8
    ldrb r2, [sl, #-1]
    mov r2, r2, lsl #0x8
    orr r1, r1, r2, asr r3
    and r1, r1, #0xff
.L_fe8:
    and r1, r1, #0xf
    cmp r1, #0xa
    addcc r1, r1, #0x30
    andcc r1, r1, #0xff
    bcc .L_1018
    cmp r6, #0x61
    addeq r1, r1, #0x57
    andeq r1, r1, #0xff
    addne r1, r1, #0x37
    andne r1, r1, #0xff
    b .L_1018
.L_1014:
    mov r1, r9
.L_1018:
    sub lr, lr, #0x1
    cmp lr, #0x1
    strb r1, [r0, #-1]!
    sub r8, r8, #0x4
    bge .L_fa4
.L_102c:
    cmp r7, #0x0
    cmpeq r5, #0x0
    movne r1, #0x2e
    strneb r1, [r0, #-1]!
    mov r1, #0x31
    strb r1, [r0, #-1]
    cmp r6, #0x61
    moveq r1, #0x78
    movne r1, #0x58
    strb r1, [r0, #-2]!
    mov r1, #0x30
    strb r1, [r0, #-1]!
    ldrsb r1, [sp, #0xc]
    cmp r1, #0x0
    movne r1, #0x2d
    strneb r1, [r0, #-1]!
    addne sp, sp, #0x44
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    addne sp, sp, #0x10
    bxne lr
    cmp r4, #0x1
    moveq r1, #0x2b
    streqb r1, [r0, #-1]!
    addeq sp, sp, #0x44
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    addeq sp, sp, #0x10
    bxeq lr
    cmp r4, #0x2
    moveq r1, #0x20
    streqb r1, [r0, #-1]!
    add sp, sp, #0x44
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x000001fd
_LIT1: .word data_02102a60
_LIT2: .word data_02102a68
_LIT3: .word data_02102a70
_LIT4: .word data_02102a78
_LIT5: .word data_02102a7c
_LIT6: .word data_02102a80
_LIT7: .word data_02102a88
_LIT8: .word data_02102a90
_LIT9: .word data_02102a94
_LIT10: .word 0x000007ff
