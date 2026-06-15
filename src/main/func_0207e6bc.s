; func_0207e6bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207e6bc
        .arm
func_0207e6bc:
    ldrh r1, [r0, #0x2]
    ands r1, r1, #0x1
    ldrneh r1, [r0]
    ldrne r0, [r0, #0x4]
    addne r0, r0, r1, lsl #0x4
    ldreqh r1, [r0]
    ldreq r0, [r0, #0x4]
    addeq r0, r0, r1, lsl #0x3
    bx lr
