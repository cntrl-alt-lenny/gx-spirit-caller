; func_020677dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101848
        .global func_020677dc
        .arm
func_020677dc:
    cmp r0, #0x32
    bxlt lr
    cmp r0, #0xfe
    bxgt lr
    ldr r2, _LIT0
    str r1, [r2, r0, lsl #0x2]
    bx lr
_LIT0: .word data_02101848
