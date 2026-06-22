; func_02081f48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02081f48
        .arm
func_02081f48:
    cmp r1, #0x0
    strne r1, [r0, #0x8]
    cmp r2, #0x0
    strne r2, [r0, #0x18]
    bx lr
