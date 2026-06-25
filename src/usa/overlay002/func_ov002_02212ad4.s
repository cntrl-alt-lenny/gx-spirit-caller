; func_ov002_02212ad4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5a90
        .extern func_ov002_02210014
        .extern func_ov002_0226b02c
        .global func_ov002_02212ad4
        .arm
func_ov002_02212ad4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r3, [r4, #0x2]
    mov r2, r3, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x2
    bne .L_2c
    bl func_ov002_02210014
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_2c:
    ldrh r2, [r4]
    mov r0, r3, lsl #0x1f
    mov r1, r3, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r3, #0x1
    bl func_ov002_021d5a90
    ldrh r0, [r4, #0x2]
    mov r3, #0x5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldrh r1, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d58dc
    ldrh r0, [r4, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b02c
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
