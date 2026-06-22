; func_02087c28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02087c28
        .arm
func_02087c28:
    ldr r3, [r0]
    cmp r3, #0x0
    movne r2, #0x1
    strneh r2, [r3, #0x34]
    ldrne r0, [r0]
    strneh r1, [r0, #0x38]
    bx lr
