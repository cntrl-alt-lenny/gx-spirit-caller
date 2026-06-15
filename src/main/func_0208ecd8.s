; func_0208ecd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208be9c
        .extern func_0208bf14
        .extern func_020b3658
        .global func_0208ecd8
        .arm
func_0208ecd8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    str r2, [sp, #0x8]
    str r0, [sp]
    ldr r0, [sp, #0x8]
    mov r2, r3
    ldr r7, [sp, #0x64]
    sub r0, r2, r0
    str r3, [sp, #0xc]
    str r1, [sp, #0x4]
    ldr r8, [sp, #0x60]
    ldr r6, [sp, #0x68]
    bl func_0208be9c
    cmp r7, #0x0
    ldrne r0, _LIT0
    movne r1, #0x0
    ldrne r4, _LIT1
    strne r1, [r0]
    cmp r6, #0x0
    beq .L_6a8
    mov r0, #0x0
    str r0, [r6, #0x4]
    str r0, [r6, #0x8]
    str r0, [r6, #0xc]
    str r0, [r6, #0x10]
    str r0, [r6, #0x18]
    str r0, [r6, #0x1c]
    str r0, [r6, #0x20]
    str r0, [r6, #0x24]
    str r0, [r6, #0x2c]
    str r8, [r6, #0x3c]
.L_6a8:
    bl func_0208bf14
    mov r5, r0
    str r1, [sp, #0x14]
    ldr r9, _LIT2
    mov r3, #0x0
    ldr r1, [sp]
    ldr r0, [sp, #0x4]
    str r3, [r9]
    mov r2, #0x1000
    sub r1, r1, r0
    ldr r0, _LIT3
    str r2, [r9, #0x4]
    str r1, [r0]
    cmp r8, #0x1000
    str r3, [r0, #0x4]
    beq .L_708
    mov r9, r8, asr #0x1f
    umull r0, r1, r5, r8
    mla r1, r5, r9, r1
    ldr r5, [sp, #0x14]
    mla r1, r5, r8, r1
    bl func_020b3658
    mov r5, r0
    str r1, [sp, #0x14]
.L_708:
    ldr r0, [sp, #0x14]
    mov r2, r5, lsl #0xd
    mov r1, r0, lsl #0xd
    mov r0, #-2147483648
    adds r0, r2, r0
    orr r1, r1, r5, lsr #0x13
    adc r1, r1, #0x0
    cmp r7, #0x0
    mov r0, #0x0
    strne r1, [r4]
    strne r0, [r4]
    strne r0, [r4]
    strne r0, [r4]
    strne r0, [r4]
    cmp r6, #0x0
    strne r1, [r6]
    bl func_0208bf14
    mov fp, r0
    str r1, [sp, #0x2c]
    ldr r0, _LIT2
    mov r3, #0x0
    mov r2, #0x1000
    str r3, [r0]
    str r2, [r0, #0x4]
    ldr r9, [sp, #0x58]
    ldr r1, [sp, #0x5c]
    ldr r0, _LIT3
    sub r1, r9, r1
    str r1, [r0]
    cmp r8, #0x1000
    str r3, [r0, #0x4]
    beq .L_7a8
    mov r9, r8, asr #0x1f
    umull r0, r1, fp, r8
    mla r1, fp, r9, r1
    ldr r9, [sp, #0x2c]
    mla r1, r9, r8, r1
    bl func_020b3658
    mov fp, r0
    str r1, [sp, #0x2c]
.L_7a8:
    ldr r0, [sp, #0x2c]
    mov r3, fp, lsl #0xd
    mov r2, r0, lsl #0xd
    mov r0, #-2147483648
    orr r2, r2, fp, lsr #0x13
    adds r0, r3, r0
    adc r0, r2, #0x0
    cmp r7, #0x0
    mov r1, #0x0
    strne r0, [r4]
    strne r1, [r4]
    strne r1, [r4]
    strne r1, [r4]
    strne r1, [r4]
    cmp r6, #0x0
    strne r0, [r6, #0x14]
    bl func_0208bf14
    cmp r8, #0x1000
    beq .L_818
    mov r9, r8, asr #0x1f
    mov r2, #0x1000
    mov r3, #0x0
    umull ip, sl, r0, r8
    mla sl, r0, r9, sl
    mov r0, ip
    mla sl, r1, r8, sl
    mov r1, sl
    bl func_020b3658
.L_818:
    mov r9, r1, lsl #0xd
    mov sl, r0, lsl #0xd
    mov r2, #-2147483648
    orr r9, r9, r0, lsr #0x13
    adds r2, sl, r2
    adc r2, r9, #0x0
    cmp r7, #0x0
    mov r3, #0x0
    strne r2, [r4]
    strne r3, [r4]
    cmp r6, #0x0
    strne r2, [r6, #0x28]
    ldr r3, [sp, #0xc]
    ldr r2, [sp, #0x8]
    add r9, r3, r2
    rsb lr, r9, #0x0
    ldr r3, [sp]
    ldr r2, [sp, #0x4]
    ldr r9, [sp, #0x5c]
    add r2, r3, r2
    ldr r3, [sp, #0x58]
    rsb ip, r2, #0x0
    add r3, r9, r3
    mov r9, ip, asr #0x1f
    str r9, [sp, #0x20]
    mov r9, r3, asr #0x1f
    str r9, [sp, #0x24]
    umull sl, r9, r5, lr
    mov r2, lr, asr #0x1f
    str r2, [sp, #0x1c]
    str sl, [sp, #0x18]
    ldr sl, [sp, #0x1c]
    mov r2, #-2147483648
    mla r9, r5, sl, r9
    ldr r5, [sp, #0x14]
    mla r9, r5, lr, r9
    ldr r5, [sp, #0x18]
    adds r5, r5, r2
    adc sl, r9, #0x0
    ldr r5, [sp, #0x20]
    umull lr, r9, fp, ip
    mla r9, fp, r5, r9
    ldr r5, [sp, #0x2c]
    mla r9, r5, ip, r9
    adds r5, lr, r2
    adc r5, r9, #0x0
    umull fp, r9, r0, r3
    adds r2, fp, r2
    ldr r2, [sp, #0x24]
    mla r9, r0, r2, r9
    mla r9, r1, r3, r9
    adc r0, r9, #0x0
    cmp r7, #0x0
    strne sl, [r4]
    strne r5, [r4]
    strne r0, [r4]
    strne r8, [r4]
    cmp r6, #0x0
    strne sl, [r6, #0x30]
    strne r5, [r6, #0x34]
    strne r0, [r6, #0x38]
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x04000440
_LIT1: .word 0x04000458
_LIT2: .word 0x04000290
_LIT3: .word 0x04000298
