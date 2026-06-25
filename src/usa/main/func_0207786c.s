; func_0207786c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207786c
        .arm
func_0207786c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrsb r3, [r0]
    mov lr, r0
    cmp r3, #0x0
    beq .L_8f0
.L_8b0:
    ldrsb r3, [r0, #0x1]!
    cmp r3, #0x0
    bne .L_8b0
    sub r3, r0, lr
    cmp r3, #0xff
    addge sp, sp, #0x4
    ldmgefd sp!, {lr}
    bxge lr
    mov r3, #0x2c
    strb r3, [r0]
    mov r3, #0x20
    strb r3, [r0, #0x1]
    add r0, r0, #0x2
    b .L_8f0
.L_8e8:
    ldrsb r3, [r1], #0x1
    strb r3, [r0], #0x1
.L_8f0:
    cmp r2, #0x0
    sub r2, r2, #0x1
    beq .L_908
    sub r3, r0, lr
    cmp r3, #0xff
    blt .L_8e8
.L_908:
    mov r1, #0x0
    strb r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
