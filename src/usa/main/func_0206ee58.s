; func_0206ee58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101d6c
        .extern data_02101d84
        .extern func_0206c3f8
        .global func_0206ee58
        .arm
func_0206ee58:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r1, #0x1
    bne .L_24
    ldr r0, _LIT0
    bl func_0206c3f8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_24:
    ldr r0, _LIT1
    bl func_0206c3f8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_02101d84
_LIT1: .word data_02101d6c
