; func_0208e3e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208e3e8
        .arm
func_0208e3e8:
    ldr r1, _LIT0
    ldr r2, _LIT1
    and r0, r1, r0, asr #0x9
    strh r0, [r2]
    bx lr
_LIT0: .word 0x00007fff
_LIT1: .word 0x04000610
