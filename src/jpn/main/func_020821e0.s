; func_020821e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a17d8
        .extern data_021a18b8
        .global func_020821e0
        .arm
func_020821e0:
    ldr r3, _LIT0
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r0, _LIT1
    ldr r1, [r0, #0xfc]
    bic r1, r1, #0xa4
    str r1, [r0, #0xfc]
    bx lr
_LIT0: .word data_021a18b8
_LIT1: .word data_021a17d8
