; func_0206b184 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3560
        .extern func_020b3988
        .global func_0206b184
        .arm
func_0206b184:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrsb lr, [r0]
    mov ip, #0x0
    cmp lr, #0x0
    beq .L_178
    ldr r3, _LIT0
    ldr r2, _LIT1
.L_154:
    cmp lr, #0x0
    blt .L_168
    cmp lr, #0x80
    bge .L_168
    ldrb lr, [r3, lr]
.L_168:
    mla ip, r2, ip, lr
    ldrsb lr, [r0, #0x1]!
    cmp lr, #0x0
    bne .L_154
.L_178:
    mov r0, ip
    bl func_020b3988
    mov r0, r1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020c3560
_LIT1: .word 0x9ccf9319
