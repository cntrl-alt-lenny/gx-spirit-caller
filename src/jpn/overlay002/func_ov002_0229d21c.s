; func_ov002_0229d21c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022d1330
        .extern func_020b377c
        .extern func_ov002_0229d1dc
        .extern func_ov002_022a6cc8
        .global func_ov002_0229d21c
        .arm
func_ov002_0229d21c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x24
    mov r4, r0
    ldrsb r0, [r4]
    cmp r0, #0x0
    addeq sp, sp, #0x24
    ldmeqia sp!, {r4, r5, pc}
    ldrsh r0, [r4, #0x4]
    cmp r0, #0x8
    bne .L_88
    ldr r0, _LIT0
    ldrh r1, [r4, #0xa]
    ldr r0, [r0, #0x4]
    add sp, sp, #0x24
    mov r1, r1, lsl #0x1f
    eor r0, r0, #0x1
    cmp r0, r1, lsr #0x1f
    ldrh r1, [r4, #0xa]
    moveq r2, #0x1
    movne r2, #0x0
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x1f
    rsb r1, r1, r2, lsl #0x1
    ldrsb r0, [r4, #0x2]
    mov r1, r1, lsl #0x1e
    rsb r0, r0, r1, lsr #0x1b
    and r0, r0, #0x1f
    cmp r0, #0x10
    moveq r0, #0x1
    streqb r0, [r4, #0x1]
    ldrsh r0, [r4, #0x4]
    sub r0, r0, #0x1
    strh r0, [r4, #0x4]
    ldmia sp!, {r4, r5, pc}
.L_88:
    cmp r0, #0x0
    beq .L_1dc
    ldrh r0, [r4, #0xa]
    ldrsb r1, [r4, #0x3]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x1f
    cmp r1, r0, lsl #0x3
    addne r0, r1, #0x1
    andne r0, r0, #0xf
    strneb r0, [r4, #0x3]
    ldr r0, _LIT0
    ldrh r1, [r4, #0xa]
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    eor r0, r0, #0x1
    cmp r0, r1, lsr #0x1f
    ldrh r0, [r4, #0xa]
    moveq r2, #0x1
    movne r2, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x1f
    rsb r0, r0, r2, lsl #0x1
    ldrsb r1, [r4, #0x2]
    mov r0, r0, lsl #0x1e
    cmp r1, r0, lsr #0x1b
    beq .L_128
    rsb r0, r1, r0, lsr #0x1b
    and r0, r0, #0x1f
    cmp r0, #0x10
    ldrsb r0, [r4, #0x1]
    bgt .L_118
    add r1, r1, #0x1
    add r0, r1, r0
    and r0, r0, #0x1f
    strb r0, [r4, #0x2]
    b .L_128
.L_118:
    sub r1, r1, #0x1
    sub r0, r1, r0
    and r0, r0, #0x1f
    strb r0, [r4, #0x2]
.L_128:
    ldrh r2, [r4, #0xa]
    ldr r1, _LIT1
    add r0, sp, #0xc
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x18
    str r2, [sp]
    ldrh r2, [r4, #0xa]
    mov r3, r2, lsl #0x1a
    mov ip, r2, lsl #0x1f
    mov r2, ip, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6cc8
    ldr r3, [sp, #0xc]
    ldrsh r0, [r4, #0x6]
    ldr r2, [sp, #0x10]
    ldrsh r1, [r4, #0x4]
    sub r0, r0, r3
    str r3, [sp, #0x1c]
    mul r0, r1, r0
    add r1, r1, #0x1
    str r2, [sp, #0x20]
    bl func_020b377c
    ldr r1, [sp, #0x1c]
    ldr r5, [sp, #0x20]
    add r0, r1, r0
    strh r0, [r4, #0x6]
    ldrsh r0, [r4, #0x8]
    ldrsh r1, [r4, #0x4]
    sub r0, r0, r5
    mul r0, r1, r0
    add r1, r1, #0x1
    bl func_020b377c
    add r0, r5, r0
    strh r0, [r4, #0x8]
    ldrsh r0, [r4, #0x4]
    sub r0, r0, #0x1
    strh r0, [r4, #0x4]
    ldrsh r0, [r4, #0x4]
    cmp r0, #0x0
    addne sp, sp, #0x24
    ldmneia sp!, {r4, r5, pc}
    mov r0, r4
    bl func_ov002_0229d1dc
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
.L_1dc:
    ldrh r1, [r4, #0xa]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    strb r1, [r4, #0x3]
    ldrh r1, [r4, #0xa]
    ldr r0, [r0, #0x4]
    ldrh r2, [r4, #0xa]
    mov r1, r1, lsl #0x1f
    eor r0, r0, #0x1
    cmp r0, r1, lsr #0x1f
    moveq r3, #0x1
    mov r2, r2, lsl #0x10
    movne r3, #0x0
    mov r2, r2, lsr #0x1f
    rsb r2, r2, r3, lsl #0x1
    mov r2, r2, lsl #0x1e
    mov r2, r2, lsr #0x1b
    strb r2, [r4, #0x2]
    ldrh r2, [r4, #0xa]
    ldr r1, _LIT1
    add r0, sp, #0x4
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x18
    str r2, [sp]
    ldrh r2, [r4, #0xa]
    mov r3, r2, lsl #0x1a
    mov ip, r2, lsl #0x1f
    mov r2, ip, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6cc8
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r0, [sp, #0x14]
    strh r0, [r4, #0x6]
    strh r1, [r4, #0x8]
    ldr r0, [r4, #0x10]
    str r1, [sp, #0x18]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [r4, #0x10]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word data_ov002_022d1330
