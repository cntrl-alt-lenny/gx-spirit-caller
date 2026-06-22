; func_0207f7f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207f7f0
        .arm
func_0207f7f0:
    ldr r3, [r0]
    cmp r3, #0x1
    ldreqh r3, [r0, #0x12]
    orreq r3, r3, #0x2
    streqh r3, [r0, #0x12]
    streq r1, [r0, #0x4]
    streq r2, [r0, #0x8]
    bx lr
