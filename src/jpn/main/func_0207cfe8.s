; func_0207cfe8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207d0a4
        .global func_0207cfe8
        .arm
func_0207cfe8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, [r0]
    cmp r2, #0x0
    bne .L_fc
    bl func_0207d0a4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_fc:
    ldrh r3, [r0, #0xa]
    mov r2, #0x0
    str r2, [r1, r3]
    ldr r2, [r0]
    add r3, r1, r3
    str r2, [r3, #0x4]
    ldrh r2, [r0, #0xa]
    ldr r3, [r0]
    str r1, [r3, r2]
    str r1, [r0]
    ldrh r1, [r0, #0x8]
    add r1, r1, #0x1
    strh r1, [r0, #0x8]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
