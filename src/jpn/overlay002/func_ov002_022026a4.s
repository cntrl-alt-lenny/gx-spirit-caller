; func_ov002_022026a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022026a4
        .arm
func_ov002_022026a4:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
