; func_ov006_021c6e18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021c6e18
        .arm
func_ov006_021c6e18:
    ldr r1, [r0, #0x3c]
    cmp r1, #0x0
    ldrne r0, [r0, #0x40]
    cmpne r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
