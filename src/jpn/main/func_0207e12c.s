; func_0207e12c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a0804
        .global func_0207e12c
        .arm
func_0207e12c:
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0, #0x8]
    str r2, [r0]
    str r1, [r0, #0x4]
    bx lr
_LIT0: .word data_021a0804
