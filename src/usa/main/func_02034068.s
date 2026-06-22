; func_02034068 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02034068
        .arm
func_02034068:
    ldr r0, _LIT0
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
_LIT0: .word 0x00013a2e
