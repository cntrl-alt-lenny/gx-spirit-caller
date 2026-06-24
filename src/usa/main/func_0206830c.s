; func_0206830c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206830c
        .arm
func_0206830c:
    ldr r3, [r0]
    mov r2, #0x0
    cmp r3, #0x0
    beq .L_64
.L_10:
    cmp r3, r1
    bne .L_54
    cmp r2, #0x0
    ldrne r1, [r3, #0x20]
    strne r1, [r2, #0x20]
    ldr r1, [r0]
    cmp r1, r3
    ldreq r1, [r3, #0x20]
    streq r1, [r0]
    ldr r1, [r0, #0x4]
    cmp r1, r3
    streq r2, [r0, #0x4]
    ldr r1, [r0, #0x8]
    sub r1, r1, #0x1
    str r1, [r0, #0x8]
    mov r0, #0x1
    bx lr
.L_54:
    mov r2, r3
    ldr r3, [r3, #0x20]
    cmp r3, #0x0
    bne .L_10
.L_64:
    mov r0, #0x0
    bx lr
