; func_ov002_0229e53c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b0008
        .extern func_ov002_021c9424
        .extern func_ov002_021c97ac
        .extern func_ov002_0229d074
        .global func_ov002_0229e53c
        .arm
func_ov002_0229e53c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r0, [r4, #0x28]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b0008
    strh r0, [r4, #0x2a]
    ldrsh r1, [r4, #0x2a]
    cmp r1, #0x0
    beq .L_1ac
    ldrh r0, [r4, #0x28]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xd
    moveq r0, #0x0
    subne r0, r1, #0x1
    ldrh r1, [r4, #0x28]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [r4, #0x28]
    ldrh r0, [r4, #0x28]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c97ac
    ldrh r1, [r4, #0x28]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x4000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x11
    strh r0, [r4, #0x28]
    ldrh r0, [r4, #0x28]
    bic r0, r0, #0x8000
    strh r0, [r4, #0x28]
    ldrh r0, [r4, #0x28]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c9424
    mov r1, r0
    mov r0, r4
    add r2, r4, #0x28
    bl func_ov002_0229d074
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
    bl func_ov002_021c97ac
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
    bl func_ov002_021c9424
    mov r1, r0
    add r2, sp, #0x0
    add r0, r4, #0x14
    bl func_ov002_0229d074
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_1ac:
    ldrh r1, [r4, #0x28]
    mov r0, #0x0
    bic r1, r1, #0x3fc0
    strh r1, [r4, #0x28]
    strb r0, [r4]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
