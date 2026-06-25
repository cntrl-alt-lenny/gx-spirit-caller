; func_ov002_0220b8bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0220b8bc
        .arm
func_ov002_0220b8bc:
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x16
    cmpne r1, #0x1b
    bne .L_1cc
    ldr r1, [r0, #0x14]
    ldrh r0, [r0, #0x2]
    mov r2, r1, lsl #0x16
    mov r2, r2, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r2, r0, lsr #0x1f
    bne .L_1cc
    mov r0, r1, lsl #0x12
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    bhi .L_1cc
    mov r0, r1, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_1cc
    mov r0, r1, lsl #0xe
    movs r0, r0, lsr #0x1f
    beq .L_1cc
    mov r0, r1, lsl #0x10
    movs r0, r0, lsr #0x1f
    beq .L_1cc
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    moveq r0, #0x1
    bxeq lr
.L_1cc:
    mov r0, #0x0
    bx lr
