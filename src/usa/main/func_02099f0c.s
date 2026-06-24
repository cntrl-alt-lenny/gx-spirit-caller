; func_02099f0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a82b4
        .extern func_02096264
        .global func_02099f0c
        .arm
func_02099f0c:
    stmdb sp!, {r4, lr}
    bl OS_DisableIrq
    mov r4, r0
    ldr r1, _LIT0
    mov r0, #0x6
    mov r2, #0x0
    bl func_02096264
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    cmp r0, #0x0
    bne .L_70
    mov r0, r4
    bl OS_RestoreIrq
    ldr r0, _LIT1
    ldrh r1, [r0, #0x34]
    ldr r3, [r0]
    orr r1, r1, #0x4
    strh r1, [r0, #0x34]
    cmp r3, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    mov r0, #0x2
    mov r1, #0x4
    mov r2, #0x0
    blx r3
    ldmia sp!, {r4, lr}
    bx lr
.L_70:
    ldr r1, _LIT1
    mov r0, r4
    ldrh r2, [r1, #0x36]
    orr r2, r2, #0x4
    strh r2, [r1, #0x36]
    ldrh r2, [r1, #0x34]
    bic r2, r2, #0x4
    strh r2, [r1, #0x34]
    bl OS_RestoreIrq
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x03000200
_LIT1: .word data_021a82b4
