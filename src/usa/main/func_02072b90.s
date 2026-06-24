; func_02072b90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ede8
        .extern data_0219ee3c
        .extern data_0219ee96
        .extern data_0219f098
        .extern data_021a62f0
        .extern func_02073014
        .extern func_02073ec4
        .extern func_02073ee0
        .global func_02072b90
        .arm
func_02072b90:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r7, r2
    ldrb r2, [r7, #0x8]
    mov r9, r0
    mov r8, r1
    cmp r2, #0x0
    mov r6, r3
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    ldr r0, _LIT0
    ldr r3, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0, #0x4]
    ldr ip, [r3]
    cmp r0, r1
    ldreq r4, _LIT3
    ldrne r0, [r7, #0x4c]
    addne r4, r0, #0x22
    ands r0, r6, #0x2
    movne r5, #0x18
    moveq r5, #0x14
    add r1, r5, r8
    mov r2, r1, lsl #0x10
    mov r1, ip, lsr #0x10
    mov r1, r1, lsl #0x10
    mov ip, r1, lsr #0x10
    mov r1, ip, asr #0x8
    orr r1, r1, ip, lsl #0x8
    strh r1, [r4, #-12]
    ldr r1, [r3]
    mov ip, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, r2, asr #0x8
    orr r1, r1, r2, lsl #0x8
    strh r1, [r4, #-10]
    ldr r1, [r7, #0x1c]
    mov r3, ip, asr #0x8
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, r2, asr #0x8
    orr r1, r1, r2, lsl #0x8
    strh r1, [r4, #-8]
    ldr r1, [r7, #0x1c]
    mov r2, r5, lsr #0x2
    mov r1, r1, lsl #0x10
    mov lr, r1, lsr #0x10
    mov r1, lr, asr #0x8
    orr r1, r1, lr, lsl #0x8
    strh r1, [r4, #-6]
    mov r1, #0x600
    strh r1, [r4, #-4]
    orr r1, r3, ip, lsl #0x8
    strh r1, [r4, #-2]
    ldrh ip, [r7, #0xa]
    cmp r0, #0x0
    mov r2, r2, lsl #0x4
    mov r3, ip, asr #0x8
    orr r3, r3, ip, lsl #0x8
    strh r3, [r4]
    ldrh r3, [r7, #0x18]
    mov r1, #0x0
    mov r0, r3, asr #0x8
    orr r0, r0, r3, lsl #0x8
    strh r0, [r4, #0x2]
    ldr r0, [r7, #0x28]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r3, asr #0x8
    orr r0, r0, r3, lsl #0x8
    strh r0, [r4, #0x4]
    ldr r0, [r7, #0x28]
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r3, asr #0x8
    orr r0, r0, r3, lsl #0x8
    strh r0, [r4, #0x6]
    ldr r0, [r7, #0x24]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r3, asr #0x8
    orr r0, r0, r3, lsl #0x8
    strh r0, [r4, #0x8]
    ldr r0, [r7, #0x24]
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r3, asr #0x8
    orr r0, r0, r3, lsl #0x8
    strh r0, [r4, #0xa]
    strb r2, [r4, #0xc]
    strb r6, [r4, #0xd]
    ldr r2, [r7, #0x3c]
    ldr r0, [r7, #0x44]
    sub r0, r2, r0
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r2, asr #0x8
    orr r0, r0, r2, lsl #0x8
    strh r0, [r4, #0xe]
    strh r1, [r4, #0x10]
    strh r1, [r4, #0x12]
    beq .L_1ec
    ldr r1, _LIT4
    ldrh r0, [r1]
    add r0, r0, #0x2040000
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r2, asr #0x8
    orr r0, r0, r2, lsl #0x8
    strh r0, [r4, #0x14]
    ldrh r0, [r1]
    add r0, r0, #0x2040000
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    strh r0, [r4, #0x16]
.L_1ec:
    sub r0, r4, #0xc
    add r1, r5, #0xc
    mov r2, #0x0
    bl func_02073ee0
    mov r2, r0
    mov r0, r9
    mov r1, r8
    bl func_02073ee0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_02073ec4
    mov r3, r0, asr #0x8
    orr r0, r3, r0, lsl #0x8
    strh r0, [r4, #0x10]
    mov r0, r4
    ldr r4, [r7, #0x1c]
    mov r3, #0x6
    str r4, [sp]
    str r3, [sp, #0x4]
    mov r1, r5
    mov r2, r9
    mov r3, r8
    bl func_02073014
    ands r0, r6, #0x3
    ldr r0, [r7, #0x28]
    add r1, r7, #0x28
    add r0, r0, r8
    str r0, [r7, #0x28]
    ldrne r0, [r1]
    addne r0, r0, #0x1
    strne r0, [r1]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word data_021a62f0
_LIT1: .word data_0219ee3c
_LIT2: .word data_0219f098
_LIT3: .word data_0219ee96
_LIT4: .word data_0219ede8
