; func_ov004_021cec98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .global func_ov004_021cec98
        .arm
func_ov004_021cec98:
    ldr r2, _LIT0
    ldr r0, [r2, #0x228]
    cmp r0, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r1, [r2, #0x22c]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_74
    b .L_38
    b .L_38
    b .L_38
    b .L_4c
    b .L_60
.L_38:
    ldr r0, [r2, #0x230]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_4c:
    ldr r0, [r2, #0x230]
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_60:
    ldr r0, [r2, #0x230]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_74:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov004_0220b2a0
