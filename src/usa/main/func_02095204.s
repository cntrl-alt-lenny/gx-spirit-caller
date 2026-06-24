; func_02095204 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6650
        .extern data_021a6654
        .extern func_0209275c
        .extern func_0209595c
        .extern func_02095b24
        .global func_02095204
        .arm
func_02095204:
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
    bl func_0209275c
    bl func_0209595c
    bl func_02095b24
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6650
_LIT1: .word data_021a6654
