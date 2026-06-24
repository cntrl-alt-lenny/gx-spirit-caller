; func_0209d5a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a8c4c
        .extern func_020927e4
        .global func_0209d5a8
        .arm
func_0209d5a8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    cmp r0, #0x0
    moveq r5, #0x0
    beq .L_38
    ldr r5, [r0, #0x4]
    mov r1, #0x2
    add r0, r5, #0x86
    bl func_020927e4
    ldrh r5, [r5, #0x86]
.L_38:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a8c4c
