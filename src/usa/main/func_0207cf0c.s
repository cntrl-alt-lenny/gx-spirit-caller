; func_0207cf0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207cf0c
        .arm
func_0207cf0c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrh ip, [r0, #0xa]
    ldr r3, [r1, ip]
    add lr, r1, ip
    cmp r3, #0x0
    ldreq r1, [lr, #0x4]
    streq r1, [r0]
    ldrne r2, [lr, #0x4]
    addne r1, r3, ip
    strne r2, [r1, #0x4]
    ldr r3, [lr, #0x4]
    cmp r3, #0x0
    ldreq r1, [lr]
    streq r1, [r0, #0x4]
    ldrneh r1, [r0, #0xa]
    ldrne r2, [lr]
    strne r2, [r3, r1]
    mov r1, #0x0
    str r1, [lr]
    str r1, [lr, #0x4]
    ldrh r1, [r0, #0x8]
    sub r1, r1, #0x1
    strh r1, [r0, #0x8]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
