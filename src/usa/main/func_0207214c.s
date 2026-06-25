; func_0207214c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef74
        .extern func_020722b0
        .extern func_02094500
        .global func_0207214c
        .arm
func_0207214c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r4, _LIT0
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x64
    mov r5, r3
    bl func_02094500
    ldrh r2, [r7, #0x2]
    mov r1, r4
    mov r0, r2, asr #0x8
    orr r0, r0, r2, lsl #0x8
    strh r0, [r1, #0xa]
    ldrh r2, [r7]
    mov r0, r2, asr #0x8
    orr r0, r0, r2, lsl #0x8
    strh r0, [r1, #0x18]
    ldrh r2, [r8, #0xc]
    ldrh r8, [r8, #0xe]
    mov r0, r2, asr #0x8
    orr r0, r0, r2, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r2, r8, asr #0x8
    mov r3, r0, lsr #0x10
    orr r0, r2, r8, lsl #0x8
    mov r2, r3, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    str r0, [r1, #0x1c]
    ldrb r0, [r7, #0xd]
    ands r0, r0, #0x10
    beq .L_d0
    ldrh r2, [r7, #0x8]
    ldrh r6, [r7, #0xa]
    mov r0, r4
    mov r1, r2, asr #0x8
    orr r1, r1, r2, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r2, r6, asr #0x8
    mov r3, r1, lsr #0x10
    orr r1, r2, r6, lsl #0x8
    mov r2, r3, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r3, r2, r1, lsr #0x10
    mov r2, r5
    mov r1, #0x4
    str r3, [r4, #0x28]
    bl func_020722b0
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_d0:
    mov r0, #0x0
    str r0, [r4, #0x28]
    ldrh r1, [r7, #0x4]
    ldrh r3, [r7, #0x6]
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r3, asr #0x8
    mov r2, r0, lsr #0x10
    orr r0, r1, r3, lsl #0x8
    mov r1, r2, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    add r0, r6, r0
    str r0, [r4, #0x24]
    ldrb r0, [r7, #0xd]
    mov r2, r5
    mov r1, #0x14
    ands r0, r0, #0x3
    ldrne r0, [r4, #0x24]
    addne r0, r0, #0x1
    strne r0, [r4, #0x24]
    mov r0, r4
    bl func_020722b0
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_0219ef74
