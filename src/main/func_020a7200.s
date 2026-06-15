; func_020a7200 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a7200
        .arm
func_020a7200:
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    cmp r2, #0x0
    mvneq r0, #0x0
    bxeq lr
    cmp r0, #0x0
    ldrneb r2, [r1]
    strneh r2, [r0]
    ldrsb r0, [r1]
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    bx lr
