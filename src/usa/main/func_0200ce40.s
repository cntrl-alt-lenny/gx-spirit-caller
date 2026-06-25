; func_0200ce40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0200bed8
        .extern func_0200bf30
        .extern func_0200bf88
        .extern func_0200bfb0
        .global func_0200ce40
        .arm
func_0200ce40:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r1
    mov r4, r2
    mov r8, r3
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r9, #0x0
    bne .L_618
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_618:
    ldr r1, [r9, #0x1c]
    ldr r0, [r0, #0x60]
    cmp r1, #0x0
    movne r7, #0x0
    mov r0, r0, lsl #0x15
    moveq r7, #0x1
    movs r0, r0, lsr #0x1f
    ldrsb r0, [r4, #0x49]
    ldrsb r1, [r4, #0x4a]
    movne r7, #0x1
    bl func_0200bfb0
    mov r6, r0
    ldrsb r0, [r4, #0x49]
    ldrsb r1, [r4, #0x4a]
    bl func_0200bf88
    mov r5, r0
    ldrsh r0, [r9, #0x6]
    bl func_0200bf30
    mov r4, r0
    ldrsh r0, [r9, #0x4]
    bl func_0200bed8
    ldrsb r2, [r9]
    cmp r8, #0x2
    ldr r3, [sp, #0x20]
    mov r2, r2, lsl #0x1a
    orr r2, r2, r3, lsr #0x3
    orr r2, r2, r8, lsl #0x1e
    orr r0, r2, r0, lsl #0x14
    orr r0, r0, r4, lsl #0x17
    orr r0, r0, r5, lsl #0x10
    orr r0, r0, r6, lsl #0x12
    ldr r1, _LIT0
    orr r0, r0, r7, lsl #0x1d
    str r0, [r1]
    cmpne r8, #0x3
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrsh r0, [r9, #0x6]
    ldrsh r1, [r9, #0x4]
    ldr r2, _LIT1
    mov r0, r0, asr #0x1
    mov r0, r0, lsl #0x14
    mov r3, r1, asr #0x1
    mov r1, r0, asr #0x10
    mov r0, r3, lsl #0x14
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x040004a8
_LIT1: .word 0x04000488
