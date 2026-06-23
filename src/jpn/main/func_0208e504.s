; func_0208e504 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208e504
        .arm
func_0208e504:
    orr r0, r0, r1, lsl #0x10
    ldr ip, [sp]
    orr r3, r0, r3, lsl #0x18
    cmp ip, #0x0
    ldr r1, _LIT0
    orrne r3, r3, #0x8000
    ldr r0, _LIT1
    str r3, [r1]
    strh r2, [r0]
    bx lr
_LIT0: .word 0x04000350
_LIT1: .word 0x04000354
