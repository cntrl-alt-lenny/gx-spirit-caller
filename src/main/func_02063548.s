; func_02063548 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02063620
        .extern func_02063664
        .extern func_02063710
        .extern func_0206371c
        .extern func_02063808
        .global func_02063548
        .arm
func_02063548:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r1, #0x64
    add lr, r2, #0x3
    sub ip, r3, #0x3
    bne .L_c54
    mov r1, lr
    mov r2, ip
    bl func_02063808
    cmp r0, #0x0
    bne .L_ce8
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_c54:
    cmp r1, #0x65
    bne .L_c7c
    mov r1, lr
    mov r2, ip
    bl func_0206371c
    cmp r0, #0x0
    bne .L_ce8
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_c7c:
    cmp r1, #0x66
    bne .L_ca4
    mov r1, r2
    mov r2, r3
    bl func_02063710
    cmp r0, #0x0
    bne .L_ce8
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_ca4:
    cmp r1, #0x67
    bne .L_ccc
    mov r1, lr
    mov r2, ip
    bl func_02063664
    cmp r0, #0x0
    bne .L_ce8
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_ccc:
    cmp r1, #0x68
    bne .L_ce8
    bl func_02063620
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
.L_ce8:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
