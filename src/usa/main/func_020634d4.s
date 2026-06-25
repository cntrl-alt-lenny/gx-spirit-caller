; func_020634d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020635ac
        .extern func_020635f0
        .extern func_0206369c
        .extern func_020636a8
        .extern func_02063794
        .global func_020634d4
        .arm
func_020634d4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r1, #0x64
    add lr, r2, #0x3
    sub ip, r3, #0x3
    bne .L_54c
    mov r1, lr
    mov r2, ip
    bl func_02063794
    cmp r0, #0x0
    bne .L_5e0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_54c:
    cmp r1, #0x65
    bne .L_574
    mov r1, lr
    mov r2, ip
    bl func_020636a8
    cmp r0, #0x0
    bne .L_5e0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_574:
    cmp r1, #0x66
    bne .L_59c
    mov r1, r2
    mov r2, r3
    bl func_0206369c
    cmp r0, #0x0
    bne .L_5e0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_59c:
    cmp r1, #0x67
    bne .L_5c4
    mov r1, lr
    mov r2, ip
    bl func_020635f0
    cmp r0, #0x0
    bne .L_5e0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_5c4:
    cmp r1, #0x68
    bne .L_5e0
    bl func_020635ac
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
.L_5e0:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
