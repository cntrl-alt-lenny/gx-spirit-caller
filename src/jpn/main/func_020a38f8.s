; func_020a38f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a981c
        .extern func_02093b08
        .extern func_020a3938
        .global func_020a38f8
        .arm
func_020a38f8:
    stmdb sp!, {r4, lr}
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    add r0, r0, #0x1000
    ldr r0, [r0, #0x320]
    cmp r0, #0x0
    bne .L_1d4
    bl func_02093b08
.L_1d4:
    bl func_020a3938
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a981c
