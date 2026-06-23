; func_0208bd88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208bd88
        .arm
func_0208bd88:
    ldr r1, _LIT0
.L_3c:
    ldrh r0, [r1]
    ands r0, r0, #0x8000
    bne .L_3c
    ldr r0, _LIT1
    ldr r0, [r0]
    add r0, r0, #0x200
    mov r0, r0, lsr #0xa
    bx lr
_LIT0: .word 0x040002b0
_LIT1: .word 0x040002b4
