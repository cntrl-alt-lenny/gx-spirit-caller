; func_ov002_022003d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022003d8
        .arm
func_ov002_022003d8:
    ldrh r2, [r0, #0x2]
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0xb
    bne .L_dc
    ldr r1, [r0, #0x14]
    mov r0, r2, lsl #0x1f
    mov r2, r1, lsl #0x16
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsr #0x1f
    rsb r0, r0, #0x1
    cmp r2, r0
    movne r0, #0x0
    bxne lr
    mov r0, r1, lsl #0x10
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    bxeq lr
    mov r0, r1, lsl #0x11
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_dc:
    mov r0, #0x0
    bx lr
