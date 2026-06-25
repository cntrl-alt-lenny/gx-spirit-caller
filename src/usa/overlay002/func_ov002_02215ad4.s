; func_ov002_02215ad4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_02215ad4
        .arm
func_ov002_02215ad4:
    ldrh r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    bxne lr
    ldrh r0, [r1, #0x8]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    strh r0, [r1, #0x8]
    mov r0, #0x0
    bx lr
