; func_02090774 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020908c8
        .global func_02090774
        .arm
func_02090774:
    ldr r1, _LIT0
    bx r1
_LIT0: .word func_020908c8
