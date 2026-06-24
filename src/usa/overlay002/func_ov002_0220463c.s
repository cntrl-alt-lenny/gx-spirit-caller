; func_ov002_0220463c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0220463c
        .arm
func_ov002_0220463c:
    ldrh r2, [r0, #0x2]
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0xf
    bne .L_280
    ldr r1, [r0, #0x14]
    mov r0, r2, lsl #0x1f
    mov r1, r1, lsl #0xa
    mov r1, r1, lsr #0x1f
    cmp r1, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_280:
    mov r0, #0x0
    bx lr
