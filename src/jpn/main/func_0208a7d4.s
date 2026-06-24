; func_0208a7d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208a7d4
        .arm
func_0208a7d4:
    ldr r2, [r0, #0x14c]
    cmp r2, #0x0
    movne r1, #0x0
    strne r1, [r2]
    strne r1, [r0, #0x14c]
    ldr r1, [r0, #0x110]
    bic r1, r1, #0x1
    str r1, [r0, #0x110]
    ldr r1, [r0, #0x110]
    bic r1, r1, #0x4
    str r1, [r0, #0x110]
    ldr r1, [r0, #0x110]
    bic r1, r1, #0x2
    str r1, [r0, #0x110]
    bx lr
