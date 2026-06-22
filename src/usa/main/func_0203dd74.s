; func_0203dd74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203dd74
        .arm
func_0203dd74:
    ldrb r0, [r0, #0xb]
    cmp r0, #0x0
    ldreq r0, _LIT0
    ldrne r0, _LIT1
    bx lr
_LIT0: .word 0xffff3c4d
_LIT1: .word 0xffff3865
