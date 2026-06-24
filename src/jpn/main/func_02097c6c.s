; func_02097c6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02097c6c
        .arm
func_02097c6c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r1, #0x3
    mov lr, #0x0
    bgt .L_54
    mov ip, lr
    cmp r1, #0x0
    ble .L_54
    mov r3, lr
.L_24:
    ldrb r2, [r0, ip]
    cmp r2, #0x0
    beq .L_54
    sub r2, r2, #0x41
    cmp r2, #0x19
    addls r2, r2, #0x61
    addhi r2, r2, #0x41
    add ip, ip, #0x1
    orr lr, lr, r2, lsl r3
    cmp ip, r1
    add r3, r3, #0x8
    blt .L_24
.L_54:
    mov r0, lr
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
