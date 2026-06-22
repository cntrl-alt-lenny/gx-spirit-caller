; func_02099b44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a82b4
        .global func_02099b44
        .arm
func_02099b44:
    ldr r1, _LIT0
.L_4:
    ldrh r2, [r1, #0x36]
    ands r2, r2, r0
    bne .L_4
    bx lr
_LIT0: .word data_021a82b4
