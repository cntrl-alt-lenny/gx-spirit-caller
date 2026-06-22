; func_0204547c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9ec
        .global func_0204547c
        .arm
func_0204547c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    mov r2, #0x20
    ldr r3, [r3]
    blx r3
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219d9ec
