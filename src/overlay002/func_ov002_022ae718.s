; func_ov002_022ae718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .global func_ov002_022ae718
        .arm
func_ov002_022ae718:
    ldrh r0, [r0]
    cmp r0, #0x0
    beq .L_308
    ldr r0, _LIT0
    ldr r0, [r0, #0xd48]
    cmp r0, #0x1
    moveq r0, #0x1
    bxeq lr
.L_308:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d016c
