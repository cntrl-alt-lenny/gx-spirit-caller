; func_0205362c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0205362c
        .arm
func_0205362c:
    ldr r1, [r0]
    ldr r0, _LIT0
    and r0, r0, r1, lsr #0xb
    bx lr
_LIT0: .word 0x001fffff
