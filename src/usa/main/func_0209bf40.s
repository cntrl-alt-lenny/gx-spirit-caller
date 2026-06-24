; func_0209bf40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a83e0
        .extern func_020919a4
        .global func_0209bf40
        .arm
func_0209bf40:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r6, _LIT0
    bl OS_DisableIrq
    ldr r1, [r6, #0x114]
    mov r5, r0
    ands r0, r1, #0x4
    beq .L_34
    add r4, r6, #0x10c
.L_20:
    mov r0, r4
    bl func_020919a4
    ldr r0, [r6, #0x114]
    ands r0, r0, #0x4
    bne .L_20
.L_34:
    mov r0, r5
    bl OS_RestoreIrq
    ldr r0, [r6]
    ldr r0, [r0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a83e0
