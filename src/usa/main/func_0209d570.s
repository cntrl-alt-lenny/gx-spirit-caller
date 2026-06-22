; func_0209d570 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8c44
        .extern func_02096134
        .extern func_02096340
        .extern func_0209d4f0
        .global func_0209d570
        .arm
func_0209d570:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_02096134
    ldr r1, _LIT0
    mov r0, #0xe
    bl func_02096340
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word func_0209d4f0
_LIT1: .word data_021a8c44
