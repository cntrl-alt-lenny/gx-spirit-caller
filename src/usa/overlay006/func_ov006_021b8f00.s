; func_ov006_021b8f00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021b8f00
        .arm
func_ov006_021b8f00:
    ldrh r2, [r0]
    ldrh r0, [r1]
    sub r0, r2, r0
    bx lr
