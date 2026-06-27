; func_ov002_02201c90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_02201c90
        .arm
func_ov002_02201c90:
    ldrh r2, [r0, #0x2]
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0xf
    beq .L_100
    cmp r1, #0x10
    beq .L_120
    b .L_13c
.L_100:
    ldr r1, [r0, #0x14]
    mov r0, r2, lsl #0x1f
    mov r1, r1, lsl #0xa
    mov r1, r1, lsr #0x1f
    cmp r1, r0, lsr #0x1f
    bne .L_13c
    mov r0, #0x1
    bx lr
.L_120:
    ldr r1, [r0, #0x14]
    mov r0, r2, lsl #0x1f
    mov r1, r1, lsl #0xf
    mov r1, r1, lsr #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x1
    bxeq lr
.L_13c:
    mov r0, #0x0
    bx lr
