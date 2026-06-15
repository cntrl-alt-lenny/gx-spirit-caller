; func_020117e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4b1c
        .extern data_020b4d60
        .extern func_020a991c
        .extern func_020b3870
        .global func_020117e4
        .arm
func_020117e4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr ip, _LIT0
    mov r1, r1, lsl #0x1
    add r0, ip, r0, lsl #0x4
    ldrsh r0, [r1, r0]
    cmp r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x10
    mov lr, r0, lsr #0x10
    cmp lr, #0x0
    ldr r4, _LIT1
    mov ip, #0x0
    ble .L_50
.L_38:
    ldrh r1, [r4]
    add r0, r4, #0x2
    add ip, ip, #0x1
    cmp ip, lr
    add r4, r0, r1, lsl #0x1
    blt .L_38
.L_50:
    ldrh r5, [r4]
    ldr r0, [sp, #0x10]
    cmp r0, #0x1
    ldreqh r0, [r4, #0x2]
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp lr, #0x15
    bgt .L_98
    bge .L_120
    sub r0, lr, #0x8
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_cc
    b .L_e4
    b .L_e4
    b .L_f8
    b .L_cc
    b .L_cc
    b .L_10c
.L_98:
    cmp lr, #0x18
    bgt .L_a8
    beq .L_17c
    b .L_cc
.L_a8:
    cmp lr, #0x1b
    bgt .L_cc
    cmp lr, #0x19
    blt .L_cc
    beq .L_198
    cmp lr, #0x1a
    beq .L_1bc
    cmp lr, #0x1b
    beq .L_1e0
.L_cc:
    bl func_020a991c
    mov r1, r5
    bl func_020b3870
    add r0, r4, r1, lsl #0x1
    ldrh r0, [r0, #0x2]
    ldmia sp!, {r3, r4, r5, pc}
.L_e4:
    cmp r2, #0x4
    cmpeq r3, #0x7
    ldreqh r0, [r4, #0x4]
    ldrneh r0, [r4, #0x2]
    ldmia sp!, {r3, r4, r5, pc}
.L_f8:
    cmp r2, #0x13
    cmpeq r3, #0x3
    ldreqh r0, [r4, #0x4]
    ldrneh r0, [r4, #0x2]
    ldmia sp!, {r3, r4, r5, pc}
.L_10c:
    cmp r2, #0x16
    cmpeq r3, #0x1
    ldreqh r0, [r4, #0x4]
    ldrneh r0, [r4, #0x2]
    ldmia sp!, {r3, r4, r5, pc}
.L_120:
    cmp r2, #0x21
    bne .L_164
    cmp r3, #0x2
    ldreqh r0, [r4, #0x4]
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r3, #0x3
    ldreqh r0, [r4, #0x2]
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r3, #0x4
    ldreqh r0, [r4, #0x6]
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020a991c
    mov r1, r5
    bl func_020b3870
    add r0, r4, r1, lsl #0x1
    ldrh r0, [r0, #0x2]
    ldmia sp!, {r3, r4, r5, pc}
.L_164:
    bl func_020a991c
    mov r1, r5
    bl func_020b3870
    add r0, r4, r1, lsl #0x1
    ldrh r0, [r0, #0x2]
    ldmia sp!, {r3, r4, r5, pc}
.L_17c:
    cmp r2, #0x17
    bne .L_190
    cmp r3, #0x5
    ldrgeh r0, [r4, #0x4]
    ldmgeia sp!, {r3, r4, r5, pc}
.L_190:
    ldrh r0, [r4, #0x2]
    ldmia sp!, {r3, r4, r5, pc}
.L_198:
    cmp r2, #0x20
    bgt .L_1ac
    bne .L_1b4
    cmp r3, #0x3
    blt .L_1b4
.L_1ac:
    ldrh r0, [r4, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
.L_1b4:
    ldrh r0, [r4, #0x2]
    ldmia sp!, {r3, r4, r5, pc}
.L_1bc:
    cmp r2, #0x8
    bgt .L_1d0
    bne .L_1d8
    cmp r3, #0x3
    blt .L_1d8
.L_1d0:
    ldrh r0, [r4, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
.L_1d8:
    ldrh r0, [r4, #0x2]
    ldmia sp!, {r3, r4, r5, pc}
.L_1e0:
    cmp r2, #0xb
    ldrgeh r0, [r4, #0x4]
    ldrlth r0, [r4, #0x2]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_020b4d60
_LIT1: .word data_020b4b1c
