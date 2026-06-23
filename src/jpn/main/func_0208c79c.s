; func_0208c79c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208c79c
        .arm
func_0208c79c:
    cmp r1, #0x0
    moveq r1, #0x0
    streqh r1, [r0]
    bxeq lr
    cmp r1, #0x0
    orrgt r1, r1, #0x4000
    strgth r1, [r0]
    rsble r1, r1, #0x0
    orrle r1, r1, #0x8000
    strleh r1, [r0]
    bx lr
