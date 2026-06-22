; func_020536b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020536b4
        .arm
func_020536b4:
    ldr r2, [r0]
    ldr r1, _LIT0
    ldr r0, [r0, #0x4]
    and r1, r2, r1
    orr r1, r1, #0x0
    orr r0, r0, #0x0
    bx lr
_LIT0: .word 0x000007ff
