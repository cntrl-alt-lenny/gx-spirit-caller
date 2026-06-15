; func_02085460 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02085460
        .arm
func_02085460:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, [r0, #0x8]
    add lr, r0, r3
    ldrh r0, [lr, #0xa]
    add ip, lr, #0x4
    ldrh r3, [ip, r0]
    add r0, ip, r0
    mla r0, r3, r1, r0
    ldr r0, [r0, #0x4]
    add r1, lr, r0
    ldr r0, [r1, #0xc]
    bic r0, r0, #0xf
    orr r0, r0, r2
    str r0, [r1, #0xc]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
