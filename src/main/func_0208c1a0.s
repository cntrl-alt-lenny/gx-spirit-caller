; func_0208c1a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208c1a0
        .arm
func_0208c1a0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r3, [r0, #0x4]
    ldr r4, [r0]
    smull r2, r7, r3, r3
    smlal r2, r7, r4, r4
    ldr r4, [r0, #0x8]
    ldr r3, _LIT0
    smlal r2, r7, r4, r4
    mov r6, #0x2
    mov r4, r7, lsl #0x2
    ldr r5, _LIT1
    strh r6, [r3]
    mov r3, #0x0
    str r3, [r5]
    mov r6, #0x1000000
    ldr r3, _LIT2
    str r6, [r5, #0x4]
    str r2, [r3]
    ldr r6, _LIT3
    str r7, [r3, #0x4]
    mov r5, #0x1
    ldr r3, _LIT4
    strh r5, [r6]
    mov r5, r2, lsl #0x2
    str r5, [r3]
    orr r4, r4, r2, lsr #0x1e
    str r4, [r3, #0x4]
.L_248:
    ldrh r2, [r6]
    ands r2, r2, #0x8000
    bne .L_248
    ldr r2, _LIT5
    ldr ip, [r2]
    ldr r3, _LIT0
.L_260:
    ldrh r2, [r3]
    ands r2, r2, #0x8000
    bne .L_260
    ldr r7, _LIT6
    ldr r5, [r0]
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
    str r4, [r1]
    ldr r5, [r0, #0x4]
    umull r6, ip, r3, r5
    mov r4, r5, asr #0x1f
    mla ip, r3, r4, ip
    mla ip, r2, r5, ip
    adds r4, r6, lr
    adc r4, ip, #0x1000
    mov r4, r4, asr #0xd
    str r4, [r1, #0x4]
    ldr ip, [r0, #0x8]
    umull r5, r4, r3, ip
    mov r0, ip, asr #0x1f
    adds r5, r5, lr
    mla r4, r3, r0, r4
    mla r4, r2, ip, r4
    adc r0, r4, #0x1000
    mov r0, r0, asr #0xd
    str r0, [r1, #0x8]
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word 0x04000280
_LIT1: .word 0x04000290
_LIT2: .word 0x04000298
_LIT3: .word 0x040002b0
_LIT4: .word 0x040002b8
_LIT5: .word 0x040002b4
_LIT6: .word 0x040002a0
