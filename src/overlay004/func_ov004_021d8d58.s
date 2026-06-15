; func_ov004_021d8d58 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_02104f4c
        .extern data_ov004_0220b500
        .extern func_02006110
        .extern func_0200617c
        .extern func_020061ac
        .extern func_02037208
        .global func_ov004_021d8d58
        .arm
func_ov004_021d8d58:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r4, [r6, #0xc]
    ldr r2, [r6]
    rsb r0, r4, #0xc0
    add r0, r0, r0, lsr #0x1f
    ldr r1, _LIT0
    mov r3, r0, asr #0x1
    add r0, r4, r0, asr #0x1
    cmp r2, #0x1
    sub r4, r3, #0x8
    sub r0, r0, #0x8
    ldrh r1, [r1, #0x54]
    mov r5, #0x38
    beq .L_90
    cmp r2, #0x2
    beq .L_f4
    cmp r2, #0x3
    beq .L_388
    b .L_3f8
.L_90:
    ldr r1, [r6, #0x14]
    ldr r2, _LIT1
    add r1, r1, #0x1
    mul r3, r0, r1
    str r1, [r6, #0x14]
    mov r1, r3, asr #0x2
    ldr r4, [r6, #0xc]
    add r1, r3, r1, lsr #0x1d
    sub r1, r4, r1, asr #0x3
    ldr r4, _LIT2
    and r1, r2, r1, lsl #0x10
    str r1, [r4]
    ldr r1, [r6, #0x14]
    ldr r3, [r6, #0xc]
    mul r1, r0, r1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    sub r0, r3, r0, asr #0x3
    and r0, r2, r0, lsl #0x10
    str r0, [r4, #0x4]
    ldr r0, [r6, #0x14]
    cmp r0, #0x8
    movge r0, #0x2
    strge r0, [r6]
    b .L_3f8
.L_f4:
    ldr r0, [r6, #0x18]
    and r0, r0, #0xf
    cmp r0, #0x1
    ble .L_3f8
    cmp r1, #0x0
    beq .L_1f8
    cmp r0, #0x3
    bne .L_14c
    tst r1, #0x2
    beq .L_3f8
    ldr r0, _LIT3
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_140
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_140:
    mov r0, #0x3
    str r0, [r6]
    b .L_3f8
.L_14c:
    tst r1, #0x1
    beq .L_184
    ldr r0, _LIT3
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_178
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_178:
    mov r0, #0x3
    str r0, [r6]
    b .L_3f8
.L_184:
    cmp r0, #0x2
    beq .L_3f8
    tst r1, #0x2
    beq .L_1cc
    ldr r0, _LIT3
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_1b8
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_1b8:
    mov r0, #0x1
    str r0, [r6, #0x8]
    mov r0, #0x3
    str r0, [r6]
    b .L_3f8
.L_1cc:
    tst r1, #0x30
    beq .L_3f8
    mov r0, r5
    sub r1, r5, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r6, #0x8]
    rsb r0, r0, #0x1
    str r0, [r6, #0x8]
    b .L_3f8
.L_1f8:
    bl func_020061ac
    cmp r0, #0x0
    bne .L_210
    bl func_0200617c
    cmp r0, #0x0
    beq .L_37c
.L_210:
    ldr r0, [r6, #0x18]
    and r1, r0, #0xf
    sub r0, r1, #0x2
    cmp r0, #0x1
    bhi .L_2b0
    cmp r1, #0x3
    bne .L_244
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x1
    movhi r5, #0x4c
.L_244:
    ldr r1, [r6, #0x10]
    add r0, r5, r5, lsr #0x1f
    add r2, r1, r4
    mov r3, r0, asr #0x1
    add r0, sp, #0x4
    add r1, sp, #0x0
    rsb r4, r3, #0x80
    add r7, r2, #0x5
    bl func_02006110
    ldr r2, [sp, #0x4]
    cmp r2, r4
    ldrge r1, [sp]
    cmpge r1, r7
    blt .L_2a4
    add r0, r4, r5
    cmp r2, r0
    addlt r0, r7, #0x18
    cmplt r1, r0
    bge .L_2a4
    mov r0, #0x1
    str r0, [r6, #0x4]
    mov r0, #0x0
    str r0, [r6, #0x8]
    b .L_338
.L_2a4:
    mov r0, #0x0
    str r0, [r6, #0x4]
    b .L_338
.L_2b0:
    ldr r1, [r6, #0x10]
    add r0, sp, #0x4
    add r2, r1, r4
    add r1, sp, #0x0
    add r4, r2, #0x5
    bl func_02006110
    ldr r2, [sp, #0x4]
    cmp r2, #0x30
    ldrge r1, [sp]
    cmpge r1, r4
    blt .L_300
    cmp r2, #0x68
    addlt r0, r4, #0x18
    cmplt r1, r0
    bge .L_300
    mov r0, #0x1
    str r0, [r6, #0x4]
    mov r0, #0x0
    str r0, [r6, #0x8]
    b .L_338
.L_300:
    cmp r2, #0xa0
    ldrge r1, [sp]
    cmpge r1, r4
    blt .L_330
    cmp r2, #0xd8
    addlt r0, r4, #0x18
    cmplt r1, r0
    bge .L_330
    mov r0, #0x1
    str r0, [r6, #0x4]
    str r0, [r6, #0x8]
    b .L_338
.L_330:
    mov r0, #0x0
    str r0, [r6, #0x4]
.L_338:
    bl func_0200617c
    cmp r0, #0x0
    ldrne r0, [r6, #0x4]
    cmpne r0, #0x0
    beq .L_3f8
    ldr r0, _LIT3
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_370
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_370:
    mov r0, #0x3
    str r0, [r6]
    b .L_3f8
.L_37c:
    mov r0, #0x0
    str r0, [r6, #0x4]
    b .L_3f8
.L_388:
    ldr r1, [r6, #0x14]
    ldr r2, _LIT1
    sub r1, r1, #0x1
    mul r3, r0, r1
    str r1, [r6, #0x14]
    mov r1, r3, asr #0x2
    ldr r4, [r6, #0xc]
    add r1, r3, r1, lsr #0x1d
    sub r1, r4, r1, asr #0x3
    ldr r4, _LIT2
    and r1, r2, r1, lsl #0x10
    str r1, [r4]
    ldr r1, [r6, #0x14]
    ldr r3, [r6, #0xc]
    mul r1, r0, r1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    sub r0, r3, r0, asr #0x3
    and r0, r2, r0, lsl #0x10
    str r0, [r4, #0x4]
    ldr r0, [r6, #0x14]
    cmp r0, #0x0
    bgt .L_3f8
    mov r0, #0x0
    str r0, [r6]
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3f8:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02104bac
_LIT1: .word 0x01ff0000
_LIT2: .word 0x04001010
_LIT3: .word data_ov004_0220b500
_LIT4: .word data_02104f4c
