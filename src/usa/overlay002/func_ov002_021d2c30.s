; func_ov002_021d2c30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdba8
        .extern data_ov002_022ce870
        .extern func_ov002_021b9a84
        .extern func_ov002_0229acd0
        .global func_ov002_021d2c30
        .arm
func_ov002_021d2c30:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r5, #0x1
    ldrh r7, [r0, #0x6]
    ldrh r4, [r0, #0x4]
    ldrh r6, [r0, #0x2]
    mov r0, r7
    moveq r5, #0x0
    bl func_ov002_021b9a84
    ldr ip, [r0]
    ldr lr, _LIT1
    mov r0, r7, lsl #0x10
    mov r3, r4, lsl #0x10
    orr r3, r3, r0, lsr #0x10
    mov r1, r5
    mov r2, r6
    mov r0, #0x2b
    str ip, [lr, r4, lsl #0x2]
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word data_ov002_022cdba8
