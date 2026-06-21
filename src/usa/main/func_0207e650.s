; func_0207e650 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207e650
        .arm
func_0207e650:
    ldr r1, [r0, #0xc]
    add r1, r1, r0
    str r1, [r0, #0xc]
    bx lr
