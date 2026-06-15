; func_ov017_021b6264 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov017_021b7ef8
        .extern data_ov017_021b867c
        .extern func_0202b100
        .extern func_0202c0c0
        .extern func_020aadf8
        .global func_ov017_021b6264
        .arm
func_ov017_021b6264:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x144
    mov lr, r0
    ldr r0, [lr, #0x4]
    mov r6, r1
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_168
    b .L_30
    b .L_4c
    b .L_64
    b .L_14c
.L_30:
    add r0, lr, r6
    ldrb r0, [r0, #0x20]
    add r0, r0, #0x3bc
    add r0, r0, #0x400
    bl func_0202c0c0
    add sp, sp, #0x144
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_4c:
    add r0, lr, r6
    ldrb r0, [r0, #0x20]
    add r0, r0, #0x7d0
    bl func_0202c0c0
    add sp, sp, #0x144
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_64:
    ldr ip, _LIT0
    add r5, sp, #0x0
    mov r4, #0x4
.L_70:
    ldmia ip!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_70
    ldr r0, [ip]
    add r4, lr, #0x20
    str r0, [r5]
    ldrb r1, [r4, r6]
    cmp r1, #0x0
    bne .L_a8
    ldr r0, _LIT1
    bl func_0202c0c0
    add sp, sp, #0x144
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_a8:
    add r0, sp, #0x0
    ldr r0, [r0, r1, lsl #0x2]
    mov r5, #0x0
    bl func_0202b100
    mov r1, r0
    add r0, sp, #0x44
    bl func_020aadf8
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x2
    bne .L_134
    ldrb r2, [r4, r6]
    add r1, sp, #0x0
    ldr r0, _LIT3
    ldr r1, [r1, r2, lsl #0x2]
    cmp r1, r0
    bne .L_134
    ldrsb r0, [sp, #0x44]
    cmp r0, #0x0
    beq .L_124
    ldr r1, _LIT4
    add r2, sp, #0x44
.L_108:
    ldrsb r0, [r2]
    cmp r0, #0x20
    strneb r0, [r1, r5]
    ldrsb r0, [r2, #0x1]!
    addne r5, r5, #0x1
    cmp r0, #0x0
    bne .L_108
.L_124:
    ldr r0, _LIT4
    mov r1, #0x0
    strb r1, [r0, r5]
    b .L_140
.L_134:
    ldr r0, _LIT4
    add r1, sp, #0x44
    bl func_020aadf8
.L_140:
    add sp, sp, #0x144
    ldr r0, _LIT4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_14c:
    add r0, lr, r6
    ldrb r0, [r0, #0x20]
    add r0, r0, #0x36c
    add r0, r0, #0x400
    bl func_0202c0c0
    add sp, sp, #0x144
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_168:
    mov r0, #0x0
    add sp, sp, #0x144
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov017_021b7ef8
_LIT1: .word 0x0000079f
_LIT2: .word data_02104f4c
_LIT3: .word 0x0000190d
_LIT4: .word data_ov017_021b867c
