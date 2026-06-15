; func_020a6a94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a6a00
        .global func_020a6a94
        .arm
func_020a6a94:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    sub ip, r2, #0x1
    cmp ip, #0x0
    mov lr, #0x0
    ble .L_d0
.L_ac:
    ldrsb r3, [r1]
    strb r3, [r0, lr]
    ldrsb r3, [r1]
    cmp r3, #0x0
    beq .L_d0
    add lr, lr, #0x1
    cmp lr, ip
    add r1, r1, #0x1
    blt .L_ac
.L_d0:
    sub r3, r2, #0x1
    cmp lr, r3
    blt .L_e8
    cmp r2, #0x0
    movne r2, #0x0
    strneb r2, [r0, lr]
.L_e8:
    mov r0, r1
    bl func_020a6a00
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
