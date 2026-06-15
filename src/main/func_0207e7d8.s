; func_0207e7d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207e7d8
        .arm
func_0207e7d8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrh r2, [r0, #0xc]
    ldrh ip, [r0, #0xe]
    mov lr, #0x0
    add r0, r0, r2
    cmp ip, #0x0
    bls .L_dc
.L_b0:
    ldr r2, [r0]
    cmp r2, r1
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    add r2, lr, #0x1
    mov r2, r2, lsl #0x10
    ldr r3, [r0, #0x4]
    mov lr, r2, lsr #0x10
    cmp lr, ip
    add r0, r0, r3
    bcc .L_b0
.L_dc:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
