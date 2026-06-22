; func_02033cd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02033cd8
        .arm
func_02033cd8:
    ldrb r1, [r0]
    cmp r1, #0x0
    movne r1, #0x0
    strneb r1, [r0]
    bx lr
