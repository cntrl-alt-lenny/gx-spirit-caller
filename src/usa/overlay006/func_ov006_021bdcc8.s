; func_ov006_021bdcc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_ov006_0224f328
        .extern data_ov006_0225df48
        .extern func_0202bb74
        .extern func_0202bb88
        .extern func_020371b8
        .extern func_ov006_021b7ab0
        .extern func_ov006_021b7b94
        .extern func_ov006_021b7bc0
        .extern func_ov006_021b7be0
        .extern func_ov006_021b8d4c
        .extern func_ov006_021bbcb4
        .extern func_ov006_021bca88
        .extern func_ov006_021bd5f4
        .extern func_ov006_021bd758
        .extern func_ov006_021bdfa4
        .extern func_ov006_021bef10
        .extern func_ov006_021bf198
        .extern func_ov006_021ca158
        .extern func_ov006_021ca2d4
        .extern func_ov006_021ca2e4
        .global func_ov006_021bdcc8
        .arm
func_ov006_021bdcc8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    add r5, sp, #0x0
    mov r7, r0
    mov r1, r5
    add r0, r7, #0x88
    mov r2, #0xc
    mov r6, #0x0
    ldr r4, _LIT0
    ldr r8, _LIT1
    bl Copy32
    mov r2, r6
    str r2, [r7, #0x88]
    str r2, [r7, #0x8c]
    str r2, [r7, #0x90]
    ldr r0, [sp]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_2c4
    b .L_2c4
    b .L_68
    b .L_dc
    b .L_130
    b .L_190
    b .L_1c4
    b .L_298
.L_68:
    ldmib r5, {r1, r2}
    cmp r1, r2
    beq .L_2c4
    mov r0, r7
    bl func_ov006_021bdfa4
    movs r6, r0
    beq .L_c4
    ldr r0, [r7, #0x40]
    cmp r0, #0x1
    beq .L_9c
    cmp r0, #0x2
    beq .L_b8
    b .L_2c4
.L_9c:
    mov r0, r7
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov006_021bca88
    mov r0, r7
    bl func_ov006_021bef10
    b .L_2c4
.L_b8:
    mov r0, r7
    bl func_ov006_021bf198
    b .L_2c4
.L_c4:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_2c4
.L_dc:
    ldr r1, [r5, #0x4]
    mov r0, r4
    mov r3, #0x1
    bl func_ov006_021b8d4c
    ldr r0, [r7, #0x50]
    mov r1, #0x4
    cmp r0, #0x4
    strne r0, [r7, #0x5c]
    mov r0, r7
    mov r2, #0x0
    str r1, [r7, #0x50]
    bl func_ov006_021bd5f4
    mov r0, r7
    bl func_ov006_021bbcb4
    mov r0, r7
    bl func_ov006_021bd758
    ldr r0, [r5, #0x4]
    mov r6, #0x1
    str r0, [r7, #0x60]
    str r6, [r7, #0x84]
    b .L_2c4
.L_130:
    ldr r0, [r5, #0x4]
    bl func_0202bb88
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, [r5, #0x4]
    movne r1, r6
    bl func_0202bb74
    mov r8, #0x0
    mov r5, #0x1
    mov r7, r8
.L_158:
    mov r0, r4
    mov r1, r8
    mov r2, r7
    bl func_ov006_021b7be0
    cmp r0, #0x0
    blt .L_180
    mov r0, r4
    mov r1, r8
    bl func_ov006_021b7ab0
    mov r6, r5
.L_180:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_158
    b .L_2c4
.L_190:
    ldr r1, [r7, #0x50]
    ldr r2, [r5, #0x4]
    mov r0, r4
    bl func_ov006_021b7b94
    ldr r1, [r7, #0x50]
    mov r0, r4
    bl func_ov006_021b7ab0
    ldr r1, [r7, #0x50]
    mov r0, r7
    mov r2, r6
    bl func_ov006_021bd5f4
    mov r6, #0x1
    b .L_2c4
.L_1c4:
    ldr r6, [r5, #0x4]
    cmp r6, #0x0
    bge .L_260
    ldr r5, [r7, #0x50]
    mov r0, r4
    mov r1, r5
    sub r3, r2, #0x1
    bl func_ov006_021b7bc0
    mov r2, #0x1
    mov r0, r4
    mov r1, r5
    sub r3, r2, #0x2
    bl func_ov006_021b7bc0
    mov r2, #0x2
    mov r0, r4
    mov r1, r5
    sub r3, r2, #0x3
    bl func_ov006_021b7bc0
    mov r0, r4
    mov r1, r5
    mov r2, #0x3
    sub r3, r2, #0x4
    bl func_ov006_021b7bc0
    mov r0, r4
    mov r1, r5
    mov r2, #0x4
    sub r3, r2, #0x5
    bl func_ov006_021b7bc0
    mov r0, r4
    mov r1, r5
    mov r2, #0x5
    sub r3, r2, #0x6
    bl func_ov006_021b7bc0
    mov r1, r5
    mov r0, r4
    mov r2, #0x6
    sub r3, r2, #0x7
    bl func_ov006_021b7bc0
    b .L_274
.L_260:
    ldr r1, [r7, #0x50]
    ldr r3, [r5, #0x8]
    mov r0, r4
    mov r2, r6
    bl func_ov006_021b7bc0
.L_274:
    ldr r1, [r7, #0x50]
    mov r0, r4
    bl func_ov006_021b7ab0
    ldr r1, [r7, #0x50]
    mov r0, r7
    mov r2, #0x0
    bl func_ov006_021bd5f4
    mov r6, #0x1
    b .L_2c4
.L_298:
    ldr r1, _LIT2
    mov r0, r8
    mov r2, #0xd
    bl func_ov006_021ca2d4
    mov r0, r8
    mov r1, #0x2
    mov r2, #0xe
    bl func_ov006_021ca2e4
    mov r0, r8
    ldmib r5, {r1, r2}
    bl func_ov006_021ca158
.L_2c4:
    mov r0, r6
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word data_ov006_0225df48
_LIT2: .word 0x00000322
