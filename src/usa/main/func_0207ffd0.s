; func_0207ffd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207ffd0
        .arm
func_0207ffd0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, [r0]
    ldr lr, [r3, #0xc]
    cmp lr, #0x0
    beq .L_21c
.L_1e4:
    ldrh ip, [lr]
    cmp ip, r1
    bhi .L_210
    ldrh r2, [lr, #0x2]
    cmp r1, r2
    ldrlsh r2, [r0, #0xa]
    addls r3, lr, #0x8
    subls r0, r1, ip
    mlals r0, r2, r0, r3
    addls sp, sp, #0x4
    ldmlsfd sp!, {pc}
.L_210:
    ldr lr, [lr, #0x4]
    cmp lr, #0x0
    bne .L_1e4
.L_21c:
    add r0, r3, #0x4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
