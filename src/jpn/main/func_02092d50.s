; func_02092d50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02092d50
        .arm
func_02092d50:
    mrc p15, 0, r0, c9, c1, 0
    ldr r1, _LIT0
    and r0, r0, r1
    bx lr
_LIT0: .word 0xfffff000
