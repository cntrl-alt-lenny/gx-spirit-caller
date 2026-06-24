; func_02063c30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02063d54
        .extern func_02063d98
        .extern func_02063e04
        .extern func_02063e5c
        .extern func_02063f70
        .extern func_0206404c
        .extern func_020640e4
        .global func_02063c30
        .arm
func_02063c30:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrh ip, [r0, #0x66]
    cmp r1, #0x0
    add ip, ip, #0x1
    strh ip, [r0, #0x66]
    bne .L_3c
    mov r1, r2
    mov r2, r3
    bl func_020640e4
    cmp r0, #0x0
    bne .L_118
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_3c:
    cmp r1, #0x1
    bne .L_64
    mov r1, r2
    mov r2, r3
    bl func_0206404c
    cmp r0, #0x0
    bne .L_118
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_64:
    cmp r1, #0x2
    bne .L_8c
    mov r1, r2
    mov r2, r3
    bl func_02063f70
    cmp r0, #0x0
    bne .L_118
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_8c:
    cmp r1, #0x3
    bne .L_b4
    mov r1, r2
    mov r2, r3
    bl func_02063e5c
    cmp r0, #0x0
    bne .L_118
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_b4:
    cmp r1, #0x4
    bne .L_d4
    bl func_02063e04
    cmp r0, #0x0
    bne .L_118
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_d4:
    cmp r1, #0x5
    bne .L_fc
    mov r1, r2
    mov r2, r3
    bl func_02063d98
    cmp r0, #0x0
    bne .L_118
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_fc:
    cmp r1, #0x6
    bne .L_118
    bl func_02063d54
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
.L_118:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
