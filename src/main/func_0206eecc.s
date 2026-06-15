; func_0206eecc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101e4c
        .extern data_02101e64
        .extern func_0206c46c
        .global func_0206eecc
        .arm
func_0206eecc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r1, #0x1
    bne .L_24
    ldr r0, _LIT0
    bl func_0206c46c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_24:
    ldr r0, _LIT1
    bl func_0206c46c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_02101e64
_LIT1: .word data_02101e4c
