; func_02077954 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02077954
        .arm
func_02077954:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrsb r3, [r0]
    mov lr, r0
    cmp r3, #0x0
    beq .L_918
.L_8d8:
    ldrsb r3, [r0, #0x1]!
    cmp r3, #0x0
    bne .L_8d8
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
    b .L_918
.L_910:
    ldrsb r3, [r1], #0x1
    strb r3, [r0], #0x1
.L_918:
    cmp r2, #0x0
    sub r2, r2, #0x1
    beq .L_930
    sub r3, r0, lr
    cmp r3, #0xff
    blt .L_910
.L_930:
    mov r1, #0x0
    strb r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
