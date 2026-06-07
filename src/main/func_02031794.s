; func_02031794 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031794
        .arm
func_02031794:
    ldr r1, _LIT0
    cmp r0, r1
    ldrne r1, _LIT1
    cmpne r0, r1
    bne .L_11a8
    mov r0, #0x1
    bx lr
.L_11a8:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000012d3
_LIT1: .word 0x0000147e
