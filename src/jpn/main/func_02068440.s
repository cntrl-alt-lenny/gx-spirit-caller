; func_02068440 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02068440
        .arm
func_02068440:
    str r1, [r0, #0x8]
    strh r2, [r0, #0xc]
    bx lr
