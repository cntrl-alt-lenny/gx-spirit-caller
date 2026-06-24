; func_0205bce4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205bd44
        .global func_0205bce4
        .arm
func_0205bce4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr ip, [r0]
    mov r3, #0x0
    ldr r2, [ip, #0x424]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
.L_20:
    cmp r2, r1
    bne .L_48
    cmp r3, #0x0
    ldreq r2, [r2, #0x20]
    streq r2, [ip, #0x424]
    ldrne r2, [r1, #0x20]
    strne r2, [r3, #0x20]
    bl func_0205bd44
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_48:
    mov r3, r2
    ldr r2, [r2, #0x20]
    cmp r2, #0x0
    bne .L_20
    add sp, sp, #0x4
    ldmfd sp!, {pc}
