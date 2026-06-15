; func_0207445c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eef0
        .extern func_02091768
        .extern func_020918d0
        .global func_0207445c
        .arm
func_0207445c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_28
    bl func_020918d0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_28:
    bl func_02091768
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219eef0
