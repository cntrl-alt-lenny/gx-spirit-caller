; func_020495e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .global func_020495e8
        .arm
func_020495e8:
    ldr r2, _LIT0
    ldr r3, [r2]
    cmp r3, #0x0
    moveq r0, #0x0
    strne r0, [r3, #0x44]
    ldrne r2, [r2]
    movne r0, #0x1
    strne r1, [r2, #0x48]
    bx lr
_LIT0: .word data_0219dba0
