; func_ov016_021b5a6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern func_02006110
        .extern func_02006148
        .extern func_0200617c
        .extern func_02037208
        .global func_ov016_021b5a6c
        .arm
func_ov016_021b5a6c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr ip, [r4, #0x14]
    ldr r2, [r4, #0x4]
    rsb r0, ip, #0xc0
    add r0, r0, r0, lsr #0x1f
    ldr r1, _LIT0
    mov r3, r0, asr #0x1
    add r0, ip, r0, asr #0x1
    cmp r2, #0x0
    sub r3, r3, #0x8
    sub r0, r0, #0x8
    ldrh r1, [r1, #0x54]
    beq .L_50
    cmp r2, #0x1
    beq .L_b4
    cmp r2, #0x2
    beq .L_2d8
    b .L_34c
.L_50:
    ldr r1, [r4, #0x1c]
    ldr r2, _LIT1
    add r1, r1, #0x1
    mul r3, r0, r1
    str r1, [r4, #0x1c]
    mov r1, r3, asr #0x2
    ldr ip, [r4, #0x14]
    add r1, r3, r1, lsr #0x1d
    sub r1, ip, r1, asr #0x3
    ldr ip, _LIT2
    and r1, r2, r1, lsl #0x10
    str r1, [ip]
    ldr r1, [r4, #0x1c]
    ldr r3, [r4, #0x14]
    mul r1, r0, r1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    sub r0, r3, r0, asr #0x3
    and r0, r2, r0, lsl #0x10
    str r0, [ip, #0x4]
    ldr r0, [r4, #0x1c]
    cmp r0, #0x8
    movge r0, #0x1
    strge r0, [r4, #0x4]
    b .L_34c
.L_b4:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_34c
    cmp r1, #0x0
    beq .L_188
    cmp r0, #0x1
    beq .L_dc
    cmp r0, #0x2
    beq .L_104
    b .L_34c
.L_dc:
    tst r1, #0x3
    beq .L_34c
    mov r0, #0x3a
    mov ip, #0x2
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x4]
    bl func_02037208
    b .L_34c
.L_104:
    tst r1, #0x1
    beq .L_12c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x2
    str r0, [r4, #0x4]
    b .L_34c
.L_12c:
    tst r1, #0x2
    beq .L_15c
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    str r0, [r4, #0x10]
    mov r0, #0x2
    str r0, [r4, #0x4]
    b .L_34c
.L_15c:
    tst r1, #0x30
    beq .L_34c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r4, #0x10]
    rsb r0, r0, #0x1
    str r0, [r4, #0x10]
    b .L_34c
.L_188:
    cmp r0, #0x1
    beq .L_19c
    cmp r0, #0x2
    beq .L_21c
    b .L_34c
.L_19c:
    ldr r1, [r4, #0x18]
    add r0, sp, #0x4
    add r2, r1, r3
    add r1, sp, #0x0
    add r5, r2, #0x5
    bl func_02006148
    ldr r0, [sp, #0x4]
    cmp r0, #0x68
    ldrge r1, [sp]
    cmpge r1, r5
    blt .L_1e0
    cmp r0, #0x98
    addlt r0, r5, #0x12
    cmplt r1, r0
    movlt r0, #0x1
    strlt r0, [r4, #0xc]
    blt .L_1e8
.L_1e0:
    mov r0, #0x0
    str r0, [r4, #0xc]
.L_1e8:
    bl func_0200617c
    cmp r0, #0x0
    ldrne r0, [r4, #0xc]
    cmpne r0, #0x0
    beq .L_34c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x2
    str r0, [r4, #0x4]
    b .L_34c
.L_21c:
    ldr r1, [r4, #0x18]
    add r0, sp, #0x4
    add r2, r1, r3
    add r1, sp, #0x0
    add r5, r2, #0x5
    bl func_02006110
    ldr r2, [sp, #0x4]
    cmp r2, #0x30
    ldrge r1, [sp]
    cmpge r1, r5
    blt .L_26c
    cmp r2, #0x60
    addlt r0, r5, #0x12
    cmplt r1, r0
    bge .L_26c
    mov r0, #0x1
    str r0, [r4, #0xc]
    mov r0, #0x0
    str r0, [r4, #0x10]
    b .L_2a4
.L_26c:
    cmp r2, #0xa0
    ldrge r1, [sp]
    cmpge r1, r5
    blt .L_29c
    cmp r2, #0xd0
    addlt r0, r5, #0x12
    cmplt r1, r0
    bge .L_29c
    mov r0, #0x1
    str r0, [r4, #0xc]
    str r0, [r4, #0x10]
    b .L_2a4
.L_29c:
    mov r0, #0x0
    str r0, [r4, #0xc]
.L_2a4:
    bl func_0200617c
    cmp r0, #0x0
    ldrne r0, [r4, #0xc]
    cmpne r0, #0x0
    beq .L_34c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x2
    str r0, [r4, #0x4]
    b .L_34c
.L_2d8:
    ldr r1, [r4, #0x1c]
    ldr r2, _LIT1
    sub r1, r1, #0x1
    mul r3, r0, r1
    str r1, [r4, #0x1c]
    mov r1, r3, asr #0x2
    ldr ip, [r4, #0x14]
    add r1, r3, r1, lsr #0x1d
    sub r1, ip, r1, asr #0x3
    ldr ip, _LIT2
    and r1, r2, r1, lsl #0x10
    str r1, [ip]
    ldr r1, [r4, #0x1c]
    ldr r3, [r4, #0x14]
    mul r1, r0, r1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    sub r0, r3, r0, asr #0x3
    and r0, r2, r0, lsl #0x10
    str r0, [ip, #0x4]
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    bgt .L_34c
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x1c]
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_34c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104bac
_LIT1: .word 0x01ff0000
_LIT2: .word 0x04001010
