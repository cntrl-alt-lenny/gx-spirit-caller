; func_020807b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020808b8
        .extern func_02080b04
        .extern func_02080cdc
        .extern func_02080f40
        .global func_020807b8
        .arm
func_020807b8:
    stmfd sp!, {lr}
    sub sp, sp, #0x14
    ldr lr, [sp, #0x18]
    ldr ip, _LIT0
    str lr, [sp]
    ldr lr, _LIT1
    str ip, [sp, #0x4]
    ldr ip, _LIT2
    str lr, [sp, #0x8]
    str ip, [sp, #0xc]
    str r2, [sp, #0x10]
    bl func_020808b8
    add sp, sp, #0x14
    ldmfd sp!, {pc}
_LIT0: .word func_02080f40
_LIT1: .word func_02080cdc
_LIT2: .word func_02080b04
