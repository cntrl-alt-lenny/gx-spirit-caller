; func_02074374 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee10
        .extern func_02091680
        .extern func_020917e8
        .global func_02074374
        .arm
func_02074374:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_28
    bl func_020917e8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_28:
    bl func_02091680
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219ee10
