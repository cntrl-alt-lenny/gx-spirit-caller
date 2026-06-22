; func_02064ce4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02064ce4
        .arm
func_02064ce4:
    ldr r3, [r0]
    ldr r2, [r1]
    ldr r0, [r3]
    ldr r1, [r2]
    cmp r0, r1
    subne r0, r0, r1
    ldreqh r1, [r3, #0x4]
    ldreqh r0, [r2, #0x4]
    subeq r0, r1, r0
    moveq r0, r0, lsl #0x10
    moveq r0, r0, asr #0x10
    bx lr
