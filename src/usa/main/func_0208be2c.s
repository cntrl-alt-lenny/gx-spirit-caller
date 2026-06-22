; func_0208be2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208be2c
        .arm
func_0208be2c:
    ldr r1, _LIT0
.L_e0:
    ldrh r0, [r1]
    ands r0, r0, #0x8000
    bne .L_e0
    ldr r1, _LIT1
    ldr r0, [r1]
    ldr r1, [r1, #0x4]
    bx lr
_LIT0: .word 0x04000280
_LIT1: .word 0x040002a0
