; func_ov002_0228a778 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0228a778
        .arm
func_ov002_0228a778:
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldrh r1, [r1, #0x2]
    ldrh r0, [r0, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
