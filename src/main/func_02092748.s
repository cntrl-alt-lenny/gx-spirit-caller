; func_02092748 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a63d0
        .extern func_02091a0c
        .extern func_02092644
        .global func_02092748
        .arm
func_02092748:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x4]
    ldr r1, [r5, #0x8]
    cmp r1, r0
    bne .L_114
    ldr r1, [r5, #0xc]
    sub r1, r1, #0x1
    str r1, [r5, #0xc]
    ldr r1, [r5, #0xc]
    cmp r1, #0x0
    bne .L_114
    mov r1, r5
    bl func_02092644
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0x8]
    bl func_02091a0c
.L_114:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a63d0
