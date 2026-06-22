; func_02093b1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02093b1c
        .arm
func_02093b1c:
    ldr r1, _LIT0
    strb r0, [r1]
    bx lr
_LIT0: .word 0x04000247
