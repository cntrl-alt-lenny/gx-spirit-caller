; func_0207e2d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207e2d4
        .arm
func_0207e2d4:
    ldrh r2, [r0]
    cmp r2, r1
    ldrhi r0, [r0, #0x4]
    addhi r0, r0, r1, lsl #0x4
    movls r0, #0x0
    bx lr
