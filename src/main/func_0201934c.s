; func_0201934c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020be6c4
        .extern data_02104f4c
        .global func_0201934c
        .arm
func_0201934c:
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldrb r0, [r2, r0]
    ldr r2, [r1, #0x928]
    ldr r1, [r1, #0x92c]
    cmp r0, #0x3b
    bgt .L_188
    bge .L_1f8
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    bx lr
    bx lr
    bx lr
    b .L_194
    b .L_1a0
    bx lr
    b .L_1ac
    bx lr
    b .L_1c4
.L_188:
    cmp r0, #0x49
    beq .L_1dc
    bx lr
.L_194:
    cmp r2, #0x24
    movge r0, #0x4a
    bx lr
.L_1a0:
    cmp r2, #0x29
    movge r0, #0x5e
    bx lr
.L_1ac:
    cmp r2, #0x18
    movge r0, #0x4b
    cmp r2, #0x17
    cmpge r1, #0x4
    movge r0, #0x4b
    bx lr
.L_1c4:
    cmp r2, #0x2c
    movge r0, #0x3f
    cmp r2, #0x2b
    cmpge r1, #0x3
    movge r0, #0x3f
    bx lr
.L_1dc:
    cmp r2, #0xa
    movlt r0, #0x2d
    cmp r2, #0xa
    bxne lr
    cmp r1, #0x7
    movlt r0, #0x2d
    bx lr
.L_1f8:
    cmp r2, #0x21
    cmpeq r1, #0x3
    moveq r0, #0x3c
    cmp r2, #0x21
    cmpeq r1, #0x4
    moveq r0, #0x3d
    bx lr
_LIT0: .word data_020be6c4
_LIT1: .word data_02104f4c
