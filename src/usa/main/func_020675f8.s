; func_020675f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101500
        .global func_020675f8
        .arm
func_020675f8:
    cmp r0, #0x0
    ldreq r0, _LIT0
    ldreq r0, [r0]
    str r1, [r0, #0xa0]
    bx lr
_LIT0: .word data_02101500
