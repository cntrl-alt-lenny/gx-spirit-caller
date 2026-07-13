; func_ov019_021b5628 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern func_0200612c
        .extern func_02006160
        .extern func_020371b8
        .global func_ov019_021b5628
        .arm
func_ov019_021b5628:
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
    beq .L_180
    b .L_1f4
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
    b .L_1f4
.L_b4:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_1f4
    cmp r1, #0x0
    beq .L_f8
    cmp r0, #0x1
    bne .L_1f4
    tst r1, #0x3
    beq .L_1f4
    mov r0, #0x3a
    mov ip, #0x2
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x4]
    bl func_020371b8
    b .L_1f4
.L_f8:
    cmp r0, #0x1
    bne .L_1f4
    ldr r1, [r4, #0x18]
    add r0, sp, #0x4
    add r2, r1, r3
    add r1, sp, #0x0
    add r5, r2, #0x5
    bl func_0200612c
    ldr r0, [sp, #0x4]
    cmp r0, #0x68
    ldrge r1, [sp]
    cmpge r1, r5
    blt .L_144
    cmp r0, #0x98
    addlt r0, r5, #0x12
    cmplt r1, r0
    movlt r0, #0x1
    strlt r0, [r4, #0xc]
    blt .L_14c
.L_144:
    mov r0, #0x0
    str r0, [r4, #0xc]
.L_14c:
    bl func_02006160
    cmp r0, #0x0
    ldrne r0, [r4, #0xc]
    cmpne r0, #0x0
    beq .L_1f4
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x2
    str r0, [r4, #0x4]
    b .L_1f4
.L_180:
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
    bgt .L_1f4
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x1c]
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1f4:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104acc
_LIT1: .word 0x01ff0000
_LIT2: .word 0x04001010
