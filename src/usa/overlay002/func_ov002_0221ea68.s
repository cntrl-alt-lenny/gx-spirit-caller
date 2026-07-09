; func_ov002_0221ea68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021d7178
        .extern func_ov002_021d7c1c
        .extern func_ov002_021e267c
        .extern func_ov002_022535a4
        .global func_ov002_0221ea68
        .arm
func_ov002_0221ea68:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r3, [r4, #0x2]
    mov r0, r3, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq .L_54
    mov r0, r3, lsl #0x11
    mov r1, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r5, r0, r1, lsr #0x1f
    ldrh r1, [r4]
    mov r0, r5
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021e267c
    mov r0, r5
    mov r1, #0x9c
    bl func_ov002_021ae320
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_54:
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7e
    beq .L_14c
    cmp r0, #0x7f
    beq .L_12c
    cmp r0, #0x80
    bne .L_240
    ldrh r1, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_022535a4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r4]
    ldr r1, _LIT1
    cmp r2, r1
    bgt .L_d0
    bge .L_f8
    sub r0, r1, #0x6
    cmp r2, r0
    bgt .L_124
    sub r0, r1, #0x9
    cmp r2, r0
    blt .L_124
    subne r0, r1, #0x6
    cmpne r2, r0
    beq .L_e0
    b .L_124
.L_d0:
    add r0, r1, #0x5
    cmp r2, r0
    beq .L_110
    b .L_124
.L_e0:
    ldrh r0, [r4, #0x2]
    mov r1, #0x4c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    b .L_124
.L_f8:
    ldrh r0, [r4, #0x2]
    mov r1, #0x4e
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    b .L_124
.L_110:
    ldrh r0, [r4, #0x2]
    mov r1, #0x4d
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
.L_124:
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_12c:
    ldrh r2, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0x6
    mov r3, #0x0
    bl func_ov002_021af8f0
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_14c:
    ldrh r2, [r4]
    ldr r1, _LIT1
    cmp r2, r1
    bgt .L_18c
    bge .L_1dc
    sub r0, r1, #0x6
    cmp r2, r0
    bgt .L_238
    sub r0, r1, #0x9
    cmp r2, r0
    blt .L_238
    beq .L_19c
    sub r0, r1, #0x6
    cmp r2, r0
    beq .L_1dc
    b .L_238
.L_18c:
    add r0, r1, #0x5
    cmp r2, r0
    beq .L_21c
    b .L_238
.L_19c:
    bl func_ov002_021afa94
    mov r5, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldrh r2, [r4, #0x2]
    mov r0, r0, lsl #0x2
    ldr r1, [r5]
    mov r3, r2, lsl #0x1f
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r0, r3, lsr #0x1f
    mov r2, #0x1
    bl func_ov002_021d7178
    b .L_238
.L_1dc:
    bl func_ov002_021afa94
    mov r5, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldrh r2, [r4, #0x2]
    mov r0, r0, lsl #0x2
    ldr r1, [r5]
    mov r3, r2, lsl #0x1f
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r0, r3, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_021d7178
    b .L_238
.L_21c:
    bl func_ov002_021afa94
    ldrh r1, [r4, #0x2]
    mov r2, r0
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021d7c1c
.L_238:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_240:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00001452
