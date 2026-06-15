; func_0207de6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207de6c
        .arm
func_0207de6c:
    ldr r2, [r0]
    ldr r1, _LIT0
    cmp r2, r1
    movne r0, #0x0
    bxne lr
    ldrh r2, [r0, #0x4]
    ldr r1, _LIT1
    cmp r2, r1
    movne r0, #0x0
    bxne lr
    ldrh r0, [r0, #0x6]
    cmp r0, #0x100
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
_LIT0: .word 0x4352414e
_LIT1: .word 0x0000fffe
