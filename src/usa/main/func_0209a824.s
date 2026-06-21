; func_0209a824 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209a824
        .arm
func_0209a824:
    cmp r0, #0x0
    ldrne r2, [r0]
    strne r2, [r1, #0x8]
    strne r1, [r0]
    bx lr
