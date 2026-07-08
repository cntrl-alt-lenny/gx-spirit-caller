; func_ov002_0222a2f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d0170
        .extern func_0202e274
        .extern func_ov002_021b939c
        .extern func_ov002_021d7178
        .extern func_ov002_021e277c
        .extern func_ov002_0223de04
        .global func_ov002_0222a2f0
        .arm
func_ov002_0222a2f0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    beq .L_1a0
    cmp r0, #0x80
    mov r0, #0x0
    bne .L_2a4
    str r0, [r1, #0x5ac]
.L_1a0:
    ldrh r0, [r5, #0x6]
    mov r0, r0, lsl #0x10
    movs r1, r0, lsr #0x18
    beq .L_250
    mov r0, r5
    sub r1, r1, #0x1
    bl func_ov002_0223de04
    mov r6, r0
    bl func_ov002_021b939c
    mov r1, r0, lsr #0x10
    mov r1, r1, lsl #0x10
    and r4, r0, #0xff
    movs r0, r1, lsr #0x10
    bmi .L_21c
    mov r0, r4
    mov r1, r6
    mov r2, #0x1
    bl func_ov002_021d7178
    ldr r0, _LIT1
    mov r1, r6, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e274
    cmp r0, #0x0
    bne .L_21c
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r2, [r0, #0x5ac]
    orr r1, r2, r1, lsl r4
    str r1, [r0, #0x5ac]
.L_21c:
    ldrh r2, [r5, #0x6]
    mov r0, #0x7f
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x18
    add r1, r1, #0xff
    add r1, r1, #0xff00
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x10
    strh r1, [r5, #0x6]
    ldmia sp!, {r4, r5, r6, pc}
.L_250:
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT0
    mov r1, #0x1
    mov r3, r2, lsl #0x1f
    ldr r2, [r0, #0x5ac]
    mov r0, r3, lsr #0x1f
    tst r2, r1, lsl r0
    beq .L_274
    bl func_ov002_021e277c
.L_274:
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT0
    mov r1, #0x1
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, [r0, #0x5ac]
    rsb r0, r3, #0x1
    tst r2, r1, lsl r0
    beq .L_29c
    bl func_ov002_021e277c
.L_29c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_2a4:
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0170
