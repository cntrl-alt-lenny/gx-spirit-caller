; func_02019af4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_02104f4c
        .extern func_02018bc0
        .extern func_02019acc
        .global func_02019af4
        .arm
func_02019af4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl GetSystemWork
    cmp r5, #0x35
    bgt .L_6c
    bge .L_144
    cmp r5, #0x1c
    bgt .L_50
    cmp r5, #0x19
    blt .L_44
    beq .L_fc
    cmp r5, #0x1b
    beq .L_cc
    cmp r5, #0x1c
    beq .L_e4
    b .L_1c0
.L_44:
    cmp r5, #0x5
    beq .L_190
    b .L_1c0
.L_50:
    cmp r5, #0x29
    bgt .L_60
    beq .L_120
    b .L_1c0
.L_60:
    cmp r5, #0x31
    beq .L_15c
    b .L_1c0
.L_6c:
    cmp r5, #0x48
    bgt .L_b0
    bge .L_150
    sub r0, r5, #0x36
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_1c0
    b .L_12c
    b .L_1c0
    b .L_138
    b .L_114
    b .L_150
    b .L_1c0
    b .L_1c0
    b .L_1c0
    b .L_108
    b .L_d8
.L_b0:
    cmp r5, #0x4b
    bgt .L_c0
    beq .L_190
    b .L_1c0
.L_c0:
    cmp r5, #0x5e
    beq .L_f0
    b .L_1c0
.L_cc:
    mov r0, #0x1
    bl func_02019acc
    b .L_1c0
.L_d8:
    mov r0, #0x2
    bl func_02019acc
    b .L_1c0
.L_e4:
    mov r0, #0x3
    bl func_02019acc
    b .L_1c0
.L_f0:
    mov r0, #0x4
    bl func_02019acc
    b .L_1c0
.L_fc:
    mov r0, #0x5
    bl func_02019acc
    b .L_1c0
.L_108:
    mov r0, #0x9
    bl func_02019acc
    b .L_1c0
.L_114:
    mov r0, #0xa
    bl func_02019acc
    b .L_1c0
.L_120:
    mov r0, #0x11
    bl func_02019acc
    b .L_1c0
.L_12c:
    mov r0, #0x13
    bl func_02019acc
    b .L_1c0
.L_138:
    mov r0, #0x14
    bl func_02019acc
    b .L_1c0
.L_144:
    mov r0, #0x15
    bl func_02019acc
    b .L_1c0
.L_150:
    mov r0, #0x16
    bl func_02019acc
    b .L_1c0
.L_15c:
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1f
    ldr r2, [r0, #0xa68]
    tst r4, #0x2
    orr r1, r2, r1, lsr #0x19
    str r1, [r0, #0xa68]
    ldr r0, _LIT0
    movne r2, #0x1
    ldr r1, [r0, #0xa68]
    moveq r2, #0x0
    orr r1, r1, r2, lsl #0x12
    str r1, [r0, #0xa68]
    b .L_1c0
.L_190:
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1f
    ldr r2, [r0, #0xa68]
    tst r4, #0x2
    orr r1, r2, r1, lsr #0x18
    str r1, [r0, #0xa68]
    ldr r0, _LIT0
    movne r2, #0x1
    ldr r1, [r0, #0xa68]
    moveq r2, #0x0
    orr r1, r1, r2, lsl #0x8
    str r1, [r0, #0xa68]
.L_1c0:
    mov r0, r5
    bl func_02018bc0
    ldr r2, [r0, #0x10]
    mov r1, r2, lsl #0x1c
    orr r1, r4, r1, lsr #0x1e
    bic r2, r2, #0xc
    mov r1, r1, lsl #0x1e
    orr r1, r2, r1, lsr #0x1c
    str r1, [r0, #0x10]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104f4c
