; func_02001d64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02001d64
        .arm
func_02001d64:
    and r1, r1, #0xff
    str r1, [r0, #0x10]
    and r1, r2, #0xff
    str r1, [r0, #0x14]
    bx lr
