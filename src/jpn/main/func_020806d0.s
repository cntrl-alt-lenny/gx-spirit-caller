; func_020806d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020807d0
        .extern func_02080a1c
        .extern func_02080bf4
        .extern func_02080e58
        .global func_020806d0
        .arm
func_020806d0:
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
    bl func_020807d0
    add sp, sp, #0x14
    ldmfd sp!, {pc}
_LIT0: .word func_02080e58
_LIT1: .word func_02080bf4
_LIT2: .word func_02080a1c
