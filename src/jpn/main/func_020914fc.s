; func_020914fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020914fc
        .arm
func_020914fc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r2, #0x0
    addle sp, sp, #0x4
    ldmlefd sp!, {lr}
    bxle lr
    ldr ip, [r0]
    mov lr, #0x0
    cmp ip, r2
    movhi ip, r2
    cmp ip, #0x0
    bls .L_44
.L_30:
    ldr r3, [r0, #0x4]
    strb r1, [r3, lr]
    add lr, lr, #0x1
    cmp lr, ip
    bcc .L_30
.L_44:
    ldr r1, [r0]
    sub r1, r1, ip
    str r1, [r0]
    ldr r1, [r0, #0x4]
    add r1, r1, r2
    str r1, [r0, #0x4]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
