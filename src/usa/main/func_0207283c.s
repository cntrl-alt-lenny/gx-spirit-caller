; func_0207283c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02073014
        .extern func_02073650
        .extern func_02073750
        .extern func_02073dc8
        .extern func_02073e9c
        .global func_0207283c
        .arm
func_0207283c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r6, r0
    ldrh r3, [r6, #0xc]
    ldrh r4, [r6, #0xe]
    mov r5, r1
    mov r0, r3, asr #0x8
    orr r0, r0, r3, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r4, asr #0x8
    mov r3, r0, lsr #0x10
    orr r0, r1, r4, lsl #0x8
    mov r1, r3, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    mov r4, r2
    bl func_02073dc8
    movs r7, r0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    bl func_02073750
    cmp r0, #0x0
    bne .L_18c
    mov r0, r7
    bl func_02073650
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_18c:
    mov r2, #0x0
    strb r2, [r5]
    mov r0, r5
    mov r1, r4
    strh r2, [r5, #0x2]
    bl func_02073e9c
    mov r1, r0, asr #0x8
    orr r0, r1, r0, lsl #0x8
    strh r0, [r5, #0x2]
    ldrh r1, [r6, #0xc]
    ldrh r6, [r6, #0xe]
    mov r2, #0x0
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r6, asr #0x8
    mov r3, r0, lsr #0x10
    orr r0, r1, r6, lsl #0x8
    mov r1, r3, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r6, r1, r0, lsr #0x10
    mov r0, r5
    mov r1, r4
    mov r3, r2
    str r6, [sp]
    mov r4, #0x1
    str r4, [sp, #0x4]
    bl func_02073014
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
