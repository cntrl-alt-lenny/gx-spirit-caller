; func_02097668 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a8308
        .extern data_021a830c
        .global func_02097668
        .arm
func_02097668:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4]
    cmp r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    bl OS_DisableIrq
    ldr r2, [r4, #0x4]
    mov r3, #0x0
    cmp r2, #0x0
    ldrne r1, [r4, #0x8]
    strne r1, [r2, #0x8]
    ldr r2, [r4, #0x8]
    cmp r2, #0x0
    ldrne r1, [r4, #0x4]
    strne r1, [r2, #0x4]
    str r3, [r4]
    str r3, [r4, #0x8]
    ldr r1, [r4, #0x8]
    ldr r2, _LIT0
    str r1, [r4, #0x4]
    ldr r1, [r4, #0x1c]
    bic r1, r1, #0x1
    str r1, [r4, #0x1c]
    ldr r1, [r2]
    cmp r1, r4
    bne .L_494
    ldr r1, _LIT1
    str r3, [r2, #0x8]
    ldr r1, [r1]
    strh r3, [r2, #0x6]
    str r1, [r2]
    strh r3, [r2, #0x4]
.L_494:
    bl OS_RestoreIrq
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a830c
_LIT1: .word data_021a8308
