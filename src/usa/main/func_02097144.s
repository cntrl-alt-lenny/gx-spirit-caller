; func_02097144 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02097144
        .arm
func_02097144:
    cmp r2, #0x0
    moveq r1, #0x0
    beq .L_ab8
    cmp r1, #0x0
    moveq r2, #0x0
.L_ab8:
    str r1, [r0, #0x54]
    str r2, [r0, #0x58]
    bx lr
