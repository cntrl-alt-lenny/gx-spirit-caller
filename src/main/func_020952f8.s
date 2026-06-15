; func_020952f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6730
        .extern data_021a6734
        .extern func_02092844
        .extern func_02095a50
        .extern func_02095c18
        .global func_020952f8
        .arm
func_020952f8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r0, [r1]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldr r0, _LIT1
    mov r2, #0x1
    str r2, [r1]
    bl func_02092844
    bl func_02095a50
    bl func_02095c18
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6730
_LIT1: .word data_021a6734
