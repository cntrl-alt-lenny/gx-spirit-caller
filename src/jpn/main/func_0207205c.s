; func_0207205c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020722b0
        .extern func_0207235c
        .extern func_02092fc8
        .global func_0207205c
        .arm
func_0207205c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r2, #0x3
    mov r6, r0
    mov r5, r1
    strb r2, [r4, #0x8]
    bl func_02092fc8
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    str r0, [r4, #0x10]
    ldrh r2, [r6, #0x10]
    ldrh r3, [r6, #0x12]
    mov r0, r5
    mov r1, r2, asr #0x8
    orr r1, r1, r2, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r2, r3, asr #0x8
    orr r2, r2, r3, lsl #0x8
    mov r1, r1, lsr #0x10
    mov r3, r1, lsl #0x10
    mov r1, r2, lsl #0x10
    orr r1, r3, r1, lsr #0x10
    str r1, [r4, #0x14]
    ldrh r3, [r5]
    mov r1, r4
    mov r2, r3, asr #0x8
    orr r2, r2, r3, lsl #0x8
    strh r2, [r4, #0x18]
    ldrh r3, [r6, #0xc]
    ldrh r6, [r6, #0xe]
    mov r2, r3, asr #0x8
    orr r2, r2, r3, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r3, r6, asr #0x8
    orr r3, r3, r6, lsl #0x8
    mov r2, r2, lsr #0x10
    mov r6, r2, lsl #0x10
    mov r2, r3, lsl #0x10
    orr r2, r6, r2, lsr #0x10
    str r2, [r4, #0x1c]
    ldrh r3, [r5, #0x4]
    ldrh r6, [r5, #0x6]
    mov r2, r3, asr #0x8
    orr r2, r2, r3, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r3, r6, asr #0x8
    mov r5, r2, lsr #0x10
    orr r2, r3, r6, lsl #0x8
    mov r3, r5, lsl #0x10
    mov r2, r2, lsl #0x10
    orr r2, r3, r2, lsr #0x10
    add r2, r2, #0x1
    str r2, [r4, #0x24]
    bl func_0207235c
    mov r0, r4
    mov r1, #0x12
    mov r2, #0x0
    bl func_020722b0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
