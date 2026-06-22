; func_02065dcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e888
        .extern func_020540d4
        .global func_02065dcc
        .arm
func_02065dcc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_020540d4
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219e888
