; func_0205d9a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0205d9a8
        .arm
func_0205d9a8:
    ldr r2, [r0]
    ldr r0, [r1]
    sub r0, r2, r0
    bx lr
