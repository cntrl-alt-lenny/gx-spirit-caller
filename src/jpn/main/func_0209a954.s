; func_0209a954 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209a954
        .arm
func_0209a954:
    ldr r0, _LIT0
    ldrh r0, [r0]
    ands r0, r0, #0x1
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
_LIT0: .word 0x04000304
