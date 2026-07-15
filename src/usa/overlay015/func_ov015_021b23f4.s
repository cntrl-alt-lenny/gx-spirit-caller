; func_ov015_021b23f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov015_021b23f4
        .arm
func_ov015_021b23f4:
    ldr r1, [r0, #0x64]
    cmp r1, #0x0
    ldrne r1, [r0, #0x5c]
    ldrne r0, [r0, #0x60]
    cmpne r1, r0
    moveq r0, #0x0
    movne r0, #0x1
    bx lr
