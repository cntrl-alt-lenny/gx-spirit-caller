; func_02098be8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02098be8
        .arm
func_02098be8:
    ldrb r1, [r0, #0x1f]
    ands r1, r1, #0x1
    ldrne r0, [r0, #0x1c]
    movne r0, r0, lsl #0x8
    movne r0, r0, lsr #0x8
    ldreq r0, [r0, #0x8]
    bx lr
