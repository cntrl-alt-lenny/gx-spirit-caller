; func_0207f810 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207f810
        .arm
func_0207f810:
    ldr r2, [r0]
    cmp r2, #0x1
    ldreqh r2, [r0, #0x12]
    orreq r2, r2, #0x4
    streqh r2, [r0, #0x12]
    streqh r1, [r0, #0x10]
    bx lr
