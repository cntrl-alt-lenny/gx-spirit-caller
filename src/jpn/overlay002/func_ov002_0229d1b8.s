; func_ov002_0229d1b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0229d1b8
        .arm
func_ov002_0229d1b8:
    ldrsb r1, [r0]
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r1, [r0, #0x10]
    cmp r1, #0x0
    movne r0, #0x1
    ldreqsh r0, [r0, #0x4]
    bx lr
