; func_020779d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020779d8
        .arm
func_020779d8:
    ldr r1, [r0]
    ldrb r3, [r1]
    add ip, r1, #0x1
    ands r1, r3, #0x80
    beq .L_988
    ands r1, r3, #0x7f
    sub r2, r1, #0x1
    mov r3, #0x0
    beq .L_988
.L_968:
    ands r1, r3, #-16777216
    mvnne r0, #0x0
    bxne lr
    ldrb r1, [ip], #0x1
    cmp r2, #0x0
    sub r2, r2, #0x1
    add r3, r1, r3, lsl #0x8
    bne .L_968
.L_988:
    str ip, [r0]
    mov r0, r3
    bx lr
