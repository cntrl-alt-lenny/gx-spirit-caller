; func_02022608 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02197434
        .extern data_0219747c
        .global func_02022608
        .arm
func_02022608:
    ldr r2, _LIT0
    ldr r3, _LIT1
    ldr r2, [r2, r0, lsl #0x4]
    cmp r2, #0x0
    movlt r0, #0x0
    bxlt lr
    cmp r1, #0x0
    addne r2, r3, r0, lsl #0x4
    ldrne r2, [r2, #0x48]
    strne r2, [r1]
    add r1, r3, #0x4c
    add r0, r1, r0, lsl #0x4
    bx lr
_LIT0: .word data_0219747c
_LIT1: .word data_02197434
