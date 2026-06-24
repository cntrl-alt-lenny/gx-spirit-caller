; func_020aed84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aed84
        .arm
func_020aed84:
    ldrh r2, [r0], #0x2
    cmp r2, #0x0
    beq .L_24
.L_c:
    cmp r2, r1
    subeq r0, r0, #0x2
    bxeq lr
    ldrh r2, [r0], #0x2
    cmp r2, #0x0
    bne .L_c
.L_24:
    cmp r1, #0x0
    movne r0, #0x0
    subeq r0, r0, #0x2
    bx lr
