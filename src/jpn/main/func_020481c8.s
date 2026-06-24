; func_020481c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219db98
        .extern func_02047b94
        .extern func_02047e14
        .global func_020481c8
        .arm
func_020481c8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mov r1, #0x0
    bl func_02047b94
    ldr r0, _LIT1
    mov r3, #0x1
    ldr r2, [r0]
    mov r1, #0x0
    str r3, [r2, #0x4]
    ldr r0, [r0]
    str r1, [r0, #0x30]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word func_02047e14
_LIT1: .word data_0219db98
