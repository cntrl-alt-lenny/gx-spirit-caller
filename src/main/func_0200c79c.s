; func_0200c79c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200c79c
        .arm
func_0200c79c:
    cmp r1, #0x0
    bge .L_220
    ldr r1, [r0, #0x7c]
    bic r1, r1, #-2147483648
    str r1, [r0, #0x7c]
    b .L_288
.L_220:
    mov r3, #0x58
    mul r3, r1, r3
    ldr r1, [r0]
    adds r1, r1, r3
    moveq r0, #0x0
    bxeq lr
    tst r2, #0x1
    movne r3, #0x1
    moveq r3, #0x0
    strb r3, [r1, #0x40]
    tst r2, #0x2
    movne r3, #0x1
    moveq r3, #0x0
    strb r3, [r1, #0x41]
    tst r2, #0x4
    movne r3, #0x1
    moveq r3, #0x0
    tst r2, #0x8
    movne r2, #0x1
    strb r3, [r1, #0x42]
    moveq r2, #0x0
    strb r2, [r1, #0x43]
    ldr r1, [r0, #0x7c]
    bic r1, r1, #-2147483648
    orr r1, r1, #-2147483648
    str r1, [r0, #0x7c]
.L_288:
    mov r0, #0x1
    bx lr
