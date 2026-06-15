; func_020a5db0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a9934
        .extern func_02092e6c
        .extern func_020a60c0
        .global func_020a5db0
        .arm
func_020a5db0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    str r5, [r1]
    bl func_020a60c0
    cmp r0, #0x0
    bne .L_78
    cmp r5, #0x0
    movne r1, #0x1000
    moveq r1, #0x5000
    mov r0, #0xf000
    bl func_02092e6c
.L_78:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a9934
