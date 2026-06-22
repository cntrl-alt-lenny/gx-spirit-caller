; func_02090828 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02090828
        .arm
func_02090828:
    ldr r1, _LIT0
    ldrh r0, [r1]
    bic r0, r0, #0x800
    strh r0, [r1]
    bx lr
_LIT0: .word 0x04000204
