; func_ov002_0220489c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0220489c
        .arm
func_ov002_0220489c:
    cmp r1, #0x0
    ldrneh r2, [r1]
    ldrneh r1, [r0]
    cmpne r2, r1
    movne r0, #0x0
    bxne lr
    ldrh r2, [r0, #0x2]
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0xe
    bne .L_7c
    ldr r1, [r0, #0x14]
    mov r0, r2, lsl #0x1f
    mov r3, r0, lsr #0x1f
    mov r0, r1, lsl #0xf
    mov r2, r0, lsr #0x1f
    rsb r0, r3, #0x1
    cmp r2, r0
    movne r0, #0x0
    bxne lr
    mov r0, r1, lsl #0xa
    mov r0, r0, lsr #0x1f
    cmp r0, r3
    movne r0, #0x0
    bxne lr
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x7d0
    movcs r0, #0x1
    movcc r0, #0x0
    bx lr
.L_7c:
    mov r0, #0x0
    bx lr
