; func_0207e550 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207e550
        .arm
func_0207e550:
    ldrh r2, [r0]
    cmp r1, r2
    movcs r0, #0x0
    bxcs lr
    ldrh r2, [r0, #0x2]
    ands r2, r2, #0x1
    ldrne r0, [r0, #0x4]
    addne r0, r0, r1, lsl #0x4
    ldreq r0, [r0, #0x4]
    addeq r0, r0, r1, lsl #0x3
    bx lr
