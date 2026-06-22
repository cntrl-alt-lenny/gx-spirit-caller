; func_0209d694 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209d694
        .arm
func_0209d694:
    ldr r1, _LIT0
    ldrh r0, [r1]
    ands r2, r0, #0x1
    bicne r0, r0, #0x1
    strneh r0, [r1]
    bx lr
_LIT0: .word 0x027fff96
