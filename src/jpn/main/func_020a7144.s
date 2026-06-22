; func_020a7144 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a7144
        .arm
func_020a7144:
    cmp r0, #0x0
    moveq r0, #0x0
    strneb r1, [r0]
    movne r0, #0x1
    bx lr
