; func_02004fb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02003b14
        .extern func_02004ef4
        .global func_02004fb8
        .arm
func_02004fb8:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr lr, [sp, #0x10]
    ldr ip, _LIT0
    stmia sp, {r3, lr}
    mov r3, r2
    mov r2, #0x0
    str ip, [sp, #0x8]
    bl func_02004ef4
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word func_02003b14
