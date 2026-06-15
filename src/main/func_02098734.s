; func_02098734 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02098788
        .extern func_02098a4c
        .global func_02098734
        .arm
func_02098734:
    stmfd sp!, {lr}
    sub sp, sp, #0x2c
    mov r3, r0
    mov r2, r1
    add r0, sp, #0x0
    mov r1, r3
    bl func_02098a4c
    cmp r0, #0x0
    beq .L_34
    add r0, sp, #0x0
    bl func_02098788
    cmp r0, #0x0
    bne .L_44
.L_34:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmfd sp!, {lr}
    bx lr
.L_44:
    mov r0, #0x1
    add sp, sp, #0x2c
    ldmfd sp!, {lr}
    bx lr
