; func_02021c68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02021c68
        .arm
func_02021c68:
    ldr r1, [r0]
    cmp r1, #0x0
    moveq r0, #0x0
    movne r1, #0x0
    strne r1, [r0]
    movne r0, #0x1
    bx lr
