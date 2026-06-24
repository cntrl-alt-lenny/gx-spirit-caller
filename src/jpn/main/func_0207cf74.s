; func_0207cf74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207cfe8
        .extern func_0207d044
        .global func_0207cf74
        .arm
func_0207cf74:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r1, #0x0
    bne .L_20
    mov r1, r2
    bl func_0207d044
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_20:
    ldr r3, [r0]
    cmp r1, r3
    bne .L_3c
    mov r1, r2
    bl func_0207cfe8
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_3c:
    ldrh lr, [r0, #0xa]
    ldr r3, [r1, lr]
    add ip, r2, lr
    str r3, [r2, lr]
    str r1, [ip, #0x4]
    add r3, r3, lr
    str r2, [r3, #0x4]
    ldrh r3, [r0, #0xa]
    str r2, [r1, r3]
    ldrh r1, [r0, #0x8]
    add r1, r1, #0x1
    strh r1, [r0, #0x8]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
