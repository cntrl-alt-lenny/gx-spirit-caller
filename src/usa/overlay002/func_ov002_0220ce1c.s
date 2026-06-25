; func_ov002_0220ce1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0220ce1c
        .arm
func_ov002_0220ce1c:
    cmp r1, #0x0
    movne r0, #0x0
    bxne lr
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x1f
    cmpne r0, #0x20
    bne .L_2c
    mov r0, #0x1
    bx lr
.L_2c:
    mov r0, #0x0
    bx lr
