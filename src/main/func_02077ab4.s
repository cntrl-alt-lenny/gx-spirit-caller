; func_02077ab4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a63d0
        .extern func_0209181c
        .global func_02077ab4
        .arm
func_02077ab4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r1, r0
    cmp r1, #0x20
    addcs sp, sp, #0x4
    ldmcsfd sp!, {lr}
    bxcs lr
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0209181c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a63d0
