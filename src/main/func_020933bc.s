; func_020933bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a66d4
        .extern func_02093684
        .global func_020933bc
        .arm
func_020933bc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, [r5]
    mov r4, r0
    cmp r1, #0x0
    bne .L_148
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_148:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    ldreq r2, [r5, #0x14]
    ldreq r1, _LIT0
    streq r2, [r1, #0x4]
    ldrne r1, [r5, #0x14]
    strne r1, [r0, #0x14]
    ldr r1, [r5, #0x14]
    cmp r1, #0x0
    strne r0, [r1, #0x18]
    bne .L_188
    ldr r1, _LIT0
    cmp r0, #0x0
    str r0, [r1]
    beq .L_188
    bl func_02093684
.L_188:
    mov r1, #0x0
    str r1, [r5]
    str r1, [r5, #0x1c]
    mov r0, r4
    str r1, [r5, #0x20]
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a66d4
