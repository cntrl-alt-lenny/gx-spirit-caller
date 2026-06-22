; func_02001e20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02001e20
        .arm
func_02001e20:
    ldr r3, [r0, #0x8]
    str r3, [r1]
    ldr r0, [r0, #0xc]
    str r0, [r2]
    bx lr
