; func_0204823c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc78
        .extern func_02047c08
        .extern func_02047e88
        .global func_0204823c
        .arm
func_0204823c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mov r1, #0x0
    bl func_02047c08
    ldr r0, _LIT1
    mov r3, #0x1
    ldr r2, [r0]
    mov r1, #0x0
    str r3, [r2, #0x4]
    ldr r0, [r0]
    str r1, [r0, #0x30]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word func_02047e88
_LIT1: .word data_0219dc78
