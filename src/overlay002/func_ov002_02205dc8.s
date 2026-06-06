; func_ov002_02205dc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_02205dc8
        .arm
func_ov002_02205dc8:
    ldrh r1, [r0, #0x2]
    mov r2, r1, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x16
    bne .L_90
    mov r1, r1, lsl #0x1f
    ldr r2, [r0, #0x14]
    mov r0, r1, lsr #0x1f
    mov r1, r2, lsl #0x16
    rsb r0, r0, #0x1
    cmp r0, r1, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_90:
    mov r0, #0x0
    bx lr
