; func_02075df4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02076260
        .extern func_02077e58
        .extern func_02077ecc
        .extern func_02077f8c
        .extern func_02078498
        .extern func_0207850c
        .extern func_020785cc
        .extern func_02078dcc
        .extern func_020945f4
        .global func_02075df4
        .arm
func_02075df4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x30
    mov r5, r1
    mov r6, r0
    ldrh r0, [r6, #0x32]
    ldrb r3, [r5, #0x3]
    ldrb r2, [r5, #0x4]
    add r1, r5, #0x5
    cmp r0, #0x4
    add r4, r2, r3, lsl #0x8
    add r8, r1, r4
    beq .L_bc
    cmp r0, #0x5
    beq .L_190
    b .L_260
.L_bc:
    add r7, r6, #0x3fc
    mov r0, r7
    bl func_02077f8c
    ldr r1, [r6, #0xbc]
    mov r0, r7
    mov r2, #0x10
    bl func_02077ecc
    add r0, sp, #0x0
    mov r1, #0x36
    mov r2, #0x30
    bl func_020945f4
    mov r0, r7
    add r1, sp, #0x0
    mov r2, #0x30
    bl func_02077ecc
    mov r0, r7
    add r1, r6, #0x1cc
    mov r2, #0x8
    bl func_02077ecc
    mov r0, r7
    mov r1, r5
    mov r2, #0x1
    bl func_02077ecc
    mov r0, r7
    add r1, r5, #0x3
    add r2, r4, #0x2
    bl func_02077ecc
    mov r0, r7
    mov r1, r8
    bl func_02077e58
    mov r0, r7
    bl func_02077f8c
    ldr r1, [r6, #0xbc]
    mov r0, r7
    mov r2, #0x10
    bl func_02077ecc
    add r0, sp, #0x0
    mov r1, #0x5c
    mov r2, #0x30
    bl func_020945f4
    mov r0, r7
    add r1, sp, #0x0
    mov r2, #0x30
    bl func_02077ecc
    mov r0, r7
    mov r1, r8
    mov r2, #0x10
    bl func_02077ecc
    mov r0, r7
    mov r1, r8
    bl func_02077e58
    add r4, r4, #0x10
    b .L_260
.L_190:
    add r7, r6, #0x348
    mov r0, r7
    bl func_020785cc
    ldr r1, [r6, #0xbc]
    mov r0, r7
    mov r2, #0x14
    bl func_0207850c
    add r0, sp, #0x0
    mov r1, #0x36
    mov r2, #0x28
    bl func_020945f4
    mov r0, r7
    add r1, sp, #0x0
    mov r2, #0x28
    bl func_0207850c
    mov r0, r7
    add r1, r6, #0x1cc
    mov r2, #0x8
    bl func_0207850c
    mov r0, r7
    mov r1, r5
    mov r2, #0x1
    bl func_0207850c
    mov r0, r7
    add r1, r5, #0x3
    add r2, r4, #0x2
    bl func_0207850c
    mov r0, r7
    mov r1, r8
    bl func_02078498
    mov r0, r7
    bl func_020785cc
    ldr r1, [r6, #0xbc]
    mov r0, r7
    mov r2, #0x14
    bl func_0207850c
    add r0, sp, #0x0
    mov r1, #0x5c
    mov r2, #0x28
    bl func_020945f4
    mov r0, r7
    add r1, sp, #0x0
    mov r2, #0x28
    bl func_0207850c
    mov r0, r7
    mov r1, r8
    mov r2, #0x14
    bl func_0207850c
    mov r0, r7
    mov r1, r8
    bl func_02078498
    add r4, r4, #0x14
.L_260:
    mov r0, r4, asr #0x8
    strb r0, [r5, #0x3]
    mov r2, r4
    add r0, r6, #0xc8
    add r1, r5, #0x5
    strb r4, [r5, #0x4]
    bl func_02078dcc
    add r0, r6, #0x1d4
    bl func_02076260
    add r0, r4, #0x5
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
