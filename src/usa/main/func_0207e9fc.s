; func_0207e9fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207e9fc
        .arm
func_0207e9fc:
    ldr r3, [r0, #0x18]
    ldrh r2, [r3]
    cmp r1, r2
    ldrcc r2, [r3, #0xc]
    addcc r1, r2, r1, lsl #0x3
    strcc r1, [r0]
    movcc r0, #0x1
    movcs r0, #0x0
    bx lr
