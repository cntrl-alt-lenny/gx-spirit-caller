; func_ov002_021e2d28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021e2d28
        .arm
func_ov002_021e2d28:
    ldr r1, _LIT0
    cmp r0, r1
    bne .L_158
    mov r0, #0x0
    bx lr
.L_158:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x000018ec
