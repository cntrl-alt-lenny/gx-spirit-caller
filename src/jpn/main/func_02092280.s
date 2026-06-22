; func_02092280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021023d0
        .global func_02092280
        .arm
func_02092280:
    ldr r0, _LIT0
    ldr r1, _LIT1
    str r0, [r1]
    bx lr
_LIT0: .word 0x82000001
_LIT1: .word data_021023d0
