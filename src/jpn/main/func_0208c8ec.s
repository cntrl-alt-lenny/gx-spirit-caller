; func_0208c8ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208c8ec
        .arm
func_0208c8ec:
    ldr r2, _LIT0
    cmp r0, #0x0
    ldrh r0, [r2]
    ldrneh r1, [r2]
    and r0, r0, #0x8
    orrne r1, r1, #0x8
    strneh r1, [r2]
    ldreqh r1, [r2]
    biceq r1, r1, #0x8
    streqh r1, [r2]
    bx lr
_LIT0: .word 0x04000004
