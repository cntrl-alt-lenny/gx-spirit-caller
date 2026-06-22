; func_020322f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020322f0
        .arm
func_020322f0:
    str r1, [r0, #0x10]
    str r2, [r0, #0x14]
    bx lr
