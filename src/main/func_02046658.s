; func_02046658 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02046658
        .arm
func_02046658:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov lr, #0x0
    mov ip, lr
    cmp r1, #0x0
    ble .L_25c
    mov r3, #0x1
.L_248:
    ldrb r2, [r0, ip]
    add ip, ip, #0x1
    cmp ip, r1
    orr lr, lr, r3, lsl r2
    blt .L_248
.L_25c:
    mov r0, lr
    add sp, sp, #0x4
    ldmfd sp!, {pc}
