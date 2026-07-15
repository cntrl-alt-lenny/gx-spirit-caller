; func_ov016_021b21c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov016_021b21c8
        .arm
func_ov016_021b21c8:
    ldr r1, [r1, #0xc]
    ldr r0, [r0, #0xc]
    sub r0, r1, r0
    bx lr
