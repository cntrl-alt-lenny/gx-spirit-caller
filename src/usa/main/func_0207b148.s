; func_0207b148 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a07ac
        .global func_0207b148
        .arm
func_0207b148:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    add r0, r0, #0x2000
    str r1, [r0, #0x264]
    bx lr
_LIT0: .word data_021a07ac
_LIT1: .word 0x00aaa082
