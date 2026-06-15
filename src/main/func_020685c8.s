; func_020685c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3654
        .extern func_020b3a7c
        .global func_020685c8
        .arm
func_020685c8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrsb lr, [r0]
    mov ip, #0x0
    cmp lr, #0x0
    beq .L_44
    ldr r3, _LIT0
    ldr r2, _LIT1
.L_20:
    cmp lr, #0x0
    blt .L_34
    cmp lr, #0x80
    bge .L_34
    ldrb lr, [r3, lr]
.L_34:
    mla ip, r2, ip, lr
    ldrsb lr, [r0, #0x1]!
    cmp lr, #0x0
    bne .L_20
.L_44:
    mov r0, ip
    bl func_020b3a7c
    mov r0, r1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020c3654
_LIT1: .word 0x9ccf9319
