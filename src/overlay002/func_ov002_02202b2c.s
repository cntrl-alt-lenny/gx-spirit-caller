; func_ov002_02202b2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_02202b2c
        .arm
func_ov002_02202b2c:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    bne .L_6c
    mov r0, #0x1
    bx lr
.L_6c:
    mov r0, #0x0
    bx lr
