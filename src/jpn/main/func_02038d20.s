; func_02038d20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219c408
        .extern data_0219cf88
        .global func_02038d20
        .arm
func_02038d20:
    cmp r0, #0x0
    ldreq r0, _LIT0
    ldr r2, _LIT1
    addne r0, r0, #0x5c
.L_e8:
    cmp r0, r2
    bcs .L_104
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    bxne lr
    add r0, r0, #0x5c
    b .L_e8
.L_104:
    mov r0, #0x0
    bx lr
_LIT0: .word data_0219c408
_LIT1: .word data_0219cf88
