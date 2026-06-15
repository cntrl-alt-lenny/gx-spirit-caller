; func_0206b1f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3654
        .extern func_020b3a7c
        .global func_0206b1f8
        .arm
func_0206b1f8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrsb lr, [r0]
    mov ip, #0x0
    cmp lr, #0x0
    beq .L_1d0
    ldr r3, _LIT0
    ldr r2, _LIT1
.L_1ac:
    cmp lr, #0x0
    blt .L_1c0
    cmp lr, #0x80
    bge .L_1c0
    ldrb lr, [r3, lr]
.L_1c0:
    mla ip, r2, ip, lr
    ldrsb lr, [r0, #0x1]!
    cmp lr, #0x0
    bne .L_1ac
.L_1d0:
    mov r0, ip
    bl func_020b3a7c
    mov r0, r1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020c3654
_LIT1: .word 0x9ccf9319
