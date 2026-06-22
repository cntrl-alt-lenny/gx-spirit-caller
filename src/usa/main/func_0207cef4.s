; func_0207cef4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207cef4
        .arm
func_0207cef4:
    cmp r1, #0x0
    ldreq r0, [r0]
    ldrneh r0, [r0, #0xa]
    addne r0, r1, r0
    ldrne r0, [r0, #0x4]
    bx lr
