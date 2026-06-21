; func_02027e80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02027e80
        .arm
func_02027e80:
    ldrh r1, [r0, #0xde]
    bic r1, r1, #0x10
    strh r1, [r0, #0xde]
    bx lr
