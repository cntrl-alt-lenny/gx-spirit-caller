; func_0206db48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ec6c
        .extern func_0206dc40
        .global func_0206db48
        .arm
func_0206db48:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl OS_DisableIrq
    ldr r4, _LIT0
    mov r5, r0
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_114
.L_104:
    bl func_0206dc40
    ldr r0, [r4]
    cmp r0, #0x0
    bne .L_104
.L_114:
    mov r0, r5
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_0219ec6c
