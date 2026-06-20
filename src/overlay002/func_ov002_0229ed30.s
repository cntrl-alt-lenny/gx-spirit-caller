; func_ov002_0229ed30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c9504
        .extern func_ov002_021c988c
        .extern func_ov002_0229d184
        .global func_ov002_0229ed30
        .arm
func_ov002_0229ed30:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    cmp r2, #0x0
    bne .L_20
    ldrsh r0, [r4, #0x2a]
    cmp r0, #0x0
    bne .L_148
.L_20:
    ldrsb r0, [r1]
    strb r0, [r4]
    ldrsb r0, [r1, #0x1]
    strb r0, [r4, #0x1]
    ldrsb r0, [r1, #0x2]
    strb r0, [r4, #0x2]
    ldrsb r0, [r1, #0x3]
    strb r0, [r4, #0x3]
    ldrsh r0, [r1, #0x4]
    strh r0, [r4, #0x4]
    ldrsh r0, [r1, #0x6]
    strh r0, [r4, #0x6]
    ldrsh r0, [r1, #0x8]
    strh r0, [r4, #0x8]
    ldrh r0, [r1, #0xa]
    strh r0, [r4, #0xa]
    ldr r0, [r1, #0xc]
    str r0, [r4, #0xc]
    ldr r0, [r1, #0x10]
    str r0, [r4, #0x10]
    ldrsh r0, [r4, #0x2a]
    add r0, r0, #0x1
    strh r0, [r4, #0x2a]
    ldrsh r0, [r4, #0x2a]
    cmp r0, #0x1
    addle sp, sp, #0x4
    ldmleia sp!, {r3, r4, pc}
    ldrh r1, [r4, #0x28]
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    strh r1, [sp]
    cmp r0, #0xd
    moveq r0, #0x1
    ldrnesh r0, [r4, #0x2a]
    ldrh r1, [sp]
    subne r0, r0, #0x2
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp]
    ldrh r0, [sp]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c988c
    ldrh r1, [sp]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x4000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x11
    strh r0, [sp]
    ldrh r0, [sp]
    bic r0, r0, #0x8000
    strh r0, [sp]
    ldrh r0, [sp]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c9504
    mov r1, r0
    add r2, sp, #0x0
    add r0, r4, #0x14
    bl func_ov002_0229d184
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_148:
    ldrsb r0, [r1]
    strb r0, [r4, #0x14]
    ldrsb r0, [r1, #0x1]
    strb r0, [r4, #0x15]
    ldrsb r0, [r1, #0x2]
    strb r0, [r4, #0x16]
    ldrsb r0, [r1, #0x3]
    strb r0, [r4, #0x17]
    ldrsh r0, [r1, #0x4]
    strh r0, [r4, #0x18]
    ldrsh r0, [r1, #0x6]
    strh r0, [r4, #0x1a]
    ldrsh r0, [r1, #0x8]
    strh r0, [r4, #0x1c]
    ldrh r0, [r1, #0xa]
    strh r0, [r4, #0x1e]
    ldr r0, [r1, #0xc]
    str r0, [r4, #0x20]
    ldr r0, [r1, #0x10]
    str r0, [r4, #0x24]
    ldrsh r0, [r4, #0x2a]
    add r0, r0, #0x1
    strh r0, [r4, #0x2a]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
