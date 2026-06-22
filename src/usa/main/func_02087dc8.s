; func_02087dc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02087dc8
        .arm
func_02087dc8:
    ldr r2, [r0]
    cmp r2, #0x0
    movne r1, #0x0
    strne r1, [r2]
    strne r1, [r0]
    bx lr
