; func_0202b480 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202b480
        .arm
func_0202b480:
    ldr r1, _LIT0
    cmp r0, r1
    addne r1, r1, #0xad
    cmpne r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
_LIT0: .word 0x000018f9
