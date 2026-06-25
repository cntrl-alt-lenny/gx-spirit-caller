; func_02075a00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee2c
        .extern func_02075c5c
        .extern func_02075f20
        .extern func_0207619c
        .extern func_02076434
        .extern func_020769e8
        .extern func_02076c2c
        .extern func_02076cf4
        .extern func_02094500
        .global func_02075a00
        .arm
func_02075a00:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldrb r0, [r8, #0x455]
    mov r7, r1
    cmp r0, #0x9
    bne .L_30
    ldr r1, _LIT0
    mov r0, r7
    ldr r1, [r1]
    blx r1
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_30:
    ldrb r2, [r7, #0x3]
    ldrb r1, [r7, #0x4]
    add r0, r0, #0xf9
    and r0, r0, #0xff
    add r1, r1, r2, lsl #0x8
    cmp r0, #0x1
    add r5, r1, #0x5
    ldrb r4, [r7]
    bhi .L_5c
    cmp r4, #0x15
    bne .L_6c
.L_5c:
    cmp r4, #0x15
    bne .L_7c
    cmp r5, #0x7
    bls .L_7c
.L_6c:
    mov r0, r8
    mov r1, r7
    bl func_02075f20
    mov r5, r0
.L_7c:
    sub r0, r4, #0x14
    cmp r0, #0x3
    add r6, r7, #0x5
    sub r5, r5, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_238
    b .L_a4
    b .L_d4
    b .L_e8
    b .L_214
.L_a4:
    ldr r0, [r8, #0x1d4]
    cmp r0, #0x0
    moveq r0, #0x9
    streqb r0, [r8, #0x455]
    beq .L_240
    add r0, r8, #0x2e4
    mov r1, #0x0
    mov r2, #0x8
    bl func_02094500
    mov r0, #0x7
    strb r0, [r8, #0x455]
    b .L_240
.L_d4:
    ldrb r0, [r6]
    cmp r0, #0x2
    moveq r0, #0x9
    streqb r0, [r8, #0x455]
    b .L_240
.L_e8:
    ldrb r1, [r6, #0x1]
    ldrb r0, [r6, #0x2]
    ldrb r3, [r6]
    ldrb r2, [r6, #0x3]
    mov r1, r1, lsl #0x10
    add r0, r1, r0, lsl #0x8
    cmp r3, #0xb
    add r4, r2, r0
    add r6, r6, #0x4
    bgt .L_13c
    cmp r3, #0xb
    bge .L_1b0
    cmp r3, #0x2
    bgt .L_1dc
    cmp r3, #0x1
    blt .L_1dc
    cmp r3, #0x1
    beq .L_168
    cmp r3, #0x2
    beq .L_1a0
    b .L_1dc
.L_13c:
    cmp r3, #0x14
    bgt .L_1dc
    cmp r3, #0xe
    blt .L_1dc
    cmp r3, #0xe
    beq .L_1c0
    cmp r3, #0x10
    beq .L_190
    cmp r3, #0x14
    beq .L_1cc
    b .L_1dc
.L_168:
    ldrb r0, [r8, #0x454]
    cmp r0, #0x0
    beq .L_1e4
    ldrb r0, [r8, #0x455]
    cmp r0, #0x0
    bne .L_1e4
    mov r0, r8
    mov r1, r6
    bl func_020769e8
    b .L_1e4
.L_190:
    mov r0, r8
    mov r1, r6
    bl func_02076434
    b .L_1e4
.L_1a0:
    mov r0, r8
    mov r1, r6
    bl func_02076c2c
    b .L_1e4
.L_1b0:
    mov r0, r8
    mov r1, r6
    bl func_02076cf4
    b .L_1e4
.L_1c0:
    mov r0, #0x4
    strb r0, [r8, #0x455]
    b .L_1e4
.L_1cc:
    mov r0, r8
    mov r1, r6
    bl func_0207619c
    b .L_1e4
.L_1dc:
    mov r0, #0x9
    strb r0, [r8, #0x455]
.L_1e4:
    mov r0, r8
    sub r1, r6, #0x4
    add r2, r4, #0x4
    bl func_02075c5c
    add r0, r4, #0x4
    add r6, r6, r4
    subs r5, r5, r0
    beq .L_240
    ldrb r0, [r8, #0x455]
    cmp r0, #0x9
    bne .L_e8
    b .L_240
.L_214:
    str r7, [r8, #0x824]
    mov r0, #0x5
    str r0, [r8, #0x82c]
    add r0, r5, #0x5
    str r0, [r8, #0x828]
    mov r0, #0x1
    strb r0, [r8, #0x456]
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_238:
    mov r0, #0x9
    strb r0, [r8, #0x455]
.L_240:
    ldr r1, _LIT0
    mov r0, r7
    ldr r1, [r1]
    blx r1
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_0219ee2c
