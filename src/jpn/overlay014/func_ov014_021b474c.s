; func_ov014_021b474c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern func_020060f4
        .extern func_02006160
        .extern func_020371b8
        .global func_ov014_021b474c
        .arm
func_ov014_021b474c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr ip, [r4, #0xc]
    ldr r2, [r4]
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
    beq .L_1fc
    b .L_260
.L_50:
    ldr r1, [r4, #0x14]
    ldr r2, _LIT1
    add r1, r1, #0x1
    mul r3, r0, r1
    str r1, [r4, #0x14]
    mov r1, r3, asr #0x2
    ldr ip, [r4, #0xc]
    add r1, r3, r1, lsr #0x1d
    sub r1, ip, r1, asr #0x3
    ldr ip, _LIT2
    and r1, r2, r1, lsl #0x10
    str r1, [ip]
    ldr r1, [r4, #0x14]
    ldr r3, [r4, #0xc]
    mul r1, r0, r1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    sub r0, r3, r0, asr #0x3
    and r0, r2, r0, lsl #0x10
    str r0, [ip, #0x4]
    ldr r0, [r4, #0x14]
    cmp r0, #0x8
    movge r0, #0x1
    strge r0, [r4]
    b .L_260
.L_b4:
    cmp r1, #0x0
    beq .L_140
    tst r1, #0x1
    beq .L_e4
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x2
    str r0, [r4]
    b .L_260
.L_e4:
    tst r1, #0x2
    beq .L_114
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    str r0, [r4, #0x8]
    mov r0, #0x2
    str r0, [r4]
    b .L_260
.L_114:
    tst r1, #0x30
    beq .L_260
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r4, #0x8]
    rsb r0, r0, #0x1
    str r0, [r4, #0x8]
    b .L_260
.L_140:
    ldr r1, [r4, #0x10]
    add r0, sp, #0x4
    add r2, r1, r3
    add r1, sp, #0x0
    add r5, r2, #0x5
    bl func_020060f4
    ldr r2, [sp, #0x4]
    cmp r2, #0x30
    ldrge r1, [sp]
    cmpge r1, r5
    blt .L_190
    cmp r2, #0x60
    addlt r0, r5, #0x12
    cmplt r1, r0
    bge .L_190
    mov r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b .L_1c8
.L_190:
    cmp r2, #0xa0
    ldrge r1, [sp]
    cmpge r1, r5
    blt .L_1c0
    cmp r2, #0xd0
    addlt r0, r5, #0x12
    cmplt r1, r0
    bge .L_1c0
    mov r0, #0x1
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_1c8
.L_1c0:
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_1c8:
    bl func_02006160
    cmp r0, #0x0
    ldrne r0, [r4, #0x4]
    cmpne r0, #0x0
    beq .L_260
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x2
    str r0, [r4]
    b .L_260
.L_1fc:
    ldr r1, [r4, #0x14]
    ldr r2, _LIT1
    sub r1, r1, #0x1
    mul r3, r0, r1
    str r1, [r4, #0x14]
    mov r1, r3, asr #0x2
    ldr ip, [r4, #0xc]
    add r1, r3, r1, lsr #0x1d
    sub r1, ip, r1, asr #0x3
    ldr ip, _LIT2
    and r1, r2, r1, lsl #0x10
    str r1, [ip]
    ldr r1, [r4, #0x14]
    ldr r3, [r4, #0xc]
    mul r1, r0, r1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    sub r0, r3, r0, asr #0x3
    and r0, r2, r0, lsl #0x10
    str r0, [ip, #0x4]
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    addle sp, sp, #0x8
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, pc}
.L_260:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104acc
_LIT1: .word 0x01ff0000
_LIT2: .word 0x04001010
