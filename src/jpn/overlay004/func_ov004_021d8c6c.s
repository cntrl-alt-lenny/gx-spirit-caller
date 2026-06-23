; func_ov004_021d8c6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov004_0220b2a0
        .extern func_020060f4
        .extern func_02006160
        .extern func_02006190
        .extern func_020371b8
        .global func_ov004_021d8c6c
        .arm
func_ov004_021d8c6c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r4, [r5, #0xc]
    ldr r2, [r5]
    rsb r0, r4, #0xc0
    add r0, r0, r0, lsr #0x1f
    ldr r1, _LIT0
    mov r3, r0, asr #0x1
    add r0, r4, r0, asr #0x1
    cmp r2, #0x1
    sub r4, r3, #0x8
    sub r0, r0, #0x8
    ldrh r1, [r1, #0x54]
    beq .L_50
    cmp r2, #0x2
    beq .L_b4
    cmp r2, #0x3
    beq .L_308
    b .L_378
.L_50:
    ldr r1, [r5, #0x14]
    ldr r2, _LIT1
    add r1, r1, #0x1
    mul r3, r0, r1
    str r1, [r5, #0x14]
    mov r1, r3, asr #0x2
    ldr r4, [r5, #0xc]
    add r1, r3, r1, lsr #0x1d
    sub r1, r4, r1, asr #0x3
    ldr r4, _LIT2
    and r1, r2, r1, lsl #0x10
    str r1, [r4]
    ldr r1, [r5, #0x14]
    ldr r3, [r5, #0xc]
    mul r1, r0, r1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    sub r0, r3, r0, asr #0x3
    and r0, r2, r0, lsl #0x10
    str r0, [r4, #0x4]
    ldr r0, [r5, #0x14]
    cmp r0, #0x8
    movge r0, #0x2
    strge r0, [r5]
    b .L_378
.L_b4:
    ldr r0, [r5, #0x18]
    and r0, r0, #0xf
    cmp r0, #0x1
    ble .L_378
    cmp r1, #0x0
    beq .L_1b8
    cmp r0, #0x3
    bne .L_10c
    tst r1, #0x2
    beq .L_378
    ldr r0, _LIT3
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_100
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_100:
    mov r0, #0x3
    str r0, [r5]
    b .L_378
.L_10c:
    tst r1, #0x1
    beq .L_144
    ldr r0, _LIT3
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_138
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_138:
    mov r0, #0x3
    str r0, [r5]
    b .L_378
.L_144:
    cmp r0, #0x2
    beq .L_378
    tst r1, #0x2
    beq .L_18c
    ldr r0, _LIT3
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_178
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_178:
    mov r0, #0x1
    str r0, [r5, #0x8]
    mov r0, #0x3
    str r0, [r5]
    b .L_378
.L_18c:
    tst r1, #0x30
    beq .L_378
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x8]
    rsb r0, r0, #0x1
    str r0, [r5, #0x8]
    b .L_378
.L_1b8:
    bl func_02006190
    cmp r0, #0x0
    bne .L_1d0
    bl func_02006160
    cmp r0, #0x0
    beq .L_2fc
.L_1d0:
    ldr r0, [r5, #0x18]
    ldr r1, [r5, #0x10]
    and r0, r0, #0xf
    sub r0, r0, #0x2
    cmp r0, #0x1
    add r2, r1, r4
    add r0, sp, #0x4
    add r1, sp, #0x0
    bhi .L_240
    add r4, r2, #0x5
    bl func_020060f4
    ldr r0, [sp, #0x4]
    cmp r0, #0x68
    ldrge r1, [sp]
    cmpge r1, r4
    blt .L_234
    cmp r0, #0x98
    addlt r0, r4, #0x12
    cmplt r1, r0
    bge .L_234
    mov r0, #0x1
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b .L_2b8
.L_234:
    mov r0, #0x0
    str r0, [r5, #0x4]
    b .L_2b8
.L_240:
    add r4, r2, #0x5
    bl func_020060f4
    ldr r2, [sp, #0x4]
    cmp r2, #0x30
    ldrge r1, [sp]
    cmpge r1, r4
    blt .L_280
    cmp r2, #0x60
    addlt r0, r4, #0x12
    cmplt r1, r0
    bge .L_280
    mov r0, #0x1
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b .L_2b8
.L_280:
    cmp r2, #0xa0
    ldrge r1, [sp]
    cmpge r1, r4
    blt .L_2b0
    cmp r2, #0xd0
    addlt r0, r4, #0x12
    cmplt r1, r0
    bge .L_2b0
    mov r0, #0x1
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    b .L_2b8
.L_2b0:
    mov r0, #0x0
    str r0, [r5, #0x4]
.L_2b8:
    bl func_02006160
    cmp r0, #0x0
    ldrne r0, [r5, #0x4]
    cmpne r0, #0x0
    beq .L_378
    ldr r0, _LIT3
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_2f0
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_2f0:
    mov r0, #0x3
    str r0, [r5]
    b .L_378
.L_2fc:
    mov r0, #0x0
    str r0, [r5, #0x4]
    b .L_378
.L_308:
    ldr r1, [r5, #0x14]
    ldr r2, _LIT1
    sub r1, r1, #0x1
    mul r3, r0, r1
    str r1, [r5, #0x14]
    mov r1, r3, asr #0x2
    ldr r4, [r5, #0xc]
    add r1, r3, r1, lsr #0x1d
    sub r1, r4, r1, asr #0x3
    ldr r4, _LIT2
    and r1, r2, r1, lsl #0x10
    str r1, [r4]
    ldr r1, [r5, #0x14]
    ldr r3, [r5, #0xc]
    mul r1, r0, r1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    sub r0, r3, r0, asr #0x3
    and r0, r2, r0, lsl #0x10
    str r0, [r4, #0x4]
    ldr r0, [r5, #0x14]
    cmp r0, #0x0
    bgt .L_378
    mov r0, #0x0
    str r0, [r5]
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_378:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104acc
_LIT1: .word 0x01ff0000
_LIT2: .word 0x04001010
_LIT3: .word data_ov004_0220b2a0
