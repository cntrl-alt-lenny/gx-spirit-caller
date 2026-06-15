; func_0208c04c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208c04c
        .arm
func_0208c04c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldrsh r4, [r0]
    ldrsh r3, [r0, #0x2]
    ldrsh r2, [r0, #0x4]
    mul r8, r4, r4
    mul r7, r3, r3
    mul r6, r2, r2
    ldr r2, _LIT0
    mov r3, #0x2
    ldr r4, _LIT1
    strh r3, [r2]
    mov r2, #0x0
    str r2, [r4]
    mov r5, #0x1000000
    mov r2, r8, asr #0x1f
    adds r3, r8, r7
    adc r2, r2, r7, asr #0x1f
    adds r7, r3, r6
    adc r6, r2, r6, asr #0x1f
    mov r3, r6, lsl #0x2
    ldr r2, _LIT2
    str r5, [r4, #0x4]
    str r7, [r2]
    ldr r5, _LIT3
    str r6, [r2, #0x4]
    mov r4, #0x1
    ldr r2, _LIT4
    strh r4, [r5]
    mov r4, r7, lsl #0x2
    str r4, [r2]
    orr r3, r3, r7, lsr #0x1e
    str r3, [r2, #0x4]
.L_108:
    ldrh r2, [r5]
    ands r2, r2, #0x8000
    bne .L_108
    ldr r2, _LIT5
    ldr ip, [r2]
    ldr r3, _LIT0
.L_120:
    ldrh r2, [r3]
    ands r2, r2, #0x8000
    bne .L_120
    ldr r7, _LIT6
    ldrsh r5, [r0]
    ldr r6, [r7]
    mov r4, ip, asr #0x1f
    umull r3, r2, r6, ip
    mla r2, r6, r4, r2
    ldr r8, [r7, #0x4]
    mov r4, r5, asr #0x1f
    umull r7, r6, r3, r5
    mov lr, #0x0
    mla r2, r8, ip, r2
    mla r6, r3, r4, r6
    mla r6, r2, r5, r6
    adds r4, r7, lr
    adc r4, r6, #0x1000
    mov r4, r4, asr #0xd
    strh r4, [r1]
    ldrsh r5, [r0, #0x2]
    umull r6, ip, r3, r5
    mov r4, r5, asr #0x1f
    mla ip, r3, r4, ip
    mla ip, r2, r5, ip
    adds r4, r6, lr
    adc r4, ip, #0x1000
    mov r4, r4, asr #0xd
    strh r4, [r1, #0x2]
    ldrsh ip, [r0, #0x4]
    umull r5, r4, r3, ip
    mov r0, ip, asr #0x1f
    adds r5, r5, lr
    mla r4, r3, r0, r4
    mla r4, r2, ip, r4
    adc r0, r4, #0x1000
    mov r0, r0, asr #0xd
    strh r0, [r1, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word 0x04000280
_LIT1: .word 0x04000290
_LIT2: .word 0x04000298
_LIT3: .word 0x040002b0
_LIT4: .word 0x040002b8
_LIT5: .word 0x040002b4
_LIT6: .word 0x040002a0
