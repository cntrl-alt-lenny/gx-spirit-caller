; func_0208eeec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208bdf0
        .extern func_0208be2c
        .extern func_0208bec0
        .extern func_020b3564
        .global func_0208eeec
        .arm
func_0208eeec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r0
    mov r0, r1
    mov r1, r5
    ldr r6, [sp, #0x24]
    mov r9, r2
    mov r8, r3
    ldr r5, [sp, #0x2c]
    bl func_0208bec0
    mov r7, r0
    cmp r6, #0x1000
    mulne r1, r7, r6
    movne r0, r1, asr #0xb
    addne r0, r1, r0, lsr #0x14
    movne r7, r0, asr #0xc
    ldr r0, [sp, #0x28]
    ldr r2, _LIT0
    cmp r0, #0x0
    mov r3, #0x0
    str r3, [r2]
    ldr r1, _LIT1
    str r7, [r2, #0x4]
    str r9, [r1]
    ldrne r0, _LIT2
    str r3, [r1, #0x4]
    ldrne r4, _LIT3
    strne r3, [r0]
    cmp r5, #0x0
    beq .L_3a8
    mov r1, #0x0
    str r1, [r5, #0x4]
    str r1, [r5, #0x8]
    str r1, [r5, #0xc]
    str r1, [r5, #0x10]
    str r1, [r5, #0x18]
    str r1, [r5, #0x1c]
    str r1, [r5, #0x20]
    str r1, [r5, #0x24]
    rsb r0, r6, #0x0
    str r0, [r5, #0x2c]
    str r1, [r5, #0x30]
    str r1, [r5, #0x34]
    str r1, [r5, #0x3c]
.L_3a8:
    bl func_0208bdf0
    ldr r3, [sp, #0x20]
    ldr r1, [sp, #0x28]
    ldr r9, _LIT0
    mov ip, #0x0
    str ip, [r9]
    mov sl, #0x1000
    ldr r2, _LIT1
    str sl, [r9, #0x4]
    sub r3, r8, r3
    str r3, [r2]
    str ip, [r2, #0x4]
    cmp r1, #0x0
    beq .L_408
    str r0, [r4]
    str ip, [r4]
    str ip, [r4]
    str ip, [r4]
    str ip, [r4]
    str r7, [r4]
    str ip, [r4]
    str ip, [r4]
    str ip, [r4]
    str ip, [r4]
.L_408:
    cmp r5, #0x0
    strne r0, [r5]
    strne r7, [r5, #0x14]
    bl func_0208be2c
    cmp r6, #0x1000
    beq .L_444
    mov r2, r6, asr #0x1f
    umull r7, r3, r0, r6
    mla r3, r0, r2, r3
    mla r3, r1, r6, r3
    mov r0, r7
    mov r1, r3
    mov r2, #0x1000
    mov r3, #0x0
    bl func_020b3564
.L_444:
    ldr r3, [sp, #0x20]
    mov sl, r8, lsl #0x1
    add ip, r3, r8
    mov r2, ip, asr #0x1f
    umull r7, lr, r0, ip
    mla lr, r0, r2, lr
    mov r9, #-2147483648
    smull r3, r2, sl, r3
    mla lr, r1, ip, lr
    adds r7, r7, r9
    mov r8, #0x800
    adc r7, lr, #0x0
    adds r3, r3, r8
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    umull sl, r8, r0, r3
    mov r2, r3, asr #0x1f
    adds r9, sl, r9
    mla r8, r0, r2, r8
    mla r8, r1, r3, r8
    ldr r0, [sp, #0x28]
    adc r2, r8, #0x0
    cmp r0, #0x0
    mov r0, #0x0
    beq .L_4c8
    str r7, [r4]
    rsb r1, r6, #0x0
    str r1, [r4]
    str r0, [r4]
    str r0, [r4]
    str r2, [r4]
    str r0, [r4]
.L_4c8:
    cmp r5, #0x0
    strne r7, [r5, #0x28]
    strne r2, [r5, #0x38]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word 0x04000290
_LIT1: .word 0x04000298
_LIT2: .word 0x04000440
_LIT3: .word 0x04000458
