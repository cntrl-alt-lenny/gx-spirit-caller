; func_02097154 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02097154
        .arm
func_02097154:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r2, #0x0
    mov lr, #0x0
    bls .L_9ec
.L_9ac:
    ldrb ip, [r0, lr]
    ldrb r3, [r1, lr]
    sub ip, ip, #0x41
    cmp ip, #0x19
    sub r3, r3, #0x41
    addls ip, ip, #0x20
    cmp r3, #0x19
    addls r3, r3, #0x20
    cmp ip, r3
    addne sp, sp, #0x4
    subne r0, ip, r3
    ldmnefd sp!, {lr}
    bxne lr
    add lr, lr, #0x1
    cmp lr, r2
    bcc .L_9ac
.L_9ec:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
