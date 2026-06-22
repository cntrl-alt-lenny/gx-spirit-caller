; func_0201f0c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6338
        .extern data_020c63a4
        .global func_0201f0c8
        .arm
func_0201f0c8:
    cmp r0, #0x1b
    ldrcc r1, _LIT0
    ldrcc r0, [r1, r0, lsl #0x2]
    ldrcs r0, _LIT1
    bx lr
_LIT0: .word data_020c6338
_LIT1: .word data_020c63a4
