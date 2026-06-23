; func_ov011_021d2ba4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov011_021d2ba4
        .arm
func_ov011_021d2ba4:
    ldr r3, [r0]
    str r3, [r1]
    ldr r0, [r0, #0x4]
    str r0, [r2]
    bx lr
