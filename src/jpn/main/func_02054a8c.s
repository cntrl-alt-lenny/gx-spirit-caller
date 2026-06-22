; func_02054a8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffaf4
        .global func_02054a8c
        .arm
func_02054a8c:
    cmp r0, #0x0
    bicne r1, r0, #-2147483648
    ldr r0, _LIT0
    moveq r1, #0x1
    str r1, [r0]
    bx lr
_LIT0: .word data_020ffaf4
