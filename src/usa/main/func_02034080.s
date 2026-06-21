; func_02034080 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02034080
        .arm
func_02034080:
    cmp r0, #0x6
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
